/*-------------------------------------------------------------------------
** MODBUS v1.0 LSIS protocol ver.000
**    
**------------------------------------------------------------------------*/
//#include "main.h"
#include "stm32f4xx_hal.h"
#include "usb_device.h"
#include "usb_host.h"
	
#include "usbd_cdc.h"
#include "usbh_cdc.h"
#include "usbd_cdc_if.h"

#include "RTOS.h"
//#include "lcd.h"
//#include "ads7843_ts.h"
//#include "backlight.h"
//#include "GUIDEMO.h"
//#include "WM.h"
	
//#include "mb.h"
#include "global_var.h"
//#include "modbus.h"
#include "modbus_comm.h"

//#include "MESSAGEBOX.h"


#define __COMM_S_TEST__		0
#define __COMM_R_TEST__		0

uint8_t ModbusSendFrameFromUsb(uint8_t* sendBuf, uint32_t length);

MBDATA_HandleTypeDef	hMBData;			// input working
MBDATA_HandleTypeDef	hMBDataSet;		// input orig.


uint8_t CDC_TXBuf[TX_BUFF_SIZE];
uint8_t CDC_RXBuf[RX_BUFF_SIZE];


// 1:A, 2:B mode //		Hwset->7.group control 
int gRlySetMode=A_MODE;


int gToken_nn=TOK_WAIT;
int gCurrStatus=TOK_WAIT;

int gRcvMB = 0;
int InPcBypass=0; // 설정시만 pc전송 

int gChkNorCmd = NORMAL_MODE;
int gChkWBusy =0;	// write busy check : 1

f_temp temp;

int gHmiCommAddr = 248;	// hmi 통신용 주소 


/*
	01h	ILLEGAL FUNCTION			
	02h	ILLEGAL DATA ADDRESS			
	03h	ILLEGAL DATA VALUE			
	04h	SLAVE DEVICE FAILURE			
	05h	ACKNOWLEDGE			
	06h	SLAVE DEVICE BUSY			
	10h	Event/Fault record 데이터 없음			
	11h	SBO TIME OUT			
	12h	ILLEGAL ADU LENGTH			
	13h	LOCAL MODE			
	14h	MAIN_NAK			
	15h	SELECT ERROR			
	16h	OPERATOR ERROR			
*/
char *modbus_exeception_table[] = {
	{"ILLEGAL FUNCTION"},		// 01 h
	{"ILLEGAL DATA ADDRESS"},	// 02 h
	{"ILLEGAL DATA VALUE"},	//03 h
	{"SLAVE DEVICE FAILURE"},	//04 h
	{"ACKNOWLEDGE"},	// 05 h
	{"SLAVE DEVICE BUSY"},	// 06 h
	{"Event/Fault record: Not Data"}, // 10 h	
	{"SBO TIME OUT"},	// 11 h
	{"ILLEGAL ADU LENGTH"}, // 12 h
	{"LOCAL MODE"},	// 13 h
	{"MAIN_NAK"},		// 14 h
	{"SELECT ERROR"},	// 15 h
	{"OPERATOR ERROR"},	// 16 h
};


////////////////////////////////////////////////////////////////////////////////

uint8_t Local_RxBuf[RX_BUFF_SIZE] ={0};
uint8_t workBuf[RX_BUFF_SIZE]={0};
int rxDataLen=0;
int UsbHStatus = USB_DATA_READY;
int nTimeOutCnt=1;
uint8_t *bufPt=workBuf;


void UsbH_RcvBypass_Process()
{
	OS_Delay(8);
	if (USBH_CDC_Receive(&hUsbHostHS, Local_RxBuf, RX_BUFF_SIZE) == USBH_OK)
	{
		int size = USBH_CDC_GetLastReceivedDataSize(&hUsbHostHS);
		if(size > 0)
		{
			memcpy( bufPt, Local_RxBuf, size);
			rxDataLen += size;
			bufPt += size;
			UsbHStatus = USB_DATA_START;
			nTimeOutCnt = 1;

		}

		if(UsbHStatus == USB_DATA_START)
		{
			nTimeOutCnt++;
		}		
	}

	if(nTimeOutCnt > 3) // 3x9ms= 27ms 타임 아웃 발생 하면, 
	{
		nTimeOutCnt = 1;
		UsbHStatus = USB_DATA_FINISH; 
		memset(Local_RxBuf, 0, RX_BUFF_SIZE);
	}
}

void UsbH_Rcv_Process()
{

	OS_Delay(8);
	if (USBH_CDC_Receive(&hUsbHostHS, Local_RxBuf, RX_BUFF_SIZE) == USBH_OK)
	{
		int size = USBH_CDC_GetLastReceivedDataSize(&hUsbHostHS);
		if(size > 0)
		{
			memcpy( bufPt, Local_RxBuf, size);
			rxDataLen += size;
			bufPt += size;
			UsbHStatus = USB_DATA_START;
			nTimeOutCnt = 1;
		}

		if(UsbHStatus == USB_DATA_START)
		{
			nTimeOutCnt++;
		}		
	}

	if(nTimeOutCnt > 3) // 3x9ms= 27ms 타임 아웃 발생 하면, 
	{
		nTimeOutCnt = 1;
		UsbHStatus = USB_DATA_FINISH; 
		memset(Local_RxBuf, 0, RX_BUFF_SIZE);
	}
	
}

////////////////////////////////////////////////////////////////////////////////
unsigned char AscToHex(unsigned char Data)
{
    if(Data < 0x30)
        return 0;

    if( (0x30<= Data) && (Data<= 0x39) )
    {
        Data-= 0x30;
        return Data;
    }
    if(('a'<= Data) && (Data<= 'f'))
    {
        Data-= 0x57;
        return Data;
    }
    if(('A'<= Data) && (Data<= 'F'))
    {
        Data-= 0x37;
        return Data;
    }
    return 0;
}


void Send_Pwr_Packet(int sndSize)
{
	USBH_HandleTypeDef *uHost;

	USBH_CDC_Stop(&hUsbHostHS);
	
	uHost = &hUsbHostHS;

	CDC_HandleTypeDef *CDC_Handle =  (CDC_HandleTypeDef*)(uHost->pActiveClass->pData);
	CDC_Handle->state = CDC_TRANSFER_DATA;
	USBH_CDC_Transmit(&hUsbHostHS, CDC_TXBuf, sndSize);

	//test only
#if __COMM_S_TEST__ //[[ by kys.2018.03.28_BEGIN -- a
	CDC_Transmit_FS(CDC_TXBuf, sndSize);
#endif //]] by kys.2018.03.28_END -- a
}

////////////////////////////////////////////////////////////////////////////////
#if 0
////////////////////////////////////////////////////////////////////////////////
void HwsetPac_Parser(uint8_t *Local_RxBuf)
{
	char sBuf[64]={0};
	uint16_t nVal;

	switch (gCurrStatus)
	{
	case TOK_WAIT :
		break;

	case HWSET_HW1SET_RD : // 멀티 바이트 (블럭) 읽기 
		{
			int i;
			//memcpy( &hMBData.Hw2SetDef, (HW2Set_Def*)Local_RxBuf[3], sizeof(HW2Set_Def));
			hMBData.Hw1SetDef.nDevType = Local_RxBuf[3];
			hMBData.Hw1SetDef.nNFCnY = Local_RxBuf[4];
			hMBData.Hw1SetDef.nPols = Local_RxBuf[5];
			hMBData.Hw1SetDef.nWiring = Local_RxBuf[6];
			
			hMBData.Hw1SetDef.nFreq = Local_RxBuf[7];			hMBData.Hw1SetDef.nFreq <<= 8;
			hMBData.Hw1SetDef.nFreq |= Local_RxBuf[8];
			
			hMBData.Hw1SetDef.nAF = Local_RxBuf[9];				hMBData.Hw1SetDef.nAF <<= 8;
			hMBData.Hw1SetDef.nAF |= Local_RxBuf[10];
			
#if 0 //[[ by kys.2018.03.28_BEGIN -- a
			hMBData.Hw1SetDef.nRateVol = Local_RxBuf[11];
			hMBData.Hw1SetDef.nRateVol <<= 8;
			hMBData.Hw1SetDef.nRateVol |= Local_RxBuf[12];
#endif //]] by kys.2018.03.28_END -- a

			i = 11;
			hMBData.Hw1SetDef.nRatePlug = Local_RxBuf[i++];			hMBData.Hw1SetDef.nRatePlug <<= 8;
			hMBData.Hw1SetDef.nRatePlug |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nLnFact = Local_RxBuf[i++];				hMBData.Hw1SetDef.nLnFact <<= 8;
			hMBData.Hw1SetDef.nLnFact |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nLn = Local_RxBuf[i++];						hMBData.Hw1SetDef.nLn <<= 8;
			hMBData.Hw1SetDef.nLn |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nMaxCbMoc = Local_RxBuf[i++];			hMBData.Hw1SetDef.nMaxCbMoc <<= 8;
			hMBData.Hw1SetDef.nMaxCbMoc |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nMaxCbEoc = Local_RxBuf[i++];			hMBData.Hw1SetDef.nMaxCbEoc <<= 8;
			hMBData.Hw1SetDef.nMaxCbEoc |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nMaxCW = Local_RxBuf[i++];				hMBData.Hw1SetDef.nMaxCW <<= 8;
			hMBData.Hw1SetDef.nMaxCW |= Local_RxBuf[i++];				hMBData.Hw1SetDef.nMaxCW <<= 8;
			hMBData.Hw1SetDef.nMaxCW |= Local_RxBuf[i++];				hMBData.Hw1SetDef.nMaxCW <<= 8;
			hMBData.Hw1SetDef.nMaxCW |= Local_RxBuf[i++];				hMBData.Hw1SetDef.nMaxCW <<= 8;
			hMBData.Hw1SetDef.nMaxCW |= Local_RxBuf[i++];				hMBData.Hw1SetDef.nMaxCW <<= 8;
			hMBData.Hw1SetDef.nMaxCW |= Local_RxBuf[i++];				hMBData.Hw1SetDef.nMaxCW <<= 8;
			hMBData.Hw1SetDef.nMaxCW |= Local_RxBuf[i++];				hMBData.Hw1SetDef.nMaxCW <<= 8;
			hMBData.Hw1SetDef.nMaxCW |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nDanCurr1 = Local_RxBuf[i++];			hMBData.Hw1SetDef.nDanCurr1 <<= 8;
			hMBData.Hw1SetDef.nDanCurr1 |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nDanCurr2 = Local_RxBuf[i++];			hMBData.Hw1SetDef.nDanCurr2 <<= 8;
			hMBData.Hw1SetDef.nDanCurr2 |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nDanCurr3 = Local_RxBuf[i++];			hMBData.Hw1SetDef.nDanCurr3 <<= 8;
			hMBData.Hw1SetDef.nDanCurr3 |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nOpt1 = Local_RxBuf[i++];					hMBData.Hw1SetDef.nOpt1 <<= 8;
			hMBData.Hw1SetDef.nOpt1 |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nOpt2 = Local_RxBuf[i++];					hMBData.Hw1SetDef.nOpt2 <<= 8;
			hMBData.Hw1SetDef.nOpt2 |= Local_RxBuf[i++];
			
			hMBData.Hw1SetDef.nOpt3 = Local_RxBuf[i++];					hMBData.Hw1SetDef.nOpt3 <<= 8;
			hMBData.Hw1SetDef.nOpt3 |= Local_RxBuf[i++];
			
			gToken_nn = HWSET_HW2SET_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.Hw1SetDef, &hMBData.Hw1SetDef, sizeof(HW1Set_Def));

			gChkWBusy = 0;
		}
		break;
	case HWSET_HW1SET_WR : // 멀티 바이트 (블럭) 쓰기 응답 분석  
		{			
#if 0 //[[ by kys.2018.03.28_BEGIN
			if(Local_RxBuf[0] != 0x01){
				MESSAGEBOX_Create("Invalid slave addr. !!", "hw1", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				MESSAGEBOX_Create("Invalid function code !!", "hw1", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.03.28_END

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	
	case HWSET_HW2SET_RD : // 멀티 바이트 (블럭) 읽기 
		{		
			int i;

			i=3;
			//memcpy( &hMBData.Hw2SetDef, (HW2Set_Def*)Local_RxBuf[3], sizeof(HW2Set_Def));
			hMBData.Hw2SetDef.nPhaseVal = Local_RxBuf[i++];			hMBData.Hw2SetDef.nPhaseVal <<= 8;
			hMBData.Hw2SetDef.nPhaseVal |= Local_RxBuf[i++];

#if 1 //[[ by kys.2018.03.28_BEGIN -- a
			hMBData.Hw2SetDef.nRateVol = Local_RxBuf[i++];			hMBData.Hw2SetDef.nRateVol <<= 8;
			hMBData.Hw2SetDef.nRateVol |= Local_RxBuf[i++];
#endif //]] by kys.2018.03.28_END -- a

			hMBData.Hw2SetDef.nCurrDir = Local_RxBuf[i++];			hMBData.Hw2SetDef.nCurrDir <<= 8;
			hMBData.Hw2SetDef.nCurrDir |= Local_RxBuf[i++];

			hMBData.Hw2SetDef.Address = Local_RxBuf[i++];				hMBData.Hw2SetDef.Address <<= 8;
			hMBData.Hw2SetDef.Address |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.Baudrate = Local_RxBuf[i++];			hMBData.Hw2SetDef.Baudrate <<= 8;
			hMBData.Hw2SetDef.Baudrate |= Local_RxBuf[i++];
#if 0 //[[ by kys.2018.03.28_BEGIN -- a
			hMBData.Hw2SetDef.Swap = Local_RxBuf[i++];
			hMBData.Hw2SetDef.Swap <<= 8;
			hMBData.Hw2SetDef.Swap |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.Map = Local_RxBuf[i++];
			hMBData.Hw2SetDef.Map <<= 8;
			hMBData.Hw2SetDef.Map |= Local_RxBuf[i++];
#else
			hMBData.Hw2SetDef.RES1 = Local_RxBuf[i++];				hMBData.Hw2SetDef.RES1 <<= 8;
			hMBData.Hw2SetDef.RES1 |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.RES2 = Local_RxBuf[i++];				hMBData.Hw2SetDef.RES2 <<= 8;
			hMBData.Hw2SetDef.RES2 |= Local_RxBuf[i++];
#endif //]] by kys.2018.03.28_END -- a
			hMBData.Hw2SetDef.Demand = Local_RxBuf[i++];			hMBData.Hw2SetDef.Demand <<= 8;
			hMBData.Hw2SetDef.Demand |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.LRCtrl = Local_RxBuf[i++];			hMBData.Hw2SetDef.LRCtrl <<= 8;
			hMBData.Hw2SetDef.LRCtrl |= Local_RxBuf[i++];
#if 0 //[[ by kys.2018.03.28_BEGIN -- a
			hMBData.Hw2SetDef.OCR_Passwd = Local_RxBuf[i++];
			hMBData.Hw2SetDef.OCR_Passwd <<= 8;
			hMBData.Hw2SetDef.OCR_Passwd |= Local_RxBuf[i++];
#else
			hMBData.Hw2SetDef.RES3 = Local_RxBuf[i++];				hMBData.Hw2SetDef.RES3 <<= 8;
			hMBData.Hw2SetDef.RES3 |= Local_RxBuf[i++];
#endif //]] by kys.2018.03.28_END -- a
			hMBData.Hw2SetDef.nLanguage = Local_RxBuf[i++];		hMBData.Hw2SetDef.nLanguage <<= 8;
			hMBData.Hw2SetDef.nLanguage |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.Reserved = Local_RxBuf[i++];		hMBData.Hw2SetDef.Reserved <<= 8;
			hMBData.Hw2SetDef.Reserved |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.GroupCtrl = Local_RxBuf[i++];		hMBData.Hw2SetDef.GroupCtrl <<= 8;
			hMBData.Hw2SetDef.GroupCtrl |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.UserDefDp0 = Local_RxBuf[i++];	hMBData.Hw2SetDef.UserDefDp0 <<= 8;
			hMBData.Hw2SetDef.UserDefDp0 |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.UserDefDp1 = Local_RxBuf[i++];	hMBData.Hw2SetDef.UserDefDp1 <<= 8;
			hMBData.Hw2SetDef.UserDefDp1 |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.UserDefDp2 = Local_RxBuf[i++];	hMBData.Hw2SetDef.UserDefDp2 <<= 8;
			hMBData.Hw2SetDef.UserDefDp2 |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.Pf_Disp = Local_RxBuf[i++];			hMBData.Hw2SetDef.Pf_Disp <<= 8;
			hMBData.Hw2SetDef.Pf_Disp |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.UnderPFAlm = Local_RxBuf[i++];	hMBData.Hw2SetDef.UnderPFAlm <<= 8;
			hMBData.Hw2SetDef.UnderPFAlm |= Local_RxBuf[i++];
			hMBData.Hw2SetDef.OverPFAlm = Local_RxBuf[i++];		hMBData.Hw2SetDef.OverPFAlm <<= 8;
			hMBData.Hw2SetDef.OverPFAlm |= Local_RxBuf[i++];
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.Hw2SetDef, &hMBData.Hw2SetDef, sizeof(HW2Set_Def));
			
			gChkWBusy = 0;
		}
		break;
	
	case HWSET_HW2SET_WR : // 멀티 바이트 (블럭) 쓰기 응답 분석  
		{	

			if(Local_RxBuf[0] != gHmiCommAddr){
				sprintf(sBuf, "(%x:0x01, Invalid slave addr. !!)", Local_RxBuf[0]);
				MESSAGEBOX_Create(sBuf, "hw2", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "(%x, %x : 0x10, Invalid function code !!)", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "hw2", GUI_MB_WARNING);
			}

			gRlySetMode = hMBData.Hw2SetDef.GroupCtrl;	// relay mode 
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

#if 0 //[[ by kys.2018.03.19_BEGIN -- a
	case HWSET_WIRE :
		{
			nVal = Local_RxBuf[3]; 
			nVal <<= 8;
			nVal |= Local_RxBuf[4];
			hMBData.NetPacDef.nWireSel = (uint8_t) nVal;
			gToken_nn = HWSET_RATE_VOL;
		}
		break;
	
#if 0 //[[ by kys.2018.03.08_BEGIN -- test
	case HWSET_CURR_DIR :
		{
			nVal = Local_RxBuf[3]; 
			nVal <<= 8;
			nVal |= Local_RxBuf[4];
			hMBData.NetPacDef.nCurrDir = (uint8_t) nVal;
			gToken_nn = HWSET_RATE_VOL;
		}
		break;
#endif //]] by kys.2018.03.08_END -- test
	
	case HWSET_RATE_VOL :
		{
			nVal = Local_RxBuf[3]; 
			nVal <<= 8;
			nVal |= Local_RxBuf[4];
			sprintf(setText, "%d V", nVal);
			memcpy( hMBData.NetPacDef.RateVol_Txt, setText, 20);
			gToken_nn = HWSET_RATE_CURR;
		}
		break;
	
	case HWSET_RATE_CURR :
		{
			nVal = Local_RxBuf[3]; 
			nVal <<= 8;
			nVal |= Local_RxBuf[4];
			sprintf(setText, "%d A", nVal);
			gToken_nn = TOK_WAIT;
			memcpy( hMBData.NetPacDef.RateCurr_Txt, setText, 20);
		}
		break;
#endif //]] by kys.2018.03.19_END -- a
		
	case HWSET_TIMESET_RD :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "tm", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x2b){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "tm", GUI_MB_WARNING);
			}
			hMBData.TimeSetDef.nYear = Local_RxBuf[5];
			hMBData.TimeSetDef.nMonth = Local_RxBuf[6];
			hMBData.TimeSetDef.nDay = Local_RxBuf[7];
			hMBData.TimeSetDef.nHour = Local_RxBuf[8];
			hMBData.TimeSetDef.nMinute = Local_RxBuf[9];
			hMBData.TimeSetDef.nSecond = Local_RxBuf[10];
			hMBData.TimeSetDef.nSecond <<= 8;
			hMBData.TimeSetDef.nSecond |= Local_RxBuf[11];
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.TimeSetDef, &hMBData.TimeSetDef, sizeof(Nw_TimeSet_Def));
			
			gChkWBusy = 0;
		}
		break;
	
	case HWSET_TIMESET_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "tm", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x2b){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "tm", GUI_MB_WARNING);
			}
			
			hMBData.TimeSetDef.nYear = Local_RxBuf[5];
			hMBData.TimeSetDef.nMonth = Local_RxBuf[6];
			hMBData.TimeSetDef.nDay = Local_RxBuf[7];
			hMBData.TimeSetDef.nHour = Local_RxBuf[8];
			hMBData.TimeSetDef.nMinute = Local_RxBuf[9];
			
			hMBData.TimeSetDef.nSecond = Local_RxBuf[10];			hMBData.TimeSetDef.nSecond <<= 8;
			hMBData.TimeSetDef.nSecond |= Local_RxBuf[11];	
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.TimeSetDef, &hMBData.TimeSetDef, sizeof(Nw_TimeSet_Def));
			
			gChkWBusy = 0;
		}
		break;
	case HWSET_DATA_CLEAR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "cd", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x05){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "cd", GUI_MB_WARNING);
			}

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
			//MESSAGEBOX_Create("\n\n Data Clear OK. !!\n\n", "cd", GUI_MB_WARNING);
		}
		break;
#if 0 //[[ by kys.2018.03.22_BEGIN -- q
	case HWSET_DATA_CLEAR_WR :
		break;
#endif //]] by kys.2018.03.22_END -- q

	case HWSET_DO_RD : // 207 : read // 기존 Fast Update 에서 매회 읽고 있다. 
		{
#if 0 //[[ by kys.2018.03.25_BEGIN -- a
			hMBData.DOutBitDef.nDataOutBit03 = Local_RxBuf[3];
			hMBData.DOutBitDef.nDataOutBit03 <<= 8;
			hMBData.DOutBitDef.nDataOutBit03 |= Local_RxBuf[4];
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.DOutBitDef, &hMBData.DOutBitDef, sizeof(Nw_DOut_Def));
			
			gChkWBusy = 0;
#endif //]] by kys.2018.03.25_END -- a
		}
		break;
	case HWSET_DO_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "do", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x05){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "do", GUI_MB_WARNING);
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case HWSET_DO_WR_OP :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "doop", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x05){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "doop", GUI_MB_WARNING);
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

		//////////////////////////////////////////////////////////
	}
}

void RelayPac_Parser(uint8_t *Local_RxBuf)
{
	char sBuf[64]={0};
	
	switch (gCurrStatus)
	{
	case TOK_WAIT :
		break;

	case RELAY_L_RD :
		{
			hMBData.RlyOvrLDef.nUse = Local_RxBuf[3];
			hMBData.RlyOvrLDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyOvrLDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyOvrLDef.nIdmtlSel = Local_RxBuf[6];		
			hMBData.RlyOvrLDef.nHotCold = Local_RxBuf[7];
			hMBData.RlyOvrLDef.nReserve = Local_RxBuf[8];	
			
			hMBData.RlyOvrLDef.nPickup = Local_RxBuf[9];			hMBData.RlyOvrLDef.nPickup <<= 8;
			hMBData.RlyOvrLDef.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyOvrLDef.nTimeDly = Local_RxBuf[11];		hMBData.RlyOvrLDef.nTimeDly <<= 8;
			hMBData.RlyOvrLDef.nTimeDly |= Local_RxBuf[12];
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyOvrLDef, &hMBData.RlyOvrLDef, sizeof(Ry_L_OL_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_L_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "L", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "L", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;


	case RELAY_LN_RD :
		{
			hMBData.RlyLnDef.nUse = Local_RxBuf[3];
			hMBData.RlyLnDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyLnDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyLnDef.nIdmtlSel = Local_RxBuf[6];		
			hMBData.RlyLnDef.nHotCold = Local_RxBuf[7];
			hMBData.RlyLnDef.nReserve = Local_RxBuf[8]; 
			
			hMBData.RlyLnDef.nPercent = Local_RxBuf[9];		hMBData.RlyLnDef.nPercent <<= 8;
			hMBData.RlyLnDef.nPercent |= Local_RxBuf[10];
			
			hMBData.RlyLnDef.nTmDly = Local_RxBuf[11];		hMBData.RlyLnDef.nTmDly <<= 8;
			hMBData.RlyLnDef.nTmDly |= Local_RxBuf[12];
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyLnDef, &hMBData.RlyLnDef, sizeof(Ry_LN_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_LN_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "ln", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "ln", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	case RELAY_S1_RD :
		{
			hMBData.RlySOcst1Def.nUse = Local_RxBuf[3];
			hMBData.RlySOcst1Def.nDoSel = Local_RxBuf[4];
			hMBData.RlySOcst1Def.nOpmode = Local_RxBuf[5];
			hMBData.RlySOcst1Def.nIdmtlSel = Local_RxBuf[6];		
			hMBData.RlySOcst1Def.nI2TOn = Local_RxBuf[7];
			hMBData.RlySOcst1Def.ZsiEn = Local_RxBuf[8]; 
			hMBData.RlySOcst1Def.nStartUpEn = Local_RxBuf[9]; 
			hMBData.RlySOcst1Def.Res = Local_RxBuf[10]; 
			
			hMBData.RlySOcst1Def.nPickup = Local_RxBuf[11];			hMBData.RlySOcst1Def.nPickup <<= 8;
			hMBData.RlySOcst1Def.nPickup |= Local_RxBuf[12];
			
			hMBData.RlySOcst1Def.nTmDly = Local_RxBuf[13];			hMBData.RlySOcst1Def.nTmDly <<= 8;
			hMBData.RlySOcst1Def.nTmDly |= Local_RxBuf[14];

			hMBData.RlySOcst1Def.nZsiTmDly = Local_RxBuf[15];		hMBData.RlySOcst1Def.nZsiTmDly <<= 8;
			hMBData.RlySOcst1Def.nZsiTmDly |= Local_RxBuf[16];

			hMBData.RlySOcst1Def.nSuPikup = Local_RxBuf[17];		hMBData.RlySOcst1Def.nSuPikup <<= 8;
			hMBData.RlySOcst1Def.nSuPikup |= Local_RxBuf[18];

			hMBData.RlySOcst1Def.nSuTmDly = Local_RxBuf[19];		hMBData.RlySOcst1Def.nSuTmDly <<= 8;
			hMBData.RlySOcst1Def.nSuTmDly |= Local_RxBuf[20];
			
			gToken_nn = RELAY_S2_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlySOcst1Def, &hMBData.RlySOcst1Def, sizeof(Ry_S_OCST1_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_S1_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "s1", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "s1", GUI_MB_WARNING);
			}
			
			gToken_nn = RELAY_S2_WR;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	case RELAY_S2_RD :
		{
			hMBData.RlySOcst2Def.nUse = Local_RxBuf[3];
			hMBData.RlySOcst2Def.nDoSel = Local_RxBuf[4];
			hMBData.RlySOcst2Def.nOpmode = Local_RxBuf[5];
			hMBData.RlySOcst2Def.nIdmtlSel = Local_RxBuf[6];		
			hMBData.RlySOcst2Def.nI2TOn = Local_RxBuf[7];
			hMBData.RlySOcst2Def.Res = Local_RxBuf[8]; 
			hMBData.RlySOcst2Def.nStartUpEn = Local_RxBuf[9]; 
			hMBData.RlySOcst2Def.Reserve = Local_RxBuf[10]; 
			
			hMBData.RlySOcst2Def.nPickup = Local_RxBuf[11];			hMBData.RlySOcst2Def.nPickup <<= 8;
			hMBData.RlySOcst2Def.nPickup |= Local_RxBuf[12];
			
			hMBData.RlySOcst2Def.nTmDly = Local_RxBuf[13];			hMBData.RlySOcst2Def.nTmDly <<= 8;
			hMBData.RlySOcst2Def.nTmDly |= Local_RxBuf[14];

			hMBData.RlySOcst2Def.nReserve = Local_RxBuf[15];		hMBData.RlySOcst2Def.nReserve <<= 8;
			hMBData.RlySOcst2Def.nReserve |= Local_RxBuf[16];

			hMBData.RlySOcst2Def.nSuPikup = Local_RxBuf[17];		hMBData.RlySOcst2Def.nSuPikup <<= 8;
			hMBData.RlySOcst2Def.nSuPikup |= Local_RxBuf[18];

			hMBData.RlySOcst2Def.nSuTmDly = Local_RxBuf[19];		hMBData.RlySOcst2Def.nSuTmDly <<= 8;
			hMBData.RlySOcst2Def.nSuTmDly |= Local_RxBuf[20];
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlySOcst2Def, &hMBData.RlySOcst2Def, sizeof(Ry_S_OCST2_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_S2_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "s2", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "s2", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	
	case RELAY_I_RD :
		{
			hMBData.RlyIIoDef.nUse = Local_RxBuf[3];
			hMBData.RlyIIoDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyIIoDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyIIoDef.nErms = Local_RxBuf[6];		
			hMBData.RlyIIoDef.nStartUpEn = Local_RxBuf[7];
			hMBData.RlyIIoDef.Res = Local_RxBuf[8]; 
			
			hMBData.RlyIIoDef.nPickup = Local_RxBuf[9];			hMBData.RlyIIoDef.nPickup <<= 8;
			hMBData.RlyIIoDef.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyIIoDef.nSuPickup = Local_RxBuf[11];	hMBData.RlyIIoDef.nSuPickup <<= 8;
			hMBData.RlyIIoDef.nSuPickup |= Local_RxBuf[12];

			hMBData.RlyIIoDef.nSuTmDly = Local_RxBuf[13];		hMBData.RlyIIoDef.nSuTmDly <<= 8;
			hMBData.RlyIIoDef.nSuTmDly |= Local_RxBuf[14];
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyIIoDef, &hMBData.RlyIIoDef, sizeof(Ry_I_IO_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_I_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "i", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "i", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	
	case RELAY_G_RD :
		{
			hMBData.RlyGEthFaultDef.nUse = Local_RxBuf[3];
			hMBData.RlyGEthFaultDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyGEthFaultDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyGEthFaultDef.nIdmtlSel = Local_RxBuf[6];		
			hMBData.RlyGEthFaultDef.nI2TOn = Local_RxBuf[7];
			hMBData.RlyGEthFaultDef.ZsiEn = Local_RxBuf[8];
			hMBData.RlyGEthFaultDef.nStartUpEn = Local_RxBuf[9];
			hMBData.RlyGEthFaultDef.Res = Local_RxBuf[10]; 
			
			hMBData.RlyGEthFaultDef.nPickup = Local_RxBuf[11];		hMBData.RlyGEthFaultDef.nPickup <<= 8;
			hMBData.RlyGEthFaultDef.nPickup |= Local_RxBuf[12];

			hMBData.RlyGEthFaultDef.nTmDly = Local_RxBuf[13];			hMBData.RlyGEthFaultDef.nTmDly <<= 8;
			hMBData.RlyGEthFaultDef.nTmDly |= Local_RxBuf[14];

			hMBData.RlyGEthFaultDef.nZsiTmDly = Local_RxBuf[15];	hMBData.RlyGEthFaultDef.nZsiTmDly <<= 8;
			hMBData.RlyGEthFaultDef.nZsiTmDly |= Local_RxBuf[16];

			hMBData.RlyGEthFaultDef.nSuPikup = Local_RxBuf[17];		hMBData.RlyGEthFaultDef.nSuPikup <<= 8;
			hMBData.RlyGEthFaultDef.nSuPikup |= Local_RxBuf[18];

			hMBData.RlyGEthFaultDef.nSuTmDly = Local_RxBuf[19];		hMBData.RlyGEthFaultDef.nSuTmDly <<= 8;
			hMBData.RlyGEthFaultDef.nSuTmDly |= Local_RxBuf[20];
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyGEthFaultDef, &hMBData.RlyGEthFaultDef, sizeof(Ry_G_EthFault_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_G_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "g", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "g ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	
	case RELAY_GEXT_RD :
		{
			hMBData.RlyGextDef.nUse = Local_RxBuf[3];
			hMBData.RlyGextDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyGextDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyGextDef.nI2TOn = Local_RxBuf[6];		
			hMBData.RlyGextDef.nStartUpEn = Local_RxBuf[7];
			hMBData.RlyGextDef.ZsiEn = Local_RxBuf[8]; 
			
			hMBData.RlyGextDef.nPickup = Local_RxBuf[9];			hMBData.RlyGextDef.nPickup <<= 8;
			hMBData.RlyGextDef.nPickup |= Local_RxBuf[10];

			hMBData.RlyGextDef.nTmDly = Local_RxBuf[11];			hMBData.RlyGextDef.nTmDly <<= 8;
			hMBData.RlyGextDef.nTmDly |= Local_RxBuf[12];
			
			hMBData.RlyGextDef.nZsiTmDly = Local_RxBuf[13];		hMBData.RlyGextDef.nZsiTmDly <<= 8;
			hMBData.RlyGextDef.nZsiTmDly |= Local_RxBuf[14];

			hMBData.RlyGextDef.nSuPikup = Local_RxBuf[15];		hMBData.RlyGextDef.nSuPikup <<= 8;
			hMBData.RlyGextDef.nSuPikup |= Local_RxBuf[16];

			hMBData.RlyGextDef.nSuTmDly = Local_RxBuf[17];		hMBData.RlyGextDef.nSuTmDly <<= 8;
			hMBData.RlyGextDef.nSuTmDly |= Local_RxBuf[18];
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyGextDef, &hMBData.RlyGextDef, sizeof(Ry_GEXT_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_GEXT_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "GEXT ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "GEXT ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;


	case RELAY_PTA_RD :
		{
			hMBData.RlyPtaDef.nUse = Local_RxBuf[3];
			hMBData.RlyPtaDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyPtaDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyPtaDef.nI2TOn = Local_RxBuf[6];		
			
			hMBData.RlyPtaDef.Pickup = Local_RxBuf[7];			hMBData.RlyPtaDef.Pickup <<= 8;
			hMBData.RlyPtaDef.Pickup |= Local_RxBuf[8];
			
			hMBData.RlyPtaDef.nTmDly = Local_RxBuf[9];			hMBData.RlyPtaDef.nTmDly <<= 8;
			hMBData.RlyPtaDef.nTmDly |= Local_RxBuf[10];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyPtaDef, &hMBData.RlyPtaDef, sizeof(Ry_PTA_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_PTA_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "pta ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "pta ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	case RELAY_UV_ST1_RD :
		{
			hMBData.RlyUvSta1Def.nUse = Local_RxBuf[3];
			hMBData.RlyUvSta1Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyUvSta1Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyUvSta1Def.nAutoFR = Local_RxBuf[6];		
			hMBData.RlyUvSta1Def.nNomsg = Local_RxBuf[7];		
			hMBData.RlyUvSta1Def.nDeadVolBL = Local_RxBuf[8];		
			hMBData.RlyUvSta1Def.nPhMode = Local_RxBuf[9];		
			hMBData.RlyUvSta1Def.nReserve = Local_RxBuf[10];		
			
			hMBData.RlyUvSta1Def.Pickup = Local_RxBuf[11];			hMBData.RlyUvSta1Def.Pickup <<= 8;
			hMBData.RlyUvSta1Def.Pickup |= Local_RxBuf[12];
			
			hMBData.RlyUvSta1Def.nTmDly = Local_RxBuf[13];			hMBData.RlyUvSta1Def.nTmDly <<= 8;
			hMBData.RlyUvSta1Def.nTmDly |= Local_RxBuf[14];
	
			gToken_nn = RELAY_UV_ST2_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyUvSta1Def, &hMBData.RlyUvSta1Def, sizeof(Ry_UV_Sta1_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_UV_ST1_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "uv ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "uv ", GUI_MB_WARNING);
			}
			gToken_nn = RELAY_UV_ST2_WR;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	
	case RELAY_UV_ST2_RD :
		{
			hMBData.RlyUvSta2Def.nUse = Local_RxBuf[3];
			hMBData.RlyUvSta2Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyUvSta2Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyUvSta2Def.nAutoFR = Local_RxBuf[6];		
			hMBData.RlyUvSta2Def.nNomsg = Local_RxBuf[7]; 	
			hMBData.RlyUvSta2Def.nDeadVolBL = Local_RxBuf[8]; 	
			hMBData.RlyUvSta2Def.nPhMode = Local_RxBuf[9];		
			hMBData.RlyUvSta2Def.nReserve = Local_RxBuf[10];		
			
			hMBData.RlyUvSta2Def.Pickup = Local_RxBuf[11];			hMBData.RlyUvSta2Def.Pickup <<= 8;
			hMBData.RlyUvSta2Def.Pickup |= Local_RxBuf[12];
			
			hMBData.RlyUvSta2Def.nTmDly = Local_RxBuf[13];			hMBData.RlyUvSta2Def.nTmDly <<= 8;
			hMBData.RlyUvSta2Def.nTmDly |= Local_RxBuf[14];
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyUvSta2Def, &hMBData.RlyUvSta2Def, sizeof(Ry_UV_Sta2_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_UV_ST2_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "uv2 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "uv2 ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	case RELAY_OVR1_RD :
		{
			hMBData.RlyOvSta1Def.nUse = Local_RxBuf[3];
			hMBData.RlyOvSta1Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyOvSta1Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyOvSta1Def.nReserve = Local_RxBuf[6];		
			
			hMBData.RlyOvSta1Def.Pickup = Local_RxBuf[7];			hMBData.RlyOvSta1Def.Pickup <<= 8;
			hMBData.RlyOvSta1Def.Pickup |= Local_RxBuf[8];
			
			hMBData.RlyOvSta1Def.nTmDly = Local_RxBuf[9];			hMBData.RlyOvSta1Def.nTmDly <<= 8;
			hMBData.RlyOvSta1Def.nTmDly |= Local_RxBuf[10];

			gToken_nn = RELAY_OVR2_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyOvSta1Def, &hMBData.RlyOvSta1Def, sizeof(Ry_OV_Sta1_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OVR1_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "ovr1 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "ovr1 ", GUI_MB_WARNING);
			}
			gToken_nn = RELAY_OVR2_WR;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	case RELAY_OVR2_RD :
		{
			hMBData.RlyOvSta2Def.nUse = Local_RxBuf[3];
			hMBData.RlyOvSta2Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyOvSta2Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyOvSta2Def.nReserve = Local_RxBuf[6];		
			
			hMBData.RlyOvSta2Def.Pickup = Local_RxBuf[7];			hMBData.RlyOvSta2Def.Pickup <<= 8;
			hMBData.RlyOvSta2Def.Pickup |= Local_RxBuf[8];
			
			hMBData.RlyOvSta2Def.nTmDly = Local_RxBuf[9];			hMBData.RlyOvSta2Def.nTmDly <<= 8;
			hMBData.RlyOvSta2Def.nTmDly |= Local_RxBuf[10];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyOvSta2Def, &hMBData.RlyOvSta2Def, sizeof(Ry_OV_Sta2_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OVR2_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "ovr2 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "ovr2 ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	
	case RELAY_RV_RD :
		{
			hMBData.RlyRvDef.nUse = Local_RxBuf[3];
			hMBData.RlyRvDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyRvDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyRvDef.nReserve = Local_RxBuf[6];		
			
			hMBData.RlyRvDef.Pickup = Local_RxBuf[7];			hMBData.RlyRvDef.Pickup <<= 8;
			hMBData.RlyRvDef.Pickup |= Local_RxBuf[8];
			
			hMBData.RlyRvDef.nTmDly = Local_RxBuf[9];			hMBData.RlyRvDef.nTmDly <<= 8;
			hMBData.RlyRvDef.nTmDly |= Local_RxBuf[10];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyRvDef, &hMBData.RlyRvDef, sizeof(Ry_RV_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_RV_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr)
			{
				MESSAGEBOX_Create("Invalid slave addr. !!", "rv ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10)
			{
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "rv ", GUI_MB_WARNING);
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	case RELAY_D_RD :
		{
			hMBData.RlyDOvDef.nUse = Local_RxBuf[3];
			hMBData.RlyDOvDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyDOvDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyDOvDef.ZsiEn = Local_RxBuf[6];		
			hMBData.RlyDOvDef.nStartUpEn = Local_RxBuf[7];		
			hMBData.RlyDOvDef.Res = Local_RxBuf[8];		
			
			hMBData.RlyDOvDef.nPickup = Local_RxBuf[9];				hMBData.RlyDOvDef.nPickup <<= 8;
			hMBData.RlyDOvDef.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyDOvDef.nTmDly = Local_RxBuf[11];				hMBData.RlyDOvDef.nTmDly <<= 8;
			hMBData.RlyDOvDef.nTmDly |= Local_RxBuf[12];

			hMBData.RlyDOvDef.nCherAngle = Local_RxBuf[13];		hMBData.RlyDOvDef.nCherAngle <<= 8;
			hMBData.RlyDOvDef.nCherAngle |= Local_RxBuf[14];

			hMBData.RlyDOvDef.nZsiTmDly = Local_RxBuf[15];		hMBData.RlyDOvDef.nZsiTmDly <<= 8;
			hMBData.RlyDOvDef.nZsiTmDly |= Local_RxBuf[16];

			hMBData.RlyDOvDef.nSuPikup = Local_RxBuf[17];			hMBData.RlyDOvDef.nSuPikup <<= 8;
			hMBData.RlyDOvDef.nSuPikup |= Local_RxBuf[18];

			hMBData.RlyDOvDef.nSuTmDly = Local_RxBuf[19];			hMBData.RlyDOvDef.nSuTmDly <<= 8;
			hMBData.RlyDOvDef.nSuTmDly |= Local_RxBuf[20];
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyDOvDef, &hMBData.RlyDOvDef, sizeof(Ry_D_OV_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_D_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "d ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "d ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	case RELAY_S_ST1_RD :
		{
			hMBData.RlySOcopSta1Def.nUse = Local_RxBuf[3];
			hMBData.RlySOcopSta1Def.nDoSel = Local_RxBuf[4];
			hMBData.RlySOcopSta1Def.nOpmode = Local_RxBuf[5];
			hMBData.RlySOcopSta1Def.nModeSel = Local_RxBuf[6];		
			
			hMBData.RlySOcopSta1Def.nPickupVL = Local_RxBuf[7];			hMBData.RlySOcopSta1Def.nPickupVL <<= 8;
			hMBData.RlySOcopSta1Def.nPickupVL |= Local_RxBuf[8];
			
			hMBData.RlySOcopSta1Def.nPickupVH = Local_RxBuf[9];			hMBData.RlySOcopSta1Def.nPickupVH <<= 8;
			hMBData.RlySOcopSta1Def.nPickupVH |= Local_RxBuf[10];

			hMBData.RlySOcopSta1Def.nPickupA = Local_RxBuf[11];			hMBData.RlySOcopSta1Def.nPickupA <<= 8;
			hMBData.RlySOcopSta1Def.nPickupA |= Local_RxBuf[12];

			hMBData.RlySOcopSta1Def.nTmDly = Local_RxBuf[13];			hMBData.RlySOcopSta1Def.nTmDly <<= 8;
			hMBData.RlySOcopSta1Def.nTmDly |= Local_RxBuf[14];

			hMBData.RlySOcopSta1Def.nKs = Local_RxBuf[15];			hMBData.RlySOcopSta1Def.nKs <<= 8;
			hMBData.RlySOcopSta1Def.nKs |= Local_RxBuf[16];

			gToken_nn = RELAY_S_ST2_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlySOcopSta1Def, &hMBData.RlySOcopSta1Def, sizeof(Ry_S_OCOP_Sta1_Def));
				// 토큰이 wait상태가 아니므로 초기화 해줘도 fast update가 동작상태에 들어 가지는 않는다.
			gChkWBusy = 0;
		}
		break;
	case RELAY_S_ST1_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "st1 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "st1 ", GUI_MB_WARNING);
			}
			gToken_nn = RELAY_S_ST2_WR;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	
	case RELAY_S_ST2_RD :
		{
			hMBData.RlySOcopSta2Def.nUse = Local_RxBuf[3];
			hMBData.RlySOcopSta2Def.nDoSel = Local_RxBuf[4];
			hMBData.RlySOcopSta2Def.nOpmode = Local_RxBuf[5];
			hMBData.RlySOcopSta2Def.nModeSel = Local_RxBuf[6];		
			
			hMBData.RlySOcopSta2Def.nPickupVL = Local_RxBuf[7];		hMBData.RlySOcopSta2Def.nPickupVL <<= 8;
			hMBData.RlySOcopSta2Def.nPickupVL |= Local_RxBuf[8];
			
			hMBData.RlySOcopSta2Def.nPickupVH = Local_RxBuf[9];		hMBData.RlySOcopSta2Def.nPickupVH <<= 8;
			hMBData.RlySOcopSta2Def.nPickupVH |= Local_RxBuf[10];

			hMBData.RlySOcopSta2Def.nPickupA = Local_RxBuf[11];		hMBData.RlySOcopSta2Def.nPickupA <<= 8;
			hMBData.RlySOcopSta2Def.nPickupA |= Local_RxBuf[12];

			hMBData.RlySOcopSta2Def.nTmDly = Local_RxBuf[13];			hMBData.RlySOcopSta2Def.nTmDly <<= 8;
			hMBData.RlySOcopSta2Def.nTmDly |= Local_RxBuf[14];

			hMBData.RlySOcopSta2Def.nKs = Local_RxBuf[15];			hMBData.RlySOcopSta2Def.nKs <<= 8;
			hMBData.RlySOcopSta2Def.nKs |= Local_RxBuf[16];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlySOcopSta2Def, &hMBData.RlySOcopSta2Def, sizeof(Ry_S_OCOP_Sta2_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_S_ST2_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "st2 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "st2 ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_IU_RD :
		{
			hMBData.RlyIuDef.nUse = Local_RxBuf[3];
			hMBData.RlyIuDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyIuDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyIuDef.Res = Local_RxBuf[6];		
			
			hMBData.RlyIuDef.nPickup = Local_RxBuf[7];		hMBData.RlyIuDef.nPickup <<= 8;
			hMBData.RlyIuDef.nPickup |= Local_RxBuf[8];
			
			hMBData.RlyIuDef.nTmDly = Local_RxBuf[9];			hMBData.RlyIuDef.nTmDly <<= 8;
			hMBData.RlyIuDef.nTmDly |= Local_RxBuf[10];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyIuDef, &hMBData.RlyIuDef, sizeof(Ry_IU_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_IU_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "iu ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "iu ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_VU_RD :
		{
			hMBData.RlyVuDef.nUse = Local_RxBuf[3];
			hMBData.RlyVuDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyVuDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyVuDef.Res = Local_RxBuf[6];		
			
			hMBData.RlyVuDef.nPickup = Local_RxBuf[7];		hMBData.RlyVuDef.nPickup <<= 8;
			hMBData.RlyVuDef.nPickup |= Local_RxBuf[8];
			
			hMBData.RlyVuDef.nTmDly = Local_RxBuf[9];			hMBData.RlyVuDef.nTmDly <<= 8;
			hMBData.RlyVuDef.nTmDly |= Local_RxBuf[10];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyVuDef, &hMBData.RlyVuDef, sizeof(Ry_VU_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_VU_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "vu ", GUI_MB_WARNING);
	
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "vu ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	case RELAY_UF_ST1_RD :
		{
			hMBData.RlyUfSta1Def.nUse = Local_RxBuf[3];
			hMBData.RlyUfSta1Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyUfSta1Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyUfSta1Def.Res = Local_RxBuf[6];		
			
			hMBData.RlyUfSta1Def.nUnderVol = Local_RxBuf[7];		hMBData.RlyUfSta1Def.nUnderVol <<= 8;
			hMBData.RlyUfSta1Def.nUnderVol |= Local_RxBuf[8];
	
			hMBData.RlyUfSta1Def.nPickup = Local_RxBuf[9];			hMBData.RlyUfSta1Def.nPickup <<= 8;
			hMBData.RlyUfSta1Def.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyUfSta1Def.nTmDly = Local_RxBuf[11];			hMBData.RlyUfSta1Def.nTmDly <<= 8;
			hMBData.RlyUfSta1Def.nTmDly |= Local_RxBuf[12];
	
			gToken_nn = RELAY_UF_ST2_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyUfSta1Def, &hMBData.RlyUfSta1Def, sizeof(Ry_UF_STA1_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_UF_ST1_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "uf1 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "uf1 ", GUI_MB_WARNING);
			}
			gToken_nn = RELAY_UF_ST2_WR;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_UF_ST2_RD :
		{
			hMBData.RlyUfSta2Def.nUse = Local_RxBuf[3];
			hMBData.RlyUfSta2Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyUfSta2Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyUfSta2Def.Res = Local_RxBuf[6];		
			
			hMBData.RlyUfSta2Def.nUnderVol = Local_RxBuf[7];		hMBData.RlyUfSta2Def.nUnderVol <<= 8;
			hMBData.RlyUfSta2Def.nUnderVol |= Local_RxBuf[8];
	
			hMBData.RlyUfSta2Def.nPickup = Local_RxBuf[9];			hMBData.RlyUfSta2Def.nPickup <<= 8;
			hMBData.RlyUfSta2Def.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyUfSta2Def.nTmDly = Local_RxBuf[11];			hMBData.RlyUfSta2Def.nTmDly <<= 8;
			hMBData.RlyUfSta2Def.nTmDly |= Local_RxBuf[12];
	
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyUfSta2Def, &hMBData.RlyUfSta2Def, sizeof(Ry_UF_STA2_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_UF_ST2_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "uf2 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "uf2 ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
		
	case RELAY_OF_ST1_RD :
		{
			hMBData.RlyOfSta1Def.nUse = Local_RxBuf[3];
			hMBData.RlyOfSta1Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyOfSta1Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyOfSta1Def.Res = Local_RxBuf[6];		
			
			hMBData.RlyOfSta1Def.nUnderVol = Local_RxBuf[7];		hMBData.RlyOfSta1Def.nUnderVol <<= 8;
			hMBData.RlyOfSta1Def.nUnderVol |= Local_RxBuf[8];

			hMBData.RlyOfSta1Def.nPickup = Local_RxBuf[9];			hMBData.RlyOfSta1Def.nPickup <<= 8;
			hMBData.RlyOfSta1Def.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyOfSta1Def.nTmDly = Local_RxBuf[11];			hMBData.RlyOfSta1Def.nTmDly <<= 8;
			hMBData.RlyOfSta1Def.nTmDly |= Local_RxBuf[12];
	
			gToken_nn = RELAY_OF_ST2_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyOfSta1Def, &hMBData.RlyOfSta1Def, sizeof(Ry_OF_STA1_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OF_ST1_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "of1 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "of1 ", GUI_MB_WARNING);
			}
			gToken_nn = RELAY_OF_ST2_WR;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OF_ST2_RD :
		{
			hMBData.RlyOfSta2Def.nUse = Local_RxBuf[3];
			hMBData.RlyOfSta2Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyOfSta2Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyOfSta2Def.Res = Local_RxBuf[6];
			
			hMBData.RlyOfSta2Def.nUnderVol = Local_RxBuf[7];		hMBData.RlyOfSta2Def.nUnderVol <<= 8;
			hMBData.RlyOfSta2Def.nUnderVol |= Local_RxBuf[8];

			hMBData.RlyOfSta2Def.nPickup = Local_RxBuf[9];			hMBData.RlyOfSta2Def.nPickup <<= 8;
			hMBData.RlyOfSta2Def.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyOfSta2Def.nTmDly = Local_RxBuf[11];			hMBData.RlyOfSta2Def.nTmDly <<= 8;
			hMBData.RlyOfSta2Def.nTmDly |= Local_RxBuf[12];
	
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyOfSta2Def, &hMBData.RlyOfSta2Def, sizeof(Ry_OF_STA2_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OF_ST2_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "of2 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "of2 ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	case RELAY_ROCOF_RD :
		{
			int i=3;
			hMBData.RlyRocofDef.nUse = Local_RxBuf[i++];
			hMBData.RlyRocofDef.nDoSel = Local_RxBuf[i++];
			hMBData.RlyRocofDef.nOpmode = Local_RxBuf[i++];
			hMBData.RlyRocofDef.nRocof = Local_RxBuf[i++];		
			
			hMBData.RlyRocofDef.nUnderVol = Local_RxBuf[i++];		hMBData.RlyRocofDef.nUnderVol <<= 8;
			hMBData.RlyRocofDef.nUnderVol |= Local_RxBuf[i++];
			
			hMBData.RlyRocofDef.nPickup = Local_RxBuf[i++];			hMBData.RlyRocofDef.nPickup <<= 8;
			hMBData.RlyRocofDef.nPickup |= Local_RxBuf[i++];
			
			hMBData.RlyRocofDef.nTmDly = Local_RxBuf[i++];			hMBData.RlyRocofDef.nTmDly <<= 8;
			hMBData.RlyRocofDef.nTmDly |= Local_RxBuf[i++];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyRocofDef, &hMBData.RlyRocofDef, sizeof(Ry_ROCOF_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_ROCOF_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "rocof ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "rocof ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_RP_RD :
		{
			hMBData.RlyRpDef.nUse = Local_RxBuf[3];
			hMBData.RlyRpDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyRpDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyRpDef.Res = Local_RxBuf[6];		
			
			hMBData.RlyRpDef.nPickup = Local_RxBuf[7];			hMBData.RlyRpDef.nPickup <<= 8;
			hMBData.RlyRpDef.nPickup |= Local_RxBuf[8];			hMBData.RlyRpDef.nPickup <<= 8;
			hMBData.RlyRpDef.nPickup |= Local_RxBuf[9];			hMBData.RlyRpDef.nPickup <<= 8;
			hMBData.RlyRpDef.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyRpDef.nTmDly = Local_RxBuf[11];			hMBData.RlyRpDef.nTmDly <<= 8;
			hMBData.RlyRpDef.nTmDly |= Local_RxBuf[12];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyRpDef, &hMBData.RlyRpDef, sizeof(Ry_RP_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_RP_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "rp ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "rp ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_RQ_ST1_RD :
		{
			hMBData.RlyRqSts1Def.nUse = Local_RxBuf[3];
			hMBData.RlyRqSts1Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyRqSts1Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyRqSts1Def.Res = Local_RxBuf[6];		
			
			hMBData.RlyRqSts1Def.nPickup = Local_RxBuf[7];			hMBData.RlyRqSts1Def.nPickup <<= 8;
			hMBData.RlyRqSts1Def.nPickup |= Local_RxBuf[8];			hMBData.RlyRqSts1Def.nPickup <<= 8;
			hMBData.RlyRqSts1Def.nPickup |= Local_RxBuf[9];			hMBData.RlyRqSts1Def.nPickup <<= 8;
			hMBData.RlyRqSts1Def.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyRqSts1Def.nTmDly = Local_RxBuf[11];			hMBData.RlyRqSts1Def.nTmDly <<= 8;
			hMBData.RlyRqSts1Def.nTmDly |= Local_RxBuf[12];
	
			gToken_nn = RELAY_RQ_ST2_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyRqSts1Def, &hMBData.RlyRqSts1Def, sizeof(Ry_RQ_STA1_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_RQ_ST1_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "rq1 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "rq1 ", GUI_MB_WARNING);
			}
			gToken_nn = RELAY_RQ_ST2_WR;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_RQ_ST2_RD :
		{
			hMBData.RlyRqSts2Def.nUse = Local_RxBuf[3];
			hMBData.RlyRqSts2Def.nDoSel = Local_RxBuf[4];
			hMBData.RlyRqSts2Def.nOpmode = Local_RxBuf[5];
			hMBData.RlyRqSts2Def.Res = Local_RxBuf[6];		
			
			hMBData.RlyRqSts2Def.nPickup = Local_RxBuf[7];			hMBData.RlyRqSts2Def.nPickup <<= 8;
			hMBData.RlyRqSts2Def.nPickup |= Local_RxBuf[8];			hMBData.RlyRqSts2Def.nPickup <<= 8;
			hMBData.RlyRqSts2Def.nPickup |= Local_RxBuf[9];			hMBData.RlyRqSts2Def.nPickup <<= 8;
			hMBData.RlyRqSts2Def.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyRqSts2Def.nTmDly = Local_RxBuf[11];			hMBData.RlyRqSts2Def.nTmDly <<= 8;
			hMBData.RlyRqSts2Def.nTmDly |= Local_RxBuf[12];
	
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyRqSts2Def, &hMBData.RlyRqSts2Def, sizeof(Ry_RQ_STA2_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_RQ_ST2_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "rq2 ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "rq2 ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OP_OQ_UP_RD :
		{
			int i;
			/////OP////////////////////////////////////
			hMBData.RlyOpDef.nUse = Local_RxBuf[3];
			hMBData.RlyOpDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyOpDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyOpDef.Res = Local_RxBuf[6];		
			
			hMBData.RlyOpDef.nPickup = Local_RxBuf[7];			hMBData.RlyOpDef.nPickup <<= 8;
			hMBData.RlyOpDef.nPickup |= Local_RxBuf[8];			hMBData.RlyOpDef.nPickup <<= 8;
			hMBData.RlyOpDef.nPickup |= Local_RxBuf[9];			hMBData.RlyOpDef.nPickup <<= 8;
			hMBData.RlyOpDef.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyOpDef.nTmDly = Local_RxBuf[11];			hMBData.RlyOpDef.nTmDly <<= 8;
			hMBData.RlyOpDef.nTmDly |= Local_RxBuf[12];
			// res//res
			/////OQ////////////////////////////////////
			i=15;
			hMBData.RlyOqDef.nUse = Local_RxBuf[i++];
			hMBData.RlyOqDef.nDoSel = Local_RxBuf[i++];
			hMBData.RlyOqDef.nOpmode = Local_RxBuf[i++];
			hMBData.RlyOqDef.Res = Local_RxBuf[i++];		
			
			hMBData.RlyOqDef.nPickup = Local_RxBuf[i++];			hMBData.RlyOqDef.nPickup <<= 8;
			hMBData.RlyOqDef.nPickup |= Local_RxBuf[i++];			hMBData.RlyOqDef.nPickup <<= 8;
			hMBData.RlyOqDef.nPickup |= Local_RxBuf[i++];			hMBData.RlyOqDef.nPickup <<= 8;
			hMBData.RlyOqDef.nPickup |= Local_RxBuf[i++];

			hMBData.RlyOqDef.nTmDly = Local_RxBuf[i++];			hMBData.RlyOqDef.nTmDly <<= 8;
			hMBData.RlyOqDef.nTmDly |= Local_RxBuf[i++];
			//res;//res
			//////UP///////////////////////////////////
			i=27;
			hMBData.RlyUpDef.nUse = Local_RxBuf[i++];
			hMBData.RlyUpDef.nDoSel = Local_RxBuf[i++];
			hMBData.RlyUpDef.nOpmode = Local_RxBuf[i++];
			hMBData.RlyUpDef.Res = Local_RxBuf[i++];		
			
			hMBData.RlyUpDef.nDeadCurr = Local_RxBuf[i++];	hMBData.RlyUpDef.nDeadCurr <<= 8;
			hMBData.RlyUpDef.nDeadCurr |= Local_RxBuf[i++];

			hMBData.RlyUpDef.nPickup = Local_RxBuf[i++];	hMBData.RlyUpDef.nPickup <<= 8;
			hMBData.RlyUpDef.nPickup |= Local_RxBuf[i++];	hMBData.RlyUpDef.nPickup <<= 8;
			hMBData.RlyUpDef.nPickup |= Local_RxBuf[i++];	hMBData.RlyUpDef.nPickup <<= 8;
			hMBData.RlyUpDef.nPickup |= Local_RxBuf[i++];
			
			hMBData.RlyUpDef.nTmDly = Local_RxBuf[i++];		hMBData.RlyUpDef.nTmDly <<= 8;
			hMBData.RlyUpDef.nTmDly |= Local_RxBuf[i++];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyOpDef, &hMBData.RlyOpDef, sizeof(Ry_OP_Def));
			memcpy(&hMBDataSet.RlyOqDef, &hMBData.RlyOqDef, sizeof(Ry_OQ_Def));
			memcpy(&hMBDataSet.RlyOqDef, &hMBData.RlyUpDef, sizeof(Ry_UP_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OP_RD :
		{
			hMBData.RlyOpDef.nUse = Local_RxBuf[3];
			hMBData.RlyOpDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyOpDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyOpDef.Res = Local_RxBuf[6];		
			
			hMBData.RlyOpDef.nPickup = Local_RxBuf[7];
			hMBData.RlyOpDef.nPickup <<= 8;
			hMBData.RlyOpDef.nPickup |= Local_RxBuf[8];
			hMBData.RlyOpDef.nPickup <<= 8;
			hMBData.RlyOpDef.nPickup |= Local_RxBuf[9];
			hMBData.RlyOpDef.nPickup <<= 8;
			hMBData.RlyOpDef.nPickup |= Local_RxBuf[10];
			
			hMBData.RlyOpDef.nTmDly = Local_RxBuf[11];
			hMBData.RlyOpDef.nTmDly <<= 8;
			hMBData.RlyOpDef.nTmDly |= Local_RxBuf[12];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyOpDef, &hMBData.RlyOpDef, sizeof(Ry_OP_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OP_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "op ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "op ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OQ_RD :
		{
			hMBData.RlyOqDef.nUse = Local_RxBuf[3];
			hMBData.RlyOqDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyOqDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyOqDef.Res = Local_RxBuf[6];		
			
			hMBData.RlyOqDef.nPickup = Local_RxBuf[7];			hMBData.RlyOqDef.nPickup <<= 8;
			hMBData.RlyOqDef.nPickup |= Local_RxBuf[8];			hMBData.RlyOqDef.nPickup <<= 8;
			hMBData.RlyOqDef.nPickup |= Local_RxBuf[9];			hMBData.RlyOqDef.nPickup <<= 8;
			hMBData.RlyOqDef.nPickup |= Local_RxBuf[10];

			hMBData.RlyOqDef.nTmDly = Local_RxBuf[11];			hMBData.RlyOqDef.nTmDly <<= 8;
			hMBData.RlyOqDef.nTmDly |= Local_RxBuf[12];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyOqDef, &hMBData.RlyOqDef, sizeof(Ry_OQ_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_OQ_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "oq ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "oq ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_UP_RD :
		{
			hMBData.RlyUpDef.nUse = Local_RxBuf[3];
			hMBData.RlyUpDef.nDoSel = Local_RxBuf[4];
			hMBData.RlyUpDef.nOpmode = Local_RxBuf[5];
			hMBData.RlyUpDef.Res = Local_RxBuf[6];		
			
			hMBData.RlyUpDef.nDeadCurr = Local_RxBuf[7];		hMBData.RlyUpDef.nDeadCurr <<= 8;
			hMBData.RlyUpDef.nDeadCurr |= Local_RxBuf[8];

			hMBData.RlyUpDef.nPickup = Local_RxBuf[9];			hMBData.RlyUpDef.nPickup <<= 8;
			hMBData.RlyUpDef.nPickup |= Local_RxBuf[10];		hMBData.RlyUpDef.nPickup <<= 8;
			hMBData.RlyUpDef.nPickup |= Local_RxBuf[11];		hMBData.RlyUpDef.nPickup <<= 8;
			hMBData.RlyUpDef.nPickup |= Local_RxBuf[12];
			
			hMBData.RlyUpDef.nTmDly = Local_RxBuf[13];			hMBData.RlyUpDef.nTmDly <<= 8;
			hMBData.RlyUpDef.nTmDly |= Local_RxBuf[14];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.RlyUpDef, &hMBData.RlyUpDef, sizeof(Ry_UP_Def));
			
			gChkWBusy = 0;
		}
		break;
	case RELAY_UP_WR :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "up ", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "up ", GUI_MB_WARNING);
			}
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			
			gChkWBusy = 0;
		}
		break;

	}

	
}


void EvtSysPac_Parser(uint8_t *Local_RxBuf)
{
	char sBuf[64]={0};
	uint16_t nVal;

	switch (gCurrStatus)
	{
	case TOK_WAIT :
		break;

	case EVT_MAXEVT_BUFSIZE_RD :
		{
			int i=0;

			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "evtbuf", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x03){
				sprintf(sBuf, "Invalid function code : %x %x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "evtbuf", GUI_MB_WARNING);
			}
			if(Local_RxBuf[2] != 0x18){ // length
				MESSAGEBOX_Create("Invalid length !!", "evtbuf", GUI_MB_WARNING);
			}
			
			i = 3;
			hMBData.EvtSysevtDef.TripWavMaxCnt = Local_RxBuf[i++];
			hMBData.EvtSysevtDef.TripWavMaxCnt <<= 8;
			hMBData.EvtSysevtDef.TripWavMaxCnt |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.Res = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.Res <<= 8;
			hMBData.EvtSysevtDef.Res |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.TripWavSaveCycle = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.TripWavSaveCycle <<= 8;
			hMBData.EvtSysevtDef.TripWavSaveCycle |= Local_RxBuf[i++];
	
			hMBData.EvtSysevtDef.RealWavSaveCycle = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.RealWavSaveCycle <<= 8;
			hMBData.EvtSysevtDef.RealWavSaveCycle |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.Trip1CycleSample = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.Trip1CycleSample <<= 8;
			hMBData.EvtSysevtDef.Trip1CycleSample |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.Real1CycleSample = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.Real1CycleSample <<= 8;
			hMBData.EvtSysevtDef.Real1CycleSample |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.SysEvtMaxCnt = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.SysEvtMaxCnt <<= 8;
			hMBData.EvtSysevtDef.SysEvtMaxCnt |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.FltEvtMaxCnt = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.FltEvtMaxCnt <<= 8;
			hMBData.EvtSysevtDef.FltEvtMaxCnt |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.SysEvt1RecLength = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.SysEvt1RecLength <<= 8;
			hMBData.EvtSysevtDef.SysEvt1RecLength |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.FltEvt1RecLength = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.FltEvt1RecLength <<= 8;
			hMBData.EvtSysevtDef.FltEvt1RecLength |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.TripWav1RecLength = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.TripWav1RecLength <<= 8;
			hMBData.EvtSysevtDef.TripWav1RecLength |= Local_RxBuf[i++];

			hMBData.EvtSysevtDef.RealWav1RecLength = Local_RxBuf[i++]; 
			hMBData.EvtSysevtDef.RealWav1RecLength <<= 8;
			hMBData.EvtSysevtDef.RealWav1RecLength |= Local_RxBuf[i++];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.EvtSysevtDef, &hMBData.EvtSysevtDef, sizeof(Evt_SysevtDef));
			
			gChkWBusy = 0;
		}
		break;

		case EVT_SYS_EVT_DATA_RD :
			{
				int cnt=0, i=0;

				if(Local_RxBuf[0] != gHmiCommAddr){
					MESSAGEBOX_Create("Invalid slave addr. !!", "evtsys", GUI_MB_WARNING);
				}
				if(Local_RxBuf[1] != 0x64){
					sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
					MESSAGEBOX_Create(sBuf, "evtsys", GUI_MB_WARNING);
				}
				if(Local_RxBuf[2] != 0x12){ // length
					MESSAGEBOX_Create("Invalid length !!", "evtsys", GUI_MB_WARNING);
				}
				// 3,4 는 이벤트 분류
				i=5;
				for(cnt=0; cnt<8; cnt++)
				{
					hMBData.EvtSysevtDef.sys_event[cnt] = Local_RxBuf[i++];
					hMBData.EvtSysevtDef.sys_event[cnt] <<= 8;
					hMBData.EvtSysevtDef.sys_event[cnt] |= Local_RxBuf[i++];
				}
		
				gToken_nn = TOK_WAIT;
				gCurrStatus = TOK_WAIT;
				memcpy(&hMBDataSet.EvtSysevtDef, &hMBData.EvtSysevtDef, sizeof(Evt_SysevtDef));
				
				gChkWBusy = 0;
			}
			break;

		case EVT_FLT_EVT_DATA_RD :
			{
				int cnt=0, i=0;
		
				if(Local_RxBuf[0] != gHmiCommAddr){
					MESSAGEBOX_Create("Invalid slave addr. !!", "evtflt", GUI_MB_WARNING);
				}
				if(Local_RxBuf[1] != 0x64){
					sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
					MESSAGEBOX_Create(sBuf, "evtflt", GUI_MB_WARNING);
				}
				if(Local_RxBuf[2] != 0x34){ // length
					MESSAGEBOX_Create("Invalid length !!", "evtflt", GUI_MB_WARNING);
				}

				// 3,4 는 레코드 길이 . ~까지 헤더 
				i=5;
				for(cnt=0; cnt<7; cnt++)
				{
					hMBData.EvtSysevtDef.fault_event_hdr[cnt] = Local_RxBuf[i++];
					hMBData.EvtSysevtDef.fault_event_hdr[cnt] <<= 8;
					hMBData.EvtSysevtDef.fault_event_hdr[cnt] |= Local_RxBuf[i++];
				}

				for(cnt=0; cnt<9; cnt++)	// float value
				{
					hMBData.EvtSysevtDef.fault_event_val[cnt] = Local_RxBuf[i++];
					hMBData.EvtSysevtDef.fault_event_val[cnt] <<= 8;
					hMBData.EvtSysevtDef.fault_event_val[cnt] |= Local_RxBuf[i++];
					hMBData.EvtSysevtDef.fault_event_val[cnt] <<= 8;
					hMBData.EvtSysevtDef.fault_event_val[cnt] |= Local_RxBuf[i++];
					hMBData.EvtSysevtDef.fault_event_val[cnt] <<= 8;
					hMBData.EvtSysevtDef.fault_event_val[cnt] |= Local_RxBuf[i++];
				}
				
		
				gToken_nn = TOK_WAIT;
				gCurrStatus = TOK_WAIT;
				memcpy(&hMBDataSet.EvtSysevtDef, &hMBData.EvtSysevtDef, sizeof(Evt_SysevtDef));
				
				gChkWBusy = 0;
			}
			break;



	}
}

void DevInfoPac_Parser(uint8_t *Local_RxBuf)
{
	char sBuf[64]={0};
	uint16_t nVal;

	switch (gCurrStatus)
	{
	case TOK_WAIT :
		break;

	case DEV_OCRINFO_RD :
		{
			int i=0, j=0;

			j=3;
			
			for(i=0; i<12; i++)
				hMBData.DevSysInfoDef.DevOcrInfo.nProcCode[i] = Local_RxBuf[j++];
			
			for(i=0; i<10; i++)
				hMBData.DevSysInfoDef.DevOcrInfo.nSerNum[i] = Local_RxBuf[j++];

			for(i=0; i<4; i++)
				hMBData.DevSysInfoDef.DevOcrInfo.nManufName[i] = Local_RxBuf[j++];

			for(i=0; i<4; i++)
				hMBData.DevSysInfoDef.DevOcrInfo.nProcName[i] = Local_RxBuf[j++];

			for(i=0; i<10; i++)
				hMBData.DevSysInfoDef.DevOcrInfo.nModelName[i] = Local_RxBuf[j++];

			for(i=0; i<20; i++)
				hMBData.DevSysInfoDef.DevOcrInfo.nUserDefDevName[i] = Local_RxBuf[j++];

			for(i=0; i<6; i++)
				hMBData.DevSysInfoDef.DevOcrInfo.nOcrHwVer[i] = Local_RxBuf[j++];

			hMBData.DevSysInfoDef.DevOcrInfo.RES1 = Local_RxBuf[j++]; 
			hMBData.DevSysInfoDef.DevOcrInfo.RES1 <<= 8;
			hMBData.DevSysInfoDef.DevOcrInfo.RES1 |= Local_RxBuf[j++];
			hMBData.DevSysInfoDef.DevOcrInfo.RES2 = Local_RxBuf[j++]; 
			hMBData.DevSysInfoDef.DevOcrInfo.RES2 <<= 8;
			hMBData.DevSysInfoDef.DevOcrInfo.RES2 |= Local_RxBuf[j++];
			hMBData.DevSysInfoDef.DevOcrInfo.RES3 = Local_RxBuf[j++]; 
			hMBData.DevSysInfoDef.DevOcrInfo.RES3 <<= 8;
			hMBData.DevSysInfoDef.DevOcrInfo.RES3 |= Local_RxBuf[j++];
			

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.DevSysInfoDef.DevOcrInfo, &hMBData.DevSysInfoDef.DevOcrInfo, sizeof(Dev_OcrInfo));
			
			gChkWBusy = 0;
		}
		break;
	case DEV_OCRINFO_WR:
		{
			int i=0, j=0;
			
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "devocr", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "devocr", GUI_MB_WARNING);
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.DevSysInfoDef, &hMBData.DevSysInfoDef, sizeof(Dev_SysInfoDef));
			
			gChkWBusy = 0;
		}
		break;
	
	case DEV_HMIINFO_RD :
		{
			int i, j;

			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "devhmi", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x03){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "devhmi-rd", GUI_MB_WARNING);
			}

			i=3;
			for(j=0; j<6; j++)
				hMBData.DevSysInfoDef.DevHmiInfo.nHMI_SW_ver[j] = Local_RxBuf[i++];

			hMBData.DevSysInfoDef.DevHmiInfo.OCR_Passwd = Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevHmiInfo.OCR_Passwd <<= 8;
			hMBData.DevSysInfoDef.DevHmiInfo.OCR_Passwd |= Local_RxBuf[i++];
		
			hMBData.DevSysInfoDef.DevHmiInfo.Swap = Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevHmiInfo.Swap <<= 8;
			hMBData.DevSysInfoDef.DevHmiInfo.Swap |= Local_RxBuf[i++];

			hMBData.DevSysInfoDef.DevHmiInfo.Map = Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevHmiInfo.Map <<= 8;
			hMBData.DevSysInfoDef.DevHmiInfo.Map |= Local_RxBuf[i++];

			hMBData.DevSysInfoDef.DevHmiInfo.RES4 = Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevHmiInfo.RES4 <<= 8;
			hMBData.DevSysInfoDef.DevHmiInfo.RES4 |= Local_RxBuf[i++];

			hMBData.DevSysInfoDef.DevHmiInfo.RES5 = Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevHmiInfo.RES5 <<= 8;
			hMBData.DevSysInfoDef.DevHmiInfo.RES5 |= Local_RxBuf[i++];
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.DevSysInfoDef.DevHmiInfo, &hMBData.DevSysInfoDef.DevHmiInfo, sizeof(Dev_HmiInfo));
			
			gChkWBusy = 0;
		}
		break;
	case DEV_HMIINFO_WR:
		{
			if(Local_RxBuf[0] != gHmiCommAddr)
			{
				MESSAGEBOX_Create("Invalid slave addr. !!", "devhmi", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x10)
			{
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "devhmi-wr", GUI_MB_WARNING);
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.DevSysInfoDef, &hMBData.DevSysInfoDef, sizeof(Dev_SysInfoDef));
			
			gChkWBusy = 0;
		}
		break;

	case DEV_LIFE_CYCLE_RD:
		{
			int i;
			uint32_t temp;

			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "devhmi", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "devhmi-cy", GUI_MB_WARNING);
			}

			i = 3;

#if 0 //[[ by kys.2018.04.21_BEGIN -- a
			temp = Local_RxBuf[i++]; 			temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevLifeCycle.in_temp = *((float *)temp);	// 내부 온도 .
#endif //]] by kys.2018.04.21_END -- a
		
			temp = Local_RxBuf[i++]; 			temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevLifeCycle.op_time = temp; 

			temp = Local_RxBuf[i++]; 			temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevLifeCycle.cb_on_time = temp; 

			temp = Local_RxBuf[i++]; 			temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevLifeCycle.elec_cnt = temp; 

			temp = Local_RxBuf[i++]; 			temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevLifeCycle.mech_cnt = temp; 

			temp = Local_RxBuf[i++]; 			temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 		temp <<= 8;
			temp |= Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevLifeCycle.trip_cnt = temp; 

			hMBData.DevSysInfoDef.DevLifeCycle.cont_wear = Local_RxBuf[i++]; 
			hMBData.DevSysInfoDef.DevLifeCycle.cont_wear <<= 8;
			hMBData.DevSysInfoDef.DevLifeCycle.cont_wear |= Local_RxBuf[i++];
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.DevSysInfoDef.DevLifeCycle, &hMBData.DevSysInfoDef.DevLifeCycle, sizeof(Dev_LifeCycle));
			
			gChkWBusy = 0;
		}
		break;

	}

	
}

void MeasurePac_Parser(uint8_t *Local_RxBuf)
{
	char sBuf[64]={0};
	uint16_t nVal;

	switch (gCurrStatus)
	{
	case TOK_WAIT :
		break;

	case MEA_LD_CURR_RD :
		{
			hMBData.MeaPhCurDef.PhACurr = Local_RxBuf[3]; 			hMBData.MeaPhCurDef.PhACurr <<= 8;
			hMBData.MeaPhCurDef.PhACurr |= Local_RxBuf[4];			hMBData.MeaPhCurDef.PhACurr <<= 8;
			hMBData.MeaPhCurDef.PhACurr |= Local_RxBuf[5];			hMBData.MeaPhCurDef.PhACurr <<= 8;
			hMBData.MeaPhCurDef.PhACurr |= Local_RxBuf[6];
			
			hMBData.MeaPhCurDef.PhBCurr = Local_RxBuf[7];				hMBData.MeaPhCurDef.PhBCurr <<= 8;
			hMBData.MeaPhCurDef.PhBCurr |= Local_RxBuf[8];			hMBData.MeaPhCurDef.PhBCurr <<= 8;
			hMBData.MeaPhCurDef.PhBCurr |= Local_RxBuf[9];			hMBData.MeaPhCurDef.PhBCurr <<= 8;
			hMBData.MeaPhCurDef.PhBCurr |= Local_RxBuf[10];

			hMBData.MeaPhCurDef.PhCCurr = Local_RxBuf[11];			hMBData.MeaPhCurDef.PhCCurr <<= 8;
			hMBData.MeaPhCurDef.PhCCurr |= Local_RxBuf[12];			hMBData.MeaPhCurDef.PhCCurr <<= 8;
			hMBData.MeaPhCurDef.PhCCurr |= Local_RxBuf[13];			hMBData.MeaPhCurDef.PhCCurr <<= 8;
			hMBData.MeaPhCurDef.PhCCurr |= Local_RxBuf[14];

			hMBData.MeaPhCurDef.PhNCurr = Local_RxBuf[15];			hMBData.MeaPhCurDef.PhNCurr <<= 8;
			hMBData.MeaPhCurDef.PhNCurr |= Local_RxBuf[16];			hMBData.MeaPhCurDef.PhNCurr <<= 8;
			hMBData.MeaPhCurDef.PhNCurr |= Local_RxBuf[17];			hMBData.MeaPhCurDef.PhNCurr <<= 8;
			hMBData.MeaPhCurDef.PhNCurr |= Local_RxBuf[18];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaPhCurDef, &hMBData.MeaPhCurDef, sizeof(Mea_PhCurr_Def));
			
			gChkWBusy = 0;
		}
		break;

	case MEA_LD_PHVOL_RD :
		{
			int i=3;

			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhAVol = temp.u32Data; 
			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhBVol = temp.u32Data; 
			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhCVol = temp.u32Data; 
////////////////////////////////////////////////////////////////////////////////
			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhABVol = temp.u32Data; 
			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhBCVol = temp.u32Data; 
			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhCAVol = temp.u32Data; 
///////////////////////////////////////////////////////////////
			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhACur = temp.u32Data; 
			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhBCur = temp.u32Data; 
			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhCCur = temp.u32Data; 
			temp.u32Data = Local_RxBuf[i++];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[i++];
			hMBData.MeaPhVolDef.PhNCur = temp.u32Data; 
	
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaPhVolDef, &hMBData.MeaPhVolDef, sizeof(Mea_PhVolDef));
			
			gChkWBusy = 0;
		}
		break;
		
	case MEA_FAST_UPD_RD :
		{
			if(InPcBypass == 1)
			{
				gCurrStatus = TOK_WAIT;
				gToken_nn = TOK_WAIT;
				break;
			}

			hMBData.MeaFastUpdDef.nSyseRollOverC = Local_RxBuf[3];
			hMBData.MeaFastUpdDef.nFlteRollOverC = Local_RxBuf[4];

			hMBData.MeaFastUpdDef.nLastSysEvtIdx = Local_RxBuf[5];		hMBData.MeaFastUpdDef.nLastSysEvtIdx <<= 8;
			hMBData.MeaFastUpdDef.nLastSysEvtIdx = Local_RxBuf[6];

			hMBData.MeaFastUpdDef.nLastFltEvtIdx = Local_RxBuf[7];		hMBData.MeaFastUpdDef.nLastFltEvtIdx <<= 8;
			hMBData.MeaFastUpdDef.nLastFltEvtIdx = Local_RxBuf[8];

			hMBData.MeaFastUpdDef.nLastTripWaveFN = Local_RxBuf[9];
			hMBData.MeaFastUpdDef.nVaildTripWaveCnt = Local_RxBuf[10];

			hMBData.MeaFastUpdDef.nDemandNum = Local_RxBuf[11];
			hMBData.MeaFastUpdDef.nDemandNone = Local_RxBuf[12];

			hMBData.MeaFastUpdDef.nSysSetNum = Local_RxBuf[13];
			hMBData.MeaFastUpdDef.nPwrSetNum = Local_RxBuf[14];

			hMBData.MeaFastUpdDef.nPols = Local_RxBuf[15];
			hMBData.MeaFastUpdDef.nUseVolSet = Local_RxBuf[16];

			hMBData.MeaFastUpdDef.nKnobSts1 = Local_RxBuf[17];		hMBData.MeaFastUpdDef.nKnobSts1 <<= 8;
			hMBData.MeaFastUpdDef.nKnobSts1 = Local_RxBuf[18];

			hMBData.MeaFastUpdDef.nKnobSts2 = Local_RxBuf[19];		hMBData.MeaFastUpdDef.nKnobSts2 <<= 8;
			hMBData.MeaFastUpdDef.nKnobSts2 = Local_RxBuf[20];

			hMBData.MeaFastUpdDef.nLongtmIR = Local_RxBuf[21];		hMBData.MeaFastUpdDef.nLongtmIR <<= 8;
			hMBData.MeaFastUpdDef.nLongtmIR = Local_RxBuf[22];

			hMBData.MeaFastUpdDef.nRes1 = Local_RxBuf[23];				hMBData.MeaFastUpdDef.nRes1 <<= 8;
			hMBData.MeaFastUpdDef.nRes1 = Local_RxBuf[24];

			hMBData.MeaFastUpdDef.nRes2 = Local_RxBuf[25];				hMBData.MeaFastUpdDef.nRes2 <<= 8;
			hMBData.MeaFastUpdDef.nRes2 = Local_RxBuf[26];

			hMBData.MeaFastUpdDef.nOperStatus = Local_RxBuf[27];	hMBData.MeaFastUpdDef.nOperStatus <<= 8;
			hMBData.MeaFastUpdDef.nOperStatus = Local_RxBuf[28];

			hMBData.MeaFastUpdDef.nDIstatus = Local_RxBuf[29];		hMBData.MeaFastUpdDef.nDIstatus <<= 8;
			hMBData.MeaFastUpdDef.nDIstatus = Local_RxBuf[30];

			hMBData.MeaFastUpdDef.nDOstatus = Local_RxBuf[31];		hMBData.MeaFastUpdDef.nDOstatus <<= 8;
			hMBData.MeaFastUpdDef.nDOstatus = Local_RxBuf[32];

			hMBData.MeaFastUpdDef.nDevActFail1 = Local_RxBuf[33];	hMBData.MeaFastUpdDef.nDevActFail1 <<= 8;
			hMBData.MeaFastUpdDef.nDevActFail1 = Local_RxBuf[34];

			hMBData.MeaFastUpdDef.nDevActFail2 = Local_RxBuf[35];	hMBData.MeaFastUpdDef.nDevActFail2 <<= 8;
			hMBData.MeaFastUpdDef.nDevActFail2 = Local_RxBuf[36];

			hMBData.MeaFastUpdDef.nCurrPwrAct1 = Local_RxBuf[37];	hMBData.MeaFastUpdDef.nCurrPwrAct1 <<= 8;
			hMBData.MeaFastUpdDef.nCurrPwrAct1 = Local_RxBuf[38];

			hMBData.MeaFastUpdDef.nCurrPwrAct2 = Local_RxBuf[39];	hMBData.MeaFastUpdDef.nCurrPwrAct2 <<= 8;
			hMBData.MeaFastUpdDef.nCurrPwrAct2 = Local_RxBuf[40];

			hMBData.MeaFastUpdDef.nCpxPwrAct1 = Local_RxBuf[41];	hMBData.MeaFastUpdDef.nCpxPwrAct1 <<= 8;
			hMBData.MeaFastUpdDef.nCpxPwrAct1 = Local_RxBuf[42];

			hMBData.MeaFastUpdDef.nCpxPwrAct2 = Local_RxBuf[43];	hMBData.MeaFastUpdDef.nCpxPwrAct2 <<= 8;
			hMBData.MeaFastUpdDef.nCpxPwrAct2 = Local_RxBuf[44];
///////////////////////////////////////////////////////////214
			temp.u32Data = Local_RxBuf[45];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[46];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[47];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[48];
			hMBData.MeaFastUpdDef.nAPhCurr = temp.fData;
			
			temp.u32Data = Local_RxBuf[49];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[50];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[51];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[52];
			hMBData.MeaFastUpdDef.nBPhCurr = temp.fData;
			
			temp.u32Data = Local_RxBuf[53];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[54];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[55];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[56];
			hMBData.MeaFastUpdDef.nCPhCurr = temp.fData;
			
			temp.u32Data = Local_RxBuf[57];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[58];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[59];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[60];
			hMBData.MeaFastUpdDef.nNPhCurr = temp.fData;

			temp.u32Data = Local_RxBuf[61];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[62];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[63];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[64];
			hMBData.MeaFastUpdDef.n3OPhCurrIn = temp.fData;
			
			temp.u32Data = Local_RxBuf[65];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[66];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[67];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[68];
			hMBData.MeaFastUpdDef.n3OPhCurrOut = temp.fData;

			temp.u32Data = Local_RxBuf[69];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[70];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[71];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[72];
			hMBData.MeaFastUpdDef.nNorPhCurr = temp.fData;
			
			temp.u32Data = Local_RxBuf[73];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[74];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[75];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[76];
			hMBData.MeaFastUpdDef.nRevPhCurr = temp.fData;

			temp.u32Data = Local_RxBuf[77] ;		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[78];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[79];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[80];
			hMBData.MeaFastUpdDef.nAPhVol = temp.fData;
			
			temp.u32Data = Local_RxBuf[81] ;		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[82];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[83];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[84];
			hMBData.MeaFastUpdDef.nBPhVol = temp.fData;
			
			temp.u32Data = Local_RxBuf[85] ;		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[86];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[87];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[88];
			hMBData.MeaFastUpdDef.nCPhVol = temp.fData;

			temp.u32Data = Local_RxBuf[89] ;		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[90];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[91];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[92];
			hMBData.MeaFastUpdDef.nABPhVol = temp.fData;
			
			temp.u32Data = Local_RxBuf[93] ;		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[94];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[95];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[96];
			hMBData.MeaFastUpdDef.nBCPhVol = temp.fData;
			
			temp.u32Data = Local_RxBuf[97] ;		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[98];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[99];		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[100];
			hMBData.MeaFastUpdDef.nCAPhVol = temp.fData;
			
			temp.u32Data = Local_RxBuf[101] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[102];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[103];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[104];
			hMBData.MeaFastUpdDef.n3OPhVolIn = temp.fData;
			
			temp.u32Data = Local_RxBuf[105] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[106];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[107];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[108];
			hMBData.MeaFastUpdDef.n3ONorPhVol = temp.fData;

			temp.u32Data = Local_RxBuf[109] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[110];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[111];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[112];
			hMBData.MeaFastUpdDef.n3ORevPhVol = temp.fData;

			temp.u32Data = Local_RxBuf[113] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[114];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[115];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[116];
			hMBData.MeaFastUpdDef.nTotperPwr = temp.fData;

			temp.u32Data = Local_RxBuf[117] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[118];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[119];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[120];
			hMBData.MeaFastUpdDef.nTotWPwr = temp.fData;

			temp.u32Data = Local_RxBuf[121] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[122];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[123];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[124];
			hMBData.MeaFastUpdDef.nTotVarPwr = temp.fData;

			temp.u32Data = Local_RxBuf[125] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[126];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[127];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[128];
			hMBData.MeaFastUpdDef.nTotVaPwr = temp.fData;

			temp.u32Data = Local_RxBuf[129] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[130];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[131];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[132];
			hMBData.MeaFastUpdDef.nF = temp.fData;

			temp.u32Data = Local_RxBuf[133] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[134];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[135];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[136];
			hMBData.MeaFastUpdDef.nVolNonPr = temp.fData;

			temp.u32Data = Local_RxBuf[137] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[138];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[139];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[140];
			hMBData.MeaFastUpdDef.nCurrNonPr = temp.fData;

			temp.u32Data = Local_RxBuf[141] ;	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[142];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[143];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[144];
			hMBData.MeaFastUpdDef.nPwrPcen = temp.fData;

 			temp.u32Data = Local_RxBuf[145];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[146];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[147];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[148];
			hMBData.MeaFastUpdDef.nEp_l = temp.fData;

			hMBData.MeaFastUpdDef.nEp_h = Local_RxBuf[149];		hMBData.MeaFastUpdDef.nEp_h <<= 8;
			hMBData.MeaFastUpdDef.nEp_h |= Local_RxBuf[150];	hMBData.MeaFastUpdDef.nEp_h <<= 8;
			hMBData.MeaFastUpdDef.nEp_h |= Local_RxBuf[151];	hMBData.MeaFastUpdDef.nEp_h <<= 8;
			hMBData.MeaFastUpdDef.nEp_h |= Local_RxBuf[152];

			temp.u32Data = Local_RxBuf[153];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[154];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[155];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[156];
			hMBData.MeaFastUpdDef.nEq_l = temp.fData;

			hMBData.MeaFastUpdDef.nEq_h = Local_RxBuf[157];		hMBData.MeaFastUpdDef.nEq_h <<= 8;
			hMBData.MeaFastUpdDef.nEq_h |= Local_RxBuf[158];	hMBData.MeaFastUpdDef.nEq_h <<= 8;
			hMBData.MeaFastUpdDef.nEq_h |= Local_RxBuf[159];	hMBData.MeaFastUpdDef.nEq_h <<= 8;
			hMBData.MeaFastUpdDef.nEq_h |= Local_RxBuf[160];

			temp.u32Data = Local_RxBuf[161];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[162];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[163];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[164];
			hMBData.MeaFastUpdDef.nRp_l = temp.fData;

			hMBData.MeaFastUpdDef.nRp_h = Local_RxBuf[165];		hMBData.MeaFastUpdDef.nRp_h <<= 8;
			hMBData.MeaFastUpdDef.nRp_h |= Local_RxBuf[166];	hMBData.MeaFastUpdDef.nRp_h <<= 8;
			hMBData.MeaFastUpdDef.nRp_h |= Local_RxBuf[167];	hMBData.MeaFastUpdDef.nRp_h <<= 8;
			hMBData.MeaFastUpdDef.nRp_h |= Local_RxBuf[168];

			temp.u32Data = Local_RxBuf[169];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[170];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[171];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[172];
			hMBData.MeaFastUpdDef.nRq_l = temp.fData;

			hMBData.MeaFastUpdDef.nRq_h = Local_RxBuf[173];		hMBData.MeaFastUpdDef.nRq_h <<= 8;
			hMBData.MeaFastUpdDef.nRq_h |= Local_RxBuf[174];	hMBData.MeaFastUpdDef.nRq_h <<= 8;
			hMBData.MeaFastUpdDef.nRq_h |= Local_RxBuf[175];	hMBData.MeaFastUpdDef.nRq_h <<= 8;
			hMBData.MeaFastUpdDef.nRq_h |= Local_RxBuf[176];

			temp.u32Data = Local_RxBuf[177];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[178];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[179];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[180];
			hMBData.MeaFastUpdDef.nPisan_l = temp.fData;

			hMBData.MeaFastUpdDef.nPisan_h = Local_RxBuf[181];	hMBData.MeaFastUpdDef.nPisan_h <<= 8;
			hMBData.MeaFastUpdDef.nPisan_h |= Local_RxBuf[182];	hMBData.MeaFastUpdDef.nPisan_h <<= 8;
			hMBData.MeaFastUpdDef.nPisan_h |= Local_RxBuf[183];	hMBData.MeaFastUpdDef.nPisan_h <<= 8;
			hMBData.MeaFastUpdDef.nPisan_h |= Local_RxBuf[184];

			temp.u32Data = Local_RxBuf[185];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[186];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[187];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[188];
			hMBData.MeaFastUpdDef.nAphPf = temp.fData;

			temp.u32Data = Local_RxBuf[189];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[190];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[191];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[192];
			hMBData.MeaFastUpdDef.nBphPf = temp.fData;

			temp.u32Data = Local_RxBuf[193];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[194];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[195];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[196];
			hMBData.MeaFastUpdDef.nCphPf = temp.fData;

			temp.u32Data = Local_RxBuf[197];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[198];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[199];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[200];
			hMBData.MeaFastUpdDef.nAphP = temp.fData;

			temp.u32Data = Local_RxBuf[201];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[202];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[203];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[204];
			hMBData.MeaFastUpdDef.nBphP = temp.fData;

			temp.u32Data = Local_RxBuf[205];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[206];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[207];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[208];
			hMBData.MeaFastUpdDef.nCphP = temp.fData;

			temp.u32Data = Local_RxBuf[209];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[210];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[211];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[212];
			hMBData.MeaFastUpdDef.nAphQ = temp.fData;

			temp.u32Data = Local_RxBuf[213];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[214];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[215];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[216];
			hMBData.MeaFastUpdDef.nBphQ = temp.fData;

			temp.u32Data = Local_RxBuf[217];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[218];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[219];	temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[220];
			hMBData.MeaFastUpdDef.nCphQ = temp.fData;

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaFastUpdDef, &hMBData.MeaFastUpdDef, sizeof(Mea_FastUpdate_Def));
			
			gChkWBusy = 0;
			gChkNorCmd = NORMAL_MODE;

		}
		break;
	case MEA_MAXVO_RD :
		{
			temp.u32Data = Local_RxBuf[3]; 			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[4];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[5];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[6];
			hMBData.MeaMaxVoIoDef.nMaxVo = temp.fData;
			
			hMBData.MeaMaxVoIoDef.nMaxVoRes = Local_RxBuf[7];
			
			hMBData.MeaMaxVoIoDef.nMaxVoYear = Local_RxBuf[8];
			hMBData.MeaMaxVoIoDef.nMaxVoMonth = Local_RxBuf[9];
			hMBData.MeaMaxVoIoDef.nMaxVoDay = Local_RxBuf[10];
			hMBData.MeaMaxVoIoDef.nMaxVoHour = Local_RxBuf[11];
			hMBData.MeaMaxVoIoDef.nMaxVoMinute = Local_RxBuf[12];
			
			hMBData.MeaMaxVoIoDef.nMaxVoSec = Local_RxBuf[13];		hMBData.MeaMaxVoIoDef.nMaxVoSec <<= 8;
			hMBData.MeaMaxVoIoDef.nMaxVoSec |= Local_RxBuf[14];

			gToken_nn = MEA_MAXIO_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaMaxVoIoDef, &hMBData.MeaMaxVoIoDef, sizeof(Mea_MaxVoIo));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_MAXIO_RD :
		{
			temp.u32Data = Local_RxBuf[3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[6];
			hMBData.MeaMaxVoIoDef.nMaxIo = temp.fData;

			hMBData.MeaMaxVoIoDef.nMaxIoRes = Local_RxBuf[7];
			
			hMBData.MeaMaxVoIoDef.nMaxIoYear = Local_RxBuf[8];
			hMBData.MeaMaxVoIoDef.nMaxIoMonth = Local_RxBuf[9];
			hMBData.MeaMaxVoIoDef.nMaxIoDay = Local_RxBuf[10];
			hMBData.MeaMaxVoIoDef.nMaxIoHour = Local_RxBuf[11];
			hMBData.MeaMaxVoIoDef.nMaxIoMinute = Local_RxBuf[12];
			
			hMBData.MeaMaxVoIoDef.nMaxIoSec = Local_RxBuf[13];		hMBData.MeaMaxVoIoDef.nMaxIoSec <<= 8;
			hMBData.MeaMaxVoIoDef.nMaxIoSec |= Local_RxBuf[14];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaMaxVoIoDef, &hMBData.MeaMaxVoIoDef, sizeof(Mea_MaxVoIo));
			
			gChkWBusy = 0;
		}
		break;
		///////////////////////////////////////////////////////////////////////////
	case MEA_DEMAND_RD :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "dem", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "dem", GUI_MB_WARNING);
			}
			temp.u32Data = Local_RxBuf[3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[6];
			hMBData.MeaMaxDemDef.nIa = temp.fData;

			temp.u32Data = Local_RxBuf[7];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[8]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[9]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[10];
			hMBData.MeaMaxDemDef.nIb = temp.fData;

			temp.u32Data = Local_RxBuf[11];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[12]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[13]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[14];
			hMBData.MeaMaxDemDef.nIc = temp.fData;

			temp.u32Data = Local_RxBuf[15];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[16]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[17]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[18];
			hMBData.MeaMaxDemDef.nIw = temp.fData;

			gToken_nn = MEA_MAX_DEMAND_IA_RD;
			memcpy(&hMBDataSet.MeaMaxDemDef, &hMBData.MeaMaxDemDef, sizeof(Mea_MaxDemand));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_MAX_DEMAND_IA_RD :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "dem1", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "dem1", GUI_MB_WARNING);
			}
			temp.u32Data = Local_RxBuf[3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[6];
			hMBData.MeaMaxDemDef.nMaxDIa = temp.fData;

			hMBData.MeaMaxDemDef.nMaxDIaRes = Local_RxBuf[7];
			
			hMBData.MeaMaxDemDef.nMaxDIaYear = Local_RxBuf[8];
			hMBData.MeaMaxDemDef.nMaxDIaMonth = Local_RxBuf[9];
			hMBData.MeaMaxDemDef.nMaxDIaDay = Local_RxBuf[10];
			hMBData.MeaMaxDemDef.nMaxDIaHour = Local_RxBuf[11];
			hMBData.MeaMaxDemDef.nMaxDIaMinute = Local_RxBuf[12];
			
			hMBData.MeaMaxDemDef.nMaxDIaSec = Local_RxBuf[13];			hMBData.MeaMaxDemDef.nMaxDIaSec <<= 8;
			hMBData.MeaMaxDemDef.nMaxDIaSec |= Local_RxBuf[14];

			gToken_nn = MEA_MAX_DEMAND_IB_RD;
			memcpy(&hMBDataSet.MeaMaxDemDef, &hMBData.MeaMaxDemDef, sizeof(Mea_MaxDemand));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_MAX_DEMAND_IB_RD :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "dem2", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "dem2", GUI_MB_WARNING);
			}

			temp.u32Data = Local_RxBuf[3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[6];
			hMBData.MeaMaxDemDef.nMaxDIb = temp.fData;

			hMBData.MeaMaxDemDef.nMaxDIbRes = Local_RxBuf[7];
			hMBData.MeaMaxDemDef.nMaxDIbYear = Local_RxBuf[8];
			hMBData.MeaMaxDemDef.nMaxDIbMonth = Local_RxBuf[9];
			hMBData.MeaMaxDemDef.nMaxDIbDay = Local_RxBuf[10];
			hMBData.MeaMaxDemDef.nMaxDIbHour = Local_RxBuf[11];
			hMBData.MeaMaxDemDef.nMaxDIbMinute = Local_RxBuf[12];
			
			hMBData.MeaMaxDemDef.nMaxDIbSec = Local_RxBuf[13];		hMBData.MeaMaxDemDef.nMaxDIbSec <<= 8;
			hMBData.MeaMaxDemDef.nMaxDIbSec |= Local_RxBuf[14];

			gToken_nn = MEA_MAX_DEMAND_IC_RD;
			memcpy(&hMBDataSet.MeaMaxDemDef, &hMBData.MeaMaxDemDef, sizeof(Mea_MaxDemand));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_MAX_DEMAND_IC_RD :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "dem3", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "dem3", GUI_MB_WARNING);
			}

			temp.u32Data = Local_RxBuf[3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[6];
			hMBData.MeaMaxDemDef.nMaxDIc = temp.fData;

			hMBData.MeaMaxDemDef.nMaxDIcRes = Local_RxBuf[7];
			
			hMBData.MeaMaxDemDef.nMaxDIcYear = Local_RxBuf[8];
			hMBData.MeaMaxDemDef.nMaxDIcMonth = Local_RxBuf[9];
			hMBData.MeaMaxDemDef.nMaxDIcDay = Local_RxBuf[10];
			hMBData.MeaMaxDemDef.nMaxDIcHour = Local_RxBuf[11];
			hMBData.MeaMaxDemDef.nMaxDIcMinute = Local_RxBuf[12];
			
			hMBData.MeaMaxDemDef.nMaxDIcSec = Local_RxBuf[13];			hMBData.MeaMaxDemDef.nMaxDIcSec <<= 8;
			hMBData.MeaMaxDemDef.nMaxDIcSec |= Local_RxBuf[14];

			gToken_nn = MEA_MAX_DEMAND_W_RD;
			memcpy(&hMBDataSet.MeaMaxDemDef, &hMBData.MeaMaxDemDef, sizeof(Mea_MaxDemand));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_MAX_DEMAND_W_RD :
		{
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "dem4", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "dem4", GUI_MB_WARNING);
			}
			temp.u32Data = Local_RxBuf[3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[6];
			hMBData.MeaMaxDemDef.nMaxDIw = temp.fData;

			hMBData.MeaMaxDemDef.nMaxDIwRes = Local_RxBuf[7];
			
			hMBData.MeaMaxDemDef.nMaxDIwYear = Local_RxBuf[8];
			hMBData.MeaMaxDemDef.nMaxDIwMonth = Local_RxBuf[9];
			hMBData.MeaMaxDemDef.nMaxDIwDay = Local_RxBuf[10];
			hMBData.MeaMaxDemDef.nMaxDIwHour = Local_RxBuf[11];
			hMBData.MeaMaxDemDef.nMaxDIwMinute = Local_RxBuf[12];
			hMBData.MeaMaxDemDef.nMaxDIwSec = Local_RxBuf[13];				hMBData.MeaMaxDemDef.nMaxDIwSec <<= 8;
			hMBData.MeaMaxDemDef.nMaxDIwSec |= Local_RxBuf[14];

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaMaxDemDef, &hMBData.MeaMaxDemDef, sizeof(Mea_MaxDemand));
			
			gChkWBusy = 0;
		}
		break;
		///////////////////////////////////////////////////////////////////////////

	case MEA_HARMONICS_VA_RD:
		{
			int i=0, j=0;
			
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "hamva", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "hamva", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.03.22_BEGIN -- a
			if(Local_RxBuf[2] != 252){
				MESSAGEBOX_Create("Invalid data length !!", "info va", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.03.22_END -- a
			
			for(i = 0, j=0; i < 63; i++, j+=4)
			{
				temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+6];
				hMBData.MeaHamVIabcDef.nVa[i] = temp.fData;
			}

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaHamVIabcDef, &hMBData.MeaHamVIabcDef, sizeof(Mea_HamVIabcDef));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_HARMONICS_VB_RD:
		{
			int i=0, j=0;
			
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "ham vb", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "ham vb", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.03.22_BEGIN -- a
			if(Local_RxBuf[2] != 252){
				MESSAGEBOX_Create("Invalid data length !!", "info vb", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.03.22_END -- a
			
			for(i = 0, j=0; i < 63; i++, j+=4)
			{
				temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+6];
				hMBData.MeaHamVIabcDef.nVb[i] = temp.fData;
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaHamVIabcDef, &hMBData.MeaHamVIabcDef, sizeof(Mea_HamVIabcDef));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_HARMONICS_VC_RD:
		{
			int i=0, j=0;
			
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "ham vc", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "ham vc", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.03.22_BEGIN -- a
			if(Local_RxBuf[2] != 252){
				MESSAGEBOX_Create("Invalid data length !!", "info vc", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.03.22_END -- a
			
			for(i = 0, j=0; i < 63; i++, j+=4)
			{
				temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+6];
				hMBData.MeaHamVIabcDef.nVc[i] = temp.fData;
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaHamVIabcDef, &hMBData.MeaHamVIabcDef, sizeof(Mea_HamVIabcDef));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_HARMONICS_IA_RD:
		{
			int i=0, j=0;
			
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "ham ia", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "ham ia", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.03.22_BEGIN -- a
			if(Local_RxBuf[2] != 252){
				MESSAGEBOX_Create("Invalid data length !!", "info ia", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.03.22_END -- a
			
			for(i = 0, j=0; i < 63; i++, j+=4)
			{
				temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+6];
				hMBData.MeaHamVIabcDef.nIa[i] = temp.fData;
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaHamVIabcDef, &hMBData.MeaHamVIabcDef, sizeof(Mea_HamVIabcDef));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_HARMONICS_IB_RD:
		{
			int i=0, j=0;
			
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "ham ib", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "ham ib", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.04.22_BEGIN -- a
			if(Local_RxBuf[2] != 252){
				MESSAGEBOX_Create("Invalid data length !!", "ham ib", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.04.22_END -- a
			
			for(i = 0, j=0; i < 63; i++, j+=4)
			{
				temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+6];
				hMBData.MeaHamVIabcDef.nIb[i] = temp.fData;
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaHamVIabcDef, &hMBData.MeaHamVIabcDef, sizeof(Mea_HamVIabcDef));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_HARMONICS_IC_RD:
		{
			int i=0, j=0;
			
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "ham ic", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "ham ic", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.04.22_BEGIN -- a
			if(Local_RxBuf[2] != 252){
				MESSAGEBOX_Create("Invalid data length !!", "ham ic", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.04.22_END -- a
			
			for(i = 0, j=0; i < 63; i++, j+=4)
			{
				temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
				temp.u32Data |= Local_RxBuf[j+6];
				hMBData.MeaHamVIabcDef.nIc[i] = temp.fData;
			}
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaHamVIabcDef, &hMBData.MeaHamVIabcDef, sizeof(Mea_HamVIabcDef));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_HAM_THD_TDD_KF_IVABC_RD:
		{
			int j=0;
			
			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "ham thd", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x04){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "ham thd", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.04.22_BEGIN -- a
			if(Local_RxBuf[2] != 100){
				MESSAGEBOX_Create("Invalid data length !!", "ham thd", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.04.22_END -- a
			j=0;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8; // 320 - thd -v
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nThdVa = temp.fData;
			j=4;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nThdVb = temp.fData;
			j=8;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nThdVc = temp.fData;

			j=24;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;	// 332 - thd -i
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nThdIa = temp.fData;
			j=28;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nThdIb = temp.fData;
			j=32;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nThdIc = temp.fData;

			j=36;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8; // 338 - tdd - i
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nTddIa = temp.fData;
			j=40;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nTddIb = temp.fData;
			j=44;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nTddIc = temp.fData;

			j=88;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8; // 364 - kf-i
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nKfIa = temp.fData;
			j=92;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nKfIb = temp.fData;
			j=96;
			temp.u32Data = Local_RxBuf[j+3];			temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+4]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+5]; 		temp.u32Data <<= 8;
			temp.u32Data |= Local_RxBuf[j+6];
			hMBData.MeaThdTddKfDef.nKfIc = temp.fData;
			
			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaThdTddKfDef, &hMBData.MeaThdTddKfDef, sizeof(Mea_ThdTddKfDef));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_OSCILLOSCOPE_1_RD:
		{
			int i, j; 
			int16_t temp16;
			int16_t temp8;
			/* ----------------------------------------
			rsp header Format
			------------------------------------------
						Slave Address 					: 0x01
						Function								: 0x64(100)
						Resp. Data length 			: 0xF2(242)	//   길이값에는 CRC가 포함되어 있다. 
						Sub-Req. 1. File resp. length : 0xF1(241)
						Sub-Req. 1. Ref. Type		: 0x06
			*/

			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "rwosc", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x64){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "rwosc", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.03.30_BEGIN -- a
			if(Local_RxBuf[2] != 0xF2){
				MESSAGEBOX_Create("Invalid code 1", "rwosc", GUI_MB_WARNING);
			}
			if(Local_RxBuf[3] != 0xF1){
				MESSAGEBOX_Create("Invalid code 2", "rwosc", GUI_MB_WARNING);
			}
			if(Local_RxBuf[4] != 0x06){
				MESSAGEBOX_Create("Invalid code 3", "rwosc", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.03.30_END -- a

			// 이후 200바이트 연속 후 CRC // 20바이트 씩 input
			i = 5;
			for(j = 0; j < 10; j++) 
			{
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIA = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIB = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIC = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIN = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwExIzct = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwVaVab = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwVbVbc = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwVcVca = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwRes1 = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwRes2 = temp16; 
			}			

			gToken_nn = MEA_OSCILLOSCOPE_2_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaOscDef, &hMBData.MeaOscDef, sizeof(Mea_OSC_CycleDef));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_OSCILLOSCOPE_2_RD:
		{
			int i, j; 
			int16_t temp16;
			int16_t temp8;

			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "rwosc2", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x64){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "rwosc2", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.03.30_BEGIN -- a
						if(Local_RxBuf[2] != 0xF2){
							MESSAGEBOX_Create("Invalid code 1", "rwosc", GUI_MB_WARNING);
						}
						if(Local_RxBuf[3] != 0xF1){
							MESSAGEBOX_Create("Invalid code 2", "rwosc", GUI_MB_WARNING);
						}
						if(Local_RxBuf[4] != 0x06){
							MESSAGEBOX_Create("Invalid code 3", "rwosc", GUI_MB_WARNING);
						}
#endif //]] by kys.2018.03.30_END -- a

			// 이후 200바이트 연속 후 CRC // 20바이트 씩 input
			i = 5;
			for(j = 10; j < 20; j++) 
			{
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIA = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIB = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIC = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIN = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwExIzct = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwVaVab = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwVbVbc = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwVcVca = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwRes1 = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwRes2 = temp16; 
			}			

			gToken_nn = MEA_OSCILLOSCOPE_3_RD;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaOscDef, &hMBData.MeaOscDef, sizeof(Mea_OSC_CycleDef));
			
			gChkWBusy = 0;
		}
		break;
	case MEA_OSCILLOSCOPE_3_RD:
		{
			int i, j; 
			int16_t temp16;
			int16_t temp8;

			if(Local_RxBuf[0] != gHmiCommAddr){
				MESSAGEBOX_Create("Invalid slave addr. !!", "rwosc3", GUI_MB_WARNING);
			}
			if(Local_RxBuf[1] != 0x64){
				sprintf(sBuf, "Invalid function code : %x:%x", Local_RxBuf[1], Local_RxBuf[2]);
				MESSAGEBOX_Create(sBuf, "rwosc3", GUI_MB_WARNING);
			}
#if 0 //[[ by kys.2018.03.30_BEGIN -- a
			if(Local_RxBuf[2] != 0xA2){
				MESSAGEBOX_Create("Invalid code 1", "rwosc3", GUI_MB_WARNING);
			}
			if(Local_RxBuf[3] != 0xA1){
				MESSAGEBOX_Create("Invalid code 2", "rwosc3", GUI_MB_WARNING);
			}
			if(Local_RxBuf[4] != 0x06){
				MESSAGEBOX_Create("Invalid code 3", "rwosc3", GUI_MB_WARNING);
			}
#endif //]] by kys.2018.03.30_END -- a

			// 이후 200바이트 연속 후 CRC // 20바이트 씩 input
			i = 5;
			for(j = 20; j < 32; j++) 
			{
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIA = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIB = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIC = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwIN = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwExIzct = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwVaVab = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwVbVbc = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwVcVca = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwRes1 = temp16; 
				temp16 = Local_RxBuf[i++];		temp16 <<= 8;
				temp16 |= Local_RxBuf[i++];
				hMBData.MeaOscDef.RwSampleData[j].rwRes2 = temp16; 
			}

			gToken_nn = TOK_WAIT;
			gCurrStatus = TOK_WAIT;
			memcpy(&hMBDataSet.MeaOscDef, &hMBData.MeaOscDef, sizeof(Mea_OSC_CycleDef));
			
			gChkWBusy = 0;
		}
		break;

		
	}
	
}

////////////////////////////////////////////////////////////////////////////////

void Evgt_Sys_Packet()	
{
	uint16_t crc;
	static uint8_t frame[256]={0};
	uint16_t uAddr, uLen;

	switch(gToken_nn)
	{
		case TOK_WAIT :		
			{
			}
			break;

		case EVT_MAXEVT_BUFSIZE_RD:		//460: Event 및 Fault Wave 저장 크기 정보
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;
				uAddr=460; uLen=12;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = EVT_MAXEVT_BUFSIZE_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case EVT_SYS_EVT_DATA_RD:
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x64;	// func. 100
				frame[2] = 0x07;	// byte cnt
				frame[3] = 0x06;	// sub-req 1 ref type
				frame[4] = 0x00;	// file num hi
				frame[5] = 0x64;	// file num lo : 100
				frame[6] = (uint8_t)(gLastSysEvtIdx >> 8); // record start num hi
				frame[7] = (uint8_t)(gLastSysEvtIdx);  // record start num lo 
				frame[8] = 0x00;	// record length hi
				frame[9] = 0x01;	// record length lo
				crc = CRC16(frame, 10);
				frame[10] = (uint8_t) (crc >> 8);
				frame[11] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 12);
				Send_Pwr_Packet(12);
				gCurrStatus = EVT_SYS_EVT_DATA_RD;
				gToken_nn = TOK_WAIT;
			}
			break;

		case EVT_FLT_EVT_DATA_RD:
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x64;	// func. 100
				frame[2] = 0x07;	// byte cnt
				frame[3] = 0x06;	// sub-req 1 ref type
				frame[4] = 0x00;	// file num hi
				frame[5] = 0x65;	// file num lo : 101
				frame[6] = (uint8_t)(gLastFltEvtIdx >> 8); // record start num hi
				frame[7] = (uint8_t)(gLastFltEvtIdx);  // record start num lo 
				frame[8] = 0x00;	// record length hi
				frame[9] = 0x01;	// record length lo
				crc = CRC16(frame, 10);
				frame[10] = (uint8_t) (crc >> 8);
				frame[11] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 12);
				Send_Pwr_Packet(12);
				gCurrStatus = EVT_FLT_EVT_DATA_RD;
				gToken_nn = TOK_WAIT;
			}
			break;

	}
}


void Dev_Info_Packet()	
{
	uint16_t crc;
	static uint8_t frame[256]={0};
	uint16_t uAddr, uLen;

	switch(gToken_nn)
	{
		case TOK_WAIT :		
			{
			}
			break;

		case DEV_OCRINFO_RD:	//기기 정보 OCR 공장모드 설정 data 읽기 
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;
				uAddr=473; uLen=36;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = DEV_OCRINFO_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
#if 0 //[[ by kys.2018.04.13_BEGIN -- 읽기 만 된다.
		case DEV_OCRINFO_WR: //기기 정보 OCR 공장모드 설정 data
			{
				int i;
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func
				frame[2] = 0x01;
				frame[3] = 0xD9;	// 473
				frame[4] = 0x00;	// len
				frame[5] = 36;	// len 35
				frame[6] = 36*2;	// count : x2
				for(i=0; i<12; i++)
					frame[i+7] = hMBData.DevSysInfoDef.nProcCode[i];
				for(i=0; i<10; i++)
					frame[i+19] = hMBData.DevSysInfoDef.nSerNum[i];
				for(i=0; i<4; i++)
					frame[i+23] = hMBData.DevSysInfoDef.nManufName[i];
				for(i=0; i<4; i++)
					frame[i+27] = hMBData.DevSysInfoDef.nProcName[i];
				for(i=0; i<10; i++)
					frame[i+31] = hMBData.DevSysInfoDef.nModelName[i];
				for(i=0; i<20; i++)
					frame[i+41] = hMBData.DevSysInfoDef.nUserDefDevName[i];
				for(i=0; i<6; i++)
					frame[i+61] = hMBData.DevSysInfoDef.nOcrHwVer[i];
				i=67;
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.RES1>>8);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.RES1&0xFF);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.RES2>>8);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.RES2&0xFF);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.RES3>>8);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.RES3&0xFF);
				crc = CRC16(frame, i);
				frame[i++] = (uint8_t) (crc >> 8);
				frame[i++] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, i);
				Send_Pwr_Packet(i);
				gCurrStatus = DEV_OCRINFO_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
#endif //]] by kys.2018.04.13_END -- a
		case DEV_HMIINFO_RD:
			{
				uint16_t rAddr=510, rLen=8;
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;
				frame[2] = (uint8_t)(rAddr>>8);
				frame[3] = (uint8_t)(rAddr);
				frame[4] = (uint8_t)(rLen>>8);
				frame[5] = (uint8_t)(rLen);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = DEV_HMIINFO_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case DEV_HMIINFO_WR:
			{
				int i;
				uint16_t wAddr=510, wLen=8;
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func
				frame[2] = (uint8_t)(wAddr>>8);
				frame[3] = (uint8_t)(wAddr);
				frame[4] = (uint8_t)(wLen>>8);
				frame[5] = (uint8_t)(wLen);
				frame[6] = wLen*2;				// count : x2
				for(i=0; i<6; i++)
					frame[i+7] = hMBData.DevSysInfoDef.DevHmiInfo.nHMI_SW_ver[i];
				
				i=13;	//주소지정
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.OCR_Passwd>>8);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.OCR_Passwd&0xFF);

				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.Swap>>8);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.Swap&0xFF);

				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.Map>>8);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.Map&0xFF);

				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.RES4>>8);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.RES4&0xFF);

				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.RES5>>8);
				frame[i++] = (uint8_t)(hMBData.DevSysInfoDef.DevHmiInfo.RES5&0xFF);

				crc = CRC16(frame, i);
				frame[i++] = (uint8_t) (crc >> 8);
				frame[i++] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, i);
				Send_Pwr_Packet(i);
				gCurrStatus = DEV_HMIINFO_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case DEV_LIFE_CYCLE_RD:
			{
				uint16_t rAddr = 1758, rLen=11;
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x04;
				frame[2] = (uint8_t)(rAddr>>8);
				frame[3] = (uint8_t)(rAddr);
				frame[4] = (uint8_t)(rLen>>8);
				frame[5] = (uint8_t)(rLen);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = DEV_LIFE_CYCLE_RD;
				gToken_nn = TOK_WAIT;
			}
			break;

	}
}

////////////////////////////////////////////////////////////////////////////////
void MeasurePacket()
{
	uint16_t crc;
	static uint8_t frame[256]={0};
	uint16_t uAddr, uLen;

#if 0 //[[ by kys.2018.03.24_BEGIN -- test
	if( (gChkNorCmd == 0) || (InPcBypass == 0)) 
	{
		if(gToken_nn == TOK_WAIT)
		{
			if(gMeaGetTime >= 500)	// 300 ms
			{
				gMeaGetTime = 0;
				gToken_nn = MEA_FAST_UPD_RD;
			}
		}
	}
#endif //]] by kys.2018.03.24_END -- test

	switch(gToken_nn)
	{
		case TOK_WAIT :		
			{
			}
			break;
		
		case MEA_LD_CURR_RD :		
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=214; uLen=8;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_LD_CURR_RD;
			gToken_nn = TOK_WAIT;
		}
		break;

		case MEA_LD_PHVOL_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=344; uLen=20;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_LD_PHVOL_RD;
			gToken_nn = TOK_WAIT;
		}
		break;

		// 193~300 : 107ea :: fast update Read
		case MEA_FAST_UPD_RD :
		{
			if(InPcBypass == 1)
			{
				gCurrStatus = TOK_WAIT;
				gToken_nn = TOK_WAIT;
				break;
			}
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			gChkNorCmd = FASTUPDATE_MODE;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=193; uLen=109;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_FAST_UPD_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_MAXVO_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=1819; uLen=6;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_MAXVO_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_MAXIO_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=1826; uLen=6;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_MAXIO_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_DEMAND_RD :		// Last Demand IA, IB, IC, W
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=308; uLen=8;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_DEMAND_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_MAX_DEMAND_IA_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=1770; uLen=6;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_MAX_DEMAND_IA_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_MAX_DEMAND_IB_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=1777; uLen=6;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_MAX_DEMAND_IB_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_MAX_DEMAND_IC_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=1784; uLen=6;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_MAX_DEMAND_IC_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_MAX_DEMAND_W_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=1791; uLen=6;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_MAX_DEMAND_W_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_HARMONICS_VA_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=370; uLen=63;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_HARMONICS_VA_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_HARMONICS_VB_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=496; uLen=63;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_HARMONICS_VB_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_HARMONICS_VC_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=622; uLen=63;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_HARMONICS_VC_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_HARMONICS_IA_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=1126; uLen=63;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_HARMONICS_IA_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_HARMONICS_IB_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=1252; uLen=63;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_HARMONICS_IB_RD;
			gToken_nn = TOK_WAIT;
		}
		break;
		case MEA_HARMONICS_IC_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=1378; uLen=63;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_HARMONICS_IC_RD;
			gToken_nn = TOK_WAIT;
			
		}
		break;
		case MEA_HAM_THD_TDD_KF_IVABC_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x04;	// func.
			uAddr=320; uLen=50;
			frame[2] = (uint8_t)(uAddr>>8);
			frame[3] = (uint8_t)(uAddr&0xff);
			frame[4] = (uint8_t)(uLen>>8);
			frame[5] = (uint8_t)(uLen&0xff);
			crc = CRC16(frame, 6);
			frame[6] = (uint8_t) (crc >> 8);
			frame[7] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 8);
			Send_Pwr_Packet(8);
			gCurrStatus = MEA_HAM_THD_TDD_KF_IVABC_RD;
			gToken_nn = TOK_WAIT;
			
		}
		break;
		case MEA_OSCILLOSCOPE_1_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x64;	// func.
			frame[2] = 0x07;	// byte cnt
			frame[3] = 0x06;	// sub-req 1 ref type : 서브 요청 1 (real wave .etc)
			frame[4] = 0x00;	// file num hi
			frame[5] = 0xFA;	// file num lo : 받을 파일 번호 
			frame[6] = 0x00;	// record num hi
			frame[7] = 0x01;	// record num lo 받을 레코드 시작 번호 : 1 ~ A(10ea)까지 
			frame[8] = 0x00;	// file leng hi
			frame[9] = 0x0A;	// file leng lo : 받을 레코드 길이: 10 sample(레코드) (20(1recode) x 10) = 200byte
			crc = CRC16(frame, 10);
			frame[10] = (uint8_t) (crc >> 8);
			frame[11] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 12);
			Send_Pwr_Packet(12);
			gCurrStatus = MEA_OSCILLOSCOPE_1_RD;
			gToken_nn = TOK_WAIT;
			
		}
		break;
		case MEA_OSCILLOSCOPE_2_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x64;	// func.
			frame[2] = 0x07;	// byte cnt
			frame[3] = 0x06;	// sub-req 1 ref type
			frame[4] = 0x00;	// file num hi
			frame[5] = 0xFA;	// file num lo 
			frame[6] = 0x00;	// record num hi
			frame[7] = 0x0B;	// record num lo : B ~ 14(10ea)
			frame[8] = 0x00;	// file leng hi
			frame[9] = 0x0A;	// file leng lo 		// 10sample
			crc = CRC16(frame, 10);
			frame[10] = (uint8_t) (crc >> 8);
			frame[11] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 12);
			Send_Pwr_Packet(12);
			gCurrStatus = MEA_OSCILLOSCOPE_2_RD;
			gToken_nn = TOK_WAIT;
			
		}
		break;
		case MEA_OSCILLOSCOPE_3_RD :
		{
			if(gChkWBusy == 1)
				break;
			gChkWBusy = 1;
			OS_Delay(100);
			frame[0] = gHmiCommAddr;
			frame[1] = 0x64;	// func.
			frame[2] = 0x07;	// byte cnt
			frame[3] = 0x06;	// sub-req 1 ref type
			frame[4] = 0x00;	// file num hi
			frame[5] = 0xFA;	// file num lo 
			frame[6] = 0x00;	// record num hi
			frame[7] = 0x15;	// record num lo : 15 ~ 20(12ea)
			frame[8] = 0x00;	// file leng hi
			frame[9] = 0x0C;	// file leng lo 		// 12samble
			crc = CRC16(frame, 10);
			frame[10] = (uint8_t) (crc >> 8);
			frame[11] = (uint8_t)(crc & 0xff);
			memcpy(CDC_TXBuf, frame, 12);
			Send_Pwr_Packet(12);
			gCurrStatus = MEA_OSCILLOSCOPE_3_RD;
			gToken_nn = TOK_WAIT;
			
		}
		break;


	}

}

void Relay_Packet()	// 계전설정 
{
	uint16_t crc;
	static uint8_t frame[256]={0};
	uint16_t uAddr, uLen;
	
	switch(gToken_nn)
	{
		case TOK_WAIT :		
			{
			}
			break;

		case RELAY_L_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if	  (gRlySetMode == A_MODE)		uAddr=60;
				else if(gRlySetMode == B_MODE)	uAddr=260; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_L_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_L_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=60;
				else if(gRlySetMode == B_MODE)	uAddr=60+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyOvrLDef.nUse;
				frame[8] = hMBData.RlyOvrLDef.nDoSel;
				frame[9] = hMBData.RlyOvrLDef.nOpmode;
				frame[10] = hMBData.RlyOvrLDef.nIdmtlSel;
				frame[11] = hMBData.RlyOvrLDef.nHotCold;
				frame[12] = hMBData.RlyOvrLDef.nReserve;
				frame[13] = (uint8_t)(hMBData.RlyOvrLDef.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyOvrLDef.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyOvrLDef.nTimeDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyOvrLDef.nTimeDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_L_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_LN_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=115;
				else if(gRlySetMode == B_MODE)	uAddr=115+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_LN_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_LN_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=115;
				else if(gRlySetMode == B_MODE)	uAddr=115+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyLnDef.nUse;
				frame[8] = hMBData.RlyLnDef.nDoSel;
				frame[9] = hMBData.RlyLnDef.nOpmode;
				frame[10] = hMBData.RlyLnDef.nIdmtlSel;
				frame[11] = hMBData.RlyLnDef.nHotCold;
				frame[12] = hMBData.RlyLnDef.nReserve;
				frame[13] = (uint8_t)(hMBData.RlyLnDef.nPercent >> 8);
				frame[14] = (uint8_t)(hMBData.RlyLnDef.nPercent & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyLnDef.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyLnDef.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_LN_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_S1_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=66;
				else if(gRlySetMode == B_MODE)	uAddr=66+200; uLen = 9;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_S1_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_S1_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=66;
				else if(gRlySetMode == B_MODE)	uAddr=66+200; uLen = 9;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlySOcst1Def.nUse;
				frame[8] = hMBData.RlySOcst1Def.nDoSel;
				frame[9] = hMBData.RlySOcst1Def.nOpmode;
				frame[10] = hMBData.RlySOcst1Def.nIdmtlSel;
				frame[11] = hMBData.RlySOcst1Def.nI2TOn;
				frame[12] = hMBData.RlySOcst1Def.ZsiEn;
				frame[13] = hMBData.RlySOcst1Def.nStartUpEn;
				frame[14] = hMBData.RlySOcst1Def.Res;
				frame[15] = (uint8_t)(hMBData.RlySOcst1Def.nPickup >> 8);
				frame[16] = (uint8_t)(hMBData.RlySOcst1Def.nPickup & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlySOcst1Def.nTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlySOcst1Def.nTmDly & 0xFF);
				frame[19] = (uint8_t)(hMBData.RlySOcst1Def.nZsiTmDly >> 8);
				frame[20] = (uint8_t)(hMBData.RlySOcst1Def.nZsiTmDly & 0xFF);
				frame[21] = (uint8_t)(hMBData.RlySOcst1Def.nSuPikup >> 8);
				frame[22] = (uint8_t)(hMBData.RlySOcst1Def.nSuPikup & 0xFF);
				frame[23] = (uint8_t)(hMBData.RlySOcst1Def.nSuTmDly >> 8);
				frame[24] = (uint8_t)(hMBData.RlySOcst1Def.nSuTmDly & 0xFF);
				crc = CRC16(frame, 25);
				frame[25] = (uint8_t) (crc >> 8);
				frame[26] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 27);
				Send_Pwr_Packet(27);
				gCurrStatus = RELAY_S1_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_S2_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=76;
				else if(gRlySetMode == B_MODE)	uAddr=76+200; uLen = 9;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_S2_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_S2_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=76;
				else if(gRlySetMode == B_MODE)	uAddr=76+200; uLen = 9;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlySOcst2Def.nUse;
				frame[8] = hMBData.RlySOcst2Def.nDoSel;
				frame[9] = hMBData.RlySOcst2Def.nOpmode;
				frame[10] = hMBData.RlySOcst2Def.nIdmtlSel;
				frame[11] = hMBData.RlySOcst2Def.nI2TOn;
				frame[12] = hMBData.RlySOcst2Def.Res;
				frame[13] = hMBData.RlySOcst2Def.nStartUpEn;
				frame[14] = hMBData.RlySOcst2Def.Reserve;
				frame[15] = (uint8_t)(hMBData.RlySOcst2Def.nPickup >> 8);
				frame[16] = (uint8_t)(hMBData.RlySOcst2Def.nPickup & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlySOcst2Def.nTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlySOcst2Def.nTmDly & 0xFF);
				frame[19] = (uint8_t)(hMBData.RlySOcst2Def.nReserve >> 8);
				frame[20] = (uint8_t)(hMBData.RlySOcst2Def.nReserve & 0xFF);
				frame[21] = (uint8_t)(hMBData.RlySOcst2Def.nSuPikup >> 8);
				frame[22] = (uint8_t)(hMBData.RlySOcst2Def.nSuPikup & 0xFF);
				frame[23] = (uint8_t)(hMBData.RlySOcst2Def.nSuTmDly >> 8);
				frame[24] = (uint8_t)(hMBData.RlySOcst2Def.nSuTmDly & 0xFF);
				crc = CRC16(frame, 25);
				frame[25] = (uint8_t) (crc >> 8);
				frame[26] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 27);
				Send_Pwr_Packet(27);
				gCurrStatus = RELAY_S2_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_I_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=86;
				else if(gRlySetMode == B_MODE)	uAddr=86+200; uLen = 6;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_I_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_I_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=86;
				else if(gRlySetMode == B_MODE)	uAddr=86+200; uLen = 6;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyIIoDef.nUse;
				frame[8] = hMBData.RlyIIoDef.nDoSel;
				frame[9] = hMBData.RlyIIoDef.nOpmode;
				frame[10] = hMBData.RlyIIoDef.nErms;
				frame[11] = hMBData.RlyIIoDef.nStartUpEn;
				frame[12] = hMBData.RlyIIoDef.Res;
				frame[13] = (uint8_t)(hMBData.RlyIIoDef.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyIIoDef.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyIIoDef.nSuPickup >> 8);
				frame[16] = (uint8_t)(hMBData.RlyIIoDef.nSuPickup & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlyIIoDef.nSuTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlyIIoDef.nSuTmDly & 0xFF);
				crc = CRC16(frame, 19);
				frame[19] = (uint8_t) (crc >> 8);
				frame[20] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 21);
				Send_Pwr_Packet(21);
				gCurrStatus = RELAY_I_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_G_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=93;
				else if(gRlySetMode == B_MODE)	uAddr=93+200; uLen = 9;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_G_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_G_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=93;
				else if(gRlySetMode == B_MODE)	uAddr=93+200; uLen = 9;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyGEthFaultDef.nUse;
				frame[8] = hMBData.RlyGEthFaultDef.nDoSel;
				frame[9] = hMBData.RlyGEthFaultDef.nOpmode;
				frame[10] = hMBData.RlyGEthFaultDef.nIdmtlSel;
				frame[11] = hMBData.RlyGEthFaultDef.nI2TOn;
				frame[12] = hMBData.RlyGEthFaultDef.ZsiEn;
				frame[13] = hMBData.RlyGEthFaultDef.nStartUpEn;
				frame[14] = hMBData.RlyGEthFaultDef.Res;
				frame[15] = (uint8_t)(hMBData.RlyGEthFaultDef.nPickup >> 8);
				frame[16] = (uint8_t)(hMBData.RlyGEthFaultDef.nPickup & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlyGEthFaultDef.nTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlyGEthFaultDef.nTmDly & 0xFF);
				frame[19] = (uint8_t)(hMBData.RlyGEthFaultDef.nZsiTmDly >> 8);
				frame[20] = (uint8_t)(hMBData.RlyGEthFaultDef.nZsiTmDly & 0xFF);
				frame[21] = (uint8_t)(hMBData.RlyGEthFaultDef.nSuPikup >> 8);
				frame[22] = (uint8_t)(hMBData.RlyGEthFaultDef.nSuPikup & 0xFF);
				frame[23] = (uint8_t)(hMBData.RlyGEthFaultDef.nSuTmDly >> 8);
				frame[24] = (uint8_t)(hMBData.RlyGEthFaultDef.nSuTmDly & 0xFF);
				crc = CRC16(frame, 25);
				frame[25] = (uint8_t) (crc >> 8);
				frame[26] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 27);
				Send_Pwr_Packet(27);
				gCurrStatus = RELAY_G_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_GEXT_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=106;
				else if(gRlySetMode == B_MODE)	uAddr=106+200; uLen = 8;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_GEXT_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_GEXT_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=106;
				else if(gRlySetMode == B_MODE)	uAddr=106+200; uLen = 8;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyGextDef.nUse;
				frame[8] = hMBData.RlyGextDef.nDoSel;
				frame[9] = hMBData.RlyGextDef.nOpmode;
				frame[10] = hMBData.RlyGextDef.nI2TOn;
				frame[11] = hMBData.RlyGextDef.nStartUpEn;
				frame[12] = hMBData.RlyGextDef.ZsiEn;
				frame[13] = (uint8_t)(hMBData.RlyGextDef.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyGextDef.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyGextDef.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyGextDef.nTmDly & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlyGextDef.nZsiTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlyGextDef.nZsiTmDly & 0xFF);
				frame[19] = (uint8_t)(hMBData.RlyGextDef.nSuPikup >> 8);
				frame[20] = (uint8_t)(hMBData.RlyGextDef.nSuPikup & 0xFF);
				frame[21] = (uint8_t)(hMBData.RlyGextDef.nSuTmDly >> 8);
				frame[22] = (uint8_t)(hMBData.RlyGextDef.nSuTmDly & 0xFF);
				crc = CRC16(frame, 23);
				frame[23] = (uint8_t) (crc >> 8);
				frame[24] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 25);
				Send_Pwr_Packet(25);
				gCurrStatus = RELAY_GEXT_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_PTA_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=121;
				else if(gRlySetMode == B_MODE)	uAddr=121+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_PTA_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_PTA_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=121;
				else if(gRlySetMode == B_MODE)	uAddr=121+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyPtaDef.nUse;
				frame[8] = hMBData.RlyPtaDef.nDoSel;
				frame[9] = hMBData.RlyPtaDef.nOpmode;
				frame[10] = hMBData.RlyPtaDef.nI2TOn;
				frame[11] = (uint8_t)(hMBData.RlyPtaDef.Pickup >> 8);
				frame[12] = (uint8_t)(hMBData.RlyPtaDef.Pickup & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyPtaDef.nTmDly >> 8);
				frame[14] = (uint8_t)(hMBData.RlyPtaDef.nTmDly & 0xFF);
				crc = CRC16(frame, 15);
				frame[15] = (uint8_t) (crc >> 8);
				frame[16] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 17);
				Send_Pwr_Packet(17);
				gCurrStatus = RELAY_PTA_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UV_ST1_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=126;
				else if(gRlySetMode == B_MODE)	uAddr=126+200; uLen = 6;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_UV_ST1_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UV_ST1_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=126;
				else if(gRlySetMode == B_MODE)	uAddr=126+200; uLen = 6;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyUvSta1Def.nUse;
				frame[8] = hMBData.RlyUvSta1Def.nDoSel;
				frame[9] = hMBData.RlyUvSta1Def.nOpmode;
				frame[10] = hMBData.RlyUvSta1Def.nAutoFR;
				frame[11] = hMBData.RlyUvSta1Def.nNomsg;
				frame[12] = hMBData.RlyUvSta1Def.nDeadVolBL;
				frame[13] = hMBData.RlyUvSta1Def.nPhMode;
				frame[14] = hMBData.RlyUvSta1Def.nReserve;
				frame[15] = (uint8_t)(hMBData.RlyUvSta1Def.Pickup >> 8);
				frame[16] = (uint8_t)(hMBData.RlyUvSta1Def.Pickup & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlyUvSta1Def.nTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlyUvSta1Def.nTmDly & 0xFF);
				crc = CRC16(frame, 19);
				frame[19] = (uint8_t) (crc >> 8);
				frame[20] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 21);
				Send_Pwr_Packet(21);
				gCurrStatus = RELAY_UV_ST1_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UV_ST2_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=133;
				else if(gRlySetMode == B_MODE)	uAddr=133+200; uLen = 6;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_UV_ST2_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UV_ST2_WR :		// 멀티쓰기 요청 
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=133;
				else if(gRlySetMode == B_MODE)	uAddr=133+200; uLen = 6;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyUvSta2Def.nUse;
				frame[8] = hMBData.RlyUvSta2Def.nDoSel;
				frame[9] = hMBData.RlyUvSta2Def.nOpmode;
				frame[10] = hMBData.RlyUvSta2Def.nAutoFR;
				frame[11] = hMBData.RlyUvSta2Def.nNomsg;
				frame[12] = hMBData.RlyUvSta2Def.nDeadVolBL;
				frame[13] = hMBData.RlyUvSta2Def.nPhMode;
				frame[14] = hMBData.RlyUvSta2Def.nReserve;
				frame[15] = (uint8_t)(hMBData.RlyUvSta2Def.Pickup >> 8);
				frame[16] = (uint8_t)(hMBData.RlyUvSta2Def.Pickup & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlyUvSta2Def.nTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlyUvSta2Def.nTmDly & 0xFF);
				crc = CRC16(frame, 19);
				frame[19] = (uint8_t) (crc >> 8);
				frame[20] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 21);
				Send_Pwr_Packet(21);
				gCurrStatus = RELAY_UV_ST2_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OVR1_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=140;
				else if(gRlySetMode == B_MODE)	uAddr=140+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_OVR1_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OVR1_WR :	
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=140;
				else if(gRlySetMode == B_MODE)	uAddr=140+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyOvSta1Def.nUse;
				frame[8] = hMBData.RlyOvSta1Def.nDoSel;
				frame[9] = hMBData.RlyOvSta1Def.nOpmode;
				frame[10] = hMBData.RlyOvSta1Def.nReserve;
				frame[11] = (uint8_t)(hMBData.RlyOvSta1Def.Pickup >> 8);
				frame[12] = (uint8_t)(hMBData.RlyOvSta1Def.Pickup & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyOvSta1Def.nTmDly >> 8);
				frame[14] = (uint8_t)(hMBData.RlyOvSta1Def.nTmDly & 0xFF);
				crc = CRC16(frame, 15);
				frame[15] = (uint8_t) (crc >> 8);
				frame[16] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 17);
				Send_Pwr_Packet(17);
				gCurrStatus = RELAY_OVR1_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OVR2_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=145;
				else if(gRlySetMode == B_MODE)	uAddr=145+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_OVR2_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OVR2_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=145;
				else if(gRlySetMode == B_MODE)	uAddr=145+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyOvSta2Def.nUse;
				frame[8] = hMBData.RlyOvSta2Def.nDoSel;
				frame[9] = hMBData.RlyOvSta2Def.nOpmode;
				frame[10] = hMBData.RlyOvSta2Def.nReserve;
				frame[11] = (uint8_t)(hMBData.RlyOvSta2Def.Pickup >> 8);
				frame[12] = (uint8_t)(hMBData.RlyOvSta2Def.Pickup & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyOvSta2Def.nTmDly >> 8);
				frame[14] = (uint8_t)(hMBData.RlyOvSta2Def.nTmDly & 0xFF);
				crc = CRC16(frame, 15);
				frame[15] = (uint8_t) (crc >> 8);
				frame[16] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 17);
				Send_Pwr_Packet(17);
				gCurrStatus = RELAY_OVR2_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_RV_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=150;
				else if(gRlySetMode == B_MODE)	uAddr=150+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_RV_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_RV_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=150;
				else if(gRlySetMode == B_MODE)	uAddr=150+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyRvDef.nUse;
				frame[8] = hMBData.RlyRvDef.nDoSel;
				frame[9] = hMBData.RlyRvDef.nOpmode;
				frame[10] = hMBData.RlyRvDef.nReserve;
				frame[11] = (uint8_t)(hMBData.RlyRvDef.Pickup >> 8);
				frame[12] = (uint8_t)(hMBData.RlyRvDef.Pickup & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyRvDef.nTmDly >> 8);
				frame[14] = (uint8_t)(hMBData.RlyRvDef.nTmDly & 0xFF);
				crc = CRC16(frame, 15);
				frame[15] = (uint8_t) (crc >> 8);
				frame[16] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 17);
				Send_Pwr_Packet(17);
				gCurrStatus = RELAY_RV_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_D_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=155;
				else if(gRlySetMode == B_MODE)	uAddr=155+200; uLen = 9;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_D_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_D_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=155;
				else if(gRlySetMode == B_MODE)	uAddr=155+200; uLen = 9;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyDOvDef.nUse;
				frame[8] = hMBData.RlyDOvDef.nDoSel;
				frame[9] = hMBData.RlyDOvDef.nOpmode;
				frame[10] = hMBData.RlyDOvDef.ZsiEn;
				frame[11] = hMBData.RlyDOvDef.nStartUpEn;
				frame[12] = hMBData.RlyDOvDef.Res;
				frame[13] = (uint8_t)(hMBData.RlyDOvDef.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyDOvDef.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyDOvDef.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyDOvDef.nTmDly & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlyDOvDef.nCherAngle >> 8);
				frame[18] = (uint8_t)(hMBData.RlyDOvDef.nCherAngle & 0xFF);
				frame[19] = (uint8_t)(hMBData.RlyDOvDef.nZsiTmDly >> 8);
				frame[20] = (uint8_t)(hMBData.RlyDOvDef.nZsiTmDly & 0xFF);
				frame[21] = (uint8_t)(hMBData.RlyDOvDef.nSuPikup >> 8);
				frame[22] = (uint8_t)(hMBData.RlyDOvDef.nSuPikup & 0xFF);
				frame[23] = (uint8_t)(hMBData.RlyDOvDef.nSuTmDly >> 8);
				frame[24] = (uint8_t)(hMBData.RlyDOvDef.nSuTmDly & 0xFF);
				crc = CRC16(frame, 25);
				frame[25] = (uint8_t) (crc >> 8);
				frame[26] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 27);
				Send_Pwr_Packet(27);
				gCurrStatus = RELAY_D_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_S_ST1_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=165;
				else if(gRlySetMode == B_MODE)	uAddr=165+200; uLen = 7;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_S_ST1_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_S_ST1_WR :	
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=165;
				else if(gRlySetMode == B_MODE)	uAddr=165+200; uLen = 7;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlySOcopSta1Def.nUse;
				frame[8] = hMBData.RlySOcopSta1Def.nDoSel;
				frame[9] = hMBData.RlySOcopSta1Def.nOpmode;
				frame[10] = hMBData.RlySOcopSta1Def.nModeSel;
				frame[11] = (uint8_t)(hMBData.RlySOcopSta1Def.nPickupVL >> 8);
				frame[12] = (uint8_t)(hMBData.RlySOcopSta1Def.nPickupVL & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlySOcopSta1Def.nPickupVH >> 8);
				frame[14] = (uint8_t)(hMBData.RlySOcopSta1Def.nPickupVH & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlySOcopSta1Def.nPickupA >> 8);
				frame[16] = (uint8_t)(hMBData.RlySOcopSta1Def.nPickupA & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlySOcopSta1Def.nTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlySOcopSta1Def.nTmDly & 0xFF);
				frame[19] = (uint8_t)(hMBData.RlySOcopSta1Def.nKs >> 8);
				frame[20] = (uint8_t)(hMBData.RlySOcopSta1Def.nKs & 0xFF);
				crc = CRC16(frame, 21);
				frame[21] = (uint8_t) (crc >> 8);
				frame[22] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 23);
				Send_Pwr_Packet(23);
				gCurrStatus = RELAY_S_ST1_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_S_ST2_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=173;
				else if(gRlySetMode == B_MODE)	uAddr=173+200; uLen = 7;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_S_ST2_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_S_ST2_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=173;
				else if(gRlySetMode == B_MODE)	uAddr=173+200; uLen = 7;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlySOcopSta2Def.nUse;
				frame[8] = hMBData.RlySOcopSta2Def.nDoSel;
				frame[9] = hMBData.RlySOcopSta2Def.nOpmode;
				frame[10] = hMBData.RlySOcopSta2Def.nModeSel;
				frame[11] = (uint8_t)(hMBData.RlySOcopSta2Def.nPickupVL >> 8);
				frame[12] = (uint8_t)(hMBData.RlySOcopSta2Def.nPickupVL & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlySOcopSta2Def.nPickupVH >> 8);
				frame[14] = (uint8_t)(hMBData.RlySOcopSta2Def.nPickupVH & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlySOcopSta2Def.nPickupA >> 8);
				frame[16] = (uint8_t)(hMBData.RlySOcopSta2Def.nPickupA & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlySOcopSta2Def.nTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlySOcopSta2Def.nTmDly & 0xFF);
				frame[19] = (uint8_t)(hMBData.RlySOcopSta2Def.nKs >> 8);
				frame[20] = (uint8_t)(hMBData.RlySOcopSta2Def.nKs & 0xFF);
				crc = CRC16(frame, 21);
				frame[21] = (uint8_t) (crc >> 8);
				frame[22] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 23);
				Send_Pwr_Packet(23);
				gCurrStatus = RELAY_S_ST2_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_IU_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=181;
				else if(gRlySetMode == B_MODE)	uAddr=181+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_IU_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_IU_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=181;
				else if(gRlySetMode == B_MODE)	uAddr=181+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyIuDef.nUse;
				frame[8] = hMBData.RlyIuDef.nDoSel;
				frame[9] = hMBData.RlyIuDef.nOpmode;
				frame[10] = hMBData.RlyIuDef.Res;
				frame[11] = (uint8_t)(hMBData.RlyIuDef.nPickup >> 8);
				frame[12] = (uint8_t)(hMBData.RlyIuDef.nPickup & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyIuDef.nTmDly >> 8);
				frame[14] = (uint8_t)(hMBData.RlyIuDef.nTmDly & 0xFF);
				crc = CRC16(frame, 15);
				frame[15] = (uint8_t) (crc >> 8);
				frame[16] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 17);
				Send_Pwr_Packet(17);
				gCurrStatus = RELAY_IU_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_VU_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=186;
				else if(gRlySetMode == B_MODE)	uAddr=186+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_VU_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_VU_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=186;
				else if(gRlySetMode == B_MODE)	uAddr=186+200; uLen = 4;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyVuDef.nUse;
				frame[8] = hMBData.RlyVuDef.nDoSel;
				frame[9] = hMBData.RlyVuDef.nOpmode;
				frame[10] = hMBData.RlyVuDef.Res;
				frame[11] = (uint8_t)(hMBData.RlyVuDef.nPickup >> 8);
				frame[12] = (uint8_t)(hMBData.RlyVuDef.nPickup & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyVuDef.nTmDly >> 8);
				frame[14] = (uint8_t)(hMBData.RlyVuDef.nTmDly & 0xFF);
				crc = CRC16(frame, 15);
				frame[15] = (uint8_t) (crc >> 8);
				frame[16] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 17);
				Send_Pwr_Packet(17);
				gCurrStatus = RELAY_VU_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UF_ST1_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=191;
				else if(gRlySetMode == B_MODE)	uAddr=191+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_UF_ST1_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UF_ST1_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=191;
				else if(gRlySetMode == B_MODE)	uAddr=191+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyUfSta1Def.nUse;
				frame[8] = hMBData.RlyUfSta1Def.nDoSel;
				frame[9] = hMBData.RlyUfSta1Def.nOpmode;
				frame[10] = hMBData.RlyUfSta1Def.Res;
				frame[11] = (uint8_t)(hMBData.RlyUfSta1Def.nUnderVol >> 8);
				frame[12] = (uint8_t)(hMBData.RlyUfSta1Def.nUnderVol & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyUfSta1Def.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyUfSta1Def.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyUfSta1Def.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyUfSta1Def.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_UF_ST1_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UF_ST2_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=197;
				else if(gRlySetMode == B_MODE)	uAddr=197+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_UF_ST2_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UF_ST2_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=197;
				else if(gRlySetMode == B_MODE)	uAddr=197+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyUfSta2Def.nUse;
				frame[8] = hMBData.RlyUfSta2Def.nDoSel;
				frame[9] = hMBData.RlyUfSta2Def.nOpmode;
				frame[10] = hMBData.RlyUfSta2Def.Res;
				frame[11] = (uint8_t)(hMBData.RlyUfSta2Def.nUnderVol >> 8);
				frame[12] = (uint8_t)(hMBData.RlyUfSta2Def.nUnderVol & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyUfSta2Def.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyUfSta2Def.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyUfSta2Def.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyUfSta2Def.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_UF_ST2_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OF_ST1_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=203;
				else if(gRlySetMode == B_MODE)	uAddr=203+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_OF_ST1_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OF_ST1_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=203;
				else if(gRlySetMode == B_MODE)	uAddr=203+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyOfSta1Def.nUse;
				frame[8] = hMBData.RlyOfSta1Def.nDoSel;
				frame[9] = hMBData.RlyOfSta1Def.nOpmode;
				frame[10] = hMBData.RlyOfSta1Def.Res;
				frame[11] = (uint8_t)(hMBData.RlyOfSta1Def.nUnderVol >> 8);
				frame[12] = (uint8_t)(hMBData.RlyOfSta1Def.nUnderVol & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyOfSta1Def.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyOfSta1Def.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyOfSta1Def.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyOfSta1Def.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_OF_ST1_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OF_ST2_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=209;
				else if(gRlySetMode == B_MODE)	uAddr=209+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_OF_ST2_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OF_ST2_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=209;
				else if(gRlySetMode == B_MODE)	uAddr=209+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyOfSta2Def.nUse;
				frame[8] = hMBData.RlyOfSta2Def.nDoSel;
				frame[9] = hMBData.RlyOfSta2Def.nOpmode;
				frame[10] = hMBData.RlyOfSta2Def.Res;
				frame[11] = (uint8_t)(hMBData.RlyOfSta2Def.nUnderVol >> 8);
				frame[12] = (uint8_t)(hMBData.RlyOfSta2Def.nUnderVol & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyOfSta2Def.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyOfSta2Def.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyOfSta2Def.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyOfSta2Def.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_OF_ST2_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_ROCOF_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=215;
				else if(gRlySetMode == B_MODE)	uAddr=215+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_ROCOF_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_ROCOF_WR :	
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=215;
				else if(gRlySetMode == B_MODE)	uAddr=215+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyRocofDef.nUse;
				frame[8] = hMBData.RlyRocofDef.nDoSel;
				frame[9] = hMBData.RlyRocofDef.nOpmode;
				frame[10] = hMBData.RlyRocofDef.nRocof;
				frame[11] = (uint8_t)(hMBData.RlyRocofDef.nUnderVol >> 8);
				frame[12] = (uint8_t)(hMBData.RlyRocofDef.nUnderVol & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyRocofDef.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyRocofDef.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyRocofDef.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyRocofDef.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_ROCOF_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_RP_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=221;
				else if(gRlySetMode == B_MODE)	uAddr=221+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_RP_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_RP_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=221;
				else if(gRlySetMode == B_MODE)	uAddr=221+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyRpDef.nUse;
				frame[8] = hMBData.RlyRpDef.nDoSel;
				frame[9] = hMBData.RlyRpDef.nOpmode;
				frame[10] = hMBData.RlyRpDef.Res;
				frame[11] = (uint8_t)(hMBData.RlyRpDef.nPickup >> 24);
				frame[12] = (uint8_t)(hMBData.RlyRpDef.nPickup >> 16);
				frame[13] = (uint8_t)(hMBData.RlyRpDef.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyRpDef.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyRpDef.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyRpDef.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_RP_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_RQ_ST1_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=227;
				else if(gRlySetMode == B_MODE)	uAddr=227+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_RQ_ST1_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_RQ_ST1_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=227;
				else if(gRlySetMode == B_MODE)	uAddr=227+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyRqSts1Def.nUse;
				frame[8] = hMBData.RlyRqSts1Def.nDoSel;
				frame[9] = hMBData.RlyRqSts1Def.nOpmode;
				frame[10] = hMBData.RlyRqSts1Def.Res;
				frame[11] = (uint8_t)(hMBData.RlyRqSts1Def.nPickup >> 24);
				frame[12] = (uint8_t)(hMBData.RlyRqSts1Def.nPickup >> 16);
				frame[13] = (uint8_t)(hMBData.RlyRqSts1Def.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyRqSts1Def.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyRqSts1Def.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyRqSts1Def.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_RQ_ST1_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_RQ_ST2_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=233;
				else if(gRlySetMode == B_MODE)	uAddr=233+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_RQ_ST2_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_RQ_ST2_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=233;
				else if(gRlySetMode == B_MODE)	uAddr=233+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyRqSts2Def.nUse;
				frame[8] = hMBData.RlyRqSts2Def.nDoSel;
				frame[9] = hMBData.RlyRqSts2Def.nOpmode;
				frame[10] = hMBData.RlyRqSts2Def.Res;
				frame[11] = (uint8_t)(hMBData.RlyRqSts2Def.nPickup >> 24);
				frame[12] = (uint8_t)(hMBData.RlyRqSts2Def.nPickup >> 16);
				frame[13] = (uint8_t)(hMBData.RlyRqSts2Def.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyRqSts2Def.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyRqSts2Def.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyRqSts2Def.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_RQ_ST2_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OP_OQ_UP_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=239;
				else if(gRlySetMode == B_MODE)	uAddr=239+200; uLen = 19;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_OP_OQ_UP_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OP_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=239;
				else if(gRlySetMode == B_MODE)	uAddr=239+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_OP_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OP_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=239;
				else if(gRlySetMode == B_MODE)	uAddr=239+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyOpDef.nUse;
				frame[8] = hMBData.RlyOpDef.nDoSel;
				frame[9] = hMBData.RlyOpDef.nOpmode;
				frame[10] = hMBData.RlyOpDef.Res;
				frame[11] = (uint8_t)(hMBData.RlyOpDef.nPickup >> 24);
				frame[12] = (uint8_t)(hMBData.RlyOpDef.nPickup >> 16);
				frame[13] = (uint8_t)(hMBData.RlyOpDef.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyOpDef.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyOpDef.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyOpDef.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_OP_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OQ_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=245;
				else if(gRlySetMode == B_MODE)	uAddr=245+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_OQ_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_OQ_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=245;
				else if(gRlySetMode == B_MODE)	uAddr=245+200; uLen = 5;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyOqDef.nUse;
				frame[8] = hMBData.RlyOqDef.nDoSel;
				frame[9] = hMBData.RlyOqDef.nOpmode;
				frame[10] = hMBData.RlyOqDef.Res;
				frame[11] = (uint8_t)(hMBData.RlyOqDef.nPickup >> 24);
				frame[12] = (uint8_t)(hMBData.RlyOqDef.nPickup >> 16);
				frame[13] = (uint8_t)(hMBData.RlyOqDef.nPickup >> 8);
				frame[14] = (uint8_t)(hMBData.RlyOqDef.nPickup & 0xFF);
				frame[15] = (uint8_t)(hMBData.RlyOqDef.nTmDly >> 8);
				frame[16] = (uint8_t)(hMBData.RlyOqDef.nTmDly & 0xFF);
				crc = CRC16(frame, 17);
				frame[17] = (uint8_t) (crc >> 8);
				frame[18] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 19);
				Send_Pwr_Packet(19);
				gCurrStatus = RELAY_OQ_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UP_RD :		
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=251;
				else if(gRlySetMode == B_MODE)	uAddr=251+200; uLen = 6;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = RELAY_UP_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case RELAY_UP_WR :
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func.
				if		(gRlySetMode == A_MODE) 	uAddr=251;
				else if(gRlySetMode == B_MODE)	uAddr=251+200; uLen = 6;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				frame[6] = (uint8_t)(uLen * 2);
				frame[7] = hMBData.RlyUpDef.nUse;
				frame[8] = hMBData.RlyUpDef.nDoSel;
				frame[9] = hMBData.RlyUpDef.nOpmode;
				frame[10] = hMBData.RlyUpDef.Res;
				frame[11] = (uint8_t)(hMBData.RlyUpDef.nDeadCurr >> 8);
				frame[12] = (uint8_t)(hMBData.RlyUpDef.nDeadCurr & 0xFF);
				frame[13] = (uint8_t)(hMBData.RlyUpDef.nPickup >> 24);
				frame[14] = (uint8_t)(hMBData.RlyUpDef.nPickup >> 16);
				frame[15] = (uint8_t)(hMBData.RlyUpDef.nPickup >> 8);
				frame[16] = (uint8_t)(hMBData.RlyUpDef.nPickup & 0xFF);
				frame[17] = (uint8_t)(hMBData.RlyUpDef.nTmDly >> 8);
				frame[18] = (uint8_t)(hMBData.RlyUpDef.nTmDly & 0xFF);
				crc = CRC16(frame, 19);
				frame[19] = (uint8_t) (crc >> 8);
				frame[20] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 21);
				Send_Pwr_Packet(21);
				gCurrStatus = RELAY_UP_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
	}
	
}

////////////////////////////////////////////////////////////////////////////////

void Hwset_Pac(void)		// HW 설정 
{
	uint16_t crc;
	static uint8_t frame[256]={0};
	uint16_t uAddr, uLen;

	switch(gToken_nn)
	{
		case TOK_WAIT :		
			{
			}
			break;

		case HWSET_HW1SET_RD:
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				uAddr=17; uLen=19;
				frame[2] = (uint8_t)(uAddr>>8);
				frame[3] = (uint8_t)(uAddr&0xff);
				frame[4] = (uint8_t)(uLen>>8);
				frame[5] = (uint8_t)(uLen&0xff);
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = HWSET_HW1SET_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		// HW1 영역은  읽기 전용 모드로 변경 됨 . 
		// 아무 동작 하지 않고 리턴 하도록 변경 한다. 
		case HWSET_HW1SET_WR: //쓰기 - 멀티 레지스터 
			{
#if 0 //[[ by kys.2018.03.28_BEGIN -- ㅁ
				int i;
				
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func
				frame[2] = 0x00;	// addr
				frame[3] = 17;	// addr 17
				frame[4] = 0x00;	// len
				frame[5] = 17;	// len
				frame[6] = 34;	// count : x2
				frame[7] = (uint8_t)(hMBData.Hw1SetDef.nDevType);
				frame[8] = (uint8_t)(hMBData.Hw1SetDef.nNFCnY);
				frame[9] = (uint8_t)(hMBData.Hw1SetDef.nPols);
				frame[10] = (uint8_t)(hMBData.Hw1SetDef.nWiring);
				frame[11] = (uint8_t)(hMBData.Hw1SetDef.nFreq>>8);
				frame[12] = (uint8_t)(hMBData.Hw1SetDef.nFreq&0xFF);
				frame[13] = (uint8_t)(hMBData.Hw1SetDef.nAF>>8);
				frame[14] = (uint8_t)(hMBData.Hw1SetDef.nAF&0xFF);
#if 0 //[[ by kys.2018.03.28_BEGIN -- a
				frame[15] = (uint8_t)(hMBData.Hw1SetDef.nRateVol>>8);
				frame[16] = (uint8_t)(hMBData.Hw1SetDef.nRateVol&0xFF);
#endif //]] by kys.2018.03.28_END -- a
				i = 15;
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nRatePlug>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nRatePlug&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nLnFact>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nLnFact&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nLn>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nLn&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nMaxCbMoc>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nMaxCbMoc&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nMaxCbEoc>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nMaxCbEoc&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nMaxCW>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nMaxCW&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nDanCurr1>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nDanCurr1&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nDanCurr2>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nDanCurr2&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nDanCurr3>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nDanCurr3&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nOpt1>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nOpt1&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nOpt2>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nOpt2&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nOpt3>>8);
				frame[i++] = (uint8_t)(hMBData.Hw1SetDef.nOpt3&0xFF);
				crc = CRC16(frame, i);
				frame[i++] = (uint8_t) (crc >> 8);
				frame[i++] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, i);
				Send_Pwr_Packet(i);
				gCurrStatus = HWSET_HW1SET_WR;
				gToken_nn = TOK_WAIT;
#endif //]] by kys.2018.03.28_END -- ㅁ
			}
			break;
#if 0 //[[ by kys.2018.03.19_BEGIN -- a
		case HWSET_WIRE:
			{
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func.
				frame[2] = 0x00;	// addr.
				frame[3] = 0x12;	// addr.
				frame[4] = 0x00;	// len.
				frame[5] = 0x01;	// len.
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				USBH_CDC_Stop(&hUsbHostHS);

				USBH_HandleTypeDef *uHost;
				uHost = &hUsbHostHS;
				CDC_HandleTypeDef *CDC_Handle =  (CDC_HandleTypeDef*)(uHost->pActiveClass->pData);
				CDC_Handle->state = CDC_TRANSFER_DATA;
				USBH_CDC_Transmit(&hUsbHostHS, CDC_TXBuf, 8);
				gCurrStatus = HWSET_WIRE;
				gToken_nn = TOK_WAIT;
			}
			break;
		
#if 0 //[[ by kys.2018.03.08_BEGIN -- test
		case HWSET_CURR_DIR:
			{
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;
				frame[2] = 0x00;
				frame[3] = 0x27;
				frame[4] = 0x00;
				frame[5] = 0x01;
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				USBH_CDC_Stop(&hUsbHostHS);

				USBH_HandleTypeDef *uHost;
				uHost = &hUsbHostHS;
				CDC_HandleTypeDef *CDC_Handle =  (CDC_HandleTypeDef*)(uHost->pActiveClass->pData);
				CDC_Handle->state = CDC_TRANSFER_DATA;
				USBH_CDC_Transmit(&hUsbHostHS, CDC_TXBuf, 8);
				gCurrStatus = HWSET_CURR_DIR;
				gToken_nn = TOK_WAIT;
			}
			break;
#endif //]] by kys.2018.03.08_END -- test
		
		case HWSET_RATE_VOL:
			{
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;	// func
				frame[2] = 0x00;	// add
				frame[3] = 0x15;	// addr
				frame[4] = 0x00;	// len
				frame[5] = 0x01;	// len
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				USBH_CDC_Stop(&hUsbHostHS);

				USBH_HandleTypeDef *uHost;
				uHost = &hUsbHostHS;
				CDC_HandleTypeDef *CDC_Handle =  (CDC_HandleTypeDef*)(uHost->pActiveClass->pData);
				CDC_Handle->state = CDC_TRANSFER_DATA;
				USBH_CDC_Transmit(&hUsbHostHS, CDC_TXBuf, 8);
				gCurrStatus = HWSET_RATE_VOL;
				gToken_nn = TOK_WAIT;
			}
			break;
		case HWSET_RATE_CURR:
			{
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03; // func
				frame[2] = 0x00; // addr
				frame[3] = 0x16; // addr
				frame[4] = 0x00; // len
				frame[5] = 0x01; // len
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				USBH_CDC_Stop(&hUsbHostHS);

				USBH_HandleTypeDef *uHost;
				uHost = &hUsbHostHS;
				CDC_HandleTypeDef *CDC_Handle =  (CDC_HandleTypeDef*)(uHost->pActiveClass->pData);
				CDC_Handle->state = CDC_TRANSFER_DATA;
				USBH_CDC_Transmit(&hUsbHostHS, CDC_TXBuf, 8);
				gCurrStatus = HWSET_RATE_CURR;
				gToken_nn = TOK_WAIT;
			}
			break;
#endif //]] by kys.2018.03.19_END -- a
		case HWSET_HW2SET_RD: //읽기 - input reg..
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x03;
				frame[2] = 0x00;  //addr
				frame[3] = 37;	// 37~
				frame[4] = 0x00;   // len
				frame[5] = 19*2;  // 19x2
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = HWSET_HW2SET_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case HWSET_HW2SET_WR: //쓰기 - 멀티 레지스터 
			{
				int i;
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x10;	// func
				frame[2] = 0x00;	// addr
				frame[3] = 37;		// addr 37~
				frame[4] = 0x00;	// len
				frame[5] = 19;		// len 55 (18개)
				frame[6] = 19*2;	// count : x2
				frame[7] = (uint8_t)(hMBData.Hw2SetDef.nPhaseVal>>8);
				frame[8] = (uint8_t)(hMBData.Hw2SetDef.nPhaseVal&0xFF);
				i=9;
#if 1 //[[ by kys.2018.03.28_BEGIN -- a
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.nRateVol>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.nRateVol&0xFF);
#endif //]] by kys.2018.03.28_END -- a
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.nCurrDir>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.nCurrDir&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Address>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Address&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Baudrate>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Baudrate&0xFF);
#if 0 //[[ by kys.2018.03.28_BEGIN -- a
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Swap>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Swap&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Map>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Map&0xFF);
#else
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.RES1>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.RES1&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.RES2>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.RES2&0xFF);
#endif //]] by kys.2018.03.28_END -- a
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Demand>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Demand&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.LRCtrl>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.LRCtrl&0xFF);
#if 0 //[[ by kys.2018.03.28_BEGIN -- a
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.OCR_Passwd>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.OCR_Passwd&0xFF);
#else
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.RES3>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.RES3&0xFF);
#endif //]] by kys.2018.03.28_END -- a
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.nLanguage>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.nLanguage&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Reserved>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Reserved&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.GroupCtrl>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.GroupCtrl&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.UserDefDp0>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.UserDefDp0&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.UserDefDp1>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.UserDefDp1&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.UserDefDp2>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.UserDefDp2&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Pf_Disp>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.Pf_Disp&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.UnderPFAlm>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.UnderPFAlm&0xFF);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.OverPFAlm>>8);
				frame[i++] = (uint8_t)(hMBData.Hw2SetDef.OverPFAlm&0xFF);
				crc = CRC16(frame, i);
				frame[i++] = (uint8_t) (crc >> 8);
				frame[i++] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, i);
				Send_Pwr_Packet(i);
				gCurrStatus = HWSET_HW2SET_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case HWSET_TIMESET_RD:
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x2B;	// func
				frame[2] = 0x0F;	// sub-func
				frame[3] = 0x00;	// res.
				crc = CRC16(frame, 4);
				frame[4] = (uint8_t) (crc >> 8);
				frame[5] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 6);
				Send_Pwr_Packet(6);
				gCurrStatus = HWSET_TIMESET_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
		case HWSET_TIMESET_WR:
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x2B;
				frame[2] = 0x10;
				frame[3] = 0x00;
				frame[4] = 0x00;
				frame[5] = hMBData.TimeSetDef.nYear;
				frame[6] = hMBData.TimeSetDef.nMonth;
				frame[7] = hMBData.TimeSetDef.nDay;
				frame[8] = hMBData.TimeSetDef.nHour;
				frame[9] = hMBData.TimeSetDef.nMinute;
				frame[10] = (uint8_t)(hMBData.TimeSetDef.nSecond>>8);
				frame[11] = (uint8_t)(hMBData.TimeSetDef.nSecond&0xFF);
				crc = CRC16(frame, 12);
				frame[12] = (uint8_t) (crc >> 8);
				frame[13] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 14);
				Send_Pwr_Packet(14);
				gCurrStatus = HWSET_TIMESET_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
#if 0 //[[ by kys.2018.03.25_BEGIN
		case HWSET_DO_RD:	// DO 읽기는 207번으로 하고 쓰기는 0~11으로 한다. 
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x04;
				frame[2] = 0x00;
				frame[3] = 0xCF;	// 207번 
				frame[4] = 0x00;
				frame[5] = 0x01;
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = HWSET_DO_RD;
				gToken_nn = TOK_WAIT;
			}
			break;
#endif //]] by kys.2018.03.25_END

	}
		
}

void CB_ClearData_Addr()
{
	uint16_t crc;
	static uint8_t frame[256]={0};
	uint16_t uAddr, uLen;

	switch(gToken_nn)
	{
		case TOK_WAIT :		
			{
			}
			break;

		case HWSET_DATA_CLEAR:
			{
				//Write : Single Coil 
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x05;
				frame[2] = (uint8_t)(hMBData.DataClrDef.nAddress>>8);
				frame[3] = (uint8_t)(hMBData.DataClrDef.nAddress&0xFF);
				frame[4] = 0xFF;
				frame[5] = 0x00;
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = HWSET_DATA_CLEAR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case HWSET_DO_WR:	// DO Write : 0 ~ 11 : sel
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x05;
				frame[2] = (uint8_t)(hMBData.DOutBitDef.nDataOutBit03>>8);
				frame[3] = (uint8_t)(hMBData.DOutBitDef.nDataOutBit03&0xFF);
				frame[4] = 0xFF;
				frame[5] = 0x00;
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = HWSET_DO_WR;
				gToken_nn = TOK_WAIT;
			}
			break;
		case HWSET_DO_WR_OP:	// DO Write : 0 ~ 11 : op
			{
				if(gChkWBusy == 1)
					break;
				gChkWBusy = 1;
				OS_Delay(100);
				frame[0] = gHmiCommAddr;
				frame[1] = 0x05;
				frame[2] = (uint8_t)((hMBData.DOutBitDef.nDataOutBit03+1)>>8);
				frame[3] = (uint8_t)((hMBData.DOutBitDef.nDataOutBit03+1)&0xFF);
				frame[4] = 0xFF;
				frame[5] = 0x00;
				crc = CRC16(frame, 6);
				frame[6] = (uint8_t) (crc >> 8);
				frame[7] = (uint8_t)(crc & 0xff);
				memcpy(CDC_TXBuf, frame, 8);
				Send_Pwr_Packet(8);
				gCurrStatus = HWSET_DO_WR_OP;
				gToken_nn = TOK_WAIT;
			}
			break;
	}
}

////////////////////////////////////////////////////////////////////////////////

void Module_Req_Data()
{
	if(InPcBypass == 1)
		return;

	Evgt_Sys_Packet();
	Dev_Info_Packet();
	MeasurePacket();
	Relay_Packet();
	Hwset_Pac();
	CB_ClearData_Addr();

	return;
}

#endif
void Module_Res_Data(uint8_t *Local_RxBuf )
{
//	EvtSysPac_Parser(Local_RxBuf);
//	DevInfoPac_Parser(Local_RxBuf);
//	MeasurePac_Parser(Local_RxBuf);
//	HwsetPac_Parser(Local_RxBuf);
//	RelayPac_Parser(Local_RxBuf);
	
	return;
}

void PowerRly_byp_Host_Comm()
{
	uint32_t RcvSize=0;
	uint8_t usrBuf[TX_BUFF_SIZE]={0};
//	uint8_t bleBuf[TX_BUFF_SIZE]={0};

	if(gChkWBusy)
		return;

	if(USBD_PcRcv_Data(usrBuf, &RcvSize) != 0)
	{
		//HAL_GPIO_TogglePin(USER_LED_GPIO_Port, USER_LED_Pin);

		InPcBypass = 1;
		gToken_nn = TOK_WAIT;
		gCurrStatus = TOK_WAIT;

//		if(gPcCommOn == 0)
//			gPcCommOn=1;

		memcpy(CDC_TXBuf, usrBuf, RcvSize);
		printf("Recv USB Frame!!!\n");
		for(int i = 0; i < RcvSize; i++)
			printf("%02X ", usrBuf[i]);
		printf("\n");
		ModbusSendFrameFromUsb(usrBuf, RcvSize);
			//Send_Pwr_Packet(RcvSize);
		RcvSize=0;
	}
	
//	else if(Uart_PcRcv_Data(bleBuf, &RcvSize) != 0)
//	{
//		InPcBypass = 1;
//		gToken_nn = TOK_WAIT;
//		gCurrStatus = TOK_WAIT;
//
//		if(gBleCommOn == 0)
//			gBleCommOn=1;
//
//		memcpy(CDC_TXBuf, bleBuf, RcvSize);
//		Send_Pwr_Packet(RcvSize);
//		RcvSize=0;
//	}
	
}


extern UART_HandleTypeDef huart2;

void Host_byp_PowerRly_Comm()
{

		if(UsbHStatus == USB_DATA_FINISH) 
		{
			HAL_GPIO_TogglePin(USER_LED_GPIO_Port, USER_LED_Pin);

			if(InPcBypass == 1)
			{
				if(gBleCommOn == 1){
					HAL_UART_Transmit(&huart2, workBuf, rxDataLen, 1000);
					gBleCommOn = 0;
				}
				else
				{
					CDC_Transmit_FS(workBuf, rxDataLen); 
					gPcTimeOutStart = 1; // pc 명령 종료를 카운트 하는 시간 시작 
					gTime_cnt_pc =0;		// 동작 끝나기 전에 다시 pc명령 입력시 대기 시간 연장시킴 
				}
			}
			else
			{
				gChkNorCmd	= NORMAL_MODE;
				gPcTimeOutStart = 0;
				gTime_cnt_pc =0;
#if __COMM_R_TEST__  //[[ by kys.2018.03.28_BEGIN -- a
				CDC_Transmit_FS(workBuf, rxDataLen);
#endif //]] by kys.2018.03.28_END -- a
				Module_Res_Data(workBuf);
			}

			UsbHStatus = USB_DATA_READY;
			rxDataLen = 0;
			bufPt = workBuf;

			memset(workBuf, 0, RX_BUFF_SIZE);

		}

}



#if 0 //[[ by kys.2018.03.05_BEGIN -- t
		GUI_SetFont(GUI_FONT_16B_ASCII);
		GUI_SetBkColor(GUI_WHITE);
		GUI_SetColor(GUI_BLACK);
		sprintf(txtOut, "D%d(%d) 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x ", 
		cnt++, RcvSize, usrBuf[0],usrBuf[1],usrBuf[2],usrBuf[3],usrBuf[4],usrBuf[5],usrBuf[6],usrBuf[7]);
		GUI_DispStringHCenterAt(txtOut, LCD_GetXSize() / 2, 300);
		txtOut[0] = '\0';
#endif //]] by kys.2018.03.05_END -- t
#if 0 //[[ by kys.2018.03.05_BEGIN -- t
		// 화면 표시 
		nY = (nLine++ * 16) + 20;
		for(i=0; i<size; i++)
		{
			cnvtOut[i] = AscToHex( usrBuf[i] );
		}
		cnvtOut[i] = '\0';
		sprintf(txtOut,"D%d(%d) : %s", cnt++, size, cnvtOut);
		GUI_DispStringHCenterAt(txtOut, LCD_GetXSize() / 2, nY );
		if(nY >= 480) nLine=0;
#endif //]] by kys.2018.03.05_END -- t

/*end*/
