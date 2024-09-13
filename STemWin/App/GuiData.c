// PRQA S 3120 EOF

#define EXTERN extern
#include "guidata.h"

uint32_t gSavingModeCounter;
uint32_t gScreenSwitchingCounter;
uint32_t gReturnToScreen;
uint16_t gbInMainMenu;
int statusSendStep;

int nMenuPos;
int bEventSend;
uint16_t nEventIndex;
uint16_t nEventTotal;
uint16_t nCurrIndex;
uint16_t gReadIndex;
int gPols[DEVICE_MAX];

const char * _acinfo_modebus_version = {
"1. ACB		01.00.15(20181221)\n"
"2. MCCB 	01.00.14(20181228)\n"
"3. MLINK	01.00.20(20181227)\n"
};

char _acHardwareVersion[HARDWAREVERSION_SIZE];

char const* _acinfo_value_text[LINECOUNT_CONTENTS] = {
		"LSE",
		"IHM8(5277 1172 570)",		// Product
		"02.00.01",					// HW Version
		"02.00.01",					// SW Version
		"01.00.12",					// Comm. Version
		"Normal"
};


const uint8_t *_acImage[STATUS_IMAGE_COUNT];

const uint8_t _acXyPos[STATUS_IMAGE_COUNT] = {
    0, 0,
//	36, 0,
//	97, 0
};

GPIO_PinState KeyStatus[KEY_MAX];
uint16_t KeyPin[KEY_MAX] = {
	SETUP_KEY_Pin,
	UP_KEY_Pin,
	DOWN_KEY_Pin,
	ENTER_KEY_Pin,
	CANCEL_KEY_Pin,
};

int const _ichstatus_line_x[STATUS_LINE_COUNT] = {
	35,
	95,
	156
};

GUI_RECT rectLocal = {
	36,
	0,
	94,
	Y0_MAIN-1
};

GUI_RECT rectMode = {
	96,
	0,
	150,
	Y0_MAIN-1
};

GUI_RECT rectDate = {
	157,
	0,
	157+138,
	Y0_MAIN-1
};

GUI_RECT rectDesc = {
	300,
	0,
	X1_MAIN-5,
	Y0_MAIN-1
};

uint16_t gDeviceCount = 1;
uint16_t gDeviceIndex = 0;
uint16_t gStatusSendEnd = 0;
char gDescription[DEVICE_MAX][DESCRIPTION_MAX+1];

char const* _acNotUsed[SETUP_LANGUAGE_MAX] = {
	"Not Used",
	"未使用",
	"Not Used",
};

char const* _acalarm_text[SETUP_LANGUAGE_MAX] = {
	"Alarm",
	"报警",
	"Alarm"
};

char const* _acsetup_language[SETUP_LANGUAGE_MAX] = {
	"English",
	"中文",
	"русский"
};

char const* _acsetup_type[SETUP_TYPE_MAX] = {
	"ACB",
	"MCCB",
	"M-Link"
};

char const* _acsetup_speed[SETUP_SPEED_MAX] = {
	"9,600bps",
	"19,200bps",
	"38,400bps",
	"57,600bps"
};

char const* _acsetup_gateway_use[SETUP_LANGUAGE_MAX][INDEX_2] = {
	{
		"No",
		"Yes",
	},
	{
		"未使用",
		"使用",
	},
	{
		"No",
		"Yes",
	},
};

uint32_t const setup_speed[SETUP_SPEED_MAX] = {
	9600,
	19200,
	38400,
	57600
};

char const* _aclocal_remote[SETUP_LANGUAGE_MAX][LOCAL_REMOTE_COUNT] = {
	{
	"Local",
	"Remote"
	},
	{
	"本地",
	"远程"
	},
	{
	"Local",
	"Remote"
	},
};

char const* _accb_status[SETUP_LANGUAGE_MAX][CB_MAX] = {
	{
	"Open",
	"Close",
	"Trip",
	"Inter",
	""
	},
	{
	"关",
	"开",
	"脱扣",
	"Inter",
	""
	},
	{
	"Open",
	"Close",
	"Trip",
	"Inter",
	""
	}
};

char const* _accb_control_status[SETUP_LANGUAGE_MAX][CB_MAX] = {
	{
	"Close",
	"Open",
	"Reset",
	"",
	""
	},
	{
	"开",
	"关",
	"重置",
	"",
	""
	},
	{
	"Close",
	"Open",
	"Reset",
	"",
	""
	},
};

uint16_t SettingValue[SETUP_COUNT] = {
	0,		// Speed
	1,		// Device count
	100,	// Brightness
	120,	// Saving Mode
	0,		// Screen Switching
	0,		// Return to Screen
	0,		// Language
	0000,	// Password
	0,		// Gatwway Use
	0,		// Terminate 저항 Up
	0,		// Terminate 저항 Down
	1		// Password Use
};

uint16_t DefaultSettingValue[SETUP_COUNT] = {
	0,		// Speed
	1,		// Device count
	100,	// Brightness
	120,	// Saving Mode
	0,		// Screen Switching
	0,		// Return to Screen
	0,		// Language
	0000,	// Password
	0,		// Gatwway Use
	0,		// Terminate 저항 Up
	0,		// Terminate 저항 Down
	1		// Password Use
};

S_CONNECT_SETTING ConnectSetting[DEVICE_MAX] = {
	{DEVICE_MLINK, 1 },
	{DEVICE_NO, 2 },
	{DEVICE_NO, 3 },
	{DEVICE_NO, 4 },
	{DEVICE_NO, 5 },
	{DEVICE_NO, 6 },
	{DEVICE_NO, 7 },
	{DEVICE_NO, 8 }
};

uint16_t SetupSpeed[SETUP_SPEED_MAX] = {
	9600,
	19200,
	38400,
	57600
};

S_DATE_TIME gDateTime = {
	0,
	1,
	1,
	0,
	0,
	0,
	0
};

char const* _acPhase_Label[PHASE_COUNT] = {
	"A",
	"B",
	"C",
	"N"
};

char const* _acAcbMccb_Overview_unit[PHASE_COUNT] = {
	"A",
	"A",
	"A",
	"A"
};

char const* _achwset_label_text[SETUP_LANGUAGE_MAX][LINECOUNT_CONTENTS] = {
	{
	"Pole",
	"Rated Voltage(Vn)",
	"Rated Current(In)",
	"Comm. Address",
	"Comm. Speed",
	"Remote Status"
	},
	{
	//"本地 / 远程",
	"极数",
	"额定电压(Vn)",
	"额定电流(In)",
	"通信地址",
	"通信速度",
	"远程控制"
	},
	{
	"Pole",
	"Rated Voltage(Vn)",
	"Rated Current(In)",
	"Comm. Address",
	"Comm. Speed",
	"Remote Status"
	},
};

char const* _achwset_MCCB_label_text[SETUP_LANGUAGE_MAX][LINECOUNT_CONTENTS] = {
	{
	"Wiring",
	"Rated Voltage(Vn)",
	"Rated Current(In)",
	"Comm. Address",
	"Comm. Speed",
	"Remote Status"
	},
	{
	//"本地 / 远程",
	"极数",
	"额定电压(Vn)",
	"额定电流(In)",
	"通信地址",
	"通信速度",
	"远程控制"
	},
	{
	"Wiring",
	"Rated Voltage(Vn)",
	"Rated Current(In)",
	"Comm. Address",
	"Comm. Speed",
	"Remote Status"
	},
};

char const* _acrelayset_label_text[SETUP_LANGUAGE_MAX][ACBMCCB_RELAYSET_COL_CNT][LINECOUNT_CONTENTS-1] = {
	{
		{
			"OCR L",
			"OCR LN",
			"OCR S",
			"OCR I",
			"OCR G"
		},
		{
			"lr",
			"lnr",
			"ls",
			"li",
			"lg"
		},
		{
			"tr",
			"tnr",
			"ts",
			"",
			"tg"
		}
	},
	{
		{
			"过载",
			"中性线过载",
			"过电流延时",
			"瞬时过电流",
			"接地故障"
		},
		{
			"lr",
			"lnr",
			"ls",
			"li",
			"lg"
		},
		{
			"tr",
			"tnr",
			"ts",
			"",
			"tg"
		}
	},
	{
		{
			"OCR L",
			"OCR LN",
			"OCR S",
			"OCR I",
			"OCR G"
		},
		{
			"lr",
			"lnr",
			"ls",
			"li",
			"lg"
		},
		{
			"tr",
			"tnr",
			"ts",
			"",
			"tg"
		}
	},
};

/*
char const* _acmeasurement_menu_text[SETUP_LANGUAGE_MAX][STU_MEASUR_MENU_COUNT] = {
	{
	"V&I",
	"P&PF&F",
	"Energy",
	"PQ",
	"Max\nDemand"
	},
	{
	"V&I&",
	"P&PF&F",
	"电量",
	"电能\n质量",
	"最大\n需求"
	},
	{
	"V&I",
	"P&PF&F",
	"Energy",
	"PQ",
	"Max\nDemand"
	},
};

char const* _acmeasurement_menu_text[SETUP_LANGUAGE_MAX][ACBMCCB_MEASUR_MENU_COUNT] = {
	{
	"V&I&P",
	"Energy",
	"PQ",
	"Max\nDemand"
	},
	{
	"V&I&P",
	"电量",
	"电能\n质量",
	"最大\n需求"
	},
	{
	"V&I&P",
	"Energy",
	"PQ",
	"Max\nDemand"
	},
};
char const* _acmeasurementVI_LNLL_label_text[ACBMCCB_MESURE_VI_LNLL_CNT][LINECOUNT_CONTENTS] = {
	{
		"VA",
		"VB",
		"VC",
		"P",
		"Q",
		"S"
	},
	{
		"VAB",
		"VBC",
		"VCA",
		"P",
		"Q",
		"S"
	}
};


char const* _acmeasurementP_PF_F_label_text[ACBMCCB_MESURE_VI_LNLL_CNT][INDEX_3] = {
	{
		"P",
		"Q",
		"S",
	},
	{
		"PF",
		"F",
		"",
	}
};

*/

char const* _acmeasurement_menu_text[SETUP_LANGUAGE_MAX][ACBMCCB_MEASUR_MENU_COUNT] = {
	{
	"V&I&P",
	"Energy",
	"PQ\nPF&F",
	"Max\nDemand"
	},
	{
	"V&I&P",
	"电量",
	"电能\n质量",
	"最大\n需求"
	},
	{
	"V&I&P",
	"Energy",
	"PQ\nPF&F",
	"Max\nDemand"
	},
};

char const* _acmeasurementVI_LNLL_label_text[ACBMCCB_MESURE_VI_LNLL_CNT][LINECOUNT_CONTENTS] = {
	{
		"VA",
		"VB",
		"VC",
		"P",
		"Q",
		"S"
	},
	{
		"VAB",
		"VBC",
		"VCA",
		"P",
		"Q",
		"S"
	}
};

char const* _acmeasurementVI_A_label_text[ACBMCCB_MESURE_VI_A_CNT] = {
		"IA",
		"IB",
		"IC",
		"IN",
};

char const* _acmeasurementEnergy_unit[ACBMCCB_MESURE_ENERGY_CNT] = {
		"Wh",
		"Varh",
		"Wh",
		"Varh",
		"VAh"
};

char const* _acmeasurementEnergy_label_text[ACBMCCB_MESURE_ENERGY_CNT] = {
		"EP",
		"EQ",
		"rEP",
		"rEQ",
		"ES"
};


char const* _acmeasurementPQ_label_text[LINECOUNT_CONTENTS-1] = {
	"Freq",
	"PF",
	"THD",
	"",
	"TDD",
};

char const* _acmeasurementDemand_label_text[LINECOUNT_CONTENTS] = {
	"IA",
	"IB",
	"IC",
	"P",
	"Q",
	"S",
};

char const* _acinfo_menu_text[SETUP_LANGUAGE_MAX][MENU_COUNT][MENU_ITEM_COUNT] = {
	{
		{
			"Device Info.",
			"Operation Info.",
			"Relay Status"
		},
		{
			"System Event",
			"Fault",
			"Fault Reset"
		},
		{
			"Display Infomation",
			"Display Setting",
			"Display Connect Setting"
		},
		{
			"STU IO",
			"TRIO IO",
			"TRIO TEMP"
		}
	},
	{
		{
			"设备信息",
			"操作信息"
				""
		},
		{
			"系统事件",
			"故障",
			"Fault Reset"
		},
		{
			"显示信息",
			"显示设置",
			"屏幕连接设置"
		}
	},
	{
		{
			"Device Info.",
			"Operation Info."
				""
		},
		{
			"System Event",
			"Fault",
			"Fault Reset"
		},
		{
			"Display Infomation",
			"Display Setting",
			"Display Connect Setting"
		}
	},
};

char const* _acsetupinfo_label_text[SETUP_LANGUAGE_MAX][LINECOUNT_CONTENTS] = {
	{
		"Manufacturer",
		"Product",
		"HW Version",
		"SW Version",
		"Comm. Version",
		"Battery Status"
	},
	{
		"制造公司",
		"产品",
		"HW 版本",
		"SW 版本",
		"通信版本",
		"电池状态"
	},
	{
		"Manufacturer",
		"Product",
		"HW Version",
		"SW Version",
		"Comm. Version",
		"Battery Status"
	},
};

char const* _acinfo_label_text[SETUP_LANGUAGE_MAX][INFO_CNT][LINECOUNT_CONTENTS] = {
	{
		{
			"Manufacturer",
			"Product",
			"HW Version",
			"SW Version",
			"Comm. Version",
			"Serial Number"
		},
		{
			"Running Time",
			"Energizing Cycle",
			"Number of On/Off  M",
			"                               E",
			"Number of Trip",
			"Contact Wear",
		}
	},
	{
		{
			"制造公司",
			"产品",
			"HW 版本",
			"SW 版本",
			"通信版本",
			"序列号"
		},
		{
			"运行时间",
			"激励周期",
			"关/开次数  M",
			"                    E",
			"脱扣次数",
			"触头磨损",
		}
	},
	{
		{
			"Manufacturer",
			"Product",
			"HW Version",
			"SW Version",
			"Comm. Version",
			"Serial Number"
		},
		{
			"Running Time",
			"Energizing Cycle",
			"Number of On/Off  M",
			"                               E",
			"Number of Trip",
			"Contact Wear",
		}
	},
};

char const* _acbat_status[SETUP_LANGUAGE_MAX][BAT_STATUS_CNT] = {
	{
		"Normal",
		"Warning"
	},
	{
		"正常",
		"警告"
	},
	{
		"Normal",
		"Warning"
	},
};

char const* _acacbmccb_cbstatus_control_text[SETUP_LANGUAGE_MAX] = {
	"CB STATUS CONTROL",
	"CB 状态控制",
	"CB STATUS CONTROL",
};

char const* _acacbmccb_iostatus_text[IO_STATUS_COUNT] = {
	"ZSI IN",
	"ZSI OUT",
//	"CB STATUS",
//	"TRIP",
	"ERMS",
	"DO #1",
	"DO #2",
	"DO #3"
};

char const* _actrio_io_cbstatus_control_text[SETUP_LANGUAGE_MAX] = {
	"CB STATUS",
	"CB 状态控制",
	"CB STATUS",
};

char const* _actrio_io_iostatus_text[INDEX_2][IO_STATUS_COUNT] = {
	{
		"CB ERROR",
		"DI #1",
		"DI #2",
		"DI #3",
		"DI #4",
		"DO #1"
	},
	{
		"DO #2",
		"DO #3",
	}
};

char const* _aconoff_text[SETUP_LANGUAGE_MAX][STATUS_COUNT] = {
	{
		"Off",
		"On",
	},
	{
		"关",
		"开",
	},
	{
		"Off",
		"On",
	},
};

char const* _acopenclose_text[SETUP_LANGUAGE_MAX][STATUS_COUNT] = {
	{
		"CB Open",
		"CB Close",
	},
	{
		"断路器打开",
		"断路器关闭",
	},
	{
		"CB Open",
		"CB Close",
	},
};

char const* _actrip_text[SETUP_LANGUAGE_MAX][STATUS_COUNT] = {
	{
		"No Trip",
		"Trip",
	},
	{
		"这不是脱扣",
		"脱扣",
	},
	{
		"No Trip",
		"Trip",
	},
};

char const* _accontrol_confirm_text[SETUP_LANGUAGE_MAX][STATUS_COUNT] = {
	{
		"If you want to turn On,\nChecking your password",
		"If you want to turn Off,\nChecking your password"
	},
	{
		"若要开掉请确认密码。",
		"若要关掉请确认密码。"
	},
	{
		"If you want to turn On,\nChecking your password",
		"If you want to turn Off,\nChecking your password"
	}
};

char const* _accontrol_confirm_nopassword_text[SETUP_LANGUAGE_MAX][STATUS_COUNT] = {
	{
		"Do you want to turn it ON?",
		"Do you want to turn it OFF?"
	},
	{
		"若要开掉请确认密码。",
		"若要关掉请确认密码。"
	},
	{
		"Do you want to turn it ON?",
		"Do you want to turn it OFF?"
	}
};

char const* _acacbMccbcontrol_confirm_text[SETUP_LANGUAGE_MAX] = {
	"If you want to turn %s,\nChecking your password",
	"若要%s掉请确认密码。",
	"If you want to turn %s,\nChecking your password",
};

char const* _achange_setting_confirm_text[SETUP_LANGUAGE_MAX] = {
	"To change settings,\nChecking your password",
	"要更改设置，请确认您的密码。",
	"To change settings,\nChecking your password",
};

char const* _acacbMccbcontrol_confirm_nopassword_text[SETUP_LANGUAGE_MAX] = {
	"Do you want to turn it %s?",
	"若要%s掉请确认密码。",
	"Do you want to turn it %s?",
};

char const* _aFactoryReset_confirm_text[SETUP_LANGUAGE_MAX] = {
	"Do you want to factory reset?",
	"工厂重置?",
	"Do you want to factory reset?",
};

char const* _aFaultReset_confirm_text[SETUP_LANGUAGE_MAX] = {
	"Reset the fault of the device?",
	"工厂重置?",
	"Reset the fault of the device?",
};

char const* _accontrol_button_text[SETUP_LANGUAGE_MAX][STATUS_COUNT] = {
	{
		"OK",
		"Cancel"
	},
	{
		"OK",
		"取消"
	},
	{
		"OK",
		"Cancel"
	},
};


char const* _acpassword_input_text = {
	"*"
};

// MLink Overview
char const* _acmlink_overview_label_text[MLINK_TYPE_MAX] = {
	"DI",
	"DO",
	"AI"
};

char const* _acmlink_overview_unit_text[MLINK_OVERVER_UNIT_COUNT] = {
	"mA",
	"'C"
};

// MLink HW Set
char const* _acmlink_hwset_label_text[SETUP_LANGUAGE_MAX][MLINK_HWSET_COUNT] = {
	{
		"Comm. Address",
		"Comm. Speed",
		"Remote Status"
	},
	{
		"通信地址",
		"通信速度",
		"远程控制"
	},
	{
		"Comm. Address",
		"Comm. Speed",
		"Remote Status"
	},
};

// MLink IO Status
char const* _acmlink_iostatus_menu_text[SETUP_LANGUAGE_MAX][ACBMCCB_MEASUR_MENU_COUNT] = {
	{
		"APP",
		"DI",
		"DO",
		"AI"
	},
	{
		"应用",
		"DI",
		"DO",
		"AI"
	},
	{
		"APP",
		"DI",
		"DO",
		"AI"
	},
};

char const* _acmlink_iostatusAPP_value_text[SETUP_LANGUAGE_MAX][MLINK_IOSTATUS_APP_COL_CNT][MLINK_IOSTATUS_APP_ROW_CNT] = {
	{
		{
			"Remote Control",
			"App. Mode",
		},
		{
			"Local",
			"Mode1(Normal)"
		}
	},
	{
		{
			"远程控制",
			"应用模式",
		},
		{
			"本地",
			"Mode1(Normal)"
		}
	},
	{
		{
			"Remote Control",
			"App. Mode",
		},
		{
			"Local",
			"Mode1(Normal)"
		}
	},
};

char const* _acmlinkiostatusDI_label_text[LINECOUNT_CONTENTS] = {
		"DI #1",
		"DI #2",
		"DI #3",
		"DI #4",
		"DI #5",
		"DI #6"
};

char const* _acmlinkiostatusDI_value_text[SETUP_LANGUAGE_MAX][INDEX_11] = {
	{
		"Not Used",
		"Contact NO(AX)",
		"Contact NO(AL)",
		"Contact",
		"Contact NC(AX)",
		"Contact NC(AL)",
		"Pulse(Wh)",
		"Pulse(Varh)",
		"Pulse(VAh)",
		"Pulse",
		"Contact(Local Input)",
	},
	{
		"未使用",
		"触头NO(AX)",
		"触头NO(AL)",
		"触头",
		"触头NC(AX)",
		"触头NC(AL)",
		"脉冲(Wh)",
		"脉冲(Varh)",
		"脉冲(VAh)",
		"脉冲",
		"触头(本地输入)",
	},
	{
		"Not Used",
		"Contact(AX)",
		"Contact(AL)",
		"Contact",
		"Contact NC(AX)",
		"Contact NC(AL)",
		"Pulse(Wh)",
		"Pulse(Varh)",
		"Pulse(VAh)",
		"Pulse",
		"Contact(Local Input)",
	},
};
char const* _acmlink_iostatusDO_value_text[LINECOUNT_CONTENTS-1] = {
		"DO Control Type",
		"DO #1",
		"DO #2",
		"DO #3",
		"DO #4"
};

char const* _acmlink_iostatusDO_value[SETUP_LANGUAGE_MAX][INDEX_3] = {
	{
		"Not Latch",
		"Latch",
		"Not Used",
	},
	{
		"未锁扣",
		"锁扣",
		"未使用",
	},
	{
		"Not Latch",
		"Latch",
		"Not Used",
	},
};

char const* _acmlink_info_title_text[SETUP_LANGUAGE_MAX] = {
	"Number of Operating Cycle",
	"操作周期数",
	"Number of Operating Cycle"
};

char const* _acmlink_info_label_text[MLINK_OPERINFO_COL_CNT][MLINK_OPERINFO_ROW_CNT] = {
	{
		"DI #1",
		"DI #2",
		"DI #3",
		"",
	},
	{
		"DI #4",
		"DI #5",
		"DI #6",
		""
	},
	{
		"DO #1",
		"DO #2",
		"DO #3",
		"DO #4"
	}
};

// MLink ControlSet
char const* _acmlink_control_text[MLINK_CONTROL_ITEM_COUNT] = {
	"DO #1",
	"DO #2",
	"DO #3",
	"DO #4",
};


// Setup
char const* _acsetup_disp_conn_label_text[SETUP_LANGUAGE_MAX][LINECOUNT_CONTENTS-1] = {
	{
		"Number of Connect Device",
		"Select Device",
		"- Comm. Address",
		"- Product Name",
		"- Device Description",
	},
	{
		"连接装备数量",
		"选择装备",
		"- 通信地址",
		"- 产品名称",
		"- 装备描述",
	},
	{
		"Number of Connect Device",
		"Select Device",
		"- Comm. Address",
		"- Product Name",
		"- Device Description",
	},
};

char const* _acsetup_disp_setting_label_text[SETUP_LANGUAGE_MAX][SETUP_SETTING_NUM] = {
	{
		"Time",
		"LCD",
		"",
		"",
		"",
//		"Language",
		"Password",
		"",
		"Comm. Speed",
		"Terminate(UP)",
		"Terminate(DOWN)",
//		"Gateway Use",
		"Factory Reset"
	},
	{
		"时间",
		"液晶显示",
		"",
		"",
		"",
//		"语言",
		"密码",
		""
		"通信速度",
		"Terminate(UP)",
		"Terminate(DOWN)",
//		"网关使用",
		"工厂重置"
	},
	{
		"Time",
		"LCD",
		"",
		"",
		"",
//		"Language",
		"Password",
		"",
		"Comm. Speed",
		"Terminate(UP)",
		"Terminate(DOWN)",
//		"Gateway Use",
		"Factory Reset"
	},
};
char const* _acsetup_disp_setting_value_text[SETUP_LANGUAGE_MAX][SETUP_SETTING_NUM] = {
	{
		"%04d-%02d-%02d %02d:%02d:%02d  ",
		"Brightness             : %d %",
		"Saving Mode         : %d s",
		"Screen Switching : %d s",
		"Return to Screen  : %d s",
//		"%s",
		"****",
		"%s",
		"%s",
		"%s",
		"%s",
//		"%s",
		""
	},
	{
		"%04d-%02d-%02d %02d:%02d:%02d  ",
		"亮度               : %d % ",
		"储存模式      : %d s",
		"屏幕转换      : %d s",
		"返回到屏幕  : %d s",
//		"%s",
		"****",
		"%s",
		"%s",
		"%s",
		"%s",
//		"%s",
		""
	},
	{
		"%04d-%02d-%02d %02d:%02d:%02d ",
		"Brightness             : %d % ",
		"Saving Mode         : %d s",
		"Screen Switching : %d s",
		"Return to Screen  : %d s",
//		"%s",
		"****",
		"%s",
		"%s",
		"%s",
		"%s",
//		"%s",
		""
	},
};

char const* _acsetup_disp_setting_value_text_not[SETUP_LANGUAGE_MAX][SETUP_SETTING_NUM] = {
	{
		"%04d-%02d-%02d %02d:%02d:%02d  ",
		"Brightness             : %d %",
		"Saving Mode         : %s",
		"Screen Switching : %s",
		"Return to Screen  : %s",
		"%s",
		"****",
		"%s"
	},
	{
		"%04d-%02d-%02d %02d:%02d:%02d  ",
		"亮度               : %d % ",
		"储存模式      : %s",
		"屏幕转换      : %s",
		"返回到屏幕  : %s",
		"%s",
		"****",
		"%s",
		"%s"
	},
	{
		"%04d-%02d-%02d %02d:%02d:%02d ",
		"Brightness             : %d % ",
		"Saving Mode         : %s",
		"Screen Switching : %s",
		"Return to Screen  : %s",
		"%s",
		"****",
		"%s",
		"%s"
	},
};

GUI_POINT DOWN_POINT[SETUP_TRIANGLE_CNT] = {
	{0, 13},
	{12, 13+17},
	{24, 13}
};

GUI_POINT UP_POINT[SETUP_TRIANGLE_CNT] = {
	{12, 13},
	{0, 13+17},
	{24, 13+17}
};

uint16_t date_set_pos[DATE_INPUT_CNT][XY_POS_CNT] = {
	{  72, 140},
	{ 160, 190},
	{ 212, 246},
	{ 262, 290},
	{ 314, 350},
	{ 373, 403}
};

uint16_t date_set_updown_pos[DATE_INPUT_CNT] = {
	85,
	152,
	203,
	252,
	310,
	364
};

GUI_RECT rectAcbBox = {
	244, 46, 388+78, 46+58
};

GUI_RECT rectMccbBox = {
	236, 46, 388+78, 46+58
};

GUI_RECT rectMccbStatus[MCCB_STATUS_POS_CNT] = {
	{ 237, 47, (237+78)-3, 47+56},
	{ 314, 47, (314+78)-3, 47+56},
	{ 391, 47, (391+78)-4, 47+56}
};

GUI_RECT rectAcbStatus[ACB_STATUS_POS_CNT] = {
	{ 245, 47, (244+112)-2, 47+56},
	{ 356, 47, (355+112)-2, 47+56},
};

GUI_RECT rectTrioBox = {
	224, 46, 334+112, 46+58
};

GUI_RECT rectTrioStatus[ACB_STATUS_POS_CNT] = {
	{ 224, 47, (224+112)-3, 47+56},
	{ 334, 47, (334+112)-3, 47+56},
};


char const* _acsetup_password_text[SETUP_LANGUAGE_MAX][STATUS_COUNT] = {
	{
		"Current Password",
		"New Password"
	},
	{
		"当前密码",
		"新密码"
	},
	{
		"Current Password",
		"New Password"
	},
};

char const* _acpassword_question_text[SETUP_LANGUAGE_MAX] = {
	"The current password\ndoesn't match.\nPlease checking and retry.",
	"输入的密码不匹配，\n请确认后重试。",
	"The current password\ndoesn't match.\nPlease checking and retry."
};

char const* _apassword_button_text[SETUP_LANGUAGE_MAX][STATUS_COUNT] = {
	{
		"Retry",
		"Cancel"
	},
	{
		"重试",
		"取消"
	},
	{
		"Retry",
		"Cancel"
	},
};

char const* _acCBSetting_invalid_text[SETUP_LANGUAGE_MAX] = {
	"Not available\nPlease check CB setting.",
	"无法使用\n请检查断路器设置",
	"Not available\nPlease check CB setting.",
};

char const* _acmode_invalid_text[SETUP_LANGUAGE_MAX] = {
	"You can't control\nin the current mode.",
	"您无法在当前\n模式下进行控制。",
	"You can't control\nin the current mode.",
};

char const* _accontrol_failed_text[SETUP_LANGUAGE_MAX] = {
	"Control failed\nPlease check again.",
	"控制失败。\n请再次确认。",
	"Control failed\nPlease check again.",
};

char const* _accontrol_succeeded_text[SETUP_LANGUAGE_MAX] = {
	"Control succeeded.",
	"控制成功",
	"Control succeeded.",
};

float const RationPlugTab[RATING_PLUG_TAB_SIZE] = {
	40.0f,
	100.0f,
	160.0f,
	250.0f,
	400.0f,
	630.0f,
	800.0f
};

/*
char const* _acSystemMain[7] = {
	"Nothing",
	"Reserved1",
	"Change Status",
	"Change Setup",
	"Reserved2",
	"Reserved3",
	"Change System"
};
*/

char const* acevent_noevent_text[SETUP_LANGUAGE_MAX] = {
	"No Event",
	"没有事件。",
	"No Event",
};

//char const* acReserved = {
//	"Reserved"
//};
//
char const* acFaultMainMsg[SETUP_LANGUAGE_MAX][FAULT_MAIN_COUNT] = {
	{
		"Northing",
		"Fault"
	},
	{
		"Northing",
		"故障"
	},
	{
		"Northing",
		"Fault"
	},
};

char const* acFaultMiddleMsg[SETUP_LANGUAGE_MAX][FAULT_MIDDLE_COUNT] = {
	{
		"L(Overload)",											// 0
		"S(Time-delayed overcurrent) Stage1",					// 1
		"S(Time-delayed overcurrent) Stage2",					// 2
		"I(Instantaneous overcurrent)",							// 3
		"G(Earth fault)(A)",									// 4
		"Reserved",												// 5
		"Gext(Earth fault on External CT)",						// 6
		"LN(Neutral protection)",								// 7
		"PTA(Pre Trip Alarm)",									// 8
		"UV(Undervoltage) Stage1",								// 9
		"UV(Undervoltage) Stage2",								// 10
		"OV(Overvoltage) Stage1",								// 11
		"OV(Overvoltage) Stage2",								// 12
		"RV(Residual overvoltage)",								// 13
		"D(Directional overcurrent)",							// 14
		//	"S(Voltage controlled overcurrent protection) Stage1",	// 15
		//	"S(Voltage controlled overcurrent protection) Stage2",	// 16
		"S(Voltage controlled OCR) Stage1",						// 15
		"S(Voltage controlled OCR) Stage2",						// 16
		"IU(Current unbalance)",								// 17
		"VU(Voltage unbalance)",								// 18
		"UF(Underfrequency) Stage1",							// 19
		"UF(Underfrequency) Stage2",							// 20
		"OF(Overfrequency) Stage1",								// 21
		"OF(Overfrequency) Stage2",								// 22
		"ROCOF(Rate of Change of Frequency)",					// 23
		"RP(Reverse Active Power)",								// 24
		//	"RQ(Loss of field or reverse reactive power) Stage1",	// 25
		//	"RQ(Loss of field or reverse reactive power) Stage2",	// 26
		"RQ(Loss of field or reverse VAR) Stage1",	// 25
		"RQ(Loss of field or reverse VAR) Stage2",	// 26
		"OP(Active Overpower)(A)",								// 27
		"OQ(Reactive Overpower)",								// 28
		"UP(Active Underpower)"									// 29
	},
	{
		"长延时",											// 0
		"短延时阶段1",					// 1
		"短延时阶段2",					// 2
		"瞬时",							// 3
		"接地",									// 4
		"Reserved",												// 5
		"外部接地",						// 6
		"中性线保护",								// 7
		"预报警",									// 8
		"欠压阶段1",								// 9
		"欠压阶段2",								// 10
		"过电压继电阶段1",								// 11
		"过电压继电阶段2",								// 12
		"剩余过电压继电",								// 13
		"方向性过电流继电",							// 14
		//	"S(Voltage controlled overcurrent protection) Stage1",	// 15
		//	"S(Voltage controlled overcurrent protection) Stage2",	// 16
		"电压控制过电流保护继电1",						// 15
		"电压控制过电流保护继电2",						// 16
		"电流不平行继电",								// 17
		"电压不平行继电",								// 18
		"低频继电阶段1",							// 19
		"低频继电阶段2",							// 20
		"超频继电阶段1",								// 21
		"超频继电阶段2",								// 22
		"频率变动继电",					// 23
		"'反向有功功率",								// 24
		//	"RQ(Loss of field or reverse reactive power) Stage1",	// 25
		//	"RQ(Loss of field or reverse reactive power) Stage2",	// 26
		"失磁或反向无功功率阶段1",	// 25
		"失磁或反向无功功率阶段2",	// 26
		"有功功率过载",								// 27
		"无功功率过载",								// 28
		"有功功率过低"									// 29
	},
	{
		"L(Overload)",											// 0
		"S(Time-delayed overcurrent) Stage1",					// 1
		"S(Time-delayed overcurrent) Stage2",					// 2
		"I(Instantaneous overcurrent)",							// 3
		"G(Earth fault)(A)",									// 4
		"Reserved",												// 5
		"Gext(Earth fault on External CT)",						// 6
		"LN(Neutral protection)",								// 7
		"PTA(Pre Trip Alarm)",									// 8
		"UV(Undervoltage) Stage1",								// 9
		"UV(Undervoltage) Stage2",								// 10
		"OV(Overvoltage) Stage1",								// 11
		"OV(Overvoltage) Stage2",								// 12
		"RV(Residual overvoltage)",								// 13
		"D(Directional overcurrent)",							// 14
		//	"S(Voltage controlled overcurrent protection) Stage1",	// 15
		//	"S(Voltage controlled overcurrent protection) Stage2",	// 16
		"S(Voltage controlled OCR) Stage1",						// 15
		"S(Voltage controlled OCR) Stage2",						// 16
		"IU(Current unbalance)",								// 17
		"VU(Voltage unbalance)",								// 18
		"UF(Underfrequency) Stage1",							// 19
		"UF(Underfrequency) Stage2",							// 20
		"OF(Overfrequency) Stage1",								// 21
		"OF(Overfrequency) Stage2",								// 22
		"ROCOF(Rate of Change of Frequency)",					// 23
		"RP(Reverse Active Power)",								// 24
		//	"RQ(Loss of field or reverse reactive power) Stage1",	// 25
		//	"RQ(Loss of field or reverse reactive power) Stage2",	// 26
		"RQ(Loss of field or reverse VAR) Stage1",	// 25
		"RQ(Loss of field or reverse VAR) Stage2",	// 26
		"OP(Active Overpower)(A)",								// 27
		"OQ(Reactive Overpower)",								// 28
		"UP(Active Underpower)"									// 29
	},
};

char const* acFaultSmallMsg[SETUP_LANGUAGE_MAX][FAULT_SMALL_COUNT] = {
	{
		"None",
		"Pick-up occur",
		"Pick-out occur",
		"OP(Operation) occur (Relay operation)",
		"Drop out occur (Relay return)"
			"",
			""
	},
	{
		"无",
		"接载发生",
		"取出发生",
		"操作发生（继电器操作）",
		"抽出（继电器返回）"
			"",
			""
	},
	{
		"None",
		"Pick-up occur",
		"Pick-out occur",
		"OP(Operation) occur (Relay operation)",
		"Drop out occur (Relay return)"
			"",
			""
	},
};


char const* acFaultPhase[SETUP_LANGUAGE_MAX][FAULT_PHASE_MAX] = {
	{
		"",
		"Phase A",
		"Phase B",
		"Phase AB",
		"Phase C",
		"Phase CA",
		"Phase BC",
		"",
		"Phase N"
	},
	{
		"",
		"A相",
		"B相",
		"AB相",
		"C相",
		"CA相",
		"BC相",
		"",
		"N相"
	},
	{
		"",
		"Phase A",
		"Phase B",
		"Phase AB",
		"Phase C",
		"Phase CA",
		"Phase BC",
		"",
		"Phase N"
	},
};

char const* acFaultSource[FAULT_SOURCE_MAX] = {
	"",
	"I",
	"V",
	"Power",
	"Var",
	"%",
	"Hz",
	"Hz/sec"
};

char const* acFaultUnit[FAULT_SOURCE_MAX] = {
	"",
	"A",
	"V",
	"W",
	"Var",
	"%",
	"Hz",
	"Hz/sec"
};

char const* acSystemEventMainMsg[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_MAIN_COUNT] = {
	{
		"Notthing",				// 0
		"Reserved1",
		"Status Change",		// 2
		"Setting Change",		// 3
		"Reserved4",
		"Reserved5",
		"System Change",		// 6
	},
	{
		"没有",				// 0
		"Reserved1",
		"状态更改",		// 2
		"设置更改",		// 3
		"Reserved4",
		"Reserved5",
		"系统更改",		// 6
	},
	{
		"Notthing",				// 0
		"Reserved1",
		"Status Change",		// 2
		"Setting Change",		// 3
		"Reserved4",
		"Reserved5",
		"System Change",		// 6
	},
};

char const* acSystemEventStatusChange[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_STATUS_CHANGE_COUNT] = {
	{
		"Device Internal Operation Status",		// 0
		"Device DI Status",
		"Device DO Status",
		"Device Operation Error",
		"ETC"									// 4
	},
	{
		"机械内部运营状态",		// 0
		"机设备DI 状态",
		"设备 DO 状态",
		"设备运营错误",
		"等其他功能"									// 4
	},
	{
		"Device Internal Operation Status",		// 0
		"Device DI Status",
		"Device DO Status",
		"Device Operation Error",
		"ETC"									// 4
	},
};

char const* acSystemEventStatusChangeSmall[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_STATUS_CHANGE_COUNT][SYSTEM_EVENT_STATUS_CHANGE_SMALL_COUNT] = {
	{
		{	// Device Internal Operation Status
			"Reserved0",
			"Reserved1",
			"Reserved2",
			"Time Synchronization",		// 3
			"Reserved4",
			"Reserved5",
			"Reserved6",
			"Unlock by Key",			// 7
			"Under PF",
			"Over PF",
			"Positive Sequence / Negative Sequence",
			"Current Direction / Backward Current Direction",
			"Override / Self Protection",
			"Device Restart",
			"Group Setting",
			"Local/Remote",		// 15
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"ERMS",				// 20
			"Reserved11",
			"Reserved22",
			"Reserved23",
			"Reserved24",
			"Reserved25",
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved29",
			"Reserved30",
			"Reserved31",
			"Reserved21",
			"Reserved33",
			"Reserved34",
			"Reserved35",
		},
		{	// Device DI Status
			"DI#1 Status",
			"DI#2 Status",
			"DI#3 Status",
			"DI#4 Status",
			"DI#5 Status",
			"DI#6 Status",
			"Reserved6",
			"Reserved7",
			"Reserved8",
			"TRIP Status",		// 9
			"L_RESET Status",
			"R_RESET Status",
			"CB Status",		// 12
			"Reserved13",
			"ERMS DI",
			"ZSI DI"			// 15
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
				"Reserved30",
				"Reserved31",
				"Reserved21",
				"Reserved33",
				"Reserved34",
				"Reserved35",
		},
		{	// Device DO Status
			"DO#1 Status",		// 0
			"DO#2 Status",
			"DO#3 Status",
			"DO#4 Status",
			"Reserved4",
			"Reserved5",
			"Reserved6",
			"Reserved7",
			"Reserved8",
			"Reserved9",
			"Reserved10",
			"Reserved11",
			"Reserved12",
			"Reserved13",
			"TRIP",				// 14
			"ZSI DO"			// 15
				"CB ON",		// 16
				"CB OFF",		// 17
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
				"Reserved30",
				"Reserved31",
				"Reserved21",
				"Reserved33",
				"Reserved34",
				"Reserved35",
		},
		{	// Device Operation Error
			"Memory Error",					// 0
			"RTC Error",					// 1
			"Calibration",					// 2
			"Mechenical Counter Alarm",		// 3
			"Electrical Counter Alarm",		// 4
			"Contact Lifetime",				// 5
			"Over Internal Temperature",	// 6
			"Internal Communication Error",	// 7
			"Reserved8",
			"Device Type Error",			// 9
			"Factory CFG Error",			// 10
			"MTD Status",					// 11
			"AF Error",						// 12
			"Rating Plug Error",			// 13
			"Battery Status",				// 14
			"Reserved15",
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved21",
			"A Phase CT Error",				// 22
			"B Phase CT Error",				// 23
			"C Phase CT Error",				// 24
			"N Phase CT Error",				// 25
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved29",
			"UL_ROM Error",					// 30
			"UL_RAM Error",					// 31
			"UL_Clock Error",				// 32
			"UL_Watchdog ",					// 33
			"UL_Program Counter Error",		// 34
			"UL_CPU Register Error"			// 35
		},
		{	// ETC
			"PTA Alarm"						// 0
				"Reserved1",
				"Reserved2",
				"Reserved3",
				"Reserved4",
				"Reserved5",
				"Reserved6",
				"Reserved7",
				"Reserved8",
				"Reserved9",
				"Reserved10",
				"Reserved11",
				"Reserved12",
				"Reserved13",
				"Reserved14",
				"Reserved15",
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
				"Reserved30",
				"Reserved31",
				"Reserved21",
				"Reserved33",
				"Reserved34",
				"Reserved35",
		}
	},
	{
		{	// Device Internal Operation Status
			"Reserved0",
			"Reserved1",
			"Reserved2",
			"时间同步",
			"Reserved4",
			"Reserved5",
			"Reserved6",
			"按键解锁",
			"功率因素下限",
			"功率因素上限",
			"正相序 / 反相序",
			"电流方向 / 反向电流方向",
			"越线跳闸 / 自保护",
			"设备重启",
			"组设置",
			"本地 / 远程",		// 15
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"ERMS",
			"Reserved11",
			"Reserved22",
			"Reserved23",
			"Reserved24",
			"Reserved25",
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved29",
			"Reserved30",
			"Reserved31",
			"Reserved21",
			"Reserved33",
			"Reserved34",
			"Reserved35",
		},
		{	// Device DI Status
			"DI#1 状态",
			"DI#1 状态",
			"DI#1 状态",
			"DI#4 状态",
			"DI#5 状态",
			"DI#6 状态",
			"Reserved6",
			"Reserved7",
			"Reserved8",
			"脱扣状态",		// 9
			"过载_复位状态",
			"远程复位状态",
			"断路器状态",		// 12
			"Reserved13",
			"ERMS 数字输入",
			"特定区域接口数字输入"			// 15
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
				"Reserved30",
				"Reserved31",
				"Reserved21",
				"Reserved33",
				"Reserved34",
				"Reserved35",
		},
		{	// Device DO Status
			"DO#1 状态",		// 0
			"DO#2 状态",
			"DO#3 状态",
			"DO#4 状态",
			"Reserved4",
			"Reserved5",
			"Reserved6",
			"Reserved7",
			"Reserved8",
			"Reserved9",
			"Reserved10",
			"Reserved11",
			"Reserved12",
			"Reserved13",
			"脱扣",				// 14
			"ZSI DO"			// 15
				"断路器开启",		// 16
				"断路器关闭",		// 17
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
				"Reserved30",
				"Reserved31",
				"Reserved21",
				"Reserved33",
				"Reserved34",
				"Reserved35",
		},
		{	// Device Operation Error
			"内存错误",					// 0
			"实时时钟错误",					// 1
			"校准",					// 2
			"机械打开计数",		// 3
			"电动打开计数",		// 4
			"触头寿命",				// 5
			"内部温度超温",	// 6
			"内部通讯错误",	// 7
			"Reserved8",
			"设备类型错误",			// 9
			"工厂环境错误",			// 10
			"MTD状态",					// 11
			"安培框架错误",						// 12
			"额定值插头错误",			// 13
			"电池状态",				// 14
			"Reserved15",
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved21",
			"A相互感器有误",				// 22
			"B相互感器有误",				// 23
			"C相互感器有误",				// 24
			"N相互感器有误",				// 25
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved29",
			"UL_ROM 有误",					// 30
			"UL_RAM 有误",					// 31
			"UL_时钟有误",				// 32
			"UL_看门狗 ",					// 33
			"UL_程序计数器有误",		// 34
			"UL_CPU 注册有误"			// 35
		},
		{	// ETC
			"预报警报警"						// 0
				"Reserved1",
				"Reserved2",
				"Reserved3",
				"Reserved4",
				"Reserved5",
				"Reserved6",
				"Reserved7",
				"Reserved8",
				"Reserved9",
				"Reserved10",
				"Reserved11",
				"Reserved12",
				"Reserved13",
				"Reserved14",
				"Reserved15",
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
				"Reserved30",
				"Reserved31",
				"Reserved21",
				"Reserved33",
				"Reserved34",
				"Reserved35",
		}
	},
	{
		{	// Device Internal Operation Status
			"Reserved0",
			"Reserved1",
			"Reserved2",
			"Time Synchronization",
			"Reserved4",
			"Reserved5",
			"Reserved6",
			"Unlock by Key",
			"Under PF",
			"Over PF",
			"Positive Sequence / Negative Sequence",
			"Current Direction / Backward Current Direction",
			"Override / Self Protection",
			"Device Restart",
			"Group Setting",
			"Local/Remote",		// 15
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved11",
			"Reserved22",
			"Reserved23",
			"Reserved24",
			"Reserved25",
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved29",
			"Reserved30",
			"Reserved31",
			"Reserved21",
			"Reserved33",
			"Reserved34",
			"Reserved35",
		},
		{	// Device DI Status
			"DI#1 Status",
			"DI#2 Status",
			"DI#3 Status",
			"DI#4 Status",
			"DI#5 Status",
			"DI#6 Status",
			"Reserved6",
			"Reserved7",
			"Reserved8",
			"TRIP Status",		// 9
			"L_RESET Status",
			"R_RESET Status",
			"CB Status",		// 12
			"Reserved13",
			"ERMS DI",
			"ZSI DI"			// 15
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
				"Reserved30",
				"Reserved31",
				"Reserved21",
				"Reserved33",
				"Reserved34",
				"Reserved35",
		},
		{	// Device DO Status
			"DO#1 Status",		// 0
			"DO#2 Status",
			"DO#3 Status",
			"DO#4 Status",
			"Reserved4",
			"Reserved5",
			"Reserved6",
			"Reserved7",
			"Reserved8",
			"Reserved9",
			"Reserved10",
			"Reserved11",
			"Reserved12",
			"Reserved13",
			"TRIP",				// 14
			"ZSI DO"			// 15
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
				"Reserved30",
				"Reserved31",
				"Reserved21",
				"Reserved33",
				"Reserved34",
				"Reserved35",
		},
		{	// Device Operation Error
			"Memory Error",					// 0
			"RTC Error",					// 1
			"Calibration",					// 2
			"Mechenical Counter Alarm",		// 3
			"Electrical Counter Alarm",		// 4
			"Contact Lifetime",				// 5
			"Over Internal Temperature",	// 6
			"Internal Communication Error",	// 7
			"Reserved8",
			"Device Type Error",			// 9
			"Factory CFG Error",			// 10
			"MTD Status",					// 11
			"AF Error",						// 12
			"Rating Plug Error",			// 13
			"Battery Status",				// 14
			"Reserved15",
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved21",
			"A Phase CT Error",				// 22
			"B Phase CT Error",				// 23
			"C Phase CT Error",				// 24
			"N Phase CT Error",				// 25
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved29",
			"UL_ROM Error",					// 30
			"UL_RAM Error",					// 31
			"UL_Clock Error",				// 32
			"UL_Watchdog ",					// 33
			"UL_Program Counter Error",		// 34
			"UL_CPU Register Error"			// 35
		},
		{	// ETC
			"PTA Alarm"						// 0
				"Reserved1",
				"Reserved2",
				"Reserved3",
				"Reserved4",
				"Reserved5",
				"Reserved6",
				"Reserved7",
				"Reserved8",
				"Reserved9",
				"Reserved10",
				"Reserved11",
				"Reserved12",
				"Reserved13",
				"Reserved14",
				"Reserved15",
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
				"Reserved30",
				"Reserved31",
				"Reserved21",
				"Reserved33",
				"Reserved34",
				"Reserved35",
		}
	},
};

char const* acSystemEventSettingChange[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_SETTING_CHANGE_COUNT] = {
	{
		"System",
		"Protection",
		"Knob",
		"ETC"
	},
	{
		"系统设定",
		"继电器设定",
		"旋钮更改",
		"等其他功能"
	},
	{
		"System",
		"Protection",
		"Knob",
		"ETC"
	},
};

char const* acSystemEventSettingChangeSmall[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_SETTING_CHANGE_COUNT][SYSTEM_EVENT_SETTING_CHANGE_SMALL_COUNT] = {
	{
		{	// System
			"DEVICE_DESCRIPTION_NAME",					// 0
			"Factory Configuration",										// 1
			"System configuration",										// 2
			"Time Setting",								// 3
			"Device H/W Profile",						// 4
			"Device S/W Profile",						// 5
			"Communication Setting",					// 6
			"Reserved7",
			"Device Life",								// 8
			"HW2 DO Setting",							// 9
			"Reserved10",
			"Reserved11",
			"Reserved12",
			"Reserved13",
			"Reserved14",
			"Reserved15",
			"Language Change",							// 16
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved11",
			"Reserved22",
			"Reserved23",
			"Reserved24",
			"Reserved25",
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved30",
			"Reserved31",
		},
		{	// Protection
			"L(Overload)",											// 0
			"S(Time-delayed overcurrent) Stage1",					// 1
			"S(Time-delayed overcurrent) Stage2",					// 2
			"I(Instantaneous overcurrent)",							// 3
			"G(Earth fault)",										// 4
			"N phase protection",									// 5
			"Gext(Earth fault on External CT)",						// 6
			"LN(Neutral protection)",								// 7
			"PTA(Pre Trip Alarm)",									// 8
			"UV(Undervoltage) Stage1",								// 9
			"UV(Undervoltage) Stage2",								// 10
			"OV(Overvoltage) Stage1",								// 11
			"OV(Overvoltage) Stage2",								// 12
			"RV(Residual overvoltage)",								// 13
			"D(Directional overcurrent)",							// 14
			"S(Voltage controlled overcurrent protection) Stage1",	// 15
			"S(Voltage controlled overcurrent protection) Stage2",	// 16
			"IU(Current unbalance)",								// 17
			"VU(Voltage unbalance)",								// 18
			"UF(Underfrequency) Stage1",							// 19
			"UF(Underfrequency) Stage2",							// 20
			"OF(Overfrequency) Stage1",								// 21
			"OF(Overfrequency) Stage2",								// 22
			"ROCOF(Rate of Change of Frequency)",					// 23
			"RP(Reverse Active Power)",								// 24
			"RQ(Loss of field or reverse reactive power) Stage1",	// 25
			"RQ(Loss of field or reverse reactive power) Stage2",	// 26
			"OP(Active Overpower)",									// 27
			"OQ(Reactive Overpower)",								// 28
			"UP(Active Underpower)",								// 29
			"Reserved30",
			"ZSI Use",												// 31
		},
		{	// Knob
			"L_IU",					// 0
			"L_Ir",					// 1
			"L_tr",					// 2
			"S_Is",					// 3
			"S_ts",					// 4
			"I_Ii",					// 5
			"G_Ig",					// 6
			"G_tg",					// 7
			"Gext_I n",			// 8
			"Gext_ t",				// 9
			//		"Gext_I¢n",			// 8
			//		"Gext_¢t",				// 9
			"PTA_Ip",				// 10
			"PTA_tp ",				// 11
			"Reserved12",
			"Reserved13",
			"Reserved14",
			"Reserved15",
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved11",
			"Reserved22",
			"Reserved23",
			"Reserved24",
			"Reserved25",
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved29",
			"Reserved30",
			"Reserved31",
		},
		{	// ETC
			"Language Change"
				"Reserved1",
				"Reserved2",
				"Reserved3",
				"Reserved4",
				"Reserved5",
				"Reserved6",
				"Reserved7",
				"Reserved8",
				"Reserved9",
				"Reserved10",
				"Reserved11",
				"Reserved12",
				"Reserved13",
				"Reserved14",
				"Reserved15",
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
			"Reserved30",
			"Reserved31",
		}
	},
	{
		{	// System
			"设备描述名称",					// 0
			"工厂配置",										// 1
			"系统配置",										// 2
			"时间设定",								// 3
			"装备硬件简介",						// 4
			"装备软件简介",						// 5
			"通信设置",					// 6
			"Reserved7",
			"装备寿命",								// 8
			"硬件2的DO设置",							// 9
			"Reserved10",
			"Reserved11",
			"Reserved12",
			"Reserved13",
			"Reserved14",
			"Reserved15",
			"语言变更",							// 16
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved11",
			"Reserved22",
			"Reserved23",
			"Reserved24",
			"Reserved25",
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved30",
			"Reserved31",
		},
		{	// Protection
			"长延时",											// 0
			"短延时阶段1",					// 1
			"短延时阶段2",					// 2
			"瞬时",							// 3
			"接地",										// 4
			"中性保护",									// 5
			"外部接地",						// 6
			"中性保护",								// 7
			"预报警",									// 8
			"欠压阶段1",								// 9
			"欠压阶段2",								// 10
			"过压阶段1",								// 11
			"过压阶段2",								// 12
			"剩余过电压",								// 13
			"电流方向",							// 14
			"电流控制过电流保护阶段1",	// 15
			"电流控制过电流保护阶段2",	// 16
			"电流不平衡",								// 17
			"电压不平衡",								// 18
			"频率下线阶段1",							// 19
			"频率下线阶段2",							// 20
			"过频阶段1",								// 21
			"过频阶段2",								// 22
			"频率变化率",					// 23
			"'反向有功功率",								// 24
			"丢失领域或反向无功功率阶段1",	// 25
			"丢失领域或反向无功功率阶段2",	// 26
			"有功功率过载",									// 27
			"无功功率过载",								// 28
			"有功功率过低",								// 29
			"Reserved30",
			"ZSI使用",								// 31
		},
		{	// Knob
			"过载_电流不平衡",					// 0
			"L_Ir",					// 1
			"L_tr",					// 2
			"S_Is",					// 3
			"S_ts",					// 4
			"I_Ii",					// 5
			"G_Ig",					// 6
			"G_tg",					// 7
			"Gext_I n",			// 8
			"Gext_ t",				// 9
			//		"Gext_I¢n",			// 8
			//		"Gext_¢t",				// 9
			"PTA_Ip",				// 10
			"PTA_tp ",				// 11
			"Reserved12",
			"Reserved13",
			"Reserved14",
			"Reserved15",
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved11",
			"Reserved22",
			"Reserved23",
			"Reserved24",
			"Reserved25",
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved29",
			"Reserved30",
			"Reserved31",
		},
		{	// ETC
			"语言变更"
				"Reserved1",
				"Reserved2",
				"Reserved3",
				"Reserved4",
				"Reserved5",
				"Reserved6",
				"Reserved7",
				"Reserved8",
				"Reserved9",
				"Reserved10",
				"Reserved11",
				"Reserved12",
				"Reserved13",
				"Reserved14",
				"Reserved15",
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
			"Reserved30",
			"Reserved31",
		}
	},
	{
		{	// System
			"DEVICE_DESCRIPTION_NAME",					// 0
			"HW1",										// 1
			"HW2",										// 2
			"Time Setting",								// 3
			"Device H/W Profile",						// 4
			"Device S/W Profile",						// 5
			"Communication Setting",					// 6
			"Reserved7",
			"Device Life",								// 8
			"HW2 DO Setting",							// 9
			"Reserved10",
			"Reserved11",
			"Reserved12",
			"Reserved13",
			"Reserved14",
			"Reserved15",
			"Language Change",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved11",
			"Reserved22",
			"Reserved23",
			"Reserved24",
			"Reserved25",
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved30",
			"Reserved31",
		},
		{	// Protection
			"L(Overload)",											// 0
			"S(Time-delayed overcurrent) Stage1",					// 1
			"S(Time-delayed overcurrent) Stage2",					// 2
			"I(Instantaneous overcurrent)",							// 3
			"G(Earth fault)",										// 4
			"N phase protection",									// 5
			"Gext(Earth fault on External CT)",						// 6
			"LN(Neutral protection)",								// 7
			"PTA(Pre Trip Alarm)",									// 8
			"UV(Undervoltage) Stage1",								// 9
			"UV(Undervoltage) Stage2",								// 10
			"OV(Overvoltage) Stage1",								// 11
			"OV(Overvoltage) Stage2",								// 12
			"RV(Residual overvoltage)",								// 13
			"D(Directional overcurrent)",							// 14
			"S(Voltage controlled overcurrent protection) Stage1",	// 15
			"S(Voltage controlled overcurrent protection) Stage2",	// 16
			"IU(Current unbalance)",								// 17
			"VU(Voltage unbalance)",								// 18
			"UF(Underfrequency) Stage1",							// 19
			"UF(Underfrequency) Stage2",							// 20
			"OF(Overfrequency) Stage1",								// 21
			"OF(Overfrequency) Stage2",								// 22
			"ROCOF(Rate of Change of Frequency)",					// 23
			"RP(Reverse Active Power)",								// 24
			"RQ(Loss of field or reverse reactive power) Stage1",	// 25
			"RQ(Loss of field or reverse reactive power) Stage2",	// 26
			"OP(Active Overpower)",									// 27
			"OQ(Reactive Overpower)",								// 28
			"UP(Active Underpower)",								// 29
			"Reserved30",
			"ZSI Use", 												// 31
		},
		{	// Knob
			"L_IU",					// 0
			"L_Ir",					// 1
			"L_tr",					// 2
			"S_Is",					// 3
			"S_ts",					// 4
			"I_Ii",					// 5
			"G_Ig",					// 6
			"G_tg",					// 7
			"Gext_I n",			// 8
			"Gext_ t",				// 9
			//		"Gext_I¢n",			// 8
			//		"Gext_¢t",				// 9
			"PTA_Ip",				// 10
			"PTA_tp ",				// 11
			"Reserved12",
			"Reserved13",
			"Reserved14",
			"Reserved15",
			"Reserved16",
			"Reserved17",
			"Reserved18",
			"Reserved19",
			"Reserved20",
			"Reserved11",
			"Reserved22",
			"Reserved23",
			"Reserved24",
			"Reserved25",
			"Reserved26",
			"Reserved27",
			"Reserved28",
			"Reserved29",
			"Reserved30",
			"Reserved31",
		},
		{	// ETC
			"Language Change"
				"Reserved1",
				"Reserved2",
				"Reserved3",
				"Reserved4",
				"Reserved5",
				"Reserved6",
				"Reserved7",
				"Reserved8",
				"Reserved9",
				"Reserved10",
				"Reserved11",
				"Reserved12",
				"Reserved13",
				"Reserved14",
				"Reserved15",
				"Reserved16",
				"Reserved17",
				"Reserved18",
				"Reserved19",
				"Reserved20",
				"Reserved11",
				"Reserved22",
				"Reserved23",
				"Reserved24",
				"Reserved25",
				"Reserved26",
				"Reserved27",
				"Reserved28",
				"Reserved29",
			"Reserved30",
			"Reserved31",
		}
	},
};

char const* acSystemEventSystemChange[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_SYSTEM_CHANGE_COUNT] = {
	{
		"Parameter Reset",
		"DO & CB Control",
	},
	{
		"数据清除",
		"断路器控制",
	},
	{
		"Parameter Reset",
		"DO & CB Control",
	},
};

char const* acSystemEventSystemChangeSmall[SETUP_LANGUAGE_MAX][SYSTEM_EVENT_SYSTEM_CHANGE_COUNT][SYSTEM_EVENT_SYSTEM_CHANGE_SMALL_COUNT] = {
{
	  {
		  "Fault reset",								// 0
		  "System event buffer clear",					// 1
		  "Fault event buffer clear",					// 2
		  "Energy reset (Wh, Varh, rWh, rVarh)",		// 3
		  "Max Demand reset",							// 4
		  "Max Watt reset",								// 5
		  "Max Internal Temperature reset",				// 6
		  "Max Vo reset",								// 7
		  "Max Io reset",								// 8
		  "Max ext Io reset",							// 9
		  "Max IN reset",								// 10
		  "Load Profile Clear",							// 11
		  "DI Counter Clear",							// 12
		  "DO Counter Clear",							// 13
		  "Global Reset",								// 14
		  "Running Time Reset",							// 15
		  "Energizing Cycle Reset",						// 16
		  "Reserved17",
		  "Reserved18",
		  "Reserved19",
		  "Reserved20",
		  "Max. W Reset by Key",						// 21
		  "Max. Var Reset by Key",						// 22
		  "Max. VA Reset by Key",						// 23
		  "Wh Reset by Key",							// 24
		  "Varh Reset by Key",							// 25
		  "VAh Reset by Key",							// 26
		  "Test Trip by Key",							// 27
	  },
	  {
		  "DO#1 Control",								// 0
		  "DO#2 Control",								// 1
		  "DO#3 Control",								// 2
		  "DO#4 Control",								// 3
		  "DO#5 Control",								// 4
		  "DO#6 Control",								// 5
		  "Reserved6",
		  "Reserved7",
		  "Reserved8",
		  "Reserved9",
		  "Reserved10",
		  "Reserved11",
		  "Reserved12",
		  "Reserved13",
		  "Reserved14",
		  "Reserved15",
		  "CB ON",										// 16
		  "CB OFF",										// 17
		  "CB RESET",									// 18
		  "Reserved19",
		  "Reserved20",
		  "Reserved21",
		  "Reserved22",
		  "Reserved23",
		  "Reserved24",
		  "Reserved25",
		  "Reserved26",
		  "Reserved27",
	},
},
{
	  {
		  "故障复位",										// 0
		  "系统事件缓存清除",								// 1
		  "故障事件缓存清除",								// 2
		  "能量复位",										// 3
		  "最大要求复位",									// 4
		  "最大瓦特复位",									// 5
		  "最大内部温度复位",								// 6
		  "最大映像电压复位",								// 7
		  "最大映像电流复位",								// 8
		  "最大外部映像电流复位",								// 9
		  "最大IN复位",									// 10
		  "加载配置清楚",									// 11
		  "DII计数器清除",									// 12
		  "DOI计数器清除",									// 13
		  "全局复位",										// 14
		  "运行时间重置",
		  "通电循环复位",
		  "Reserved17",
		  "Reserved18",
		  "Reserved19",
		  "Reserved20",
		  "Max. W 按键重置",							// 21
		  "Max. Var 按键重置",						// 22
		  "Max. VA 按键重置",							// 23
		  "Wh 按键重置",								// 24
		  "Varh 按键重置",							// 25
		  "VAh 按键重置",								// 26
		  "按键试验脱扣",								// 27
	  },
	  {
		  "DO#1 控制",								// 0
		  "DO#2 控制",								// 1
		  "DO#3 控制",								// 2
		  "DO#4 控制",								// 3
		  "DO#5 控制",								// 4
		  "DO#6 控制",								// 5
		  "Reserved6",
		  "Reserved7",
		  "Reserved8",
		  "Reserved9",
		  "Reserved10",
		  "Reserved11",
		  "Reserved12",
		  "Reserved13",
		  "Reserved14",
		  "Reserved15",
		  "断路器开启",										// 16
		  "断路器关闭",										// 17
		  "断路器复位",									// 18
		  "Reserved19",
		  "Reserved20",
		  "Reserved21",
		  "Reserved22",
		  "Reserved23",
		  "Reserved24",
		  "Reserved25",
		  "Reserved26",
		  "Reserved27",
	},
},
{
	  {
		  "Fault reset",								// 0
		  "System event buffer clear",					// 1
		  "Fault event buffer clear",					// 2
		  "Energy reset (Wh, Varh, rWh, rVarh)",		// 3
		  "Max Demand reset",							// 4
		  "Max Watt reset",								// 5
		  "Max Internal Temperature reset",				// 6
		  "Max Vo reset",								// 7
		  "Max Io reset",								// 8
		  "Max ext Io reset",							// 9
		  "Max IN reset",								// 10
		  "Load Profile Clear",							// 11
		  "DI Counter Clear",							// 12
		  "DO Counter Clear",							// 13
		  "Global Reset",								// 14
		  "Running Time Reset",							// 15
		  "Energizing Cycle Reset",						// 16
		  "Reserved17",
		  "Reserved18",
		  "Reserved19",
		  "Reserved20",
		  "Max. W Reset by Key",						// 21
		  "Max. Var Reset by Key",						// 22
		  "Max. VA Reset by Key",						// 23
		  "Wh Reset by Key",							// 24
		  "Varh Reset by Key",							// 25
		  "VAh Reset by Key",							// 26
		  "Test Trip by Key",							// 27
	  },
	  {
		  "DO#1 Control",								// 0
		  "DO#2 Control",								// 1
		  "DO#3 Control",								// 2
		  "DO#4 Control",								// 3
		  "DO#5 Control",								// 4
		  "DO#6 Control",								// 5
		  "Reserved6",
		  "Reserved7",
		  "Reserved8",
		  "Reserved9",
		  "Reserved10",
		  "Reserved11",
		  "Reserved12",
		  "Reserved13",
		  "Reserved14",
		  "Reserved15",
		  "CB ON",										// 16
		  "CB OFF",										// 17
		  "CB RESET",									// 18
		  "Reserved19",
		  "Reserved20",
		  "Reserved21",
		  "Reserved22",
		  "Reserved23",
		  "Reserved24",
		  "Reserved25",
		  "Reserved26",
		  "Reserved27",
	},
},
};

// AcbMccbMeasurement.c
char const* _acPQS_unit[PQS_UNIT_COUNT] = {
	"W",
	"Var",
	"VA"
};


const GUI_POINT cPtAngle[PQS_UNIT_COUNT] = {
	{10, 15},
	{0, 25},
	{10, 25}
};


char const* _acmeasurementPQ_unit_text[PQS_UNIT2_COUNT] = {
	"Hz",
	"%",
	"%",
	"%"
};


char const* _acmeasurementPQ_V_text[PQS_UNIT_COUNT] = {
	"VA",
	"VB",
	"VC"
};

char const* _acmeasurementPQ_I_text[PQS_UNIT_COUNT] = {
	"IA",
	"IB",
	"IC"
};

//int PQ_LABEL_X[PQS_UNIT_COUNT][XY_POS_CNT] = {
//	{175,175+22},
//	{270,270+22},
//	{365,365+22}
//};
//
//int PQ_VALUE_X[PQS_UNIT_COUNT][XY_POS_CNT] = {
//	{175+22,175+55},
//	{270+22,270+55},
//	{365+22,365+55}
//};
//
//int PQ_UNIT_X[PQS_UNIT_COUNT][XY_POS_CNT] = {
//	{175+55+5,175+60+25},
//	{270+55+5,270+60+25},
//	{365+55+5,365+60+25}
//};

int PQ_LABEL_X[PQS_UNIT_COUNT][XY_POS_CNT] = {
	{175,175+40},
	{270,270+40},
	{365,365+40}
};

int PQ_VALUE_X[PQS_UNIT_COUNT][XY_POS_CNT] = {
	{175+42,175+72},
	{270+42,270+72},
	{365+42,365+72}
};

int PQ_UNIT_X[PQS_UNIT_COUNT][XY_POS_CNT] = {
	{175+72+2,175+72+21},
	{270+72+2,270+72+21},
	{365+72+2,365+72+21}
};

char const* _acmeasurementDemand_unit[DEMAND_COUNT] = {
	"A",
	"A",
	"A",
	"W",
	"Var",
	"VA"
};

//MenuDlg.c


//MlinkIoSet.c
char const* _acappdesc_label_text[SETUP_LANGUAGE_MAX][MLINK_MODE_DESC_KIND][MLINK_MODE_DESC_ROW_CNT] = {
	{
		{
			"M1 : General DI/DO",
			"DI - Contact, Pulse",
			"DO - Relay",
			""
		},
		{
			"M2 : Remote Breaker Control",
			"DI - Breaker Status",
			"DO - Breaker Control",
			""
		},
		{
			"M3 : Remote/Local Breaker Control",
			"DI - Breaker Control Local Input",
			"      Breaker Status",
			"DO - Breaker Control",

		},
		{
			"M4 : Local Load Control",
			"DI - Load Control Local Input",
			"DO - Load Control",
			""
		},
		{
			"M5 : General DI",
			"DI - Contact, Pulse",
			"DO - Not Used",
			""
		},
	},
	{
		{
			"M1 : 通用 DI/DO",
			"DI - 触头, 脉冲",
			"DO - 继电器",
			""
		},
		{
			"M2 : 远程断路器控制",
			"DI - 断路器状态",
			"DO - 断路器控制",
			""
		},
		{
			"M3 : 远程/本地断路器控制",
			"DI - 断路器控制本地",
			"       输入断路器状态",
			"DO - 断路器控制",

		},
		{
			"M4 : 本地负荷控制",
			"DI - 负荷控制本地输入",
			"DO - 负荷控制",
			""
		},
		{
			"M5 : 通用 DI",
			"DI - 触头, 脉冲",
			"DO - 未使用",
			""
		},
	},
	{
		{
			"M1 : General DI/DO",
			"DI - Contact, Pulse",
			"DO - Relay",
			""
		},
		{
			"M2 : Remote Breaker Control",
			"DI - Breaker Status",
			"DO - Breaker Control",
			""
		},
		{
			"M3 : Remote/Local Breaker Control",
			"DI - Breaker Control Local Input",
			"      Breaker Status",
			"DO - Breaker Control",

		},
		{
			"M4 : Remote/Local Load Control",
			"DI - Load Control Local Input",
			"DO - Load Control",
			""
		},
		{
			"M5 : General DI",
			"DI - Contact, Pulse",
			"DO - Not Used",
			""
		},
	},
};

// modbus.c
/* Table of CRC values for high-order byte */
const uint8_t auchCRCHi[] = {
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
	0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,
	0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,
	0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81,
	0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,
	0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,
	0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
	0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,
	0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,
	0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
	0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,
	0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,
	0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
	0x40
} ;

/* Table of CRC values for low-order byte */
const uint8_t auchCRCLo[] = {
	0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7, 0x05, 0xC5, 0xC4,
	0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E, 0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09,
	0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9, 0x1B, 0xDB, 0xDA, 0x1A, 0x1E, 0xDE, 0xDF, 0x1F, 0xDD,
	0x1D, 0x1C, 0xDC, 0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,
	0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32, 0x36, 0xF6, 0xF7,
	0x37, 0xF5, 0x35, 0x34, 0xF4, 0x3C, 0xFC, 0xFD, 0x3D, 0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A,
	0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE,
	0x2E, 0x2F, 0xEF, 0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,
	0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1, 0x63, 0xA3, 0xA2,
	0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4, 0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F,
	0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 0x69, 0xA9, 0xA8, 0x68, 0x78, 0xB8, 0xB9, 0x79, 0xBB,
	0x7B, 0x7A, 0xBA, 0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,
	0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0, 0x50, 0x90, 0x91,
	0x51, 0x93, 0x53, 0x52, 0x92, 0x96, 0x56, 0x57, 0x97, 0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C,
	0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E, 0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88,
	0x48, 0x49, 0x89, 0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,
	0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83, 0x41, 0x81, 0x80,
	0x40
} ;

E_ACB_TYPE gAcbType[DEVICE_MAX];


