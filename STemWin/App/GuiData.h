#ifndef __GUIDATA__
#define __GUIDATA__

#include <stdlib.h>
#include "DIALOG.h"
#include "GUI.h"
#include "stm32f4xx_hal.h"
#include "modbus.h"


extern GUI_CONST_STORAGE GUI_FONT GUI_FontLSfont_24x24;
extern GUI_CONST_STORAGE GUI_FONT GUI_FontLSfont16_;
extern GUI_CONST_STORAGE GUI_FONT GUI_FontLSFont20b_;
extern GUI_CONST_STORAGE GUI_FONT GUI_FontLSFont20n_;
extern GUI_CONST_STORAGE GUI_FONT GUI_FontLSfont24_;
extern GUI_CONST_STORAGE GUI_FONT GUI_Fontcyrillic_24x24;
extern GUI_CONST_STORAGE GUI_FONT GUI_Fontcyrillic20_20x20;
extern GUI_CONST_STORAGE GUI_FONT GUI_Fontcyrillic16_16x16;

extern uint32_t gSavingModeCounter;
extern uint32_t gScreenSwitchingCounter;
extern uint32_t gReturnToScreen;
extern uint16_t gbInMainMenu;
extern int statusSendStep;


#ifndef GUI_CONST_STORAGE
  #define GUI_CONST_STORAGE const
#endif

#define	TIMESYNC_HOUR					0
#define	TIMESYNC_MIN					20

#define	TIMESYNC_DELAY					10

#define	KEY_MAX							5

#define	ON								1
#define OFF 							0

#define	TRUE							1
#define FALSE 							0

#define DEVICE_MAX 						8
#define DESCRIPTION_MAX 				16

#define	SETUP_LANGUAGE_MAX				3
#define	SETUP_LANGUAGE_INPUT_MAX		2
#define	SETUP_TYPE_MAX					3
#define	SETUP_SPEED_MAX					4
#define	SETUP_BRIGHT_MIN				0
#define	SETUP_BRIGHT_MAX				100
#define	SETUP_SAVING_MIN				10
#define	SETUP_SAVING_MAX				120
#define	SETUP_SWITCHING_MIN				10
#define	SETUP_SWITCHING_MAX				60
#define	SETUP_RETURN_TO_MIN				10
#define	SETUP_RETURN_TO_MAX				60
#define SETUP_DEVICE_ADDR_MIN			1
#define SETUP_DEVICE_ADDR_MAX			247
#define	SETUP_GATEWAY_USE_MAX			2

//#define ACB_SYSTEM_EVENT_MAX			255
//#define ACB_FAULT_EVENT_MAX				127
//#define MCCB_SYSTEM_EVENT_MAX			50
//#define MCCB_FAULT_EVENT_MAX			50
//#define MLINK_SYSTEM_EVENT_MAX			100

#define PHASE_MAX						4
#define AF250							250
#define P3								3
#define P4								4

#define MAX_EP_EQ						1000000000

#define MESSAGE_AUTO_CLOSE_TIME			5
#define HARDWAREVERSION_SIZE			10
#define	STATUS_IMAGE_COUNT				2
#define	STATUS_LINE_COUNT				3
#define	LOCAL_REMOTE_COUNT				2
#define	PHASE_COUNT						4
#define	ACBMCCB_RELAYSET_COL_CNT		3
#define	ACBMCCB_MESURE_VI_LNLL_CNT		2
#define	ACBMCCB_MESURE_VI_A_CNT			4
#define	ACBMCCB_MESURE_ENERGY_CNT		5
#define	INFO_CNT						2
#define	BAT_STATUS_CNT					2
#define	STATUS_COUNT					2
#define MLINK_HWSET_COUNT				3
#define	MLINK_IOSTATUS_APP_COL_CNT		2
#define	MLINK_IOSTATUS_APP_ROW_CNT		2
#define	MLINK_OPERINFO_COL_CNT			3
#define	MLINK_OPERINFO_ROW_CNT			4
#define	SETUP_TRIANGLE_CNT				3
#define	DATE_INPUT_CNT					6
#define	XY_POS_CNT				2
#define	ACB_STATUS_POS_CNT				2
#define	MCCB_STATUS_POS_CNT				3
#define CONNECT_IMAGE_SIZE				3726
#define UPDOWN_IMAGE_SIZE				2638
#define	RATING_PLUG_TAB_SIZE			7
#define	PQS_UNIT2_COUNT					4
#define	PQS_UNIT_COUNT					3
#define	DEMAND_COUNT					6
#define	MLINK_MODE_DESC_KIND			5
#define	MLINK_MODE_DESC_ROW_CNT			4
#define	PASSWORD_INPUT_BUF_SIZE			2
#define	PULSE_UNIT_COUNT				5

#define SETUP_COUNT						11
typedef enum e_setting
{
	SETUP_SPEED = 0,
	SETUP_DEVICE_COUNT = 1,
	SETUP_BRIGHTNESS = 2,
	SETUP_SAVING_MODE = 3,
	SETUP_SCREEN_SWITCHING = 4,
	SETUP_RETURN_TO_SCREEN = 5,
	SETUP_LANGUAGE = 6,
	SETUP_PASSWORD = 7,
	SETUP_GATEWAY_USE = 8,
	SETUP_TERM1_USE = 9,
	SETUP_TERM2_USE = 10,
	SETUP_MAX = 11
} E_SETTING;

extern uint16_t SettingValue[SETUP_COUNT];
extern uint16_t DefaultSettingValue[SETUP_COUNT];

typedef enum e_fontsize
{
	FONT16 = 0,
	FONT16B = 1,
	FONT20 = 2,
	FONT20B = 3,
	FONT24 = 4,
	FONT24B = 5,
	FONT32 = 6,
	FONT32B = 7
} E_FONT_SIZE;


typedef enum e_devicetype
{
	DEVICE_ACB = 0,
	DEVICE_MCCB = 1,
	DEVICE_MLINK = 2,
	DEVICE_NO = 3
} E_DEVICE_TYPE;

typedef enum e_language
{
	ENGLISH = 0,
	CHINESE = 1,
	RUSSIAN = 2,
} E_LANGUAGE;

typedef enum e_acb_type
{
	MARINE = 1,
	GENENAL = 2,
	HYNIX = 3,
	SK = 4
} E_ACB_TYPE;


typedef struct s_Connect_Setting {
	E_DEVICE_TYPE DeviceType;
	uint16_t Address;
} S_CONNECT_SETTING;


typedef enum e_key
{
	KEY_SETUP = 0,
	KEY_UP = 1,
	KEY_DOWN = 2,
	KEY_ENTER = 3,
	KEY_CANCEL = 4,
	DATA_RECV = 5,
	TIME_OUT = 6,
	KEY_COMM_ERROR = 7,
	COMM_STAT_ERROR = 8,
	SECOND_TIMER = 9,
} E_KEY;

typedef enum e_status_send
{
	STATUS_SEND_ING = 0,
	STATUS_SEND_END = 1
} E_STATUS_SEND;

typedef enum e_cb_status
{
	CB_OPEN = 0,
	CB_CLOSE = 1,
	CB_TRIP = 2,
	CB_INTER = 3,
	CB_NOTUSED = 4,
	CB_MAX = 5
} E_CB_STATUS;

typedef enum e_io_status
{
	ZSI_IN = 0,
	ZSI_OUT = 1,
	ERMS = 2,
	DO1 = 3,
	DO2 = 4,
	DO3 = 5,
	IO_STATUS_COUNT = 6
} E_IO_STATUS;

//typedef enum e_io_status
//{
//	ZSI_IN = 0,
//	ZSI_OUT = 1,
//	CB_STATUS = 2,
//	TRIP = 3,
//	ERMS = 4,
//	DO1 = 5,
//	DO2 = 6,
//	DO3 = 7,
//	IO_STATUS_COUNT = 8
//} E_IO_STATUS;

typedef enum e_control_status
{
	CONTROL_OK = 0,
	CONTROL_FAIL = 1,
} E_CONTROL_STATUS;

typedef enum e_setup_return
{
	SETUP_NOCHANGED = 0,
	SETUP_CHANGED = 1,
} E_SETUP_RETURN;

extern char const* _acNotUsed[SETUP_LANGUAGE_MAX];

extern char const* _acalarm_text[SETUP_LANGUAGE_MAX];
extern uint16_t SetupSpeed[SETUP_SPEED_MAX];
extern char const* _aclocal_remote[SETUP_LANGUAGE_MAX][LOCAL_REMOTE_COUNT];
extern char const* _accb_status[SETUP_LANGUAGE_MAX][CB_MAX];
extern char const* _accb_control_status[SETUP_LANGUAGE_MAX][CB_MAX];
extern S_DATE_TIME	gDateTime;
extern uint16_t 	gDeviceCount;
extern uint16_t 	gDeviceIndex;
extern uint16_t		gStatusSendEnd;
extern char gDescription[DEVICE_MAX][DESCRIPTION_MAX+1];

extern S_CONNECT_SETTING ConnectSetting[DEVICE_MAX];

#define COLOR_MAIN_BG 			0x1c1b1a
#define COLOR_LINE 				0x494440
#define COLOR_LABEL 			0xc8c8c8
#define COLOR_VALUE 			GUI_WHITE
#define COLOR_MENU_SELECTED		0xd07b18
#define COLOR_MENU_NORMAL		0x2f2c2a
#define COLOR_OFF 				0x494949
#define COLOR_ON 				0x0fce00
#define COLOR_TRIP 				0x0000ff
#define COLOR_CONTENTS			0x2a2826
#define COLOR_DISABLE			0x2b2a2a
#define COLOR_UNIT				0xa5a5a5
#define COLOR_WARNING			0x00deff
#define COLOR_MESSAGE 			0x494949
#define COLOR_DO_DISBLE 		0x504f4f

#define	PAGE_X					465
#define	PAGE_Y					121
#define PAGE_RADIUS 			5
#define PAGE_HEIGHT				16

#define STATUS_LINE_COLOR		0x605a54
#define	STATUS_ON				1
#define	STATUS_OFF				0

#define	MAX_WIDTH				480
#define MAX_HEIGHT				320
#define	STATUS_PENSIZE_LINE		1
#define	PENSIZE_LINE			2
#define	X0_MAIN					0
#define Y0_MAIN					34
#define	Y0_FULL					0
#define	X1_MAIN					480-1
#define Y1_MAIN					320-1
#define HEIGHT_CONTENTS 		264
#define WIDTH_CONTENTS			460
#define HEIGHT_LABEL 			44
#define WIDTH_LABEL 			150
#define HEIGHT_VALUE			44
#define WIDTH_VALUE				100
#define STARTX_CONTENTS 		10
#define STARTY_CONTENTS 		45
#define STARTX_LABEL 			41
#define STARTY_LABEL 			46
#define STARTX_VALUE 			340
#define STARTY_VALUE 			46
#define LINECOUNT_CONTENTS 		6

#define SETTING_STARTY_LABEL	10
#define SETTING_STARTX_LABEL	STARTX_VALUE-100
#define SEETING_HEIGHT_LABEL	99
#define SETTING_SUB_HEIGHT		50

#define HW_SET					0
#define RELAY_SET				1
#define MEASUREMENT				2
#define	EVENT					3
#define INFO					4
#define CONTROL					5

#define INFO_MENU				0
#define EVENT_MENU				1
#define SETTING_MENU			2
#define CONTROL_MENU			3
#define MENU_COUNT				4
#define MENU_ITEM_COUNT			3

// Status
#define STATUS_LOCAL_X0			47
#define STATUS_DATE_X			164
#define STATUS_DATE_Y			11
#define STATUS_MODE_X			102
#define STATUS_DESC_X			331
#define STATUS_DESC_Y			7

#define STATUS_Y0				75
#define STATUS_Y1				((STATUS_Y0 + 226) - 1)
#define STATUS_X1				57
#define STATUS_X2				161
#define STATUS_X3				245

// ACB/MCCB Overview
#define AcbMccbMenuCount 		6
#define	ACBMCCB_PER_Y0			54
#define	ACBMCCB_PER_Y1			((ACBMCCB_PER_Y0 + 13) - 1)

#define ACBMCCB_LABEL_HEIGHT	21
#define ACBMCCB_LABEL_WIDTH		20
//#define ACBMCCB_VALUE_WIDTH		90
#define ACBMCCB_VALUE_WIDTH		110
#define ACBMCCB_LABEL_DISTANCE	58
#define ACBMCCB_LABEL_X0		28
#define ACBMCCB_LABEL_X1		((ACBMCCB_LABEL_X0 + ACBMCCB_LABEL_WIDTH) - 1)
#define ACBMCCB_LABEL_Y0		90
#define ACBMCCB_LABEL_Y1		((ACBMCCB_LABEL_Y0 + ACBMCCB_LABEL_HEIGHT) - 1)
//#define ACBMCCB_VALUE_X0		345
#define ACBMCCB_VALUE_X0		320
#define ACBMCCB_VALUE_X1		(((ACBMCCB_VALUE_X0 + ACBMCCB_VALUE_WIDTH) - 20) - 1)
#define ACBMCCB_UNIT_X0			(ACBMCCB_VALUE_X1 + 5)
#define ACBMCCB_UNIT_X1			((ACBMCCB_UNIT_X0 + 40) - 1)

#define ACBMCCB_BAR_HEIGHT		35
#define ACBMCCB_BAR_WIDTH		18
#define ACBMCCB_BAR_X_DISTANCE	20
#define ACBMCCB_BAR_Y_DISTANCE	57
#define ACBMCCB_BAR_X0			61
#define ACBMCCB_BAR_X1			((ACBMCCB_BAR_X0 + ACBMCCB_BAR_WIDTH) - 1)
#define ACBMCCB_BAR_Y0			84
#define ACBMCCB_BAR_Y1			((ACBMCCB_BAR_Y0 + ACBMCCB_BAR_HEIGHT) - 1)
//#define ACBMCCB_BAR_X100		261
//#define ACBMCCB_BAR_X120		305
#define ACBMCCB_BAR_X50			161
#define ACBMCCB_BAR_X100		264
#define ACBMCCB_BAR_X120		307
#define	ACBMCCB_50PER_X0		(ACBMCCB_BAR_X50 - 10)
#define	ACBMCCB_50PER_X1		((ACBMCCB_50PER_X0 + 20) - 1)
#define	ACBMCCB_100PER_X0		(ACBMCCB_BAR_X100 - 10)
#define	ACBMCCB_100PER_X1		((ACBMCCB_100PER_X0 + 20) - 1)
#define	ACBMCCB_120PER_X0		(ACBMCCB_BAR_X120 - 10)
#define	ACBMCCB_120PER_X1		((ACBMCCB_120PER_X0 + 30) - 1)

// ACB/MCCB Relay Set
#define ACBMCCB_RELAYSET_LABEL1_X0		41
#define ACBMCCB_RELAYSET_LABEL1_WIDTH	75
#define ACBMCCB_RELAYSET_LABEL2_X0		150
#define ACBMCCB_RELAYSET_LABEL2_WIDTH	40
#define ACBMCCB_RELAYSET_LABEL3_X0		320
#define ACBMCCB_RELAYSET_LABEL3_WIDTH	40
#define ACBMCCB_MONPQ_LABEL3_WIDTH		50

#define ACBMCCB_RELAYSET_VALUE_WIDTH	110	//80
#define ACBMCCB_RELAYSET_VALUE1_X0		200
#define ACBMCCB_RELAYSET_AMPARE_X0		ACBMCCB_RELAYSET_VALUE1_X0 - 30
#define ACBMCCB_RELAYSET_VALUE2_X0		350

#define MLINK_IOSET_VALUE_X0			((ACBMCCB_RELAYSET_VALUE2_X0 - ACBMCCB_RELAYSET_VALUE_WIDTH) + 50)

#define	ACBMCCB_RELAYSET_GRID_X0		130
#define	ACBMCCB_RELAYSET_GRID_X1		((130+340)-1)
#define	ACBMCCB_RELAYSET_GRID_X			300
#define	ACBMCCB_RELAYSET_GRID_Y0		STARTY_CONTENTS
#define	ACBMCCB_RELAYSET_GRID_Y1		(STARTY_CONTENTS + (HEIGHT_VALUE * 5))


// ACB/MCCB Measurement Menu
#define ACBMCCB_MEASUR_MENU_COUNT		4
#define ACBMCCB_MEASUR_MENU_WIDTH		120
#define ACBMCCB_MEASUR_MENU_HEIGHT		66
#define ACBMCCB_MEASUR_TEXT_x0			30
#define ACBMCCB_MEASUR_TEXT_x1			105


// Infomation
#define INFO_MENU_WIDTH					460
#define INFO_MENU_HEIGHT				88
#define INFO_MENU_X0					50
#define INFO_MENU_COUNT					3
#define EVENT_MENU_COUNT				3
#define SETTING_MENU_COUNT				3
#define	INFO_VALUE_X0					((STARTX_CONTENTS + WIDTH_LABEL) + 50)
#define	INFO_VALUE_X1					((STARTX_VALUE + WIDTH_VALUE) - 1)

// Event
#define EVENT_CONTENTS_Y0				88
#define EVENT_CONTENTS_Y1				((88 + 222) - 1)
#define EVENT_X0						36
#define EVENT_TITLE_X1					((36 + 154) - 1)
#define EVENT_TITLE_Y0					57
#define EVENT_TITLE_Y1					((57 + 24) - 1)
#define EVENT_INDEX_X0					360
#define EVENT_INDEX_X1					(360 + 100)
#define EVENT_DATE_Y0					106
#define EVENT_DATE_HEIGHT				33
#define MLINK_EVENT_INDEX_X0			(EVENT_INDEX_X0 + 30)

// IO Status
#define	ACBMCCB_IOSTATUS_START_X		10
#define	ACBMCCB_IOSTATUS_START_Y		44
#define	ACBMCCB_IOSTATUS_BOX_WIDTH		227
#define	ACBMCCB_IOSTATUS_BOX_HEIGHT		62
#define	ACBMCCB_IOSTATUS_STATUS_X		145
#define	ACBMCCB_IOSTATUS_STATUS_Y		2
#define	ACBMCCB_IOSTATUS_STATUS_WIDTH	80
#define	ACBMCCB_IOSTATUS_STATUS_HEIGHT	58
#define	ACBMCCB_IOSTATUS_DESC_X			22
#define	ACBMCCB_IOSTATUS_X_DISTANCE		232
#define	ACBMCCB_IOSTATUS_Y_DISTANCE		68

	// Control
#define SELECTED_TEXT_COLOR				GUI_WHITE
#define UNSELECTED_TEXT_COLOR			COLOR_LABEL
#define ON_ON_BOX_COLOR					0x0fc901
#define ON_OFF_BOX_COLOR				0x2a4324
#define OFF_ON_BOX_COLOR				0x494949
#define OFF_OFF_BOX_COLOR				0x373533
#define ONOFF_ON_TEXT_COLOR				GUI_WHITE
#define ONOFF_OFF_TEXT_COLOR			0x636261
#define	ACBMCCB_IOSTATUS_ONOFF_X		12
#define	ACBMCCB_IOSTATUS_ONOFF_WIDTH	224

#define TRIP_OFF_COLOR					0x393967
#define TRIP_OFF_TEXT_COLOR				0x646467
#define TRIP_ON_COLOR					GUI_RED

#define CB_CLOSE_OFF_COLOR				0x2a4324
#define CB_CLOSE_OFF_TEXT_COLOR			0x5b6b58
#define CB_CLOSE_ON_COLOR				0x0fce00

#define CB_OPEN_OFF_COLOR				0x494949
#define CB_OPEN_OFF_TEXT_COLOR			0x6f6f6f
#define CB_OPEN_ON_COLOR				0x373533


// Control Confirm
#define POPUP_WINDOW_X0				25
#define POPUP_WINDOW_Y0				18
#define POPUP_WINDOW_X1				((430 + 25) - 1)
#define POPUP_WINDOW_Y1				((280 + 18) - 1)
#define CONTROL_MSG_X0					107
#define CONTROL_MSG_X1					((107 + 266) - 1)
#define CONTROL_MSG_Y0					50
#define CONTROL_MSG_Y1					((50 + 60) - 1)
#define	CONTROL_BUTTON_Y				218
#define	CONTROL_BUTTON_X				88
#define	CONTROL_BTTON_DISTANCE			20
#define	CONTROL_BUTTON_WIDTH			142
#define	CONTROL_BUTTON_HEIGHT			55
#define	CONTROL_PASSWORD_WIDTH			50
#define	CONTROL_PASSWORD_HEIGHT			60
#define CONTROL_NORMAL_BUTTON			0x4c4945
#define CONTROL_NORMAL_COLOR			0xa1a1a1
#define	PASSWORD_INTPUT_Y0				133
#define	PASSWORD_INTPUT_Y1				((PASSWORD_INTPUT_Y0 + CONTROL_PASSWORD_HEIGHT) - 1)
#define CONTROL_BUTTON_OK				0
#define CONTROL_BUTTON_CANCEL			1
#define CONTROL_BUTTON_NOSELECT			2
#define CONTROL_FAILED_BUTTON_X0		169
#define CONTROL_FAILED_BUTTON_Y0		219
#define SUCCEED_MSG_Y0					178
#define SUCCEED_MSG_Y1					(SUCCEED_MSG_Y0 + 66)

#define SUCCEED_IMG_X					200
#define SUCCEED_IMG_Y					78

#define	PASSWORD_INTPUT_DIGIT_WIDTH		50
#define	PASSWORD_INTPUT_DIGIT_X			140
#define	PASSWORD_INTPUT_DIGIT_UP_Y0		116
#define	PASSWORD_INTPUT_DIGIT_UP_Y1		((PASSWORD_INTPUT_DIGIT_UP_Y0 + 17) - 1)
#define	PASSWORD_INTPUT_DIGIT_DOWN_Y0	(PASSWORD_INTPUT_Y0 + CONTROL_PASSWORD_HEIGHT)
#define	PASSWORD_INTPUT_DIGIT_DOWN_Y1	((PASSWORD_INTPUT_DIGIT_DOWN_Y0 + 17) - 1)
#define CONTROL_PASSWORD_DIGIT			4

// M Link Overview
#define MLINK_OVERVER_UNIT_COUNT		2
#define	MLINK_OVERVIEW_DI				0
#define	MLINK_OVERVIEW_DO				1
#define MLINK_TYPE_MAX					3
#define MLINK_DI_MAX					6
#define MLINK_DO_MAX					4
#define	MLINK_OVERVIEW_BOX_X1			((STARTX_CONTENTS + 440) - 1)
#define	MLINK_OVERVIEW_Y_DISTANCE		72
#define	MLINK_OVERVIEW_DI_BOX_Y0		74
#define	MLINK_OVERVIEW_DI_BOX_Y1		((MLINK_OVERVIEW_DI_BOX_Y0 + 62) - 1)
#define	MLINK_OVERVIEW_VLINE_X			89
#define	MLINK_OVERVIEW_LABEL_X0			34
#define	MLINK_OVERVIEW_LABEL_X1			((MLINK_OVERVIEW_LABEL_X0 + 50) - 1)
#define MLINK_OVERVIEW_UNIT_Y0			218
#define MLINK_OVERVIEW_UNIT_Y1			((MLINK_OVERVIEW_UNIT_Y0 + 62) - 1)
#define MLINK_OVERVIEW_UNIT1_X0			408
#define MLINK_OVERVIEW_UNIT1_X1			((408 + 30) - 1)
#define MLINK_OVERVIEW_UNIT2_X0			420
#define MLINK_OVERVIEW_UNIT2_X1			((420 + 30) - 1)
#define MLINK_OVERVIEW_VALUE1_X0		300
#define MLINK_OVERVIEW_VALUE1_X1		((300 + 100) - 1)
#define MLINK_OVERVIEW_VALUE2_X0		230
#define MLINK_OVERVIEW_VALUE2_X1		((368 + 46) - 1)
#define	MLINK_OVERVIEW_STATUS_DISTANCE	60
#define	MLINK_OVERVIEW_STATUS_X0		MLINK_OVERVIEW_VLINE_X
#define	MLINK_OVERVIEW_STATUS_X1		((MLINK_OVERVIEW_STATUS_X0 + MLINK_OVERVIEW_STATUS_DISTANCE) - 1)

//MLink Info
#define MLINK_INFO_TITLE_WIDTH			280
#define MLINK_INFO_TITLE_HEIGHT			21
#define MLINK_INFO_LABEL_WIDTH			60
#define MLINK_INFO_VALUE_WIDTH			60
#define MLINK_INFO_LABEL1_X0			21
#define MLINK_INFO_LABEL2_X0			170
#define MLINK_INFO_LABEL3_X0			320
#define MLINK_INFO_VALUE1_X0			90
#define MLINK_INFO_VALUE2_X0			240
#define MLINK_INFO_VALUE3_X0			390
#define MLINK_INFO_TITLE_Y0				58
#define MLINK_INFO_LABEL_Y0				95
#define MLINK_INFO_LABEL_Y_DISTANCE		60

// MLink Control Set
#define MLINK_CONTROL_ITEM_COUNT		4
#define	MLINK_CONTROL_DESC_X0			45
#define	MLINK_CONTROL_DESC_WIDTH		85
#define	MLINK_CONTROL_WIDTH				80
#define	MLINK_CONTROL_ONOFF_HEIGHT		58
#define	MLINK_CONTROL_ON_X0				308
#define	MLINK_CONTROL_OFF_X0			386
#define	MLINK_CONTROL_ONOFF_Y0			48
#define	MLINK_CONTROL_ONOFF_DISTANCE	67
#define	MLINK_CONTROL_HEIGHT			66
#define MLINK_CONTROL_STARTY			44


// Setup
#define SETUP_LABEL_X0					30
#define SETUP_LABEL_X1					((SETUP_LABEL_X0 + 245) - 1)
#define SETUP_VALUE_X0					280
#define SETUP_VALUE_X1					((SETUP_VALUE_X0 + 180) - 1)
#define SETUP_SETTING_X0				210
#define SETUP_SETTING_X1				((SETUP_SETTING_X0 + 265) - 1)

#define SETUP_UPDOWN_X					240
#define SETUP_SETTING_NUM				10

#define SETUP_TIMESET_COUNT				6
#define SETUP_INPUT_Y0					96
#define SETUP_INPUT_Y1					((SETUP_INPUT_Y0 + 50) - 2)
#define SETUP_INPUT_X0					(240 - 80)
#define SETUP_INPUT_X1					((SETUP_INPUT_X0 + (80*2)) - 1)
#define SETUP_INPUT_UPDOWN_X0			((SETUP_INPUT_X0 + 80) - 25)
#define SETUP_INPUT_COUNT				1

#define SETUP_INPUT_STRING_X0			160
#define SETUP_INPUT_STRING_X1			((SETUP_INPUT_STRING_X0 + 160) - 1)
#define SETUP_INPUT_STRING_UPDOWN_X0	((SETUP_INPUT_STRING_X0 + 60) - 25)

#define	PASSWORD_CHANGE_HEIGHT			45
#define	PASSWORD_CHANGE_WIDTH			36
#define	PASSWORD_OLD_INTPUT_Y0			((55 + 10) + 5)
#define	PASSWORD_OLD_INTPUT_Y1			((PASSWORD_OLD_INTPUT_Y0 + PASSWORD_CHANGE_HEIGHT) - 1)
#define	PASSWORD_NEW_INTPUT_Y0			((PASSWORD_OLD_INTPUT_Y1) + 30 + 5)
#define	PASSWORD_NEW_INTPUT_Y1			((PASSWORD_NEW_INTPUT_Y0 + PASSWORD_CHANGE_HEIGHT) - 1)
#define PASSWORD_CHANGE_LABEL_X0		88
#define PASSWORD_CHANGE_LABEL_X1		(PASSWORD_CHANGE_LABEL_X0 + CONTROL_BUTTON_WIDTH)
#define PASSWORD_CHANGE_VALUE_X			(PASSWORD_CHANGE_LABEL_X1 + CONTROL_BTTON_DISTANCE)
#define PASSWORD_CHANGE_DIGIT			8

#define PASSWORD_MSG_X0					50
#define PASSWORD_MSG_X1					((50 + 380) - 1)
#define PASSWORD_MSG_Y0					50
#define PASSWORD_MSG_Y1					((133 + 60) - 1)

#define EVENT_LINE_MAX							4

#define FAULT_MAIN_COUNT						2
#define FAULT_MIDDLE_COUNT						30
#define FAULT_SMALL_COUNT						7

#define	SYSTEM_EVENT_STATUS_CHANGE				2
#define	SYSTEM_EVENT_SETTING_CHANGE				3
#define	SYSTEM_EVENT_SYSTEM_CHANGE				6
#define	SYSTEM_EVENT_MAIN_COUNT					7
#define	SYSTEM_EVENT_STATUS_CHANGE_COUNT		5
#define	SYSTEM_EVENT_STATUS_CHANGE_SMALL_COUNT	36
#define SYSTEM_EVENT_SETTING_CHANGE_COUNT		4
#define SYSTEM_EVENT_SYSTEM_CHANGE_COUNT		2
#define SYSTEM_EVENT_SETTING_CHANGE_SMALL_COUNT	32
#define SYSTEM_EVENT_SYSTEM_CHANGE_SMALL_COUNT	28

#define FAULT_SOURCE_MAX						8
#define FAULT_PHASE_MAX							9

// AcbMccbMeasuremnet.c
#define	ACBMCCB_MEASURE_GRID_X0					120
#define	ACBMCCB_MEASURE_GRID_X1					((120+340)-1)
#define	ACBMCCB_MEASURE_GRID_X					(120+(340/2))		//290

#define ACBMCCB_MEASUR_LABEL_X0					(ACBMCCB_MEASURE_GRID_X0 + 5)
#define ACBMCCB_MEASUR_LABEL_WIDTH				40
#define ACBMCCB_MEASUR_LABEL2_X0				(ACBMCCB_MEASURE_GRID_X + 5)
#define ACBMCCB_MEASUR_LABEL2_WIDTH				40
#define ACBMCCB_MEASUR_LABEL3_X0		(ACBMCCB_MEASURE_GRID_X0 + 10)
#define ACBMCCB_MEASUR_LABEL3_X1		((ACBMCCB_MEASUR_LABEL3_X0 + ACBMCCB_MEASUR_LABEL_WIDTH) - 1)


#define ACBMCCB_MEASUR_VIP_V_x0			((ACBMCCB_MEASUR_LABEL_X0 + ACBMCCB_MEASUR_LABEL_WIDTH) -5)
#define ACBMCCB_MEASUR_VIP_V_x1			(ACBMCCB_MEASUR_VIP_V_x0 + 58)
#define ACBMCCB_MEASUR_VIP_VU_x0		(ACBMCCB_MEASUR_VIP_V_x1 + 1)
#define ACBMCCB_MEASUR_VIP_VU_x1		(ACBMCCB_MEASUR_VIP_VU_x0 + 28)
#define ACBMCCB_MEASUR_VIP_VS_x0		(ACBMCCB_MEASUR_VIP_VU_x1)
#define ACBMCCB_MEASUR_VIP_VS_x1		(ACBMCCB_MEASUR_VIP_VS_x0 + 8)
#define ACBMCCB_MEASUR_VIP_VA_x0		(ACBMCCB_MEASUR_VIP_VS_x1 + 1)
#define ACBMCCB_MEASUR_VIP_VA_x1		(ACBMCCB_MEASUR_VIP_VA_x0 + 30)

#define ACBMCCB_MEASUR_VIP_I_x0			((ACBMCCB_MEASURE_GRID_X + ACBMCCB_MEASUR_LABEL_WIDTH) - 5)
#define ACBMCCB_MEASUR_VIP_I_x1			(ACBMCCB_MEASUR_VIP_I_x0 + 58)
#define ACBMCCB_MEASUR_VIP_IU_x0		(ACBMCCB_MEASUR_VIP_I_x1 + 1)
#define ACBMCCB_MEASUR_VIP_IU_x1		(ACBMCCB_MEASUR_VIP_IU_x0 + 28)
#define ACBMCCB_MEASUR_VIP_IS_x0		(ACBMCCB_MEASUR_VIP_IU_x1)
#define ACBMCCB_MEASUR_VIP_IS_x1		(ACBMCCB_MEASUR_VIP_IS_x0 + 8)
#define ACBMCCB_MEASUR_VIP_IA_x0		(ACBMCCB_MEASUR_VIP_IS_x1 + 1)
#define ACBMCCB_MEASUR_VIP_IA_x1		(ACBMCCB_MEASUR_VIP_IA_x0 + 30)


#define ACBMCCB_MEASUR_VIP_PQS_x0			((ACBMCCB_MEASURE_GRID_X0 + ACBMCCB_MEASUR_LABEL_WIDTH) + 5)
#define ACBMCCB_MEASUR_VIP_PQS_x1			(ACBMCCB_MEASUR_VIP_PQS_x0 + 70)
#define ACBMCCB_MEASUR_VIP_PQS_U_x0			(ACBMCCB_MEASUR_VIP_PQS_x1 + 5)
#define ACBMCCB_MEASUR_VIP_PQS_U_x1			(ACBMCCB_MEASUR_VIP_PQS_U_x0 + 40)

#define ACBMCCB_MEASUR_VALUE_x0				((ACBMCCB_MEASURE_GRID_X0 + ACBMCCB_MEASUR_LABEL_WIDTH) + 10)
#define ACBMCCB_MEASUR_VALUE_x1				(ACBMCCB_MEASURE_GRID_X + 90)
#define ACBMCCB_MEASUR_VALUE_U_x0			(ACBMCCB_MEASUR_VALUE_x1 + 5)
#define ACBMCCB_MEASUR_VALUE_U_x1			(ACBMCCB_MEASUR_VALUE_U_x0 + 60)

#define ACBMCCB_MEASUR_PQ_THD_VA_LABEL_x0	206
#define ACBMCCB_MEASUR_PQ_THD_VA_LABEL_x1	(ACBMCCB_MEASUR_PQ_THD_VA_LABEL_x0+50)
#define ACBMCCB_MEASUR_PQ_THD_VB_LABEL_x0	294
#define ACBMCCB_MEASUR_PQ_THD_VB_LABEL_x1	(ACBMCCB_MEASUR_PQ_THD_VB_LABEL_x0+50)
#define ACBMCCB_MEASUR_PQ_THD_VC_LABEL_x0	294
#define ACBMCCB_MEASUR_PQ_THD_VC_LABEL_x1	(ACBMCCB_MEASUR_PQ_THD_VB_LABEL_x0+50)

#define ACBMCCB_MEASUR_DEMAND_VALUE_x0		((ACBMCCB_MEASURE_GRID_X0 + ACBMCCB_MEASUR_LABEL_WIDTH) + 10)
#define ACBMCCB_MEASUR_DEMAND_VALUE_x1		(ACBMCCB_MEASUR_DEMAND_VALUE_x0 + 80)
#define ACBMCCB_MEASUR_DEMAND_VALUE_U_x0	(ACBMCCB_MEASUR_DEMAND_VALUE_x1 + 10)
#define ACBMCCB_MEASUR_DEMAND_VALUE_U_x1	(ACBMCCB_MEASUR_DEMAND_VALUE_U_x0 + 40)
#define ACBMCCB_MEASUR_DEMAND_DATE_x0		(ACBMCCB_MEASUR_DEMAND_VALUE_U_x1 + 5)
#define ACBMCCB_MEASUR_DEMAND_DATE_x1		(ACBMCCB_MEASUR_DEMAND_DATE_x0 + 130)

#define POINT_ANGLE_COUNT	3
#define	PENSIZE_ANGLE		2

#define PF_DISPLAY_LS		1
#define PF_DISPLAY_IEC		2
#define PF_DISPLAY_IEEE		3

extern const uint8_t *_acImage[STATUS_IMAGE_COUNT];
extern const uint8_t _acXyPos[STATUS_IMAGE_COUNT];

//extern GPIO_PinState KeyStatus[5];
//extern uint16_t KeyPin[5];

extern int const _ichstatus_line_x[STATUS_LINE_COUNT];
extern GUI_RECT rectLocal;
extern GUI_RECT rectMode;
extern GUI_RECT rectDate;
extern GUI_RECT rectDesc;

//extern const int _BarXPos[12];
//extern const GUI_COLOR _BarColor[5];
extern char const* _acPhase_Label[PHASE_COUNT];
extern char const* _acAcbMccb_Overview_vlaue[PHASE_COUNT];
extern char const* _acAcbMccb_Overview_unit[PHASE_COUNT];

extern char const* _acinfo_modebus_version;

extern char const* _achwset_label_text[SETUP_LANGUAGE_MAX][LINECOUNT_CONTENTS];
extern char const* _achwset_MCCB_label_text[SETUP_LANGUAGE_MAX][LINECOUNT_CONTENTS];
extern char const* _acrelayset_label_text[SETUP_LANGUAGE_MAX][ACBMCCB_RELAYSET_COL_CNT][LINECOUNT_CONTENTS-1];
extern char const* _acmeasurement_menu_text[SETUP_LANGUAGE_MAX][ACBMCCB_MEASUR_MENU_COUNT];
extern char const* _acmeasurementVI_LNLL_label_text[ACBMCCB_MESURE_VI_LNLL_CNT][LINECOUNT_CONTENTS];
extern char const* _acmeasurementVI_A_label_text[ACBMCCB_MESURE_VI_A_CNT];
extern char const* _acmeasurementEnergy_unit[ACBMCCB_MESURE_ENERGY_CNT];
extern char const* _acmeasurementEnergy_label_text[ACBMCCB_MESURE_ENERGY_CNT];
extern char const* _acmeasurementPQ_label_text[LINECOUNT_CONTENTS-1];
extern char const* _acmeasurementDemand_label_text[LINECOUNT_CONTENTS];
extern char const* _acsetupinfo_label_text[SETUP_LANGUAGE_MAX][LINECOUNT_CONTENTS];
extern char const* _acinfo_label_text[SETUP_LANGUAGE_MAX][INFO_CNT][LINECOUNT_CONTENTS];
extern char const* _acinfo_value_text[LINECOUNT_CONTENTS];
extern char const* _acbat_status[SETUP_LANGUAGE_MAX][BAT_STATUS_CNT];
extern char const* _acinfo_menu_text[SETUP_LANGUAGE_MAX][MENU_COUNT][MENU_ITEM_COUNT];
extern char _acHardwareVersion[HARDWAREVERSION_SIZE];

extern char const* _acacbmccb_cbstatus_control_text[SETUP_LANGUAGE_MAX];
extern char const* _acacbmccb_iostatus_text[IO_STATUS_COUNT];
extern char const* _aconoff_text[SETUP_LANGUAGE_MAX][STATUS_COUNT];
extern char const* _acopenclose_text[SETUP_LANGUAGE_MAX][STATUS_COUNT];
extern char const* _actrip_text[SETUP_LANGUAGE_MAX][STATUS_COUNT];
extern char const* _accontrol_confirm_text[SETUP_LANGUAGE_MAX][STATUS_COUNT];
extern char const* _acacbMccbcontrol_confirm_text[SETUP_LANGUAGE_MAX];
extern char const* _aFactoryReset_confirm_text[SETUP_LANGUAGE_MAX];
extern char const* _aFaultReset_confirm_text[SETUP_LANGUAGE_MAX];
extern char const* _accontrol_button_text[SETUP_LANGUAGE_MAX][STATUS_COUNT];
extern char const* _acpassword_input_text;

// MLink
extern char const* _acmlink_overview_label_text[MLINK_TYPE_MAX];
extern char const* _acmlink_overview_unit_text[MLINK_OVERVER_UNIT_COUNT];

extern char const* _acmlink_hwset_label_text[SETUP_LANGUAGE_MAX][MLINK_HWSET_COUNT];

extern char const* _acmlink_iostatus_menu_text[SETUP_LANGUAGE_MAX][ACBMCCB_MEASUR_MENU_COUNT];
extern char const* _acmlink_iostatusAPP_value_text[SETUP_LANGUAGE_MAX][MLINK_IOSTATUS_APP_COL_CNT][MLINK_IOSTATUS_APP_ROW_CNT];
extern char const* _acmlinkiostatusDI_label_text[LINECOUNT_CONTENTS];
extern char const* _acmlinkiostatusDI_value_text[SETUP_LANGUAGE_MAX][INDEX_11];
extern char const* _acmlink_iostatusDO_value_text[LINECOUNT_CONTENTS-1];
extern char const* _acmlink_iostatusDO_value[SETUP_LANGUAGE_MAX][INDEX_3];

extern char const* _acmlink_info_title_text[SETUP_LANGUAGE_MAX];
extern char const* _acmlink_info_label_text[MLINK_OPERINFO_COL_CNT][MLINK_OPERINFO_ROW_CNT];
extern char const* _acmlink_control_text[MLINK_CONTROL_ITEM_COUNT];
extern void PasswordDisp(int pos, char password);
extern void MLinkButtonDisp(int button);

// Setup
extern char const* _acsetup_disp_conn_label_text[SETUP_LANGUAGE_MAX][LINECOUNT_CONTENTS-1];
extern char const* _acsetup_disp_setting_label_text[SETUP_LANGUAGE_MAX][SETUP_SETTING_NUM];
extern char const* _acsetup_disp_setting_value_text[SETUP_LANGUAGE_MAX][SETUP_SETTING_NUM];
extern char const* _acsetup_disp_setting_value_text_not[SETUP_LANGUAGE_MAX][SETUP_SETTING_NUM];

extern char const* _acsetup_password_text[SETUP_LANGUAGE_MAX][STATUS_COUNT];

extern GUI_POINT DOWN_POINT[SETUP_TRIANGLE_CNT];
extern GUI_POINT UP_POINT[SETUP_TRIANGLE_CNT];

extern uint16_t date_set_pos[DATE_INPUT_CNT][XY_POS_CNT];
extern uint16_t date_set_updown_pos[DATE_INPUT_CNT];

extern  GUI_RECT rectAcbBox;
extern  GUI_RECT rectMccbBox;
extern  GUI_RECT rectMccbStatus[MCCB_STATUS_POS_CNT];
extern  GUI_RECT rectAcbStatus[ACB_STATUS_POS_CNT];

extern char const* _acsetup_language[SETUP_LANGUAGE_MAX];
extern char const* _acsetup_type[SETUP_TYPE_MAX];
extern char const* _acsetup_speed[SETUP_SPEED_MAX];
extern char const* _acsetup_gateway_use[SETUP_LANGUAGE_MAX][INDEX_2];
extern uint32_t const setup_speed[SETUP_SPEED_MAX];

extern char const* _acpassword_question_text[SETUP_LANGUAGE_MAX];
extern char const* _apassword_button_text[SETUP_LANGUAGE_MAX][STATUS_COUNT];
extern char const* _acCBSetting_invalid_text[SETUP_LANGUAGE_MAX];
extern char const* _acmode_invalid_text[SETUP_LANGUAGE_MAX];
extern char const* _accontrol_failed_text[SETUP_LANGUAGE_MAX];
extern char const* _accontrol_succeeded_text[SETUP_LANGUAGE_MAX];

extern const U8 _acImageStatusConnected[CONNECT_IMAGE_SIZE];
extern const U8 _acImageStatusDisconnected[CONNECT_IMAGE_SIZE];
//extern const U8 _acImageZSIOn[6174];
//extern const U8 _acImageZSIOff[6174];
//extern const U8 _acImageAlarmOn[6174];
//extern const U8 _acImageAlarmOff[6174];
extern const U8 _acUp[UPDOWN_IMAGE_SIZE];
extern const U8 _acDown[UPDOWN_IMAGE_SIZE];

extern GUI_CONST_STORAGE GUI_BITMAP bmHWINFO_enable;
extern GUI_CONST_STORAGE GUI_BITMAP bmHWINFO_Focus;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_measurement_selected;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_measurement_normal;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_systeminfo_selected;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_systeminfo_normal;
extern GUI_CONST_STORAGE GUI_BITMAP bmRELAYINFO_enable;
extern GUI_CONST_STORAGE GUI_BITMAP bmRELAYINFO_Focus;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_events_selected;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_events_normal;
extern GUI_CONST_STORAGE GUI_BITMAP bmcontrol_selected;
extern GUI_CONST_STORAGE GUI_BITMAP bmcontrol_normal;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_IOset_selected;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_IOset_normal;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_IOstatus_selected;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_IOstatus_normal;
//extern GUI_CONST_STORAGE GUI_BITMAP bmacb_iostatus_btn_normal;
//extern GUI_CONST_STORAGE GUI_BITMAP bmacb_iostatus_btn_selected;
extern GUI_CONST_STORAGE GUI_BITMAP bmacbmccb_control_btn_normal;
extern GUI_CONST_STORAGE GUI_BITMAP bmacbmcc_control_btn_selected;
extern GUI_CONST_STORAGE GUI_BITMAP bmicon_succeeded;

// 중국어 이미지
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_hwset_selected_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_hwset_normal_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_IOstatus_normal_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_IOstatus_selected_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_measurement_normal_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_measurement_selected_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_systeminfo_normal_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_systeminfo_selected_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_relayset_normal_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_relayset_selected_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_events_normal_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_events_selected_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmacbmccb_control_normal_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmacbmccb_control_selected_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_IOset_normal_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmbtn_IOset_selected_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmcontrol_btn_normal_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmcontrol_btn_selected_ch;
extern GUI_CONST_STORAGE GUI_BITMAP bmCelsius;


extern GPIO_PinState KeyStatus[KEY_MAX];
extern uint16_t KeyPin[KEY_MAX];
extern float const RationPlugTab[RATING_PLUG_TAB_SIZE];


// Events

extern char const* acFaultPhase[SETUP_LANGUAGE_MAX][FAULT_PHASE_MAX];
extern char const* acFaultSource[FAULT_SOURCE_MAX];
extern char const* acFaultUnit[FAULT_SOURCE_MAX];

extern char const* acevent_noevent_text[SETUP_LANGUAGE_MAX];
extern char const* acFaultMainMsg[SETUP_LANGUAGE_MAX][FAULT_MAIN_COUNT];
extern char const* acFaultMiddleMsg[SETUP_LANGUAGE_MAX][FAULT_MIDDLE_COUNT];
extern char const* acFaultSmallMsg[SETUP_LANGUAGE_MAX][FAULT_SMALL_COUNT];
extern char const* acSystemEventMainMsg[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_MAIN_COUNT];
extern char const* acSystemEventStatusChange[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_STATUS_CHANGE_COUNT];
extern char const* acSystemEventStatusChangeSmall[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_STATUS_CHANGE_COUNT][SYSTEM_EVENT_STATUS_CHANGE_SMALL_COUNT];
extern char const* acSystemEventSettingChange[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_SETTING_CHANGE_COUNT];
extern char const* acSystemEventSettingChangeSmall[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_SETTING_CHANGE_COUNT][SYSTEM_EVENT_SETTING_CHANGE_SMALL_COUNT];
extern char const* acSystemEventSystemChange[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_SYSTEM_CHANGE_COUNT];
extern char const* acSystemEventSystemChangeSmall[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_SYSTEM_CHANGE_COUNT][SYSTEM_EVENT_SYSTEM_CHANGE_SMALL_COUNT];

E_KEY GetKey(void);

extern void ButtonDisp(int button);

void DispStatus(void);
void DispMLinkStatus(void);
void CountDisp(int total, int index);
void InfoMenu(int menu, int pos, int count);
void ControlSet(const int pos, const int offset, const int cur_status, const char* msg, const uint8_t nSBO);
void ControlErrorMessage(const char* message);

void OverViewValue(int flag);
void OverviewSend(void);

WM_HWIN CreateMenu(E_DEVICE_TYPE DeviceType);
void AcbMccbHwSet(void);
void AcbMccbRelaySet(void);
void AcbMccbMeasurement(void);
void AcbMccbInfomation(void);
void AcbMccbEvent(void);
void AcbMccbControl(void);

void MLinkOverview(void);
void MLinkOverviewValue(int flag);
void MLinkIOSet(void);
void MLinkHwSet(void);
void MLinkInfomation(void);
void MLinkEvent(void);
void MLinkControl(void);
void DeviceDisp(void);
E_SETUP_RETURN Setup(void);

void SettingTime(void);
int SettingInput(uint16_t* orgValue, int const min, int const max, int const not_used);
int SettingInputString(uint16_t* orgValue, int const max, const char* const text[], int multi_lan);
int PasswordChange(void);
int QuestionMessage(void);
void DispFormat(float value, const char* baseUnit, char unit[10], char result[20]);

void BacklightBrghtness(const uint16_t brightness, const uint16_t flag);

extern char const* _acPQS_unit[PQS_UNIT_COUNT];
extern const GUI_POINT cPtAngle[PQS_UNIT_COUNT];
extern char const* _acmeasurementPQ_unit_text[PQS_UNIT2_COUNT];
extern char const* _acmeasurementPQ_V_text[PQS_UNIT_COUNT];
extern char const* _acmeasurementPQ_I_text[PQS_UNIT_COUNT];
extern int PQ_LABEL_X[PQS_UNIT_COUNT][XY_POS_CNT];
extern int PQ_VALUE_X[PQS_UNIT_COUNT][XY_POS_CNT];
extern int PQ_UNIT_X[PQS_UNIT_COUNT][XY_POS_CNT];
extern char const* _acmeasurementDemand_unit[DEMAND_COUNT];

//MenuDlg.c
#define ID_WINDOW_0 (GUI_ID_USER + 0x00)
#define ID_BUTTON_0 (GUI_ID_USER + 0x01)
#define ID_BUTTON_1 (GUI_ID_USER + 0x02)
#define ID_BUTTON_2 (GUI_ID_USER + 0x03)
#define ID_BUTTON_3 (GUI_ID_USER + 0x04)
#define ID_BUTTON_4 (GUI_ID_USER + 0x05)
#define ID_BUTTON_5 (GUI_ID_USER + 0x06)

//MlinkIoSet.c
extern char const* _acappdesc_label_text[SETUP_LANGUAGE_MAX][MLINK_MODE_DESC_KIND][MLINK_MODE_DESC_ROW_CNT];
#define MLINK_IOSET_APP_BOX_Y1				300
#define MLINK_IOSET_APP_DESC_Y0				154
#define MLINK_IOSET_APP_DESC_Y_DISTANCE		30
#define MLINK_IOSET_APP_DESC_X0				154
#define MLINK_IOSET_APP_DESC_X1				MLINK_IOSET_APP_DESC_X0 + 300
#define MLINK_IOSET_APP_DESC2_X0				190
#define MLINK_IOSET_APP_DESC2_X1				MLINK_IOSET_APP_DESC2_X0 + 250

//modbus.c
extern const uint8_t auchCRCHi[];
extern const uint8_t auchCRCLo[];

void EventSend(int bEvent);
void EventDataRecv(void);
void PCF2127_readTime(uint8_t flag);
uint16_t PCF2127_set_time();
uint16_t RTCBatteryStatus(void);
void SystemClock_Config(void);
void BSP_Background(void);
void Module_Req_Data();
static void MX_I2C2_Init(void);

extern int gAmpareFrame[DEVICE_MAX];
extern uint16_t gSendIndex;
extern uint16_t gReadIndex;
extern uint16_t nEventIndex;
extern uint16_t nEventTotal;
extern uint16_t nCurrIndex;
extern int bEventSend;
extern int nMenuPos;
extern uint8_t doStatus[DEVICE_MAX][MLINK_DO_MAX];
extern uint8_t diStatus[DEVICE_MAX][MLINK_DI_MAX];
extern UART_HandleTypeDef huart1;
extern UART_HandleTypeDef huart2;
extern SPI_HandleTypeDef hspi3;
extern TIM_HandleTypeDef htim2;
extern int gPols[DEVICE_MAX];

void LanguageSelect(E_FONT_SIZE size);
void BaseDisp(float value, char* mks, const char*baseUnit, char unit[UNIT_BUF_SIZE],  char result[DEFAULT_BUF_SIZE]);

void CommTimerInit(void);
void CommTimerClear(void);

void LCD_OnOff(int nOnOff);
void KeyCheck(void);

extern E_ACB_TYPE gAcbType[DEVICE_MAX];
extern IWDG_HandleTypeDef hiwdg;


#endif /* __GUIDATA__ */
