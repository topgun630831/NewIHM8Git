/* Includes ------------------------------------------------------------------*/
#define EXTERN extern
#include "RTOS.h"
#include <string.h>
#include "stm32f4xx_hal.h"
#include "modbus.h"
#include "GuiData.h"

/** 
* @file Smodbus.c 
* @brief Modbus 프로토콜 구현.
* @author Yong Seong Kim
* @date 2018/2/21
* @version 1.0
*/

//PRQA S 1503 EOF
//PRQA S 1505 EOF

void MasterModbusBufferPut(uint8_t *pData, uint16_t Sze);
uint16_t CRC16(const uint8_t *puchMsg, const uint16_t usDataLen);
static void ReadAll(void);
static uint8_t ModbusRecvCheck(void);

/** 
* @fn CRC16 
* @brief Modbus CRC16 계산 
* @author Yong Seong Kim
* @param puchMsg [in] A pointer to the message buffer containing binary data to be used for generating the CRC
* @param  usDataLen [in] The quantity of bytes in the message buffer. 

* @return 계산된 CRC16 
*/
uint16_t CRC16(const uint8_t puchMsg[], const uint16_t usDataLen)
{
	uint8_t uchCRCHi = MASK_FF ;   /**< high byte of CRC initialized */ 
	uint8_t uchCRCLo = MASK_FF ;   /**< low byte of CRC initialized */ 
	uint16_t uIndex;            /**< will index into CRC lookup table */
	for(uint8_t i = 0; i < usDataLen; i++)         /* pass through message buffer */
	{
		uIndex = uchCRCHi ^ puchMsg[i] ; /* calculate the CRC */ 
		uchCRCHi = uchCRCLo ^ auchCRCHi[uIndex];
		uchCRCLo = auchCRCLo[uIndex];
	}
	uint16_t ret;
	ret = (uint16_t)(uchCRCHi << INDEX_8) | (uint16_t)uchCRCLo;
	return (ret) ;
}

static void ReadAll(void)
{
	g_bRecvVariable = FALSE;
	uint8_t buf;
	while(1) 
	{
		HAL_StatusTypeDef stat;
		stat = HAL_UART_Receive(&huart2, &buf, 1, INDEX_10);
		//(void)printf("[%02X %02X]", (int)stat, buf);
		if(stat != HAL_OK)
		{
			break;
		}
	}	
}

void MasterModbusSend(uint8_t *pData, uint16_t Length)
{
	//g_bRecvVariable = FALSE;
    g_sendOwner = OWNER_MASTER;
	g_modbusRxIndex = 0;
	g_modbusRxDone = 0;
	g_modbusRxError = 0;

	if(gDebug)
	{
	  (void)printf("Master Send Frame!!!(statusSendStep:%d)\n",statusSendStep);
	  for(int i = 0; i < MasterSendLength; i++)
	  {
		  (void)printf("%02X ", MasterTxBuffer[i]);
	  }
	  (void)printf("\n");
	}
	
	masterSendTick = HAL_GetTick();
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_SET);
	HAL_UART_Transmit_DMA(&huart2, MasterTxBuffer, MasterSendLength);
}

void MasterModbusBufferPut(uint8_t *pData, uint16_t Length)
{
	uint16_t len;

	if(Length > MASTER_TX_BUFF_MAX)
		len = MASTER_TX_BUFF_MAX;
	else
		len = Length;
	memcpy(MasterTxBuffer, pData, len);
	MasterSendLength = len;
}

void SlaveModbusSend(void)
{
//	g_bRecvVariable = FALSE;
        g_sendOwner = OWNER_SLAVE;
	g_modbusSlaveRxIndex = 0;
	g_modbusSlaveRxDone = 0;
	g_modbusSlaveRxError = 0;

	if(gDebug)
	{
	  (void)printf("Slave Send Frame!!!(statusSendStep:%d)\n",statusSendStep);
	  for(int i = 0; i < SlaveSendLength; i++)
	  {
		  (void)printf("%02X ", SlaveTxBuffer[i]);
	  }
	  (void)printf("\n");
	}
	
	if(SlaveSendLength > SLAVE_TX_BUFF_MAX)
		SlaveSendLength = SLAVE_TX_BUFF_MAX;
	slaveSendTick = HAL_GetTick();
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_SET);
	HAL_UART_Transmit_DMA(&huart1, SlaveTxBuffer, SlaveSendLength);
}

void SlaveModbusBufferPut(uint8_t *pData, uint16_t Length)
{
	uint16_t len;

	if(Length > SLAVE_TX_BUFF_MAX)
		len = SLAVE_TX_BUFF_MAX;
	else
		len = Length;
	memcpy(SlaveTxBuffer, pData, len);
	SlaveSendLength = len;
}

void ModbusSendFrame(const uint8_t address, const uint8_t functionCode, const uint16_t start, const uint16_t no)
{
	g_modbusAddress = address;
	g_functionCode = functionCode;
	g_startAddr = start;
	if((functionCode == COIL) || (functionCode == INPUT_STATUS))
	{
		g_waitReceiveLen = no / INDEX_8;
		if(no % INDEX_8)
		{
			g_waitReceiveLen++;
		}
	}
	else
	if((functionCode == HOLDING_REGISTER) || (functionCode == INPUT_REGISTER))
	{
		g_waitReceiveLen = no * INDEX_2;
	}
	else {}
	g_wModbusWaitLen = g_waitReceiveLen + INDEX_5;
	
	uint8_t frame[MODBUS_FRAME_COUNT];
	uint16_t startAddr = start - 1;
	frame[INDEX_0] = address;
	frame[INDEX_1] = functionCode;
	frame[INDEX_2] = (uint8_t)(startAddr >> INDEX_8);
	frame[INDEX_3] = (uint8_t)(startAddr & MASK_FF);
	frame[INDEX_4] = (uint8_t)(no << INDEX_8);
	frame[INDEX_5] = (uint8_t)(no & MASK_FF);
	
	uint16_t crc = CRC16(frame, INDEX_6);
	
	frame[INDEX_6] = (uint8_t)(crc >> INDEX_8);
	frame[INDEX_7] = (uint8_t)(crc & MASK_FF);
	
	g_subFunction = 0;
	
	MasterModbusBufferPut(frame, INDEX_8);
	g_AddressRecv = 0;
	sendFlag = 1;
}

void ModbusSendFrameReadTime(const uint8_t address)
{
	g_modbusAddress = address;
	g_functionCode = MODBUS_EXTEND_FUNCTION;
	g_subFunction = MODBUS_SUBFUCTION_READTIME;
	g_wModbusWaitLen = INDEX_14;
	
	uint8_t frame[MODBUS_FRAME_COUNT];
	frame[INDEX_0] = address;
	frame[INDEX_1] = MODBUS_EXTEND_FUNCTION;
	frame[INDEX_2] = MODBUS_SUBFUCTION_READTIME;
	frame[INDEX_3] = 0;				// Reserved
	
	uint16_t crc = CRC16(frame, INDEX_4);
	
	frame[INDEX_4] = (uint8_t) (crc >> INDEX_8);
	frame[INDEX_5] = (uint8_t)(crc & MASK_FF);
	
	MasterModbusBufferPut(frame, INDEX_6);
	g_AddressRecv = 0;
	sendFlag = 1;
}

void ModbusSendFrameDeviceIdentofocation(const uint8_t address)
{
	g_modbusAddress = address;
	g_functionCode = MODBUS_EXTEND_FUNCTION;
	g_subFunction = MODBUS_SUBFUCTION_DEVICE_IDENTIFICATION;

	if(ConnectSetting[gDeviceIndex].DeviceType == DEVICE_ACB)
	{
		g_wModbusWaitLen = ACB_DEVICE_IDENTOFOCATION_WAIT_LEN;
	}
	else
	{
		g_wModbusWaitLen = MCCB_DEVICE_IDENTOFOCATION_WAIT_LEN;
	}
	
	uint8_t frame[MODBUS_FRAME_COUNT];
	frame[INDEX_0] = address;
	frame[INDEX_1] = MODBUS_EXTEND_FUNCTION;
	frame[INDEX_2] = MODBUS_SUBFUCTION_DEVICE_IDENTIFICATION;
	frame[INDEX_3] = INDEX_2;
	frame[INDEX_4] = INDEX_4;
	
	uint16_t crc = CRC16(frame, INDEX_5);
	
	frame[INDEX_5] = (uint8_t) (crc >> INDEX_8);
	frame[INDEX_6] = (uint8_t)(crc & MASK_FF);
	
	MasterModbusBufferPut(frame, INDEX_7);
	g_AddressRecv = 0;
	sendFlag = 1;
}

void ModbusSendFrameDeviceIdentofocation3(const uint8_t address, uint8_t deviceID, uint8_t objectID)
{
	g_modbusAddress = address;
	g_functionCode = MODBUS_EXTEND_FUNCTION;
	g_subFunction = MODBUS_SUBFUCTION_DEVICE_IDENTIFICATION;

	g_wModbusWaitLen = MODBUS_FRAME_COUNT;
	uint8_t frame[MODBUS_FRAME_COUNT];
	frame[INDEX_0] = address;
	frame[INDEX_1] = MODBUS_EXTEND_FUNCTION;
	frame[INDEX_2] = MODBUS_SUBFUCTION_DEVICE_IDENTIFICATION;
	frame[INDEX_3] = deviceID;
	frame[INDEX_4] = objectID;
	
	uint16_t crc = CRC16(frame, INDEX_5);
	
	frame[INDEX_5] = (uint8_t) (crc >> INDEX_8);
	frame[INDEX_6] = (uint8_t)(crc & MASK_FF);
	
	MasterModbusBufferPut(frame, INDEX_7);
	g_bRecvVariable = TRUE;
	g_AddressRecv = 0;
	sendFlag = 1;
}


void ModbusSendFrameEvent(const uint8_t address, const uint8_t fileNo, const uint16_t recordNumber)
{
	g_modbusAddress = address;
	g_functionCode = MODBUS_READ_FILE_RECORD;
	g_subFunction = MODBUS_REF_TYPE_EVENT;
	g_wModbusWaitLen = EVENT_READ_WAIT_LEN;

	if(fileNo == MODBUS_FILE_NO_FAULT)
	{
		g_wModbusWaitLen = FAULT_EVENT_READ_WAIT_LEN;
	}
	uint8_t frame[DEFAULT_BUF_SIZE];
	frame[INDEX_0] = address;
	frame[INDEX_1] = MODBUS_READ_FILE_RECORD;
	frame[INDEX_2] = INDEX_7;
	frame[INDEX_3] = MODBUS_REF_TYPE_EVENT;			// Ref. Type
	frame[INDEX_4] = 0;
	frame[INDEX_5] = fileNo;							// File Number
	frame[INDEX_6] = (uint8_t)(recordNumber >> INDEX_8);
	frame[INDEX_7] = (uint8_t)(recordNumber & MASK_FF);	// Record Number
	frame[INDEX_8] = 0;
	frame[INDEX_9] = 1;								// Record Length
	
	uint16_t crc = CRC16(frame, INDEX_10);
	
	frame[INDEX_10] = (uint8_t) (crc >> INDEX_8);
	frame[INDEX_11] = (uint8_t)(crc & MASK_FF);
	
	MasterModbusBufferPut(frame, INDEX_12);
	g_AddressRecv = 0;
	sendFlag = 1;
}

void ModbusSendFrameFromUsb(uint8_t* sendBuf, uint32_t length)
{
//	uint8_t ret = MODBUS_OK;

	g_subFunction = 0;

//	ReadAll();
//	(void)HAL_UART_Transmit(&huart2, sendBuf, (uint8_t)length, UART_TIMEOUT);
	MasterModbusBufferPut(sendBuf, (uint8_t)length);
	g_AddressRecv = 0;
//	return ret;
}

uint8_t ModbusCRCCheck(void)
{
	if(gDebug)
	{
	  (void)printf("Recv Frame!!!\n");
	  for(int i = 0; i < g_modbusRxIndex; i++)
	  {
		  (void)printf("%02X ", g_modbusRxBuff[i]);
	  }
	  (void)printf("\n");
	}
	
	uint8_t ret = MODBUS_OK;
	if(g_modbusRxBuff[1] & MASK_80)
	{
		(void)printf("-----------------\nModbus Error[%02x]\n", g_modbusRxBuff[INDEX_2]);
	}
	uint16_t p = (uint16_t)(g_modbusRxBuff[g_modbusRxIndex-INDEX_2] << INDEX_8) | (uint16_t)g_modbusRxBuff[g_modbusRxIndex-1];
	uint16_t crc = CRC16(g_modbusRxBuff, g_modbusRxIndex-INDEX_2);
	
	if(crc != p)
	{
		(void)printf("-----------------\nModbus CRC Error[%04x, %04x]\n", crc, p);
		ret = MODBUS_CRC_ERROR;
	}
	return ret;
}

uint8_t ModbusGetUint8_U(const uint16_t address)
{
	if(address < g_startAddr)
	{
		return 0;
	}
	uint16_t offset = ((address - g_startAddr) * INDEX_2) + INDEX_3; // address+func code+bytes
	uint8_t bValue = g_modbusRxBuff[offset];
	return bValue;
}

uint8_t ModbusGetUint8_L(const uint16_t address)
{
	if(address < g_startAddr)
	{
		return 0;
	}
	uint16_t offset = ((address - g_startAddr) * INDEX_2) + INDEX_3; // address+func code+bytes
	uint8_t bValue = g_modbusRxBuff[offset+1];
	return bValue;
}

uint16_t ModbusGetUint16(const uint16_t address)
{
	if(address < g_startAddr)
	{
		return 0;
	}
	uint16_t offset = ((address - g_startAddr) * INDEX_2) + INDEX_3; // address+func code+bytes
	uint16_t wValue = (uint16_t)(((uint16_t)(g_modbusRxBuff[offset]) << INDEX_8) | g_modbusRxBuff[offset+1]);
	return wValue;
}

int16_t ModbusGetInt16(const uint16_t address)
{
	if(address < g_startAddr)
	{
		return 0;
	}
	uint16_t offset = ((address - g_startAddr) * INDEX_2) + INDEX_3; // address+func code+bytes
	int16_t sValue = (int16_t)(((uint16_t)(g_modbusRxBuff[offset]) << INDEX_8) | g_modbusRxBuff[offset+1]);
	return sValue;
}

float ModbusGetFloat(const uint16_t address)
{
	if(address < g_startAddr)
	{
		return 0;
	}
	uint16_t offset = ((address - g_startAddr) * INDEX_2) + INDEX_3; // address+func code+bytes
	uint8_t val[INDEX_4];
// PRQA S 0310 1
	float *fValue = (float *)val;
	
	val[INDEX_3] = g_modbusRxBuff[offset++];
	val[INDEX_2] = g_modbusRxBuff[offset++];
	val[INDEX_1] = g_modbusRxBuff[offset++];
	val[INDEX_0] = g_modbusRxBuff[offset];
	return *fValue;
}

uint32_t ModbusGetUint32(const uint16_t address)
{
	if(address < g_startAddr)
	{
		return 0;
	}
	uint16_t offset = ((address - g_startAddr) * INDEX_2) + INDEX_3; // address+func code+bytes
	uint8_t val[INDEX_4];
// PRQA S 0310 1
	uint32_t *Value = (uint32_t *)val;
	
	val[INDEX_3] = g_modbusRxBuff[offset++];
	val[INDEX_2] = g_modbusRxBuff[offset++];
	val[INDEX_1] = g_modbusRxBuff[offset++];
	val[INDEX_0] = g_modbusRxBuff[offset];
	
	return *Value;
}

int32_t ModbusGetInt32(const uint16_t address)
{
	if(address < g_startAddr)
	{
		return 0;
	}
	uint16_t offset = ((address - g_startAddr) * INDEX_2) + INDEX_3; // address+func code+bytes
	int8_t val[INDEX_4];
// PRQA S 0310 1
	int32_t *Value = (int32_t *)val;
	
	val[INDEX_3] = g_modbusRxBuff[offset++];
	val[INDEX_2] = g_modbusRxBuff[offset++];
	val[INDEX_1] = g_modbusRxBuff[offset++];
	val[INDEX_0] = g_modbusRxBuff[offset];
	
	return *Value;
}

uint8_t ModbusGetBit(const uint16_t address, const uint16_t bit)
{
	if(address < g_startAddr)
	{
		return 0;
	}
	uint16_t offset = ((address - g_startAddr) * INDEX_2) +INDEX_3; // address+func code+bytes
	uint16_t Value = (uint16_t)(((uint16_t)(g_modbusRxBuff[offset]) << INDEX_8) | g_modbusRxBuff[offset+1]);
	uint16_t mask = 1;
	mask = mask << bit;
	uint8_t ret = 0;
	
	if(Value & mask)
	{
		ret = 1;
	}
	
	return ret;
}
/*
static uint8_t ModbusGetDigital(const uint16_t address)
{
	if(address < g_startAddr)
	{
		return 0;
	}
	uint16_t offset = (address - g_startAddr);
	uint16_t bit = offset % INDEX_8;   
	offset = (offset / INDEX_8)  + INDEX_3; // address+func code+bytes
	
	uint16_t mask = 1;
	mask = mask << bit;
	
	uint8_t ret = 0;
	if(g_modbusRxBuff[offset] & mask)
	{
		ret = 1;
	}
	
	return ret;
}
*/
void ModbusGetString(const uint16_t address, const uint16_t len, char buf[])
{
	buf[0] = 0;
	if(address < g_startAddr)
	{
		return;
	}
	uint16_t offset = ((address - g_startAddr) * INDEX_2) + INDEX_3; // address+func code+bytes
	
	(void)memcpy(buf, &g_modbusRxBuff[offset], len);
	buf[len] = 0;
}

void ModbusGetDateTime(S_DATE_TIME *dateTime)
{
	uint16_t mSec;
	uint16_t offset = INDEX_4;
	
	dateTime->Invalid = g_modbusRxBuff[offset++];
	uint16_t Year = (uint16_t) g_modbusRxBuff[offset++];
	dateTime->Year = Year+YEAR_BASE;
	dateTime->Month = g_modbusRxBuff[offset++];
	dateTime->Day = g_modbusRxBuff[offset++];
	dateTime->Hour = g_modbusRxBuff[offset++];
	dateTime->Min = g_modbusRxBuff[offset++];
	mSec = (uint16_t)(((uint16_t)(g_modbusRxBuff[offset]) << INDEX_8) | g_modbusRxBuff[offset]); 
	dateTime->Sec = (uint16_t)(mSec / THOUSAND);
	dateTime->mSec = (uint16_t)(mSec % THOUSAND);
}

void ModbusGetProductName(char *buf)
{
	uint16_t offset; // address+func code+bytes
	int len;
	
	if(ConnectSetting[gDeviceIndex].DeviceType == DEVICE_ACB)
	{
		offset = GET_PRODUCTNAME_OFFSET;
		len = PRODUCT_NAME_COUNT;
	}
	else
	{
		offset = GET_PRODUCTNAME_OFFSET;
		len = INDEX_4;
	}

// PRQA S 0310 1
	(void)memcpy(gProductInfo[gDeviceIndex].ProductName, (char*)&g_modbusRxBuff[offset], len);
	gProductInfo[gDeviceIndex].ProductName[len] = 0;
	
}

void ModbusGetId1(void)
{
	int index = INDEX_9;
	
// PRQA S 0310 1
	(void)memcpy(VendorName, &g_modbusRxBuff[index+1], g_modbusRxBuff[index]);
	VendorName[g_modbusRxBuff[index]] = 0;
	//(void)printf("[%d,%x]", index, g_modbusRxBuff[index]);
	index += (g_modbusRxBuff[index] + INDEX_2);
	//(void)printf("[%d,%x]", index, g_modbusRxBuff[index]);
	index += (g_modbusRxBuff[index] + INDEX_2);
	//(void)printf("[%d,%x]", index, g_modbusRxBuff[index]);
	(void)memcpy(ModbusVersion, &g_modbusRxBuff[index+1], g_modbusRxBuff[index]);
	ModbusVersion[g_modbusRxBuff[index]] = 0;
	ModbusVersion[DEFAULT_BUF_SIZE-1] = 0;
	//(void)printf("\n\n\nVendor=%s, Ver=%s\n", VendorName, ModbusVersion);
	
}

void ModbusGetId2(char productName[MESSAGE_BUF_SIZE])
{
	int index = INDEX_9;
	index += (g_modbusRxBuff[index] + INDEX_2);

	(void)memcpy(productName, &g_modbusRxBuff[index+1], g_modbusRxBuff[index]);
	productName[g_modbusRxBuff[index]] = 0;
	index += (g_modbusRxBuff[index] + INDEX_2);
}

//void ModbusGetId3(char serialNo[DEFAULT_BUF_SIZE], char productCode[DEFAULT_BUF_SIZE], char hardwarVersion[DEFAULT_BUF_SIZE], char softwareVersion[DEFAULT_BUF_SIZE])
void ModbusGetId3(void)
{
	int index = INDEX_9;
	
	(void)memcpy(serialNo, &g_modbusRxBuff[index+1], g_modbusRxBuff[index]);
	serialNo[g_modbusRxBuff[index]] = 0;
	serialNo[DEFAULT_BUF_SIZE-1] = 0;
	index += (g_modbusRxBuff[index] + INDEX_2);

	(void)memcpy(productCode, &g_modbusRxBuff[index+1], g_modbusRxBuff[index]);
	productCode[g_modbusRxBuff[index]] = 0;
	productCode[DEFAULT_BUF_SIZE-1] = 0;
	index += (g_modbusRxBuff[index] + INDEX_2);

	(void)memcpy(hardwarVersion, &g_modbusRxBuff[index+1], g_modbusRxBuff[index]);
	hardwarVersion[g_modbusRxBuff[index]] = 0;
	hardwarVersion[DEFAULT_BUF_SIZE-1] = 0;
	index += (g_modbusRxBuff[index] + INDEX_2);

	(void)memcpy(softwareVersion, &g_modbusRxBuff[index+1], g_modbusRxBuff[index]);
	softwareVersion[g_modbusRxBuff[index]] = 0;
	softwareVersion[DEFAULT_BUF_SIZE-1] = 0;
	
	if(gDebug)
		(void)printf("serial=%s, code=%s, hVer=%s, sVer=%s\n", serialNo, productCode, hardwarVersion, softwareVersion);
}

//void ModbusGetId3(char serialNo[20], char productCode[20], char hardwarVersion[20], char softwareVersion[20])
//{
//	uint16_t offset; // address+func code+bytes
//	
//	offset = 10;
//	if(ConnectSetting[gDeviceIndex].DeviceType == DEVICE_ACB)
//	{
//		(void)memcpy(serialNo, &g_modbusRxBuff[offset], 12);
//		serialNo[12] = 0;
//		offset = offset + 12 + 2;
//		(void)memcpy(productCode, &g_modbusRxBuff[offset], 8);
//		productCode[8] = 0;
//		offset = offset + 8 + 2;
//		(void)memcpy(hardwarVersion, &g_modbusRxBuff[offset], 8);
//		hardwarVersion[8] = 0;
//		offset = offset + 8 + 2;
//		(void)memcpy(softwareVersion, &g_modbusRxBuff[offset], 8);
//		softwareVersion[8] = 0;
//	}
//	else
//	{
//		(void)memcpy(serialNo, &g_modbusRxBuff[offset], 10);
//		serialNo[10] = 0;
//		offset = offset + 10 + 2;
//		(void)memcpy(productCode, &g_modbusRxBuff[offset], 8);
//		productCode[8] = 0;
//		offset = offset + 8 + 2;
//		(void)memcpy(hardwarVersion, &g_modbusRxBuff[offset], 8);
//		hardwarVersion[8] = 0;
//		offset = offset + 8 + 2;
//		(void)memcpy(softwareVersion, &g_modbusRxBuff[offset], 8);
//		softwareVersion[8] = 0;
//	}
//}
//extern IWDG_HandleTypeDef hiwdg;
static uint8_t ModbusRecvCheck(void)
{
//	int flagBreak = FALSE;
	OS_Delay(1);
	uint32_t startTimer = HAL_GetTick();
	while(1)
	{
		if (g_modbusRxDone)
		{
			uint8_t ret = ModbusCRCCheck();
			g_modbusRxDone = 0;
			g_modbusRxError = 0;
			if(ret == MODBUS_OK)
			{
				if(gDebug)
					(void)printf("CRC OK\n");
				return CONTROL_OK;
			}
			else
			if(ret == MODBUS_ERROR)
			{
				(void)printf("Modbus Error\n");
			}
			else
			if(ret == MODBUS_CRC_ERROR)
			{
				(void)printf("CRC BAD\n");
			}
			else {}
			return CONTROL_FAIL;
		}
		uint32_t timer = HAL_GetTick();
		uint32_t diff = timer-startTimer;
		if(diff >= THOUSAND)
		{
			(void)printf("Time Out....\n");
			break;
		}
		OS_Delay(1);
//		__HAL_IWDG_RELOAD_COUNTER(&hiwdg);
	}
	return CONTROL_FAIL;
}


uint8_t ModbusControl(const uint8_t address, const int offset, const int pos, const uint8_t onoffStatus, uint8_t bSBO)
{
	uint8_t frame[MODBUS_FRAME_COUNT];
	uint16_t startAddr;
	uint8_t ret;

	g_functionCode = INDEX_5;

	if(mLinkMode[gDeviceIndex] == 1)
	{
	  if(bSBO == 1)			// SBO
	  {
		  startAddr = (pos * INDEX_4) + offset;
		  if(onoffStatus == 1)
		  {
			  startAddr += INDEX_2;		
		  }
	  }
	  else					// Not SBO
	  {
		  startAddr = (pos * INDEX_2) + offset;
		  if(onoffStatus == 1)
		  {
			  startAddr++;		
		  }
	  }		
	}
	else
	{
		if(bSBO == 1)			// SBO
		{
			startAddr = (pos * INDEX_2) + offset;
		}
		else					// Not SBO
		{
			startAddr = pos + offset;
		}
	}
	if(gDebug)
		(void)printf("ModbusControl : address:%d, offset:%d, pos=%d, onoffStatus = %d, bSBO=%d\n", address, offset, pos, onoffStatus, bSBO);
	frame[INDEX_0] = address;
	frame[INDEX_1] = INDEX_5;		//Write Single Coil
	frame[INDEX_2] = (uint8_t)(startAddr >> INDEX_8);
	frame[INDEX_3] = (uint8_t)(startAddr & MASK_FF);
	frame[INDEX_4] = MASK_FF;
	frame[INDEX_5] = 0x00;
	
	uint16_t crc = CRC16(frame, INDEX_6);
	
	frame[INDEX_6] = (uint8_t) (crc >> INDEX_8);
	frame[INDEX_7] = (uint8_t)(crc & MASK_FF);
	
	g_subFunction = 0;
	g_wModbusWaitLen = MODBUS_FRAME_COUNT;
	MasterModbusBufferPut(frame, INDEX_8);
	sendFlag = 1;

	ret = ModbusRecvCheck();
	if(ret == CONTROL_FAIL)
	{
		return ret;
	}
	(void)printf("control ok...\n");
	if(bSBO == 1)			// SBO
	{
		startAddr++;
		
		frame[INDEX_0] = address;
		frame[INDEX_1] = INDEX_5;		//Write Single Coil
		frame[INDEX_2] = (uint8_t)(startAddr >> INDEX_8);
		frame[INDEX_3] = (uint8_t)(startAddr & MASK_FF);
		frame[INDEX_4] = MASK_FF;
		frame[INDEX_5] = 0x00;
		
		crc = CRC16(frame, INDEX_6);
		
		frame[INDEX_6] = (uint8_t) (crc >> INDEX_8);
		frame[INDEX_7] = (uint8_t)(crc & MASK_FF);
		
		g_subFunction = 0;
		g_wModbusWaitLen = INDEX_8;
		MasterModbusBufferPut(frame, INDEX_8);
		sendFlag = 1;
		
		ret = ModbusRecvCheck();
		if(ret == CONTROL_FAIL)
		{
			return ret;
		}
	}
	(void)printf("control ok...\n");
	return CONTROL_OK;
}

void ModbusSetTime(const uint8_t address, const S_DATE_TIME *dateTime)
{
	uint8_t frame[DEFAULT_BUF_SIZE];
	uint16_t mSec = (uint16_t)dateTime->Sec * THOUSAND;
	frame[INDEX_0] = address;
	frame[INDEX_1] = MODBUS_EXTEND_FUNCTION;
	frame[INDEX_2] = MODBUS_SUBFUCTION_SETTIME;
	frame[INDEX_3] = 0;
	frame[INDEX_4] = 0;
	frame[INDEX_5] = (uint8_t)(dateTime->Year-YEAR_BASE);
	frame[INDEX_6] = dateTime->Month;
	frame[INDEX_7] = dateTime->Day;
	frame[INDEX_8] = dateTime->Hour;
	frame[INDEX_9] = dateTime->Min;
	frame[INDEX_10] = (uint8_t)(mSec >> INDEX_8);
	frame[INDEX_11] = (uint8_t)(mSec & MASK_FF);
	
	uint16_t crc = CRC16(frame, INDEX_12);
	
	frame[INDEX_12] = (uint8_t) (crc >> INDEX_8);
	frame[INDEX_13] = (uint8_t)(crc & MASK_FF);
	
	MasterModbusBufferPut(frame, INDEX_14);
	g_subFunction = 0;
	sendFlag = 1;
}

void ModbusSetTimeAndWait(const uint8_t address, const S_DATE_TIME *dateTime)
{
	ModbusSetTime(address, dateTime);
	g_wModbusWaitLen = INDEX_14;
	(void)ModbusRecvCheck();
}
//union TempVal {
//	uint8_t val[4];
//	uint32_t lVal;
//	float fVal;
//};
void ModbusAcbSystemEventGet(S_DATE_TIME *dateTime, uint16_t *mainCategory, uint16_t *middleCategory, uint16_t *smallCategory, uint16_t *Status, float *Value)
{
	uint16_t mSec;
	
	uint16_t offset = INDEX_5;

	*mainCategory = (g_modbusRxBuff[offset] & MASK_F0) >> INDEX_4;
	
	*middleCategory = ((g_modbusRxBuff[offset] & MASK_0F) << INDEX_2) | ((g_modbusRxBuff[offset+1] & MASK_C0) >> INDEX_6);
	*smallCategory = (g_modbusRxBuff[offset+1] & MASK_3F);

	offset += INDEX_2;
	gReadIndex = (uint16_t)((g_modbusRxBuff[offset] & MASK_07) << INDEX_8) | g_modbusRxBuff[offset+1];

	offset += INDEX_3;
	
	dateTime->Year = (uint16_t)g_modbusRxBuff[offset++] + YEAR_BASE;
	dateTime->Month = g_modbusRxBuff[offset++];
	dateTime->Day = g_modbusRxBuff[offset++];
	dateTime->Hour = g_modbusRxBuff[offset++];
	dateTime->Min = g_modbusRxBuff[offset++];
	mSec = (uint16_t)(((uint16_t)(g_modbusRxBuff[offset]) << INDEX_8) | g_modbusRxBuff[offset+1]); 
	dateTime->Sec = (uint16_t)(mSec / THOUSAND);
	dateTime->mSec = (uint16_t)(mSec % THOUSAND);
	
	offset += INDEX_2;

	*Status = ((uint16_t)g_modbusRxBuff[offset] << INDEX_8) | g_modbusRxBuff[offset+1];

	offset += INDEX_2;

	uint8_t val[INDEX_4];
	float *fValue;
// PRQA S 0310 1
	fValue = (float *)val;
	
	val[INDEX_3] = g_modbusRxBuff[offset++];
	val[INDEX_2] = g_modbusRxBuff[offset++];
	val[INDEX_1] = g_modbusRxBuff[offset++];
	val[INDEX_0] = g_modbusRxBuff[offset];

	*Value = *fValue;
	(void)printf("mSec=%d,(%d, %d)(%04x, %f)\n\n\n\n\n", mSec, dateTime->Sec, dateTime->mSec, *Status, *Value);

}
