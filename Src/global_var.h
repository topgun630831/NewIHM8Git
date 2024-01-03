#ifndef __GLOBAL_VAR_H__
#define __GLOBAL_VAR_H__

#include "stm32f4xx.h"
#include "stm32f4xx_hal.h"
#include "usbh_def.h"
#include "GUI.h"
#include "WM.h"

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/

extern int HWSETON;

extern  WM_HWIN hHsWnd;

extern WM_HWIN hItem;

extern WM_HWIN hBackBtn_h, hGoBtn_n, hQuitBtn_n;
extern WM_HWIN hBackBtn_n, hGoBtn_h, hQuitBtn_h;
extern WM_HWIN hBackBtn_s, hGoBtn_s, hQuitBtn_s;

extern WM_HWIN hListB_n1, hListB_n2, hListB_n3, hListB_n4, hListB_n5;
extern WM_HWIN hListB_s1, hListB_s2, hListB_s3, hListB_s4, hListB_s5;
extern WM_HWIN hList1, hList2, hList3,hList4,hList5;

extern WM_HWIN hItemHome, hItemMode;
extern WM_HWIN hItemBack, hItemGo, hItemQuit;
extern WM_HWIN hRELAY_Win;
extern WM_HWIN hCurrUddWin[];

typedef enum{
	F_LOAD_CURR=0,
	F_METER_OVER,
	F_VOL_CURR,
	F_POWER_ENG,
	F_HARMONIC,
	F_SYS_INFO,
	F_DEV_STS,
	F_RLY_STS,
	F_MAX
}UDD_FUNC_INDEX;
	

extern int gCurPageNum;
extern int gDnFlag;		// Hid Dn 모드 
extern int gnStaStep;	// Main Window 

extern int gUsbCdcStart; // CDC  on flag

extern int gMeaGetTime;
extern int gPcTimeOutStart;
extern int InPcBypass;
extern int gTime_cnt_pc;
extern int gToken_nn;
extern int gChkNorCmd;
extern int gChkWBusy;
extern int gPcCommOn;
extern int gBleCommOn;

extern char strPrevVal[20];
extern char strSetValW[20];

extern uint16_t gLastSysEvtIdx;	// 최종 system event 발생 인덱스 
extern uint16_t gLastFltEvtIdx;	// 최종 fault event 발생 인덱스 

extern int gRlySetMode;

//////////////////////////////////////////////////////////////////////

#define RX_BUFF_SIZE  256    /* Max Received data 256 byte */
#define TX_BUFF_SIZE  256

extern uint8_t modtest[100][10];
extern uint8_t CDC_TXBuf[TX_BUFF_SIZE];
extern uint8_t CDC_RXBuf[RX_BUFF_SIZE];

extern USBH_HandleTypeDef hUsbHostHS;

extern uint8_t workBuf[RX_BUFF_SIZE];
extern int rxDataLen;
extern int UsbHStatus;
extern uint8_t *bufPt;

////////////////////////////////////////////////////////////////////////////////
// extern function.
////////////////////////////////////////////////////////////////////////////////
extern void Cmd_Prompt();

extern void USBH_CDC_ReceiveCallback(USBH_HandleTypeDef *phost);
extern int8_t USBD_PcRcv_Data(uint8_t* Buf, uint32_t *Len);
extern void ModbusRTUTask();

extern void GroupModeSelect(WM_MESSAGE *pMsg, int id_btn,  int Select);
extern void ButtonAttrpSet();
extern void DropdownAttrpSet();
extern int8_t Uart_PcRcv_Data(uint8_t* Buf, uint32_t *Len);

extern void DispFormat(float value, const char* baseUnit, char result[20]);

////////////////////////////////////////////////////////////////////////////////
// fast update : 0
// normal mode : 1 
// process_end : 100
////////////////////////////////////////////////////////////////////////////////
typedef enum _rlymode {
	A_MODE=0,
	B_MODE
}RLY_MODE;
	

typedef enum{
	USB_DATA_READY=0,
	USB_DATA_START,
	USB_DATA_FINISH
}USBHDATA_STATUS;


typedef enum cmd_mode{
		FASTUPDATE_MODE = 0,
		NORMAL_MODE, 
		
		PROCESS_END = 100
}CMD_MODE;


#define WAIT_NORCMD					do{	\
																GUI_Delay(1);	\
														}while((InPcBypass == 0) && (gChkNorCmd == FASTUPDATE_MODE));	

#define WAIT_FASTCMD				do{	\
															GUI_Delay(1); \
														}while((InPcBypass == 0) && (gChkNorCmd == NORMAL_MODE));	

#define WAIT_TOKEN					do{ GUI_Delay(1);	}while(gToken_nn != TOK_WAIT);

#define WAIT_WBUSY_CHK			do{ GUI_Delay(1);	}while(gChkWBusy == 1);

////////////////////////////////////////////////////////////////////////////////
// TIMER ID :
///////////////////
typedef enum g_timer_id {
			FUD_TIMER=0,
			VOLCUR_TM,
			LCUR_TMID,
			VEC_TIME,			
			HAM_TMID,
			OV_TIMER,
			OSC_TM,
			DEMAND_TM,
			RTC_TIMER,

			MAX_TMID
}G_TIMER_ID;



////////////////////////////////////////////////////////////////////////////////
typedef enum g_step{
	UDD_WAIT_STEP = 0,
	UDD_MAIN_STEP,
	UDD_START_STEP,
	UDD_SECOND_STEP,
	UDD_THIRD_STEP,
	UDD_END_STEP

}G_UDD_STEP;


////////////////////////////////////////////////////////////////////////////////

typedef union
{
	uint32_t u32Data;
	float fData;
}f_temp;



////////////////////////////////////////////////////////////////////////////////

typedef enum g_token{
	TOK_WAIT = 0,
	//hwset
	HWSET_HW1SET_RD,
	HWSET_HW1SET_WR,
	HWSET_HW2SET_RD,
	HWSET_HW2SET_WR,
	HWSET_TIMESET_RD,
	HWSET_TIMESET_WR,
	HWSET_DATA_CLEAR,
//	HWSET_DATA_CLEAR_WR,
	HWSET_DO_RD,
	HWSET_DO_WR,
	HWSET_DO_WR_OP,			// 10

	//relay set
	RELAY_L_RD,
	RELAY_L_WR,

	RELAY_LN_RD,
	RELAY_LN_WR,

	RELAY_S1_RD,
	RELAY_S1_WR,
	RELAY_S2_RD,
	RELAY_S2_WR,

	RELAY_I_RD,
	RELAY_I_WR,		// 20

	RELAY_G_RD,
	RELAY_G_WR,
	
	RELAY_GEXT_RD,
	RELAY_GEXT_WR,
	
	RELAY_PTA_RD,
	RELAY_PTA_WR,
	// 10.uv
	RELAY_UV_ST1_RD,
	RELAY_UV_ST1_WR,
	RELAY_UV_ST2_RD,
	RELAY_UV_ST2_WR,		// 30

	RELAY_OVR1_RD,
	RELAY_OVR1_WR,
	RELAY_OVR2_RD,
	RELAY_OVR2_WR,

	RELAY_RV_RD,
	RELAY_RV_WR,

	RELAY_D_RD,
	RELAY_D_WR,

	RELAY_S_ST1_RD,
	RELAY_S_ST1_WR,		// 40
	RELAY_S_ST2_RD,
	RELAY_S_ST2_WR,

	RELAY_IU_RD,
	RELAY_IU_WR,
	RELAY_VU_RD,
	RELAY_VU_WR,

	RELAY_UF_ST1_RD,
	RELAY_UF_ST1_WR,
	RELAY_UF_ST2_RD,
	RELAY_UF_ST2_WR,		// 50

	RELAY_OF_ST1_RD,
	RELAY_OF_ST1_WR,
	RELAY_OF_ST2_RD,
	RELAY_OF_ST2_WR,

	RELAY_ROCOF_RD,
	RELAY_ROCOF_WR,
	RELAY_RP_RD,
	RELAY_RP_WR,
	RELAY_RQ_ST1_RD,
	RELAY_RQ_ST1_WR,		// 60
	RELAY_RQ_ST2_RD,
	RELAY_RQ_ST2_WR,
	
	RELAY_OP_RD,
	RELAY_OP_WR,
	RELAY_OQ_RD,
	RELAY_OQ_WR,
	RELAY_UP_RD,
	RELAY_UP_WR,
	RELAY_OP_OQ_UP_RD,

	//measurement
	MEA_LD_CURR_RD,

	MEA_LD_PHVOL_RD,			// 70
	
	MEA_FAST_UPD_RD,
	MEA_MAXVO_RD,
	MEA_MAXIO_RD,
	
	MEA_DEMAND_RD,
	MEA_MAX_DEMAND_IA_RD,
	MEA_MAX_DEMAND_IB_RD,
	MEA_MAX_DEMAND_IC_RD,
	MEA_MAX_DEMAND_W_RD,
	////
	MEA_HARMONICS_VA_RD,
	MEA_HARMONICS_VB_RD,			// 80
	MEA_HARMONICS_VC_RD,
	
	MEA_HARMONICS_IA_RD,
	MEA_HARMONICS_IB_RD,
	MEA_HARMONICS_IC_RD,
	
	MEA_HAM_THD_TDD_KF_IVABC_RD,

	MEA_OSCILLOSCOPE_1_RD,
	MEA_OSCILLOSCOPE_2_RD,
	MEA_OSCILLOSCOPE_3_RD,

	//event
	EVT_MAXEVT_BUFSIZE_RD,
	EVT_SYS_EVT_DATA_RD,
	EVT_FLT_EVT_DATA_RD,

	//sysinfo
	DEV_OCRINFO_RD,		// 공장 초기화 모드 	// 90
	DEV_OCRINFO_WR,	
	DEV_HMIINFO_RD,
	DEV_HMIINFO_WR,
	DEV_LIFE_CYCLE_RD,

	DEV_SYSEVT_RD,
	
	G_TOK_MAX
}G_TOKEN;


// keypad input page 
typedef enum pagenum{
	P1_NETWORK_SET = 0,
	P1_COMM_SET,
	P1_PASSWORD,
	P1_TIMERTC,
	P1_PWALM,
	//
	P1_OCR_L,
	P1_OCR_LN,
	P1_OCR_S1,
	P1_OCR_S2,
	P1_OCR_I,
	P1_OCR_G,
	P1_OCR_GEXT,
	P1_OCR_PTA,
	P1_OCR_UV,
	P1_OCR_OVR1,
	P1_OCR_OVR2,
	P1_OCR_RV,
	P1_OCR_D,
	P1_OCR_S,
	P1_OCR_IU,
	P1_OCR_VU,
	P1_OCR_UF,
	P1_OCR_OF,
	P1_OCR_ROCOF,
	P1_OCR_RP,
	P1_OCR_RQ,
	P1_OCR_OP,
	P1_OCR_OQ,
	P1_OCR_UP,
	//measurement
	P1_OCR_LDCURR,

	
	MAX_PAGE
}PAGE_NUM;

/*******************************************************************
** Modbus 
********************************************************************
*/

typedef struct hw1set
{
	// HW1 setting //17 ~
	uint8_t nDevType;	// s, p, a, n
	uint8_t nNFCnY;		//
	uint8_t nPols;
	uint8_t nWiring;
	uint16_t nFreq;		// 50, 60hz
	uint16_t nAF;			//ampere frame
	uint16_t nRatePlug;
	uint16_t nLnFact;
	uint16_t nLn;
	uint16_t nMaxCbMoc;
	uint16_t nMaxCbEoc;
	uint64_t nMaxCW;
	uint16_t nDanCurr1;
	uint16_t nDanCurr2;
	uint16_t nDanCurr3;
	uint16_t nOpt1;
	uint16_t nOpt2;
	uint16_t nOpt3;		// 35
} HW1Set_Def;


// Hw2Setting 
typedef struct
{
	// HW2 setting 
	uint16_t nPhaseVal;			//37
	uint16_t nRateVol;
	uint16_t nCurrDir;			//39
	uint16_t Address;			//40
	uint16_t Baudrate;			//41
	uint16_t RES1; 		//42	// -Reserve
	uint16_t RES2;			//43	// -Reserve
	uint16_t Demand;			//44
	uint16_t LRCtrl;			//45
	uint16_t RES3; 		//46 - RESERVE
	uint16_t nLanguage;			//47
	uint16_t Reserved;			//------48
	uint16_t GroupCtrl;			//49
	uint16_t UserDefDp0;			//50
	uint16_t UserDefDp1;			//51
	uint16_t UserDefDp2;			//52
	uint16_t Pf_Disp;			//53
	uint16_t UnderPFAlm;			//54
	uint16_t OverPFAlm;			//55
} HW2Set_Def;


#if 0 //[[ by kys.2018.03.19_BEGIN -- t
typedef struct
{
	 uint8_t nWireSel;		// 3:3P, 4:4P
//	 uint8_t nCurrDir;		// 1:forward, 2:reverse
	char RateVol_Txt[20];
	char RateCurr_Txt[20];
} NetworkPac_Def;
#endif //]] by kys.2018.03.19_END -- t

typedef struct
{
	 uint8_t nYear;
	 uint8_t nMonth;
	 uint8_t nDay;
	 uint8_t nHour;
	 uint8_t nMinute;
	 uint16_t nSecond;

} Nw_TimeSet_Def;


typedef struct
{
	// 100 ~ 111 번 까지 각종 값들 리셋, Clear 한다.
	// 제어펑션 0x5
	// 0xFF00 으로 클리어 
	uint16_t nAddress;

} Nw_DataClear_Def;


typedef struct
{
	 uint16_t nDataOutBit03;


} Nw_DOut_Def;

///RELAY///////////////////////////////////////////
typedef struct		// 1.장시간 과전류 계전 
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nIdmtlSel;
	 uint8_t nHotCold;
	 uint8_t nReserve;
	 uint16_t nPickup;
	 uint16_t nTimeDly;
//	 uint16_t nUnuse;
} Ry_L_OL_Def;

typedef struct		// 2.단시간 과전류 계전 //66 ~ 75
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nIdmtlSel;
	 uint8_t nI2TOn;
	 uint8_t ZsiEn;
	 uint8_t nStartUpEn;
	 uint8_t Res;
	 uint16_t nPickup;
	 uint16_t nTmDly;
	 uint16_t nZsiTmDly;
	 uint16_t nSuPikup;
	 uint16_t nSuTmDly;
//	 uint16_t nUnuse;
} Ry_S_OCST1_Def;

typedef struct		// 3.단시간 과전류 계전 //76~ 85
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nIdmtlSel;
	 uint8_t nI2TOn;
	 uint8_t Res;
	 uint8_t nStartUpEn;
	 uint8_t Reserve;
	 uint16_t nPickup;
	 uint16_t nTmDly;
	 uint16_t nReserve;
	 uint16_t nSuPikup;
	 uint16_t nSuTmDly;
//	 uint16_t nUnuse;
} Ry_S_OCST2_Def;

typedef struct		// 4.순시 과전류 계전 // 86 ~ 92 
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nErms;
	 uint8_t nStartUpEn;
	 uint8_t Res;
	 uint16_t nPickup;
	 uint16_t nSuPickup;
	 uint16_t nSuTmDly;
//	 uint16_t nUnuse;
} Ry_I_IO_Def;

typedef struct		// 5.지락 보호 계전  //93 ~  102
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nIdmtlSel;
	 uint8_t nI2TOn;
	 uint8_t ZsiEn;
	 uint8_t nStartUpEn;
	 uint8_t Res;
	 uint16_t nPickup;
	 uint16_t nTmDly;
	 uint16_t nZsiTmDly;
	 uint16_t nSuPikup;
	 uint16_t nSuTmDly;
//	 uint16_t nUnuse;
} Ry_G_EthFault_Def;

typedef struct		// 6.MCCB용 계전 // 103 ~ 105
{
	 uint16_t nNprot;
	 uint16_t nRes;
//	 uint16_t nUnuse;
} Ry_MCCB_Def;

typedef struct		// 7.외부 지락 보호 계전  //106 ~ 114
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nI2TOn;
	 uint8_t nStartUpEn;
	 uint8_t ZsiEn;
	 uint16_t nPickup;
	 uint16_t nTmDly;
	 uint16_t nZsiTmDly;
	 uint16_t nSuPikup;
	 uint16_t nSuTmDly;
//	 uint16_t nUnuse;
} Ry_GEXT_Def;

typedef struct		// 8.장시간 중선선 과전류 계전  //115 ~ 120
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nIdmtlSel;
	 uint8_t nHotCold;
	 uint8_t nReserve;
	 uint16_t nPercent;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_LN_Def;

typedef struct		// 9.Pre Trip Alarm  //121 ~ 125
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nI2TOn;
	 uint16_t Pickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_PTA_Def;

typedef struct		// 10.부족전압 계전  //126 ~ 132
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nAutoFR;
	 uint8_t nNomsg;
	 uint8_t nDeadVolBL;
	 uint8_t nPhMode;
	 uint8_t nReserve;
	 uint16_t Pickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_UV_Sta1_Def;

typedef struct		// 11.부족전압 계전  //133 ~ 139
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nAutoFR;
	 uint8_t nNomsg;
	 uint8_t nDeadVolBL;
	 uint8_t nPhMode;
	 uint8_t nReserve;
	 uint16_t Pickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_UV_Sta2_Def;

typedef struct		// 12.과전압 계전  //140 ~ 144
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nReserve;
	 uint16_t Pickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_OV_Sta1_Def;

typedef struct		// 13.과전압 계전  //145 ~ 149
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nReserve;
	 uint16_t Pickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_OV_Sta2_Def;

typedef struct		// 14.지락 과전압 계전  //150 ~ 154
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nReserve;
	 uint16_t Pickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_RV_Def;

typedef struct		// 15.방향성 과전압 계전  //155 ~  164
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t ZsiEn;
	 uint8_t nStartUpEn;
	 uint8_t Res;
	 uint16_t nPickup;
	 uint16_t nTmDly;
	 uint16_t nCherAngle;
	 uint16_t nZsiTmDly;
	 uint16_t nSuPikup;
	 uint16_t nSuTmDly;
//	 uint16_t nUnuse;
} Ry_D_OV_Def;

typedef struct		// 16.전압 제어/억제 과전류 계전  //165 ~  172
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nModeSel;
	 uint16_t nPickupVL;
	 uint16_t nPickupVH;
	 uint16_t nPickupA;
	 uint16_t nTmDly;
	 uint16_t nKs;
//	 uint16_t nUnuse;
} Ry_S_OCOP_Sta1_Def;

typedef struct		// 17.전압 제어/억제 과전류 계전  //173 ~  180
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nModeSel;
	 uint16_t nPickupVL;
	 uint16_t nPickupVH;
	 uint16_t nPickupA;
	 uint16_t nTmDly;
	 uint16_t nKs;
//	 uint16_t nUnuse;
} Ry_S_OCOP_Sta2_Def;

typedef struct		// 18.전류 불평형 계전  //181 ~  185
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint16_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_IU_Def;

typedef struct		// 19.전압 불평형 계전  //186 ~  190
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint16_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_VU_Def;

typedef struct		// 20.저주파수  계전  //191 ~ 196
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint16_t nUnderVol;
	 uint16_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_UF_STA1_Def;

typedef struct		// 21.저주파수  계전  //197 ~ 202
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint16_t nUnderVol;
	 uint16_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_UF_STA2_Def;

typedef struct		// 22.과주파수 계전  //203 ~ 208
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint16_t nUnderVol;
	 uint16_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_OF_STA1_Def;

typedef struct		// 23.과주파수 계전  //209 ~ 214
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint16_t nUnderVol;
	 uint16_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_OF_STA2_Def;

typedef struct		// 24.주파수 변화율  계전  
{									// 215~219 까지 
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t nRocof;
	 uint16_t nUnderVol;
	 uint16_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_ROCOF_Def;

typedef struct		// 25.역방향 유효전력  계전  //221~ 226
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint32_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_RP_Def;

typedef struct		// 26.역방향 무효전력  계전  //227 ~ 232
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint32_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_RQ_STA1_Def;

typedef struct		// 27.역방향 무효전력  계전  //233 ~ 238    
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint32_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_RQ_STA2_Def;

typedef struct		// 28.순방향 유효전력  계전 // 239   ~   244 
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint32_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_OP_Def;

typedef struct		// 29.순방향 무효전력  계전 // 245   ~   250 
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint32_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_OQ_Def;

typedef struct		// 30.부족 유효전력  계전 // 251   ~   257 
{
	 uint8_t nUse;
	 uint8_t nDoSel;
	 uint8_t nOpmode;
	 uint8_t Res;
	 uint16_t nDeadCurr;
	 uint32_t nPickup;
	 uint16_t nTmDly;
//	 uint16_t nUnuse;
} Ry_UP_Def;

//*****************************************************
// Measurement
// 이 블럭은 항상 읽어 들여야 한다. 약 300ms ~ 500ms 로 ..
// 계측 보기 이므로 값을 주기적으로 갱신하여야 한다. 
//*****************************************************
#if 1 //[[ by kys.2018.03.17_BEGIN -- tt
typedef struct
{
	 uint32_t PhACurr; // 214 : 4byte
	 uint32_t PhBCurr; // 216
	 uint32_t PhCCurr; // 218
	 uint32_t PhNCurr; // 220
}Mea_PhCurr_Def;
#endif //]] by kys.2018.03.17_END -- tt


// 위상 ~ 전압/ 전류 /선간전압 
typedef struct
{
	 float PhAVol; // 344 : 4byte
	 float PhBVol; // 
	 float PhCVol; // 

	 float PhABVol; // 350 : 4byte
	 float PhBCVol; // 
	 float PhCAVol; // 

	 float PhACur; // 356 : 4byte
	 float PhBCur; // 
	 float PhCCur; // 
	 float PhNCur; // 

}Mea_PhVolDef;


//3.2 fast update
typedef struct
{
	 uint8_t nSyseRollOverC; // 193
	 uint8_t nFlteRollOverC; // 193
	
	 uint16_t nLastSysEvtIdx; // 194
	 uint16_t nLastFltEvtIdx; // 195

	 uint8_t nLastTripWaveFN; // 196
	 uint8_t nVaildTripWaveCnt; // 196

	 uint8_t nDemandNum; // 197
	 uint8_t nDemandNone; // 197

	 uint8_t nSysSetNum; // 198
	 uint8_t nPwrSetNum; // 198

	 uint8_t nPols; // 199
	 uint8_t nUseVolSet; // 199

	 uint16_t nKnobSts1; // 200
	 uint16_t nKnobSts2; // 201

	 uint16_t nLongtmIR; // 202

	 uint16_t nRes1; // 203
	 uint16_t nRes2; // 204

	 uint16_t nOperStatus; // 205
	 uint16_t nDIstatus; // 206
	 uint16_t nDOstatus; // 207

	 uint16_t nDevActFail1; // 208
	 uint16_t nDevActFail2; // 209

	 uint16_t nCurrPwrAct1; // 210
	 uint16_t nCurrPwrAct2; // 211

	 uint16_t nCpxPwrAct1; // 212
	 uint16_t nCpxPwrAct2; // 213
////////////////////////////////////////////////////////////////////////////////
	 float nAPhCurr; // 214
	 float nBPhCurr; // 216
	 float nCPhCurr; // 218
	 float nNPhCurr; // 220

	 float n3OPhCurrIn; // 222
	 float n3OPhCurrOut; // 224
	 float nNorPhCurr; // 226
	 float nRevPhCurr; // 228 //30229

	 float nAPhVol; // 230
	 float nBPhVol; // 232
	 float nCPhVol; // 234

	 float nABPhVol; // 236
	 float nBCPhVol; // 238
	 float nCAPhVol; // 240

	 float n3OPhVolIn; // 242
	 float n3ONorPhVol; // 244
	 float n3ORevPhVol; // 246

	 float nTotperPwr; // 248
	 float nTotWPwr; // 250
	 float nTotVarPwr; // 252
	 float nTotVaPwr; // 254

	 float nF; 			//256

	 float nVolNonPr; // 258
	 float nCurrNonPr; // 260
	 float nPwrPcen; // 262
	
	 float nEp_l; 	// 264
	 uint32_t nEp_h; // 266
	 float nEq_l; 	// 268
	 uint32_t nEq_h; // 270

	 float nRp_l; 	// 272
	 uint32_t nRp_h; // 274
	 float nRq_l; 	// 276
	 uint32_t nRq_h; // 278

	 float nPisan_l; 	// 280
	 uint32_t nPisan_h; // 282

	 float nAphPf; // 284
	 float nBphPf; // 286
	 float nCphPf; // 288
	
	 float nAphP; // 290
	 float nBphP; // 292
	 float nCphP; // 294

	 float nAphQ; // 296
	 float nBphQ; // 298
	 float nCphQ; // 300
}Mea_FastUpdate_Def;

//3.3 vol & curr
typedef struct{
	 uint32_t nVa; // 230
	 uint32_t nVb; // 232
	 uint32_t nVc; // 234
	
	 uint32_t nIa; // 214
	 uint32_t nIb; // 216
	 uint32_t nIc; // 218

	 uint32_t nVab; // 236
	 uint32_t nVbc; // 238
	 uint32_t nVca; // 240
}Mea_phVolCurr;

typedef struct{
	 float nMaxVo; 				// 31820 //1819
	 uint8_t nMaxVoRes; 	// 31822
	 uint8_t nMaxVoYear; 	// 31822
	 uint8_t nMaxVoMonth; 	// 31823
	 uint8_t nMaxVoDay; 	// 31823
	 uint8_t nMaxVoHour; 	// 31824
	 uint8_t nMaxVoMinute; 	// 31824
	 uint16_t nMaxVoSec; 	// 31825

	 float nMaxIo; 				// 31827
	 uint8_t nMaxIoRes; 	// 31829
	 uint8_t nMaxIoYear; 	// 31829
	 uint8_t nMaxIoMonth; 	// 31830
	 uint8_t nMaxIoDay; 	// 31830
	 uint8_t nMaxIoHour; 	// 31831
	 uint8_t nMaxIoMinute; 	// 31831
	 uint16_t nMaxIoSec; 	// 31832
}Mea_MaxVoIo;

typedef struct{
	 float nIa; 						// 30309 //308
	 float nIb; 						// 30311 // 310
	 float nIc; 						// 30313 //312
	 float nIw; 						// 30315 //314

	 float nMaxDIa; 				// 31771:1770
	 uint8_t nMaxDIaRes; 		// 31773
	 uint8_t nMaxDIaYear; 	// 31773
	 uint8_t nMaxDIaMonth; 	// 31774
	 uint8_t nMaxDIaDay; 		// 31774
	 uint8_t nMaxDIaHour; 	// 31775
	 uint8_t nMaxDIaMinute; 	// 31775
	 uint16_t nMaxDIaSec; 	// 31776

	 float nMaxDIb; 				// 31778:1777
	 uint8_t nMaxDIbRes; 		// 31780
	 uint8_t nMaxDIbYear; 	// 31780
	 uint8_t nMaxDIbMonth; 	// 31781
	 uint8_t nMaxDIbDay; 		// 31781
	 uint8_t nMaxDIbHour; 	// 31782
	 uint8_t nMaxDIbMinute;  // 31782
	 uint16_t nMaxDIbSec; 	// 31783

	 float nMaxDIc; 				// 31785:1784
	 uint8_t nMaxDIcRes; 		// 31787
	 uint8_t nMaxDIcYear; 	// 31787
	 uint8_t nMaxDIcMonth; 	// 31788
	 uint8_t nMaxDIcDay; 		// 31788
	 uint8_t nMaxDIcHour; 	// 31789
	 uint8_t nMaxDIcMinute; 	// 31789
	 uint16_t nMaxDIcSec; 	// 31790

	 float nMaxDIw; 				// 31792:1791
	 uint8_t nMaxDIwRes; 		// 31794
	 uint8_t nMaxDIwYear; 	// 31794
	 uint8_t nMaxDIwMonth; 	// 31795
	 uint8_t nMaxDIwDay; 		// 31795
	 uint8_t nMaxDIwHour; 	// 31796
	 uint8_t nMaxDIwMinute; 	// 31796
	 uint16_t nMaxDIwSec; 	// 31797

}Mea_MaxDemand;

typedef struct{
	 float nVa[64]; 		// 30371 //370
	 float nVb[64]; 		//
	 float nVc[64]; 		//

	 float nIa[64]; 		// 31127 //1126
	 float nIb[64]; 		//
	 float nIc[64]; 		//
}Mea_HamVIabcDef;

typedef struct{
	 float nThdVa; 		// 30321 ~ 30326
	 float nThdVb; 		//  320 ~ 325
	 float nThdVc; 		//

	 float nThdIa; 		// 30333 ~ 30338
	 float nThdIb; 		//  332 ~ 337
	 float nThdIc; 		//

	 float nTddIa; 		// 30339 ~ 30344
	 float nTddIb; 		//  338 ~ 343
	 float nTddIc; 		//
	
	 float nKfIa; 		// 30365 ~ 30370
	 float nKfIb; 		//  364 ~ 369
	 float nKfIc; 		//
	
}Mea_ThdTddKfDef;


// 1sample :20byte  --- 32sample :640byte, 320word :1Cycle
typedef struct {
	 int16_t rwIA; 		//
	 int16_t rwIB; 		//
	 int16_t rwIC; 		//
	 int16_t rwIN; 		//
	 int16_t rwExIzct; 		//
	 int16_t rwVaVab; 		//
	 int16_t rwVbVbc; 		//
	 int16_t rwVcVca; 		//
	 uint16_t rwRes1; 		//
	 uint16_t rwRes2; 		//
	
}RealWave_SmpDef;


typedef struct{

	RealWave_SmpDef RwSampleData[32];		//32sample :640byte, 320word :1Cycle

}Mea_OSC_CycleDef;


// event
typedef struct{
		uint16_t sys_event[8]; 			// 8 word
		uint16_t fault_event_hdr[7]; 	// 7 word
		uint32_t fault_event_val[9]; 	// 18 word
		//uint8_t clr_event[128];  	// 클리어 정보는 100~111 Data Clear 이고, 따로 주소지정하여 All 삭제한다. 

		// func : 0x03 : Max Event Buffer szie 
		uint16_t TripWavMaxCnt;				// 460
		uint16_t Res;									// 461
		uint16_t TripWavSaveCycle;			// 462
		uint16_t RealWavSaveCycle;			// 463
		uint16_t Trip1CycleSample;			// 464
		uint16_t Real1CycleSample;			// 465
		uint16_t SysEvtMaxCnt;					// 466
		uint16_t FltEvtMaxCnt;					// 467
		uint16_t SysEvt1RecLength;			// 468
		uint16_t FltEvt1RecLength;			// 469
		uint16_t TripWav1RecLength;		// 470
		uint16_t RealWav1RecLength;		// 471
	 
}Evt_SysevtDef;


/*
운전 시간 [Hour]
차단기 통전 시간 [Hour]
CB 전기적 동작 횟수 [회]
CB 기계적+전기적 동작 횟수 [회]
Trip 횟수
CB Contact Wear[%](접점 마모율)
*/
typedef struct{	

//내부 온도는 따로 읽어야 한다. 주소 다름.
	float in_temp;			// f:4, a:1756, 2word
	uint32_t op_time;		// f:4, a:1758, l:11 
	uint32_t cb_on_time;
	uint32_t elec_cnt;
	uint32_t mech_cnt;
	uint32_t trip_cnt;
	uint16_t cont_wear;
}Dev_LifeCycle;

// 공장 초기화 모드로 사용 
// OCR 473~508 (35개)
typedef struct{	// f:4, a:473~508, l:35 
	uint8_t nProcCode[12];				 // xxxx.xxxx.xxxx
	uint8_t nSerNum[10];					 // xxxxx.xxxxx
	uint8_t nManufName[4];				 // LSIS 고정
	uint8_t nProcName[4]; 				 // OCR 고정
	uint8_t nModelName[10]; 			 // AG1 AG6 고정
	uint8_t nUserDefDevName[20];	 // "User Device Name " 고정
	uint8_t nOcrHwVer[6]; 				 // VX.Y.Z 고정
	uint16_t RES1;
	uint16_t RES2;
	uint16_t RES3;
}Dev_OcrInfo;

typedef struct{	// f:4, a:510~517, l:35 
	uint8_t nHMI_SW_ver[6];		//
	uint16_t OCR_Passwd; 		//46 - 0000~9999
	uint16_t Swap; 		//	// 1:on, 2:off
	uint16_t Map;			//	// 1:new, 2:old
	uint16_t RES4; 		
	uint16_t RES5; 		
}Dev_HmiInfo;


// dev sys info : 기기정보 OCR / HMI 
typedef struct{

	Dev_OcrInfo DevOcrInfo;
	// HMI : 510 ~ 517  
	 Dev_HmiInfo DevHmiInfo;
	 Dev_LifeCycle DevLifeCycle;

}Dev_SysInfoDef;


typedef struct{
	 uint8_t nSysStatus[256];

}Dev_StsDef;

typedef struct{
	 uint8_t nRlyStatus[256];
	
}Dev_RlyStsDef;



typedef struct
{
	// hwset
//	NetworkPac_Def 		NetPacDef;
	HW1Set_Def				Hw1SetDef;
	HW2Set_Def				Hw2SetDef;
	Nw_TimeSet_Def		TimeSetDef;
	Nw_DataClear_Def 	DataClrDef;
	Nw_DOut_Def				DOutBitDef;

	// relay-A
	// B모드의 경우 주소+200을 하면 된다. 
	Ry_L_OL_Def				RlyOvrLDef;
	Ry_S_OCST1_Def		RlySOcst1Def;
	Ry_S_OCST2_Def		RlySOcst2Def;
	Ry_I_IO_Def				RlyIIoDef;
	Ry_G_EthFault_Def	RlyGEthFaultDef;
	Ry_MCCB_Def				RlyMccbDef;
	Ry_GEXT_Def				RlyGextDef;
	Ry_LN_Def					RlyLnDef;
	Ry_PTA_Def				RlyPtaDef;
	Ry_UV_Sta1_Def		RlyUvSta1Def;
	Ry_UV_Sta2_Def		RlyUvSta2Def;
	Ry_OV_Sta1_Def		RlyOvSta1Def;
	Ry_OV_Sta2_Def		RlyOvSta2Def;
	Ry_RV_Def					RlyRvDef;
	Ry_D_OV_Def				RlyDOvDef;
	Ry_S_OCOP_Sta1_Def RlySOcopSta1Def;
	Ry_S_OCOP_Sta2_Def RlySOcopSta2Def;
	Ry_IU_Def					RlyIuDef;
	Ry_VU_Def					RlyVuDef;
	Ry_UF_STA1_Def		RlyUfSta1Def;
	Ry_UF_STA2_Def		RlyUfSta2Def;
	Ry_OF_STA1_Def		RlyOfSta1Def;
	Ry_OF_STA2_Def		RlyOfSta2Def;
	Ry_ROCOF_Def			RlyRocofDef;
	Ry_RP_Def					RlyRpDef;
	Ry_RQ_STA1_Def		RlyRqSts1Def;
	Ry_RQ_STA2_Def		RlyRqSts2Def;
	Ry_OP_Def					RlyOpDef;
	Ry_OQ_Def					RlyOqDef;
	Ry_UP_Def					RlyUpDef;

	//measurement
	Mea_PhCurr_Def		MeaPhCurDef;
	Mea_FastUpdate_Def MeaFastUpdDef;
	Mea_MaxVoIo				MeaMaxVoIoDef;
	Mea_MaxDemand			MeaMaxDemDef;
	Mea_HamVIabcDef		MeaHamVIabcDef;
	Mea_ThdTddKfDef		MeaThdTddKfDef;
	Mea_OSC_CycleDef	MeaOscDef;
	Mea_PhVolDef			MeaPhVolDef;
	//event
	Evt_SysevtDef			EvtSysevtDef;
	//dev info.
	Dev_SysInfoDef		DevSysInfoDef;
	Dev_StsDef				DevStsDef;
	Dev_RlyStsDef			DevRlyDef;
	
}MBDATA_HandleTypeDef;

extern MBDATA_HandleTypeDef	hMBData;
extern MBDATA_HandleTypeDef	hMBDataSet;





void TS_MainTask(void);
void TSC_MainTask(void);
void Video_MainTask(void);
void DropDown_MainTask(void);
void GifTask(void);


void USBH_CDC_MbRcvDataGet(uint8_t *nFrame, int nInLen, uint8_t *nRevData, uint16_t *nOutLen);


WM_HWIN Hmi_MeterOverview(void);

void KeypadView(WM_HWIN hWnd);

void Hmi_Main(void);
void HwsetView(WM_HWIN hWnd);
void RelaysetView(WM_HWIN hWnd);
void MeasureView(WM_HWIN hWnd);
void EventsView(WM_HWIN hWnd);
void SysInfoView(WM_HWIN hWnd);

void NetworkSetView(WM_HWIN hWnd);
void CommSetView(WM_HWIN hWnd);
void PasswdSetView(WM_HWIN hWnd);
void TimeRtcSetView(WM_HWIN hWnd);
void DemandView(WM_HWIN hWnd);
void LanguageSetView(WM_HWIN hWnd);
void GroupConView(WM_HWIN hWnd);
void UddView(WM_HWIN hWnd);
void DataClearView(WM_HWIN hWnd);
void OpTestView(WM_HWIN hWnd);
void PwrFactorView(WM_HWIN hWnd);
void LocRemCtrlSet(WM_HWIN hWnd);


// relay
void OcrL_1_View(WM_HWIN hWnd);	// 1
void OcrLN_1_View(WM_HWIN hWnd);	// 2
void OcrS_View(WM_HWIN hWnd); // 3
void OcrI_View(WM_HWIN hWnd);	// 4
void IOcgr_View(WM_HWIN hWnd); // 5
void OOcgr_View(WM_HWIN hWnd);	// 6
void PTA_View(WM_HWIN hWnd); // 7
void Uvr_View(WM_HWIN hWnd); // 8
void Ovr_View(WM_HWIN hWnd);	// 9
void ResOVol_Prot_View(WM_HWIN hWnd);	// 10
void DirOc_View(WM_HWIN hWnd);	// 11
void VctrlOverCurr_View(WM_HWIN hWnd);	// 12
void CurrUnbal_Prot_View(WM_HWIN hWnd); // 13
void VolUnbal_Prot_View(WM_HWIN hWnd); // 14
void UnderFreqProt_View(WM_HWIN hWnd);		// 15 
void OverFreqProt_View(WM_HWIN hWnd);	// 16
void RChgFreq_Prot_View(WM_HWIN hWnd);	// 17
void RAP_Prot_View(WM_HWIN hWnd);		// 18
void RevReaPowProt_View(WM_HWIN hWnd);// 19
void Act_OP_Prot_View(WM_HWIN hWnd);		// 20
void ReaOverProt_View(WM_HWIN hWnd);	 // 21 
void ActUnderProtection_View(WM_HWIN hWnd);  // 22

//measurement 
void LoadCurrent_View(WM_HWIN hWnd);
void Meter_OverView(WM_HWIN hWnd);
void VolCurr_View(WM_HWIN hWnd);
void PwrEnergy_View(WM_HWIN hWnd);	// 4
void Demand_View(WM_HWIN hWnd);		// 5
void Harmonics_View(WM_HWIN hWnd);
void Osc_View(WM_HWIN hWnd);


//enent
void SysEvt_View(WM_HWIN hWnd);
void ClearEvt_View(WM_HWIN hWnd);
void Faults_View(WM_HWIN hWnd);
void ClearFaults_View(WM_HWIN hWnd);

//sysinfo
void SysInfo_View(WM_HWIN hWnd);
void DevStatus_View(WM_HWIN hWnd);
void RlyStatus_View(WM_HWIN hWnd);


//////////////////////////////////////////
void _wait_delay(int delay);

void test_mb_8(uint8_t func, uint16_t addr, uint16_t num);

#endif /*__GLOBAL_VAR_H__*/
