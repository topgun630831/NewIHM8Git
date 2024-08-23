#ifndef MODBUS_H
#define MODBUS_H

#include "RTOS.H"
#include <stdbool.h>

#define DEVICE_MAX 			8

#define MODBUS_BUFF_SIZE 							512
#define MODBUS_SLAVE_BUFF_SIZE 						20

#define	MODBUS_EXTEND_FUNCTION						0x2b
#define MODBUS_SUBFUCTION_DEVICE_IDENTIFICATION		0x0e
#define MODBUS_SUBFUCTION_READTIME					0x0f
#define MODBUS_SUBFUCTION_SETTIME					0x10
#define	NORMAL_EXCEPTION_LEN						5
#define	EXTEND_EXCEPTION_LEN						6

#define	MODBUS_READ_FILE_RECORD						0x64
#define	MODBUS_REF_TYPE_EVENT						0x06
#define	MODBUS_FILE_NO_SYSTEM						0x64
#define	MODBUS_FILE_NO_FAULT						0x65

#define MODBUS_READ_DEVICE_ID						0x01
#define MODBUS_BASIC								0x01
#define MODBUS_REGULAR								0x02
#define MODBUS_EXTENDED								0x03
#define MODBUS_EXTENDED_OBJECT						0x80

#define	GET_PRODUCTNAME_OFFSET						31

#define PRODUCT_NAME_COUNT							15
#define MODEL_NAME_COUNT							26
#define COMM_ERROR_COUNT							5
#define	NOGATEWAY_MODBUS_TIMEOUT					100
#define	MODBUS_TIMEOUT								1000
#define	MODBUS_FRAME_COUNT							8
#define	ACB_DEVICE_IDENTOFOCATION_WAIT_LEN			(10+(4*2)+0x13+0x0f+0x7+0x10);
#define	MCCB_DEVICE_IDENTOFOCATION_WAIT_LEN			(10+(4*2)+0x13+0x4+0x14+0x14);
#define	MASK_FF										0xff
#define	MASK_0F										0x0f
#define	MASK_F0										0xf0
#define	MASK_C0										0xc0
#define	MASK_3F										0x3f
#define	MASK_07										0x07
#define	MASK_80										0x80
#define	EVENT_READ_WAIT_LEN							23
#define	FAULT_EVENT_READ_WAIT_LEN					(52+5)

#define MESSAGE_BUF_SIZE				60
#define FORMAT_BUF_SIZE					50
#define DEFAULT_BUF_SIZE				50
#define UNIT_BUF_SIZE					10
#define DATE_BUF_SIZE					30
#define RESULT_BUF_SIZE					100

#define MASTER_TX_BUFF_MAX 20
#define SLAVE_TX_BUFF_MAX 256

#define UART1_DMA_RX_BUFF_SIZE 20
#define UART2_DMA_RX_BUFF_SIZE 512

typedef enum e_function_code
{
    COIL = 1,
    INPUT_STATUS = 2,
    HOLDING_REGISTER = 3,
    INPUT_REGISTER = 4,
    FORCE_SINGLE_COIL = 5,
    PRESET_SINGLE_COIL = 6,
    READ_EXEPTION_STATUS = 7,
} E_FUNCTION_CODE;

typedef enum e_modbus_error
{
    MODBUS_NONE = 0,
    MODBUS_OK = 1,
    MODBUS_CRC_ERROR = 2,
    MODBUS_ERROR = 3
} E_MODBUS_ERROR;

typedef enum e_comm_status
{
    COMM_ERROR = 0,
    COMM_OK = 1,
} E_COMM_ERROR;

typedef enum e_owner
{
    OWNER_MASTER = 0,
    OWNER_SLAVE = 1,
} E_OWNER;

typedef struct s_Event_Record {
	uint16_t L_Category:4;
	uint16_t M_Category:6;
	uint16_t S_Category:6;
	uint16_t RolloverCnt:4;
	uint16_t EventIndex:12;
	uint16_t Reserved1:8;
	uint16_t Year:8;
	uint16_t Month:8;
	uint16_t Day:8;
	uint16_t Hour:8;
	uint16_t MSecH:8;
	uint16_t MSecL:8;
	uint16_t OccureenceSource:8;
	uint16_t Group:1;
	uint16_t Reserved2:1;
	uint16_t Reserved3:1;
	uint16_t Reserved4:1;
	uint16_t EventStatus:4;
} S_EVENT_RECORD;

typedef struct s_Fault_Record {
	uint16_t L_Category:4;
	uint16_t M_Category:6;
	uint16_t S_Category:6;
	uint16_t RolloverCnt:4;
	uint16_t EventIndex:12;
	uint16_t Reserved1:8;
	uint16_t Year:8;
	uint16_t Month:8;
	uint16_t Day:8;
	uint16_t Hour:8;
	uint16_t MSecH:8;
	uint16_t MSecL:8;
	uint16_t OccureenceSource:8;
	uint16_t Group:1;
	uint16_t Reserved2:1;
	uint16_t Reserved3:1;
	uint16_t Reserved4:1;
	uint16_t EventStatus:4;
} S_FAULT_RECORD;

typedef struct s_Date_Time {
	uint16_t Year;
	uint8_t Month;
	uint8_t Day;
	uint8_t Hour;
	uint8_t Min;
	uint8_t Sec;
	uint16_t mSec;
	uint8_t Invalid;
} S_DATE_TIME;

typedef struct s_System_Event {
	uint16_t mainCategory:4;
	uint16_t middleCategory:6;
	uint16_t smallCategory:6;
} S_SYSTEM_EVENT_CATEGORY;

typedef struct s_Product_Info {
	char ProductName[PRODUCT_NAME_COUNT+1];
	char ModelName[MODEL_NAME_COUNT+1];
} S_PRODUCT_INFO;

uint16_t CRC16(const uint8_t *puchMsg, const uint16_t usDataLen);
void MasterModbusBufferPut(uint8_t *pData, uint16_t Size, E_OWNER MasterSlave);
void ControlModbusBufferPut(uint8_t *pData, uint16_t Size, E_OWNER MasterSlave);
void MasterModbusSend(E_OWNER MasterSlave);
void SlaveModbusSend(void);
void ControlModbusSend(void);
uint8_t ModbusRecvCheck(void);
uint8_t ReadyToSend(void);
void ModbusSendFrame(const uint8_t address, const uint8_t functionCode, const uint16_t start, const uint16_t no);
void ModbusSendFrameReadTime(const uint8_t address);
void ModbusSendFrameDeviceIdentofocation(const uint8_t address);
void ModbusSendFrameDeviceIdentofocation3(const uint8_t address, uint8_t deviceID, uint8_t objectID);
void ModbusSendFrameEvent(const uint8_t address, const uint8_t fileNo, const uint16_t recordNumber);
void ModbusSendFrameFromUsb(uint8_t* sendBuf, uint32_t length);
uint8_t ModbusCRCCheck(void);
uint8_t ModbusGetUint8_U(const uint16_t address);
uint8_t ModbusGetUint8_L(const uint16_t address);
uint16_t ModbusGetUint16(const uint16_t address);
int16_t ModbusGetInt16(const uint16_t address);
float ModbusGetFloat(const uint16_t address);
uint32_t ModbusGetUint32(const uint16_t address);
int32_t ModbusGetInt32(const uint16_t address);
uint8_t ModbusGetBit(const uint16_t address, const uint16_t bit);
void ModbusGetString(const uint16_t address, const uint16_t len, char *buf);
//void ModbusGetId1(char VendorName[DEFAULT_BUF_SIZE], char ModbusVersion[DEFAULT_BUF_SIZE]);
void ModbusGetId1(void);
void ModbusGetId2(char productName[MESSAGE_BUF_SIZE]);
//void ModbusGetId3(char serialNo[DEFAULT_BUF_SIZE], char productCode[DEFAULT_BUF_SIZE], char hardwarVersion[DEFAULT_BUF_SIZE], char softwareVersion[DEFAULT_BUF_SIZE]);
void ModbusGetId3(void);
uint8_t ModbusControl(const uint8_t address, const int offset, const int pos, const uint8_t onoffStatus, uint8_t bSBO);
void ModbusSendFrameFromUsb(uint8_t* sendBuf, uint32_t length);
void ModbusGetDateTime(S_DATE_TIME *dateTime);
void ModbusGetProductName(char *buf);
uint16_t StatusSend(void);
uint16_t StatusRecvErrorProcess(void);
void StatusRecv(void);
void ModbusSetTime(const uint8_t address, const S_DATE_TIME *dateTime);
void ModbusSetTimeAndWait(const uint8_t address, const S_DATE_TIME *dateTime);
bool ModbusSetTimeAndNoWait(const uint8_t address, const S_DATE_TIME *dateTime);
void ModbusAcbSystemEventGet(S_DATE_TIME *dateTime, uint16_t *mainCategory, uint16_t *middleCategory, uint16_t *smallCategory, uint16_t *Status, float *Value);

typedef enum e_index_value
{
	INDEX_0 = 0,
	INDEX_1 = 1,
	INDEX_2 = 2,
	INDEX_3 = 3,
	INDEX_4 = 4,
	INDEX_5 = 5,
	INDEX_6 = 6,
	INDEX_7 = 7,
	INDEX_8 = 8,
	INDEX_9 = 9,
	INDEX_10 = 10,
	INDEX_11 = 11,
	INDEX_12 = 12,
	INDEX_13 = 13,
	INDEX_14 = 14,
	INDEX_15 = 15,
	INDEX_16 = 16,
	INDEX_17 = 17,
	INDEX_18 = 18,
	INDEX_19 = 19,
	INDEX_20 = 20,
	INDEX_21 = 21,
	INDEX_22 = 22,
	INDEX_23 = 23,
	INDEX_28 = 28,
	INDEX_29 = 29,
	INDEX_30 = 30,
	INDEX_31 = 31,
	INDEX_32 = 32,
	INDEX_50 = 50,
	INDEX_80 = 80,
	INDEX_0x80 = 0x80,
	INDEX_400 = 400,
} E_index_value;

EXTERN uint8_t g_UartRx[1];

EXTERN uint8_t g_modbusRxIndex;
EXTERN uint8_t g_modbusRxBuff[MODBUS_BUFF_SIZE];
EXTERN uint8_t g_modbusRxDone;
EXTERN uint8_t g_modbusRxError;

EXTERN uint8_t g_modbusSlaveRxIndex;
EXTERN uint8_t g_modbusSlaveRxBuff[MODBUS_SLAVE_BUFF_SIZE];
EXTERN uint8_t g_modbusSlaveRxDone;
EXTERN uint8_t g_modbusSlaveRxError;

EXTERN uint16_t g_wModbusWaitLen;
EXTERN uint8_t g_modbusAddress;
EXTERN uint8_t g_functionCode;
EXTERN uint8_t g_subFunction;

EXTERN uint16_t g_wModbusSlaveWaitLen;
EXTERN uint8_t g_modbusSlaveAddress;
EXTERN uint8_t g_SlavefunctionCode;
EXTERN uint8_t g_SlavesubFunction;

EXTERN uint16_t g_wModbusControlWaitLen;
EXTERN uint8_t g_modbusControlAddress;
EXTERN uint16_t g_wModbusControlWaitLen;
EXTERN uint8_t g_ControlfunctionCode;

EXTERN uint16_t g_startAddr;
EXTERN uint16_t g_waitReceiveLen;
EXTERN uint8_t g_AddressRecv;
EXTERN uint8_t sendFlag;
EXTERN E_OWNER g_sendOwner;
//EXTERN uint8_t g_orderOwner;
EXTERN uint16_t gSystemEventIndex[DEVICE_MAX];
EXTERN uint16_t gFaultEventIndex[DEVICE_MAX];
EXTERN uint16_t gOldSystemEventIndex[DEVICE_MAX];
EXTERN uint16_t gOldFaultEventIndex[DEVICE_MAX];
EXTERN uint16_t gSystemEventTotalCount[DEVICE_MAX];
EXTERN uint16_t gFaultEventTotalCount[DEVICE_MAX];
EXTERN uint16_t gFaultEventReaded[DEVICE_MAX];
EXTERN S_PRODUCT_INFO gProductInfo[DEVICE_MAX];
EXTERN int nSendStep;
EXTERN int gCommStatus[DEVICE_MAX];
EXTERN int gCommOldStatus[DEVICE_MAX];
EXTERN int gCommErrorCount[DEVICE_MAX];

EXTERN int g_nStatusNoUpdate;

EXTERN int g_bRecvVariable;
EXTERN int g_bMasterRecvVariable;
EXTERN int g_bSlaveRecvVariable;
EXTERN int g_bRecvAllDone;

EXTERN uint8_t MasterTxBuffer[2][MASTER_TX_BUFF_MAX];
EXTERN uint8_t SlaveTxBuffer[SLAVE_TX_BUFF_MAX];
EXTERN uint8_t ControlTxBuffer[INDEX_10];
EXTERN uint16_t MasterSendLength[2];
EXTERN uint16_t SlaveSendLength;
EXTERN uint16_t ControlSendLength;
EXTERN uint32_t masterSendTick;
EXTERN uint32_t slaveSendTick;

EXTERN bool		gDebug;
EXTERN bool		gbSlaveSend;
EXTERN uint8_t	gbSBO;
EXTERN bool		gbSetTime;

EXTERN uint32_t masterSendTick;
EXTERN uint32_t slaveSendTick;

#define VENDOR_NAME_MAX		32+1
#define MODBUS_VERSION_MAX	32+1
#define SERIALNO_MAX		22+1
#define	PRODUCT_CODE_MAX 	12+1
#define	HWVERSION_MAX		10+1
#define	SWVERSION_MAX		10+1

EXTERN char VendorName[DEFAULT_BUF_SIZE];
EXTERN char ModbusVersion[DEFAULT_BUF_SIZE];
EXTERN char serialNo[DEFAULT_BUF_SIZE];
EXTERN char productCode[DEFAULT_BUF_SIZE];
EXTERN char hardwarVersion[DEFAULT_BUF_SIZE];
EXTERN char softwareVersion[DEFAULT_BUF_SIZE];
EXTERN uint16_t gGroupOffset[DEVICE_MAX];

EXTERN int gDeviceTypeAll[DEVICE_MAX];
EXTERN int gbSettingTime;

EXTERN char gProductName[DEVICE_MAX][MESSAGE_BUF_SIZE];
EXTERN uint16_t mLinkMode[DEVICE_MAX];
EXTERN uint16_t mLinkSBO[DEVICE_MAX];

#define UART1_DMA_RX_BUFF_SIZE 20
#define UART2_DMA_RX_BUFF_SIZE 512
//#define UART2_DMA_RX_BUFF_SIZE 120
EXTERN uint8_t uart1_dma_rx_buff[UART1_DMA_RX_BUFF_SIZE];
EXTERN uint8_t uart2_dma_rx_buff[UART2_DMA_RX_BUFF_SIZE];
EXTERN uint32_t slave_last_recv;
EXTERN uint32_t uart1LastNDTR;
EXTERN uint32_t uart2LastNDTR;

EXTERN uint8_t nTrio[DEVICE_MAX];

#define	PER90		90
#define	PER105		105

#define	TIME_SYNC_MASK	0x0008
#define	ACB_TYPE_MASK	0x000f

#define	OPEN_CLOSE_TRIP				3
#define	TEN							10
#define	FLOAT_TEN					10.0
#define	HUNDRED						100
#define	THOUSAND					1000
#define	TENTHOUSAND					10000
#define	PER_MAX						100.0
#define	MCCB_TIME					1000.0
#define	YEAR_MIN					2024
#define	YEAR_MAX					2099
#define	YEAR_BASE					2000
#define	MONTH_MAX					12
#define	DAY_MAX						31
#define	HOUR_MAX					24
#define	MIN_MAX						60
#define	DIO_STATUS_MAX				2
#define	DOSETTING_MAX				3
#define	MCCB_RATIO_0_5				0.5
#define	MCCB_RATIO_1_6				1.6
#define MCCB_COMPARE_0_63			0.63

#define I_REGISTER_61				61
#define I_REGISTER_64				64
#define I_REGISTER_65				65
#define I_REGISTER_67				67
#define I_REGISTER_71				71
#define I_REGISTER_72				72
#define I_REGISTER_87				87
#define I_REGISTER_90				90
#define I_REGISTER_94				94
#define I_REGISTER_98				98
#define I_REGISTER_99				99
#define I_REGISTER_102				102
#define I_REGISTER_103				103
#define I_REGISTER_104				104
#define I_REGISTER_116				116
#define I_REGISTER_119				119
#define I_REGISTER_120				120

#define I_REGISTER_183				183
#define I_REGISTER_184				184
#define I_REGISTER_185				185

#define I_REGISTER_194				194
#define I_REGISTER_195				195
#define I_REGISTER_196				196

#define I_REGISTER_201				201
#define I_REGISTER_202				202
#define I_REGISTER_203				203
#define I_REGISTER_204				204
#define I_REGISTER_205				205
#define I_REGISTER_206				206
#define I_REGISTER_207				207
#define I_REGISTER_208				208
#define I_REGISTER_209				209
#define I_REGISTER_210				210

#define I_REGISTER_215				215
#define I_REGISTER_216				216
#define I_REGISTER_217				217
#define I_REGISTER_219				219
#define I_REGISTER_221				221
#define I_REGISTER_231				231
#define I_REGISTER_237				237
#define I_REGISTER_249				249
#define I_REGISTER_251				251
#define I_REGISTER_257				257
#define I_REGISTER_265				265
#define I_REGISTER_267				267
#define I_REGISTER_269				269
#define I_REGISTER_271				271
#define I_REGISTER_273				273
#define I_REGISTER_275				275
#define I_REGISTER_277				277
#define I_REGISTER_279				279
#define I_REGISTER_281				281
#define I_REGISTER_283				283
#define I_REGISTER_321				321
#define I_REGISTER_327				327
#define I_REGISTER_333				333
#define I_REGISTER_339				339
#define I_REGISTER_345				345
#define I_REGISTER_351				351
#define I_REGISTER_357				357
#define I_REGISTER_361				361

#define I_REGISTER_1001				1001
#define I_REGISTER_1003				1003
#define I_REGISTER_1004				1004		// MAX Event
#define I_REGISTER_1101				1101
#define I_REGISTER_1121				1121

#define I_REGISTER_1201				1201
#define I_REGISTER_1203				1203
#define I_REGISTER_1205				1205
#define I_REGISTER_1207				1207
#define I_REGISTER_1209				1209
#define I_REGISTER_1211				1211
#define I_REGISTER_1213				1213

#define I_REGISTER_1301				1301
#define I_REGISTER_1320				1320
#define I_REGISTER_1335				1335
#define I_REGISTER_1383				1383
#define I_REGISTER_1394				1394
#define I_REGISTER_1400				1400
#define I_REGISTER_1405				1405

#define I_REGISTER_1759				1759
#define I_REGISTER_1761				1761
#define I_REGISTER_1763				1763
#define I_REGISTER_1765				1765
#define I_REGISTER_1767				1767
#define I_REGISTER_1769				1769
#define I_REGISTER_1771				1771

#define H_REGISTER_1				1

#define	H_REGISTER_18				18
#define	H_REGISTER_19				19
#define	H_REGISTER_20				20
#define	H_REGISTER_21				21
#define	H_REGISTER_24				24
#define	H_REGISTER_25				25
#define	H_REGISTER_26				26
#define	H_REGISTER_28				28
#define	H_REGISTER_29				29
#define	H_REGISTER_30				30
#define	H_REGISTER_39				39
#define	H_REGISTER_41				41
#define	H_REGISTER_42				42
#define	H_REGISTER_46				46
#define	H_REGISTER_50				50
#define	H_REGISTER_54				54
#define	H_REGISTER_64				64			// lr
#define	H_REGISTER_104				104			// PTA
#define	H_REGISTER_119				119			// ln(%)
#define	H_REGISTER_124				124			// PTA

#define	H_REGISTER_467				467			// Max Event
#define	H_REGISTER_468				468			// Max Fault
#define	H_REGISTER_507				507			// Product Name

#define	H_REGISTER_1001				1001
#define	H_REGISTER_2002				2002
#define	H_REGISTER_2021				2021
#define	H_REGISTER_2024				2024
#define	H_REGISTER_2031				2031  // DI 접점설정 ~2036
#define	H_REGISTER_2037				2037

#define	H_REGISTER_2501				2501

//MainMenu.c
#define	ACB_OVERVIEW_STEP0_READ_LEN		33		// 18 ~ 50

//AcbMccbControl.c
#define ACB_CONTROL_READ_ADDR		183
#define ACB_CONTROL_READ_LEN		26
#define MCCB_CONTROL_READ_ADDR		204
#define MCCB_CONTROL_READ_LEN		5
#define CB_STATUS_INPUT_OPEN		0
#define CB_STATUS_INPUT_CLOSE		1
#define CB_STATUS_INPUT_FAULT		2
#define CB_STATUS_OUTPUT_OPEN		3
#define CB_STATUS_OUTPUT_CLOSE		2
#define CB_STATUS_OUTPUT_DEFAULT	0
#define CB_STATUS_DO_MAX			3
#define	CB_STATUS_NOT_TRIO_ADDR		12
#define	CB_STATUS_TRIO_ADDR			40
#define	CB_STATUS_MCCB_ADDR			12
#define	CB_STATUS_MCCB_TRIP_ADDR	16
#define	CB_REMOTE_MASK				0x8000
#define	CB_STATUS_SHIFT				8
#define	CB_STATUS_MASK				0x003
#define	CB_TRIO_SHIFT				12
#define	CB_TRIO_MASK				0x007
#define	CB_ACB_TRIO_SHIFT			8
#define	CB_ACB_TRIO_MASK			0x003
#define	CB_ACB_TRIO_REMOTE_MASK		0x0400
#define	CB_DO_ERROR_MASK			0x0300

#define TRIO_IO_READ_ADDR			183
#define TRIO_IO_READ_LEN			4


//AcbMccbEvent.c
#define	SOURCE_MASK					0x000f
#define	PHASE_MASK					0x0f00

//AcbMccbHwSet.c
#define ACB_HWSET_READ_ADDR			19
#define ACB_HWSET_READ_LEN			28
#define MCCB_HWSET_READ_ADDR		19
#define MCCB_HWSET_READ_LEN			11

//AcbMccbInfo.c
#define ACB_INFO_READ_ADDR			1759
#define ACB_INFO_READ_LEN			11
#define MCCB_INFO_READ_ADDR			1201
#define MCCB_INFO_READ_LEN			11

//AcbMccbMeasuremnet.c
#define	ACB_VIP_READ_ADDR			54
#define	ACB_VIP_READ_LEN			1
#define	MCCB_VIP_READ_ADDR			30
#define	MCCB_VIP_READ_LEN			1
#define	ACBMCCB_ENERGY_READ_ADDR	215
#define	ACBMCCB_ENERGY_READ_LEN		70
#define	ACBMCCB_PQ_READ_ADDR		303
#define	ACBMCCB_PQ_READ_LEN			64
#define	ACB_MAXDEMAND_READ_ADDR		1771
#define	ACB_MAXDEMAND_READ_LEN		42
#define	MCCB_MAXDEMAND_READ_ADDR	1213
#define	MCCB_MAXDEMAND_READ_LEN		42
#define MAX_ANGLE					360
#define	VI_COL_MAX					2
#define	VI_ROW_MAX					4
#define	PE_COL_MAX					2
#define	PE_ROW_MAX					5
#define	PQ1_MAX						2
#define	PQ2_COL_MAX					3
#define	PQ2_ROW_MAX					3
#define	ANGLE_COL_MAX				2
#define	ANGLE_ROW_MAX				4

//AcbMccbRelaySet.c
#define	ACB_RELAYSET_STEP0_READ_ADDR		50
#define	ACB_RELAYSET_STEP0_READ_LEN			1
#define	ACB_RELAYSET_STEP1_READ_ADDR		61
#define	ACB_RELAYSET_STEP1_READ_LEN			60
#define	MCCB_RELAYSET_READ_ADDR				61
#define	MCCB_RELAYSET_READ_LEN				44
#define	ACB_RELAYSET_GROUPOFFSET			200

//MLinkControl.c
#define	MLINK_CONTROL_STEP0_READ_ADDR		2021
#define	MLINK_CONTROL_STEP0_READ_LEN		7
#define	MLINK_CONTROL_STEP1_READ_ADDR		102
#define	MLINK_CONTROL_STEP1_READ_LEN		1
#define	MLINK_MODE1_SBO_START_ADDR			5000
#define	MLINK_MODE1_NO_SBO_START_ADDR		5050
#define	MLINK_MODE23_SBO_START_ADDR			5020
#define	MLINK_MODE23_NO_SBO_START_ADDR		5060

//MLinkHwSet.c
#define	MLINK_HWSET_STEP0_READ_ADDR		2002
#define	MLINK_HWSET_STEP0_READ_LEN		1
#define	MLINK_HWSET_STEP1_READ_ADDR		1001
#define	MLINK_HWSET_STEP1_READ_LEN		3
//#define	MLINK_HWSET_STEP2_READ_ADDR		1001
//#define	MLINK_HWSET_STEP2_READ_LEN		1
#define	MLINK_REMOTE_MASK				0x000f

//MLinkIOSet.c
	typedef enum e_di_setup
{
	NotUsed 	= 0x00,
	ContactAx	= 0x01,
	ContactAl	= 0x02,
	Contact		= 0x03,
	ContactAx2	= 0x04,
	ContactAl2	= 0x05,
	PulseWh		= 0x11,
	PulseVarh	= 0x12,
	PulseVAh	= 0x13,
	Pulse		= 0x14,
	ContactLI	= 0x21,
} E_DI_SETUP;
#define	MLINK_IOSET_STEP0_READ_ADDR		1001
#define	MLINK_IOSET_STEP0_READ_LEN		1
#define	MLINK_IOSET_STEP1_READ_ADDR		2031
#define	MLINK_IOSET_STEP1_READ_LEN		6
#define	MLINK_IOSET_STEP2_READ_ADDR		2021
#define	MLINK_IOSET_STEP2_READ_LEN		7

//MlinkInfo.c
#define	MARGIN_20						20
#define	MARGIN_24						24

#define	MLINK_DEVICE_INFO_READ_ADDR		1301
#define	MLINK_DEVICE_INFO_READ_LEN		109

#define	MLINK_INFO_STEP0_READ_ADDR		2031
#define	MLINK_INFO_STEP0_READ_LEN		18
#define	MLINK_INFO_STEP1_READ_ADDR		1101
#define	MLINK_INFO_STEP1_READ_LEN		8
#define	MLINK_INFO_STEP2_READ_ADDR		1121
#define	MLINK_INFO_STEP2_READ_LEN		12

//setup.c
#define	SETUP_READ_ADDR					2501
#define	SETUP_READ_LEN					16

//MainMenu.c
#define	MLINK_STATUS_STEP1_ADDR			1001
#define	MLINK_STATUS_STEP2_ADDR			1335
#define	MLINK_STATUS_STEP3_ADDR			2501
#define	MLINK_STATUS_STEP4_ADDR			201
#define	MLINK_STATUS_STEP5_ADDR			102
#define	ACBMCCB_STATUS_STEP1_ADDR		206
#define	ACB_STATUS_STEP2_LEN			50
#define	MCCB_STATUS_STEP2_LEN			21
#define	ACBMCCB_STATUS_STEP3_ADDR		194

#define MLINK_MODE_MASK					0x0f
#define ROLLOVER_COUNT_MASK				0x00ff
#define CB_USE_UNUSE_MASK				0x0400
#define POLL_MASK						0xff

#define	ACBMCCB_OVERVIEW_STEP0_ADDR		19
#define	ACBMCCB_OVERVIEW_STEP1_ADDR		215
#define	MLINK_OVERVIEW_STEP0_ADDR		219
#define	MLINK_OVERVIEW_STEP1_ADDR		2031

//#define	TIMER_DIFF						500
#define	TIMER_DIFF						1000
#define	TIMER_DIFF_10SEC				10000
#define TX_WAIT_TIME					30

//main.c
#define	UART_TIMEOUT					0xFFFF
#define	EMWIN_STACK_SIZE				4096
#define	RECV_TASK_STACK_SIZE			1024
#define	DEBUG_TASK_STACK_SIZE			128
#define	EMWIN_PRORITY					50
#define	RECV_PRORITY					60
#define	DEBUG_PRORITY					100
#define	LED_TIMER						10
#define	RECV_BUF_SIZE					256
#define	USER_PROG_VECTOR				0x0800c000
#define	CLOCK_PLLN						168
#define	I2C2_CLOCKSPEED					100000
#define	DEFAULT_COMM_SPEED				9600
#define	DEBUG_COMM_SPEED				115200
#define	ASCII_BASE						0x30
#define	PCF2129_TIMEOUT					200
#define	BCD_MASK						0x0F
#define	RTCBATTERYSTATUS_MASK			0x04
#define	TIMING_ADDRESSSETUPTIME_CONST	4
#define	TIMING_ADDRESSHOLDTIME			15
#define	TIMING_DATASETUPTIME			40
#define	TIMING_CLKDIVISION				16
#define	TIMING_DATALATENCY				17

extern UART_HandleTypeDef huart2;


#endif
