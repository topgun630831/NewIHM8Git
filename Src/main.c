/**
******************************************************************************
* File Name          : main.c
* Description        : Main program body
******************************************************************************
* This notice applies to any and all portions of this file
* that are not between comment pairs USER CODE BEGIN and
* USER CODE END. Other portions of this file, whether
* inserted by the user or by software development tools
* are owned by their respective copyright owners.
*
* Copyright (c) 2018 STMicroelectronics International N.V.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted, provided that the following conditions are met:
*
* 1. Redistribution of source code must retain the above copyright notice,
*    this list of conditions and the following disclaimer.
* 2. Redistributions in binary form must reproduce the above copyright notice,
*    this list of conditions and the following disclaimer in the documentation
*    and/or other materials provided with the distribution.
* 3. Neither the name of STMicroelectronics nor the names of other
*    contributors to this software may be used to endorse or promote products
*    derived from this software without specific written permission.
* 4. This software, including modifications and/or derivative works of this
*    software, must execute solely and exclusively on microcontroller or
*    microprocessor devices manufactured by or for STMicroelectronics.
* 5. Redistribution and use of this software other than as permitted under
*    this license is void and will automatically terminate your rights under
*    this license.0000000000000000000000
*
* THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT
* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
* PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
* RIGHTS ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT
* SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
* INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
* LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
* OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
* EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
******************************************************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32f4xx_hal.h"
#include "usb_device.h"
#include "usb_host.h"
#include "dma.h"

/* USER CODE BEGIN Includes */
#if 0 //[[ by kys.2017.12.31_BEGIN -- cdc사용시만
#include "usbd_cdc_if.h" //__USBD_CDC_IF_H
#endif //]] by kys.2017.12.31_END -- cdc사용시만
#include "RTOS.h"
#include "lcd.h"
#include "ads7843_ts.h"
#include "backlight.h"
#include "WM.h"
#define EXTERN
#include "GuiData.h"
#include "modbus.h"


#include "stm32f4xx_hal_flash_ex.h"

//#include "stm32f4xx_flash.h"

/* USER CODE END Includes */

//#define COMM_TEST

//static void ReceiveTask(void);
static void EmWinTask(void);
static void OS_HAL_Init(void);
static void OS_Sysclock_Config(void);
static void Board_Init(void);
static uint32_t GetSector(uint32_t Address);
static void rtc_Transmit(uint8_t *pData, uint16_t Size);
static void PCF2129_set_register( uint8_t addr, uint8_t data );
static uint8_t PCF2129_read_register( uint8_t addr );
static uint8_t i2bcd( uint8_t n );
static uint8_t bcd2i( uint8_t bcd );

/* Private variables ---------------------------------------------------------*/
static I2C_HandleTypeDef hi2c2;

// PRQA S 1514 ++
SPI_HandleTypeDef hspi3;
TIM_HandleTypeDef htim4;
UART_HandleTypeDef huart1;
// PRQA S 1504 ++
UART_HandleTypeDef huart2;
// PRQA S 3408 ++
UART_HandleTypeDef huart6;
DMA_HandleTypeDef hdma_usart1_rx;
DMA_HandleTypeDef hdma_usart1_tx;
DMA_HandleTypeDef hdma_usart2_rx;
DMA_HandleTypeDef hdma_usart2_tx;
IWDG_HandleTypeDef hiwdg;
// PRQA S 3408 --
// PRQA S 1514 --
// PRQA S 1504 --

/*Variable used for Erase procedure*/
static FLASH_EraseInitTypeDef EraseInitStruct;

bool gDisplay;
bool gFrameDisplay;
#if __WATCHDOG__
static void MX_IWDG_Init(void);
#define RELOAD_TIME				10000		//1000;	// 5sec // 32khz /32 = 1khz = 1000hz = 1sec
#endif

/* USER CODE BEGIN PV */
#define __DBG__

#if 0 //[[ by kys.2017.12.30_BEGIN -- comment
#ifdef USB_HS_MAX_PACKET_SIZE					// usbd_def.h
#endif
#ifdef CDC_DATA_HS_MAX_PACKET_SIZE		// usbd_cdc.h
#endif
#endif //]] by kys.2017.12.30_END -- comment


/* Private variables ---------------------------------------------------------*/
#ifdef __DBG__
#ifdef __GNUC__
/* With GCC, small printf (option LD Linker->Libraries->Small printf
set to 'Yes') calls __io_putchar() */
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif /* __GNUC__ */

/**
* @brief  Retargets the C library printf function to the USART.
* @param  None
* @retval None
*/

// PRQA S 1330 ++
// PRQA S 4603 ++
// PRQA S 1503 ++
PUTCHAR_PROTOTYPE
{
	/* Place your implementation of fputc here */
	/* e.g. write a character to the USART2 and Loop until the end of
	transmission */
// PRQA S 0310 1
	HAL_NVIC_DisableIRQ(USART6_IRQn); //Rx Callback 함수 Disable
	(void)HAL_UART_Transmit(&huart6, (uint8_t *)&ch, 1, UART_TIMEOUT);
	HAL_NVIC_EnableIRQ(USART6_IRQn); //Rx Callback 함수 Disable
	return ch;
}
// PRQA S 1330 --
// PRQA S 4603 --
// PRQA S 1503 --
#endif

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
static void MX_GPIO_Init(void);
static void MX_USART6_UART_Init(void);
static void MX_FSMC_Init(void);
static void MX_TIM4_Init(void);
static void MX_SPI3_Init(void);
static void MX_CRC_Init(void);
static void MX_NVIC_Init(void);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* USER CODE END PFP */

/* USER CODE BEGIN 0 */
#define RX_BUFF_SIZE  (1*1024)    /* Max Received data 1KB */
#define TX_BUFF_SIZE  (1*1024)

static void Pcf2129AT_init(void);

extern S_DATE_TIME changeDateTime;


/* Private variables ---------------------------------------------------------*/

/* USER CODE END PV */

__STATIC_INLINE void Pol_Delay_us(volatile uint32_t microseconds)
{
	/* Go to number of cycles for system */
	microseconds *= (SystemCoreClock / 1000000);   /* Delay till end */
	while (microseconds--);
}
void HAL_UART_ErrorCallback(UART_HandleTypeDef *huart)
{
	if(huart->Instance==USART1)
	{
		printf("(uart1)HAL_UART_ErrorCallback!(%x)\n", huart->ErrorCode);
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_RESET);
		__HAL_UART_CLEAR_PEFLAG(&huart1);
		__HAL_UART_CLEAR_OREFLAG(&huart1);
		__HAL_UART_CLEAR_FEFLAG(&huart1);
		__HAL_UART_CLEAR_NEFLAG(&huart1);
		__HAL_UART_CLEAR_IDLEFLAG(&huart1);
		HAL_UART_DMAStop(&huart1);
		Pol_Delay_us(15000);
		HAL_UART_MspDeInit(&huart1);
		HAL_UART_MspInit(&huart1);
		HAL_UART_Receive_DMA(&huart1, uart1_dma_rx_buff, UART1_DMA_RX_BUFF_SIZE);
		uart1LastNDTR = huart1.hdmarx->Instance->NDTR;
		g_modbusSlaveRxIndex = 0;
	}
	else if(huart->Instance==USART2)
	{
		printf("(uart2)HAL_UART_ErrorCallback!(%x)\n", huart->ErrorCode);
  		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_RESET);
		__HAL_UART_CLEAR_PEFLAG(&huart2);
		__HAL_UART_CLEAR_OREFLAG(&huart2);
		__HAL_UART_CLEAR_FEFLAG(&huart2);
		__HAL_UART_CLEAR_NEFLAG(&huart2);
		__HAL_UART_CLEAR_IDLEFLAG(&huart2);
		HAL_UART_DMAStop(&huart2);
		Pol_Delay_us(15000);
		HAL_UART_MspDeInit(&huart2);
		HAL_UART_MspInit(&huart2);
		HAL_UART_Receive_DMA(&huart2, uart2_dma_rx_buff, UART2_DMA_RX_BUFF_SIZE);
		uart2LastNDTR = huart2.hdmarx->Instance->NDTR;
		g_modbusRxIndex = 0;
//		sendFlag = 0;
	}
}

uint8_t rx6_data;
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	if(huart->Instance == USART6)
	{
		HAL_UART_Receive_IT(&huart6, &rx6_data, 1);
		if(rx6_data == '1')
		{
			gDebug = true;
			printf("\n\ngDebug : %d\n", gDebug);
		}
		else
		if(rx6_data == '2')
		{
			gDisplay = true;
			printf("\n\ngDisplay : %d\n", gDisplay);
		}
		else
		if(rx6_data == '3')
		{
			gFrameDisplay = true;
			printf("\n\gFrameDisplay : %d\n", gFrameDisplay);
		}
		else if(rx6_data == '0')
		{
			gDebug = false;
			gDisplay = false;
			gFrameDisplay = false;
			printf("\n\ngDebug : %d\n", gDebug);
		}
		else if(rx6_data == '4')
		{
        	HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM1, GPIO_PIN_SET);
			printf("\n\ngUart1 Terminate ON\n");
		}
		else if(rx6_data == '5')
		{
        	HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM1, GPIO_PIN_RESET);
			printf("\n\ngUart1 Terminate OFF\n");
		}
		else if(rx6_data == '6')
		{
        	HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM2, GPIO_PIN_SET);
			printf("\n\ngUart2 Terminate ON\n");
		}
		else if(rx6_data == '7')
		{
        	HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM2, GPIO_PIN_RESET);
			printf("\n\ngUart2 Terminate OFF\n");
		}
		else if(rx6_data == 'a')
		{
			printf("\n\n\n\naaaaaaaaaaaa\n\n\n\n");
		}
	}
	if(huart->Instance == USART1)
	{
	}
	else
	if(huart->Instance == USART2)
	{
	}
}

static void EmWinTask(void)
{
	/* Init the STemWin GUI Library */
	(void)GUI_Init();

	/* Activate the use of memory device feature */
	(void)WM_SetCreateFlags(WM_CF_MEMDEV);

#if __WATCHDOG__ //[[ by kys.2018.06.17_BEGIN -- watchdog
//    MX_IWDG_Init();
//    // iwdg reset 확인
//    if (RESET != __HAL_RCC_GET_FLAG(RCC_FLAG_IWDGRST))
//    {
//        HAL_GPIO_WritePin(USER_LED_GPIO_Port, USER_LED_Pin, GPIO_PIN_SET);
//        __HAL_RCC_CLEAR_RESET_FLAGS();
//    }
//    else
//    {
//        HAL_GPIO_WritePin(USER_LED_GPIO_Port, USER_LED_Pin, GPIO_PIN_RESET);
//    }
//    // iwdg start
//    __HAL_IWDG_START(&hiwdg);
#endif //]] by kys.2018.06.17_END -- watchdog

    GUI_UC_SetEncodeUTF8();

	GuiMain();

}

//////////////////////////////////////////////////////////////////////////////
static void OS_HAL_Init(void)
{
    SCB->VTOR = USER_PROG_VECTOR;
	/* Configure Flash prefetch, Instruction cache, Data cache */
#if (INSTRUCTION_CACHE_ENABLE != 0U)
	__HAL_FLASH_INSTRUCTION_CACHE_ENABLE();
#endif /* INSTRUCTION_CACHE_ENABLE */

#if (DATA_CACHE_ENABLE != 0U)
	__HAL_FLASH_DATA_CACHE_ENABLE();
#endif /* DATA_CACHE_ENABLE */

#if (PREFETCH_ENABLE != 0U)
	__HAL_FLASH_PREFETCH_BUFFER_ENABLE();
#endif /* PREFETCH_ENABLE */

	/* Set Interrupt Group Priority */
	HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_4);

	/* Use systick as time base source and configure 1ms tick (default clock after Reset is HSI) */
	(void)HAL_InitTick(TICK_INT_PRIORITY);

#if 0 //[[ by kys.2017.12.30_BEGIN -- test
	/* Init the low level hardware */
	HAL_MspInit();      //
#endif //]] by kys.2017.12.30_END -- test

	/* Return function status */
}

static void OS_Sysclock_Config(void)
{

	RCC_OscInitTypeDef RCC_OscInitStruct;
	RCC_ClkInitTypeDef RCC_ClkInitStruct;

	/**Configure the main internal regulator output voltage
	*/
	__HAL_RCC_PWR_CLK_ENABLE();
	__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);


	/**Initializes the CPU, AHB and APB busses clocks
	*/
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
	RCC_OscInitStruct.HSEState = RCC_HSE_ON;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
	RCC_OscInitStruct.PLL.PLLM = INDEX_4;
	RCC_OscInitStruct.PLL.PLLN = CLOCK_PLLN;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = INDEX_7;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

	/**Initializes the CPU, AHB and APB busses clocks
	*/
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
		|RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}


	//HAL_RCC_MCOConfig(RCC_MCO2, RCC_MCO2SOURCE_SYSCLK, RCC_MCODIV_4); // for test
}

/*
void HAL_Delay(uint32_t Delay)
{
  uint32_t tickstart = HAL_GetTick();
  while ((HAL_GetTick() - tickstart) < Delay)
  {
  }
}
*/
static void Board_Init(void)
{

	// spi3 TS CS High => Disable
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_SET);		//TS_CS :  HIGH DIS


	if( HAL_GPIO_ReadPin(GPIOE, GPIO_PIN_1) == GPIO_PIN_SET){
		;
	}
	else{		/* status of RESET */
		;
	}

	// B/T Reset
	// GPIO PE0 -
	// High(10ms) -> Low(100ms) -> High(10ms)
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_0, GPIO_PIN_SET);
	HAL_Delay(TEN);
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_0, GPIO_PIN_RESET);
	HAL_Delay(HUNDRED);
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_0, GPIO_PIN_SET);
	HAL_Delay(TEN);


	// Setup lcd
	LCD_init();
	LCD_Clear(0, 0, MAX_HEIGHT, MAX_WIDTH, Black);
}

void TerminateSet(void)
{
	if(SettingValue[SETUP_TERM1_USE] == 1)
		HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM1, GPIO_PIN_SET);
	else
		HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM1, GPIO_PIN_RESET);

	if(SettingValue[SETUP_TERM2_USE] == 1)
		HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM2, GPIO_PIN_SET);
	else
		HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM2, GPIO_PIN_RESET);
}
/* USER CODE END 0 */
//static int gDnFlag = 0;

//#define BOR_LEVEL OB_BOR_OFF /*!< BOR Reset threshold levels for 1.62V - 2.10V VDD power supply  */
//#define BOR_LEVEL OB_BOR_LEVEL1  /*!< BOR Reset threshold levels for 2.10V - 2.40V VDD power supply */
#define BOR_LEVEL OB_BOR_LEVEL2  /*!< BOR Reset threshold levels for 2.40V - 2.70V VDD power supply */
//#define BOR_LEVEL OB_BOR_LEVEL3  /*!< BOR Reset threshold levels for 2.70V - 3.60V VDD power supply */
#define BOR_LEVEL_MASK	0x0c
int main(void)
{
	static OS_STACKPTR int StackEmWin[EMWIN_STACK_SIZE];
	static OS_TASK         TCBEMWIN;         /* Task-control-blocks */

	/* USER CODE BEGIN 1 */
	OS_HAL_Init();
	OS_Sysclock_Config();

	/* USER CODE END SysInit */

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
    MX_DMA_Init();
	MX_USART6_UART_Init();
	MX_NVIC_Init();

	FLASH_OBProgramInitTypeDef FLASH_Handle;

	/* Read option bytes */
	HAL_FLASHEx_OBGetConfig(&FLASH_Handle);

	MX_CRC_Init();
	MX_FSMC_Init();

	MX_TIM4_Init();
	MX_SPI3_Init();

	gDebug = false;

	HAL_UART_Receive_IT(&huart6, &rx6_data, 1);

	if ((FLASH_Handle.BORLevel & BOR_LEVEL_MASK) != BOR_LEVEL)
	{
		/* Set new value */

		/* Select the desired V(BOR) Level */
		FLASH_Handle.BORLevel = (uint32_t)BOR_LEVEL;
		FLASH_Handle.OptionType = OPTIONBYTE_BOR;

		/* Unlocks the option bytes block access */
		HAL_FLASH_OB_Unlock();

		/* Set value */
		HAL_FLASHEx_OBProgram(&FLASH_Handle);

//		HAL_StatusTypeDef status;
		/* Launch the option byte loading */
		(void)HAL_FLASH_OB_Launch();

		/* Lock access to registers */
		HAL_FLASH_OB_Lock();
	}

#ifndef COMM_TEST

	HAL_GPIO_TogglePin(USER_LED_GPIO_Port, USER_LED_Pin);
	MX_I2C2_Init();


	Board_Init();
	User_Pwm_Setup();

	FlashRead();
	SettingValue[SETUP_LANGUAGE] = 0;

	TerminateSet();

	FaultCountRead();

	MX_USART1_UART_Init();
	MX_USART2_UART_Init();

    MasterSendLength[OWNER_MASTER] = MasterSendLength[OWNER_SLAVE] = SlaveSendLength = 0;


	BacklightBrghtness(SettingValue[SETUP_BRIGHTNESS], FALSE);
#else
	MX_USART2_UART_Init();
	uint8_t c;

	printf("IHM8 CommTest.......................\n");
	while(1)
	{
		if(huart2.RxState & HAL_UART_STATE_READY)
		{
			HAL_UART_Receive(&huart2, &c, 1, 1);

			volatile int i,j;
			for(i = 0; i < 1000; i++) 	//1mS Delay
			for(j = 0; j < 15; j++) ;	//1mS Delay

			HAL_UART_Transmit(&huart2, &c, 1, 1);
		}
	}

#endif
	OS_InitKern();                   /* Initialize OS                 */
	OS_InitHW();                     /* Initialize Hardware for OS    */

	Pcf2129AT_init();

#if __WATCHDOG__ //[[ by kys.2018.06.17_BEGIN -- watchdog
    MX_IWDG_Init();
    // iwdg reset 확인
    if (RESET != __HAL_RCC_GET_FLAG(RCC_FLAG_IWDGRST))
    {
        HAL_GPIO_WritePin(USER_LED_GPIO_Port, USER_LED_Pin, GPIO_PIN_SET);
        __HAL_RCC_CLEAR_RESET_FLAGS();
    }
    else
    {
        HAL_GPIO_WritePin(USER_LED_GPIO_Port, USER_LED_Pin, GPIO_PIN_RESET);
    }
    // iwdg start
    __HAL_IWDG_START(&hiwdg);
#endif

	(void)printf("\n\r");
	(void)printf("\n\r*************************");
	(void)printf("\n\r New IHM8 S/W Ver %s", _acinfo_value_text[3]);

	(void)printf("\n\r Modbus Version\n\r%s\n\r", _acinfo_modebus_version);
	(void)printf("\n\r Devie Count : %d", SettingValue[SETUP_DEVICE_COUNT]);
	(void)printf("\n\r starting..");
	(void)printf("\n\r*************************");
	(void)printf("\n\r");

//	OS_CREATETASK(&TCBRECEIVE, "Receive Task", &ReceiveTask,  RECV_PRORITY, StackReceive);										// System
	OS_CREATETASK(&TCBEMWIN, "emWin Task", &EmWinTask,  EMWIN_PRORITY, StackEmWin);									// emWin
// PRQA S 3200 ++
// PRQA S 3335 ++
	OS_Start();                      /* Start multitasking            */
// PRQA S 3200 --
// PRQA S 3335 --

	return 0;
	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	/* USER CODE END 3 */

}



/* I2C2 init function */
static void MX_I2C2_Init(void)
{

  hi2c2.Instance = I2C2;
  hi2c2.Init.ClockSpeed = I2C2_CLOCKSPEED;
  hi2c2.Init.DutyCycle = I2C_DUTYCYCLE_2;
  hi2c2.Init.OwnAddress1 = 0;
  hi2c2.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c2.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c2.Init.OwnAddress2 = 0;
  hi2c2.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c2.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c2) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}

/* RTC init function */
#if 0
static void MX_RTC_Init(void)
{
	/**Initialize RTC Only
	*/
	hrtc.Instance = RTC;
	hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
	hrtc.Init.AsynchPrediv = 127;
	hrtc.Init.SynchPrediv = 255;
	hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
	hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
	hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
	if (HAL_RTC_Init(&hrtc) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

	/**Initialize RTC and set the Time and Date
	*/
	if(HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR0) != 0x32F2)
	{
		if (HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BCD) != HAL_OK)
		{
			_Error_Handler(__FILE__, __LINE__);
		}

		if (HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BCD) != HAL_OK)
		{
			_Error_Handler(__FILE__, __LINE__);
		}

		HAL_RTCEx_BKUPWrite(&hrtc,RTC_BKP_DR0,0x32F2);
	}
}
#endif

/* CRC init function */
static void MX_CRC_Init(void)
{
	static CRC_HandleTypeDef hcrc;

	hcrc.Instance = CRC;
	if (HAL_CRC_Init(&hcrc) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

}

/* SPI3 init function */
static void MX_SPI3_Init(void)
{

	/* SPI3 parameter configuration*/
	hspi3.Instance = SPI3;
	hspi3.Init.Mode = SPI_MODE_MASTER;
	hspi3.Init.Direction = SPI_DIRECTION_2LINES;
	hspi3.Init.DataSize = SPI_DATASIZE_8BIT;
	hspi3.Init.CLKPolarity = SPI_POLARITY_LOW;
	hspi3.Init.CLKPhase = SPI_PHASE_1EDGE;
	hspi3.Init.NSS = SPI_NSS_SOFT;
	hspi3.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_32;
	hspi3.Init.FirstBit = SPI_FIRSTBIT_MSB;
	hspi3.Init.TIMode = SPI_TIMODE_DISABLE;
	hspi3.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
	hspi3.Init.CRCPolynomial = INDEX_10;
	if (HAL_SPI_Init(&hspi3) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

}

/* TIM4 init function */
static void MX_TIM4_Init(void)
{

	TIM_MasterConfigTypeDef sMasterConfig;
	TIM_OC_InitTypeDef sConfigOC;

	htim4.Instance = TIM4;
	htim4.Init.Prescaler = 0;
	htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim4.Init.Period = 0;
	htim4.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	if (HAL_TIM_PWM_Init(&htim4) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

	sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
	sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
	if (HAL_TIMEx_MasterConfigSynchronization(&htim4, &sMasterConfig) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

	sConfigOC.OCMode = TIM_OCMODE_PWM1;
	sConfigOC.Pulse = 0;
	sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
	sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
	if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

	HAL_TIM_MspPostInit(&htim4);

}

#ifdef COMM_TEST
/* USART1 init function */
void MX_USART1_UART_Init(void)
{

	huart1.Instance = USART1;
	huart1.Init.BaudRate = DEFAULT_COMM_SPEED;
	huart1.Init.WordLength = UART_WORDLENGTH_8B;
	huart1.Init.StopBits = UART_STOPBITS_1;
	huart1.Init.Parity = UART_PARITY_NONE;
	huart1.Init.Mode = UART_MODE_TX_RX;
	huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart1.Init.OverSampling = UART_OVERSAMPLING_16;
	if (HAL_UART_Init(&huart1) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}
}

/* USART2 init function */
// PRQA S 1503 1
void MX_USART2_UART_Init(void)
{
	huart2.Instance = USART2;
	huart2.Init.BaudRate = 57600;
	huart2.Init.WordLength = UART_WORDLENGTH_8B;
	huart2.Init.StopBits = UART_STOPBITS_1;
	huart2.Init.Parity = UART_PARITY_NONE;
	huart2.Init.Mode = UART_MODE_TX_RX;
	huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart2.Init.OverSampling = UART_OVERSAMPLING_16;
	if (HAL_UART_Init(&huart2) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

}
#else

void MX_USART1_UART_Init(void)
{

  huart1.Instance = USART1;
  huart1.Init.BaudRate = setup_speed[SettingValue[SETUP_SPEED]];
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }

}
/* USART2 init function */

void MX_USART2_UART_Init(void)
{

  huart2.Instance = USART2;
  huart2.Init.BaudRate = setup_speed[SettingValue[SETUP_SPEED]];
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }

}
/* USART6 init function */
#endif

/* USART6 init function */
// PRQA S 1503 1
static void MX_USART6_UART_Init(void)
{

	huart6.Instance = USART6;
	huart6.Init.BaudRate = DEBUG_COMM_SPEED;
	huart6.Init.WordLength = UART_WORDLENGTH_8B;
	huart6.Init.StopBits = UART_STOPBITS_1;
	huart6.Init.Parity = UART_PARITY_NONE;
	huart6.Init.Mode = UART_MODE_TX_RX;
	huart6.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart6.Init.OverSampling = UART_OVERSAMPLING_16;
	if (HAL_UART_Init(&huart6) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

}

/** Configure pins as
* Analog
* Input
* Output
* EVENT_OUT
* EXTI
*/
static void MX_GPIO_Init(void)
{

	GPIO_InitTypeDef GPIO_InitStruct;

	/* GPIO Ports Clock Enable */
	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();
	__HAL_RCC_GPIOD_CLK_ENABLE();
	__HAL_RCC_GPIOE_CLK_ENABLE();
	__HAL_RCC_GPIOH_CLK_ENABLE();



  	/*Configure GPIO pin : 사용하지 않는 핀 처리 */
	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_9 | GPIO_PIN_13 ;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_1, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_5, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_6, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_RESET);

	GPIO_InitStruct.Pin = GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_8 | GPIO_PIN_9 | GPIO_PIN_12 | GPIO_PIN_13 | GPIO_PIN_14  | GPIO_PIN_15 |  GPIO_PIN_6  | GPIO_PIN_7;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_2, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_3, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_4, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_5, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_9, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_12, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_13, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_14, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_15, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_6, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_7, GPIO_PIN_RESET);

	GPIO_InitStruct.Pin = GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_6 | GPIO_PIN_12 | GPIO_PIN_13;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

	HAL_GPIO_WritePin(GPIOD, GPIO_PIN_2, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOD, GPIO_PIN_3, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOD, GPIO_PIN_6, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOD, GPIO_PIN_12, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOD, GPIO_PIN_13, GPIO_PIN_RESET);

	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_0, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_1, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_4, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_5, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_6, GPIO_PIN_RESET);

	GPIO_InitStruct.Pin = GPIO_PIN_1;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOH, &GPIO_InitStruct);

	HAL_GPIO_WritePin(GPIOH, GPIO_PIN_1, GPIO_PIN_RESET);


	/*Configure GPIO pin Output Level */
//	HAL_GPIO_WritePin(USER_LED_GPIO_Port, USER_LED_Pin, GPIO_PIN_SET);

	/*Configure GPIO pin Output Level */
//	HAL_GPIO_WritePin(LCDTS_CS_GPIO_Port, LCDTS_CS_Pin, GPIO_PIN_SET);

	/*Configure GPIO pin : LCD_RESET_Pin */
	GPIO_InitStruct.Pin = LCD_RESET_Pin;// | LCD_POWER_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(LCD_RESET_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOE, LCD_RESET_Pin|LCD_POWER_Pin, GPIO_PIN_SET);

	/*Configure GPIO pins : TEST_TS_IRQ_Pin L_reset_Pin */
//	GPIO_InitStruct.Pin = TEST_TS_IRQ_Pin|L_reset_Pin;
//	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
//	GPIO_InitStruct.Pull = GPIO_NOPULL;
//	HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

	/*Configure GPIO pin : USER_LED_Pin */
	GPIO_InitStruct.Pin = USER_LED_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(USER_LED_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin : KEY_Pin */
//	GPIO_InitStruct.Pin = CANCEL_KEY_Pin | UP_KEY_Pin | DOWN_KEY_Pin | ENTER_KEY_Pin | SETUP_KEY_Pin | GPIO_PIN_9;
	GPIO_InitStruct.Pin = CANCEL_KEY_Pin | UP_KEY_Pin | DOWN_KEY_Pin | ENTER_KEY_Pin | SETUP_KEY_Pin ;
//	GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;     //yskim
//	GPIO_InitStruct.Pull = GPIO_PULLUP;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(KEY_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin : LCDTS_CS_Pin */
	GPIO_InitStruct.Pin = LCDTS_CS_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(LCDTS_CS_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin : BLE_RESET_Pin */
//	GPIO_InitStruct.Pin = BLE_RESET_Pin;
//	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD;
//	GPIO_InitStruct.Pull = GPIO_NOPULL;
//	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
//	HAL_GPIO_Init(BLE_RESET_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin : BEEP_Pin */
	GPIO_InitStruct.Pin = BEEP_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(BEEP_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin : BACKLIGHT_Pin */
//	GPIO_InitStruct.Pin = BACKLIGHT_Pin;
//	GPIO_InitStruct.Mode = GPIO_MODE_AF_OD;		// Output Open Drain Mode
//	GPIO_InitStruct.Pull = GPIO_NOPULL;
//	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
//	HAL_GPIO_Init(BACKLIGHT_GPIO_Port, &GPIO_InitStruct);
//
//	HAL_GPIO_WritePin(BACKLIGHT_GPIO_Port, BACKLIGHT_Pin, GPIO_PIN_SET);

	GPIO_InitStruct.Pin = GPIO_PIN_14 | GPIO_PIN_15;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;		// Output Open Drain Mode
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_RESET);

	/*Configure GPIO pin : RS-485 Terminate_Pin */
	GPIO_InitStruct.Pin = RS485_TERM1 | RS485_TERM2;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(RS485_TERM_Port, &GPIO_InitStruct);

	HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM1, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(RS485_TERM_Port, RS485_TERM2, GPIO_PIN_RESET);

#if 0  /* EXTI interrupt init   yskim*/
  HAL_NVIC_SetPriority(EXTI4_IRQn, 15, 0);
  HAL_NVIC_EnableIRQ(EXTI4_IRQn);

  HAL_NVIC_SetPriority(EXTI9_5_IRQn, 15, 0);
  HAL_NVIC_EnableIRQ(EXTI9_5_IRQn);
#endif

}

/* FSMC initialization function */
static void MX_FSMC_Init(void)
{
	FSMC_NORSRAM_TimingTypeDef Timing;
	static SRAM_HandleTypeDef hsram1;

	/** Perform the SRAM1 memory initialization sequence
	*/
	hsram1.Instance = FSMC_NORSRAM_DEVICE;
	hsram1.Extended = FSMC_NORSRAM_EXTENDED_DEVICE;
	/* hsram1.Init */
	hsram1.Init.NSBank = FSMC_NORSRAM_BANK1;
	hsram1.Init.DataAddressMux = FSMC_DATA_ADDRESS_MUX_DISABLE;
	hsram1.Init.MemoryType = FSMC_MEMORY_TYPE_SRAM;
	hsram1.Init.MemoryDataWidth = FSMC_NORSRAM_MEM_BUS_WIDTH_16;
	hsram1.Init.BurstAccessMode = FSMC_BURST_ACCESS_MODE_DISABLE;
	hsram1.Init.WaitSignalPolarity = FSMC_WAIT_SIGNAL_POLARITY_LOW;
	hsram1.Init.WrapMode = FSMC_WRAP_MODE_DISABLE;
	hsram1.Init.WaitSignalActive = FSMC_WAIT_TIMING_BEFORE_WS;
	hsram1.Init.WriteOperation = FSMC_WRITE_OPERATION_ENABLE;
	hsram1.Init.WaitSignal = FSMC_WAIT_SIGNAL_DISABLE;
	hsram1.Init.ExtendedMode = FSMC_EXTENDED_MODE_DISABLE;
	hsram1.Init.AsynchronousWait = FSMC_ASYNCHRONOUS_WAIT_DISABLE;
	hsram1.Init.WriteBurst = FSMC_WRITE_BURST_DISABLE;
	hsram1.Init.PageSize = FSMC_PAGE_SIZE_NONE;
	/* Timing */
	Timing.AddressSetupTime = TIMING_ADDRESSSETUPTIME_CONST;
	Timing.AddressHoldTime = TIMING_ADDRESSHOLDTIME;
	Timing.DataSetupTime = TIMING_DATASETUPTIME;
	Timing.BusTurnAroundDuration = 0;
	Timing.CLKDivision = TIMING_CLKDIVISION;
	Timing.DataLatency = TIMING_DATALATENCY;
	Timing.AccessMode = FSMC_ACCESS_MODE_A;
	/* ExtTiming */

	if (HAL_SRAM_Init(&hsram1, &Timing, NULL) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}

}

/* USER CODE END 4 */

/**
* @brief  Period elapsed callback in non blocking mode
* @note   This function is called  when TIM2 interrupt took place, inside
* HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
* a global variable "uwTick" used as application time base.
* @param  htim : TIM handle
* @retval None
*/
// PRQA S 1503 2
// PRQA S 3673 1
 void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	/* USER CODE BEGIN Callback 0 */

	/* USER CODE END Callback 0 */

	if (htim->Instance == TIM2) {
		HAL_IncTick();
	}
	/* USER CODE BEGIN Callback 1 */

	/* USER CODE END Callback 1 */
}

/**
* @brief  This function is executed in case of error occurrence.
* @param  None
* @retval None
*/
// PRQA S 1503 2
// PRQA S 1505 1
void _Error_Handler(char * file, int line)// PRQA S 1503 1505
{
	(void)printf("Error file:%s Line:%d\n", file, line);
	/* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	while(1)
	{
	}
	/* USER CODE END Error_Handler_Debug */
}

#ifdef USE_FULL_ASSERT

/**
* @brief Reports the name of the source file and the source line number
* where the assert_param error has occurred.
* @param file: pointer to the source file name
* @param line: assert_param error line source number
* @retval None
*/
void assert_failed(uint8_t* file, uint32_t line)
{
	/* USER CODE BEGIN 6 */
	/* User can add his own implementation to report the file name and line number,
	ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
	/* USER CODE END 6 */

}

#endif

/**
* @}
*/

/**
* @}
*/

static uint32_t GetSector(uint32_t Address)
{
	uint32_t sector = 0;

	if((Address < ADDR_FLASH_SECTOR_1) && (Address >= ADDR_FLASH_SECTOR_0))
	{
		sector = FLASH_SECTOR_0;
	}
	else if((Address < ADDR_FLASH_SECTOR_2) && (Address >= ADDR_FLASH_SECTOR_1))
	{
		sector = FLASH_SECTOR_1;
	}
	else if((Address < ADDR_FLASH_SECTOR_3) && (Address >= ADDR_FLASH_SECTOR_2))
	{
		sector = FLASH_SECTOR_2;
	}
	else if((Address < ADDR_FLASH_SECTOR_4) && (Address >= ADDR_FLASH_SECTOR_3))
	{
		sector = FLASH_SECTOR_3;
	}
	else if((Address < ADDR_FLASH_SECTOR_5) && (Address >= ADDR_FLASH_SECTOR_4))
	{
		sector = FLASH_SECTOR_4;
	}
	else if((Address < ADDR_FLASH_SECTOR_6) && (Address >= ADDR_FLASH_SECTOR_5))
	{
		sector = FLASH_SECTOR_5;
	}
	else if((Address < ADDR_FLASH_SECTOR_7) && (Address >= ADDR_FLASH_SECTOR_6))
	{
		sector = FLASH_SECTOR_6;
	}
	else if((Address < ADDR_FLASH_SECTOR_8) && (Address >= ADDR_FLASH_SECTOR_7))
	{
		sector = FLASH_SECTOR_7;
	}
	else if((Address < ADDR_FLASH_SECTOR_9) && (Address >= ADDR_FLASH_SECTOR_8))
	{
		sector = FLASH_SECTOR_8;
	}
	else if((Address < ADDR_FLASH_SECTOR_10) && (Address >= ADDR_FLASH_SECTOR_9))
	{
		sector = FLASH_SECTOR_9;
	}
	else if((Address < ADDR_FLASH_SECTOR_11) && (Address >= ADDR_FLASH_SECTOR_10))
	{
		sector = FLASH_SECTOR_10;
	}
	else /* (Address < FLASH_END_ADDR) && (Address >= ADDR_FLASH_SECTOR_11) */
	{
		sector = FLASH_SECTOR_11;
	}

	return sector;
}

#if 0
	HAL_FLASH_Unlock();

	/* Erase the user Flash area
	(area defined by FLASH_USER_START_ADDR and FLASH_USER_END_ADDR) ***********/

	/* Get the 1st sector to erase */
	FirstSector = GetSector(FLASH_USER_START_ADDR);
	/* Get the number of sector to erase from 1st sector*/
	NbOfSectors = GetSector(FLASH_USER_END_ADDR) - FirstSector + 1;

	/* Fill EraseInit structure*/
	EraseInitStruct.TypeErase = FLASH_TYPEERASE_SECTORS;
	EraseInitStruct.VoltageRange = FLASH_VOLTAGE_RANGE_3;
	EraseInitStruct.Sector = FirstSector;
	EraseInitStruct.NbSectors = NbOfSectors;
	if(HAL_FLASHEx_Erase(&EraseInitStruct, &SectorError) != HAL_OK)
	{
		/*
		Error occurred while sector erase.
		User can add here some code to deal with this error.
		SectorError will contain the faulty sector and then to know the code error on this sector,
		user can call function 'HAL_FLASH_GetError()'
		*/
		/*
		FLASH_ErrorTypeDef errorcode = HAL_FLASH_GetError();
		*/
		_Error_Handler(__FILE__, __LINE__);
		//    Error_Handler();
	}

	/* Note: If an erase operation in Flash memory also concerns data in the data or instruction cache,
	you have to make sure that these data are rewritten before they are accessed during code
	execution. If this cannot be done safely, it is recommended to flush the caches by setting the
	DCRST and ICRST bits in the FLASH_CR register. */
	__HAL_FLASH_DATA_CACHE_DISABLE();
	__HAL_FLASH_INSTRUCTION_CACHE_DISABLE();

	__HAL_FLASH_DATA_CACHE_RESET();
	__HAL_FLASH_INSTRUCTION_CACHE_RESET();

	__HAL_FLASH_INSTRUCTION_CACHE_ENABLE();
	__HAL_FLASH_DATA_CACHE_ENABLE();

	/* Program the user Flash area word by word
	(area defined by FLASH_USER_START_ADDR and FLASH_USER_END_ADDR) ***********/
	Address = FLASH_USER_START_ADDR;
	int endAddr = FLASH_USER_START_ADDR + 0x100;

	while (Address < endAddr)
	{
	    if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_HALFWORD, Address, DATA_32) == HAL_OK)
		{
			Address = Address + INDEX_4;
		}
		//    else
		{
			/* Error occurred while writing data in Flash memory.
			User can add here some code to deal with this error */
			/*
			FLASH_ErrorTypeDef errorcode = HAL_FLASH_GetError();
			*/
			//Error_Handler();
		}
	}
	/* Lock the Flash to disable the flash control register access (recommended
	to protect the FLASH memory against possible unwanted operation) *********/
	HAL_FLASH_Lock();

	/* Check if the programmed data is OK
	MemoryProgramStatus = 0: data programmed correctly
	MemoryProgramStatus != 0: number of words not programmed correctly ******/

	Address = FLASH_USER_START_ADDR;
	MemoryProgramStatus = 0x0;
	// int endAddr = FLASH_USER_START_ADDR + 0x100;


	while (Address < endAddr)
		//  while (Address < FLASH_USER_END_ADDR)
	{
		data32 = *(__IO uint32_t*)Address;

		if (data32 != DATA_32)
		{
			MemoryProgramStatus++;
		}
		Address = Address + INDEX_4;
	}
	(void)printf("[%d]\n==============", MemoryProgramStatus);
#endif

// PRQA S 1503 1
void FlashRead(void)
{
	uint32_t Address = FLASH_USER_START_ADDR;
	Address = FLASH_USER_START_ADDR;
	uint16_t data;
	data = *(__IO uint16_t*)Address;
	(void)printf(" Flash Read ID %04x\n", data);

	if(data == SETUP_WRITE_ID)
	{
		(void)printf("Read Falsh.............\n");
		Address += INDEX_2;
		for(int i = 0; i < SETUP_COUNT; i++)
		{
			SettingValue[i] = *(__IO uint16_t*)Address;
			Address += INDEX_2;
			printf("SettingValue[%i] : %d\n", i, SettingValue[i]);
		}
		for(int i = 0; i < DEVICE_MAX; i++)
		{
			ConnectSetting[i].DeviceType = (E_DEVICE_TYPE)(*(__IO uint16_t*)Address);
			Address += INDEX_2;
			ConnectSetting[i].Address = *(__IO uint16_t*)Address;
			Address += INDEX_2;
			printf("Device:%d Type:%d, Address:%d\n", i, ConnectSetting[i].DeviceType, ConnectSetting[i].Address);
		}
		SettingValue[SETUP_GATEWAY_USE] = *(__IO uint16_t*)Address;
		gDeviceCount = SettingValue[SETUP_DEVICE_COUNT];
	}
}

// PRQA S 1503 1
void FlashWrite(void)
{
	uint32_t FirstSector = 0, NbOfSectors = 0, Address = 0;
	uint32_t SectorError = 0;

	(void)HAL_FLASH_Unlock();

	/* Erase the user Flash area
	(area defined by FLASH_USER_START_ADDR and FLASH_USER_END_ADDR) ***********/

	/* Get the 1st sector to erase */
	FirstSector = GetSector(FLASH_USER_START_ADDR);
	/* Get the number of sector to erase from 1st sector*/
	NbOfSectors = (GetSector(FLASH_USER_END_ADDR) - FirstSector) + 1;

	/* Fill EraseInit structure*/
	EraseInitStruct.TypeErase = FLASH_TYPEERASE_SECTORS;
	EraseInitStruct.VoltageRange = FLASH_VOLTAGE_RANGE_3;
	EraseInitStruct.Sector = FirstSector;
	EraseInitStruct.NbSectors = NbOfSectors;
	if(HAL_FLASHEx_Erase(&EraseInitStruct, &SectorError) != HAL_OK)
	{
		/*
		Error occurred while sector erase.
		User can add here some code to deal with this error.
		SectorError will contain the faulty sector and then to know the code error on this sector,
		user can call function 'HAL_FLASH_GetError()'
		*/
		/*
		FLASH_ErrorTypeDef errorcode = HAL_FLASH_GetError();
		*/
		_Error_Handler(__FILE__, __LINE__);
		//    Error_Handler();
	}

	/* Note: If an erase operation in Flash memory also concerns data in the data or instruction cache,
	you have to make sure that these data are rewritten before they are accessed during code
	execution. If this cannot be done safely, it is recommended to flush the caches by setting the
	DCRST and ICRST bits in the FLASH_CR register. */
	__HAL_FLASH_DATA_CACHE_DISABLE();
	__HAL_FLASH_INSTRUCTION_CACHE_DISABLE();

	__HAL_FLASH_DATA_CACHE_RESET();
	__HAL_FLASH_INSTRUCTION_CACHE_RESET();

	__HAL_FLASH_INSTRUCTION_CACHE_ENABLE();
	__HAL_FLASH_DATA_CACHE_ENABLE();

	/* Program the user Flash area word by word
	(area defined by FLASH_USER_START_ADDR and FLASH_USER_END_ADDR) ***********/



	Address = FLASH_USER_START_ADDR;

	if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_HALFWORD, Address, SETUP_WRITE_ID) == HAL_OK)
	{
		Address += INDEX_2;
		for(int i = 0; i < SETUP_COUNT; i++)
		{
			if(HAL_FLASH_Program(FLASH_TYPEPROGRAM_HALFWORD, Address, SettingValue[i]) != HAL_OK)
			{
				(void)printf("Write Fail SettingValue[%d]\n", i);
			}
			Address += INDEX_2;
			printf("SettingValue[%i] : %d\n", i, SettingValue[i]);
#if __WATCHDOG__ //_BEGIN -- watchdog
            __HAL_IWDG_RELOAD_COUNTER(&hiwdg);
#endif // _END -- watchdog
		}
		for(int i = 0; i < DEVICE_MAX; i++)
		{
			if(HAL_FLASH_Program(FLASH_TYPEPROGRAM_HALFWORD, Address, ConnectSetting[i].DeviceType) != HAL_OK)
			{
				(void)printf("Write Fail ConnectSetting[%d].DeviceType\n", i);
			}
			Address += INDEX_2;
			if(HAL_FLASH_Program(FLASH_TYPEPROGRAM_HALFWORD, Address, ConnectSetting[i].Address) != HAL_OK)
			{
				(void)printf("Write Fail ConnectSetting[%d].Address\n", i);
			}
			Address += INDEX_2;
#if __WATCHDOG__ //_BEGIN -- watchdog
            __HAL_IWDG_RELOAD_COUNTER(&hiwdg);
#endif // _END -- watchdog
		}
		if(HAL_FLASH_Program(FLASH_TYPEPROGRAM_HALFWORD, Address, SettingValue[SETUP_GATEWAY_USE]) != HAL_OK)
		{
			(void)printf("Write Fail SettingValue[SETUP_GATEWAY_USE]\n");
		}
	}
	else
	{
		(void)printf("Write Fail SETUP_WRITE_ID\n");
	}
	/* Lock the Flash to disable the flash control register access (recommended
	to protect the FLASH memory against possible unwanted operation) *********/
	(void)HAL_FLASH_Lock();
}

//PRQA S 1503 1
void FaultCountRead(void)
{
	uint32_t Address = FLASH_FAULT_START_ADDR;
	Address = FLASH_FAULT_START_ADDR;
	uint16_t data;
	data = *(__IO uint16_t*)Address;
	(void)printf(" Flash Fault Read ID %04x\n", data);

	if(data == SETUP_WRITE_ID)
	{
		(void)printf("Read Falsh.............\n");
		Address += INDEX_2;
		for(int i = 0; i < DEVICE_MAX; i++)
		{
			gOldFaultEventIndex[i] = (E_DEVICE_TYPE)(*(__IO uint16_t*)Address);
			Address += INDEX_2;
		}
	}
	Address = FLASH_FAULT_START_ADDR + ASCII_BASE;
	for(int i = 0; i < INDEX_8; i++, Address++)
	{
		_acHardwareVersion[i] = *(__IO char*)Address;
	}
	_acHardwareVersion[INDEX_8] = 0;
}

//PRQA S 1503 1
void FaultCountWrite(void)
{
	(void)printf("FaultCountWrite();\n");
	uint32_t FirstSector = 0, NbOfSectors = 0, Address = 0;
	uint32_t SectorError = 0;

	(void)HAL_FLASH_Unlock();

	/* Erase the user Flash area
	(area defined by FLASH_FAULT_START_ADDR and FLASH_FAULT_END_ADDR) ***********/

	/* Get the 1st sector to erase */
	FirstSector = GetSector(FLASH_FAULT_START_ADDR);
	/* Get the number of sector to erase from 1st sector*/
	NbOfSectors = (GetSector(FLASH_FAULT_END_ADDR) - FirstSector) + 1;

	/* Fill EraseInit structure*/
	EraseInitStruct.TypeErase = FLASH_TYPEERASE_SECTORS;
	EraseInitStruct.VoltageRange = FLASH_VOLTAGE_RANGE_3;
	EraseInitStruct.Sector = FirstSector;
	EraseInitStruct.NbSectors = NbOfSectors;
	if(HAL_FLASHEx_Erase(&EraseInitStruct, &SectorError) != HAL_OK)
	{
		/*
		Error occurred while sector erase.
		User can add here some code to deal with this error.
		SectorError will contain the faulty sector and then to know the code error on this sector,
		user can call function 'HAL_FLASH_GetError()'
		*/
		/*
		FLASH_ErrorTypeDef errorcode = HAL_FLASH_GetError();
		*/
		_Error_Handler(__FILE__, __LINE__);
		//    Error_Handler();
	}

	/* Note: If an erase operation in Flash memory also concerns data in the data or instruction cache,
	you have to make sure that these data are rewritten before they are accessed during code
	execution. If this cannot be done safely, it is recommended to flush the caches by setting the
	DCRST and ICRST bits in the FLASH_CR register. */
	__HAL_FLASH_DATA_CACHE_DISABLE();
	__HAL_FLASH_INSTRUCTION_CACHE_DISABLE();

	__HAL_FLASH_DATA_CACHE_RESET();
	__HAL_FLASH_INSTRUCTION_CACHE_RESET();

	__HAL_FLASH_INSTRUCTION_CACHE_ENABLE();
	__HAL_FLASH_DATA_CACHE_ENABLE();

	/* Program the user Flash area word by word
	(area defined by FLASH_FAULT_START_ADDR and FLASH_FAULT_END_ADDR) ***********/



	Address = FLASH_FAULT_START_ADDR;

	if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_HALFWORD, Address, SETUP_WRITE_ID) == HAL_OK)
	{
		Address += INDEX_2;
		for(int i = 0; i < DEVICE_MAX; i++)
		{
			if(HAL_FLASH_Program(FLASH_TYPEPROGRAM_HALFWORD, Address, gOldFaultEventIndex[i]) != HAL_OK)
			{
				(void)printf("Write Fail gOldFaultEventIndex[%d]\n", i);
			}
			Address += INDEX_2;
#if __WATCHDOG__ //_BEGIN -- watchdog
            __HAL_IWDG_RELOAD_COUNTER(&hiwdg);
#endif // _END -- watchdog
		}
	}
	else
	{
		(void)printf("Write Fail FAULT SETUP_WRITE_ID\n");

	}

	Address = FLASH_FAULT_START_ADDR+ASCII_BASE;
	for(int i = 0; i < INDEX_8; i++, Address++)
	{
		if(HAL_FLASH_Program(FLASH_TYPEPROGRAM_BYTE, Address, (uint64_t)_acHardwareVersion[i]) != HAL_OK)
		{
			(void)printf("Write Fail _acHardwareVersion[%d]\n", i);
		}
#if __WATCHDOG__ //_BEGIN -- watchdog
            __HAL_IWDG_RELOAD_COUNTER(&hiwdg);
#endif // _END -- watchdog
	}
	/* Lock the Flash to disable the flash control register access (recommended
	to protect the FLASH memory against possible unwanted operation) *********/
	(void)HAL_FLASH_Lock();
}
#define RTC_RETRY	3000
static void rtc_Transmit(uint8_t *pData, uint16_t Size)
{
	uint8_t error;
	int count = 0;
	while(1)
	{
		error = HAL_I2C_Master_Transmit(&hi2c2, PCF2127_I2C_SLAVE_ADDRESS, pData, Size, PCF2129_TIMEOUT);
		if(error == 0)
		{
			break;
		}
		if(++count > 2000)
		{
			printf("rtc_Transmit error!!!\n");
			break;
		}
	}
	if(count > 0)
		printf("rtc_Transmit Count(%d)\n", count);
}


static void PCF2129_set_register( uint8_t addr, uint8_t data )
{
    uint8_t    b[ INDEX_2 ];

    b[ 0 ]    = addr;
    b[ 1 ]    = data;

	rtc_Transmit(b, sizeof(b));
}

static uint8_t PCF2129_read_register( uint8_t addr )
{
    uint8_t    data;

    data    = addr;
	rtc_Transmit(&data, 1);
    (void)HAL_I2C_Master_Receive(&hi2c2, PCF2127_I2C_SLAVE_ADDRESS, &data, 1, PCF2129_TIMEOUT);

    return ( data );
}

static uint8_t i2bcd( uint8_t n )
{
    return ( ((n / INDEX_10) << INDEX_4) | (n % INDEX_10) );
}

static uint8_t bcd2i( uint8_t bcd )
{
    return ( ((bcd >> INDEX_4) * INDEX_10) + (bcd & BCD_MASK) );
}

void PCF2127_set_time(void)
{
    uint8_t        data[INDEX_10];

	/* Write access to time registers:
	 * PCF2127/29: no special action required.
	 * PCF2131:    requires setting the STOP and CPR bits. STOP bit needs to
	 *             be cleared after time registers are updated.
	 */
#ifdef PCF2131
	  data[ INDEX_0 ]   = Control_1; //  access start register address
	  data[ INDEX_1 ]   = 0x23;
	  rtc_Transmit(data, INDEX_2);

	  data[ INDEX_0 ]   = 0x05; //  access start register address
	  data[ INDEX_1 ]   = 0xa4;
	  rtc_Transmit(data, INDEX_2);
#endif
	data[0]    = Seconds;

    data[ INDEX_1 ]    = i2bcd(changeDateTime.Sec);
    data[ INDEX_2 ]    = i2bcd(changeDateTime.Min);
    data[ INDEX_3 ]    = i2bcd(changeDateTime.Hour);
    data[ INDEX_4 ]    = i2bcd(changeDateTime.Day);
    data[ INDEX_5 ]    = 1; //Week
    data[ INDEX_6 ]    = i2bcd(changeDateTime.Month);
    data[ INDEX_7 ]    = i2bcd(changeDateTime.Year-YEAR_BASE);


	rtc_Transmit(data, INDEX_8);

#ifdef PCF2131

	data[ INDEX_0 ]   = Control_1; //  access start register address
	data[ INDEX_1 ]   = Cntl1;

	rtc_Transmit(data, INDEX_2);
#endif
 //   return ( err ? I2C_ACCESS_FAIL : NO_ERROR );
}

static void Pcf2129AT_init(void)
{
	uint8_t		data[INDEX_4], err;

//	OS_Delay(INDEX_50);

	HAL_Delay(INDEX_400);


    data[ 0 ]    = Control_1;  //  read start register address+

	rtc_Transmit(data, 1);

	err = HAL_I2C_Master_Receive(&hi2c2, PCF2127_I2C_SLAVE_ADDRESS, data, INDEX_3, PCF2129_TIMEOUT);
	printf("  HAL_I2C_Master_Receive = %d\n", err);

	for(int i = 0; i < 3; i++)
	{
		printf("[%02X]", data[i]);
	}
	printf("\n");

    data[ INDEX_0 ]   = Control_1; //  access start register address
    data[ INDEX_1 ]   = Cntl1;
    data[ INDEX_2 ]   = Cntl2;
    data[ INDEX_3 ]   = Cntl3;

	rtc_Transmit(data, sizeof(data));
    PCF2129_set_register( CLKOUT_ctl, ClkOut );

	rtc_Transmit(data, 1);

	err = HAL_I2C_Master_Receive(&hi2c2, PCF2127_I2C_SLAVE_ADDRESS, data, INDEX_3, PCF2129_TIMEOUT);
	printf("  HAL_I2C_Master_Receive = %d\n", err);

	for(int i = 0; i < 3; i++)
	{
		printf("[%02X]", data[i]);
	}
	printf("\n");


}

//PRQA S 1503 1
void PCF2127_readTime(uint8_t flag)
{
    uint8_t     buf[ INDEX_9 ];

//	OS_Delay(INDEX_5);
	HAL_Delay(INDEX_5);
    buf[ 0 ]    = Seconds-1;  //  read start register address+

	uint8_t err;
	rtc_Transmit(buf, 1);

	err = HAL_I2C_Master_Receive(&hi2c2, PCF2127_I2C_SLAVE_ADDRESS, buf, INDEX_8, PCF2129_TIMEOUT);

	if((flag == 1) && (err == HAL_OK))
	{
	  if((buf[INDEX_1] & 0x80) == 0)
	  {
		gDateTime.Year 	= bcd2i(buf[INDEX_7])+YEAR_BASE;
		gDateTime.Month	= bcd2i(buf[INDEX_6]);
		gDateTime.Day		= bcd2i(buf[INDEX_4]);
		gDateTime.Hour	= bcd2i(buf[INDEX_3]);
		gDateTime.Min		= bcd2i(buf[INDEX_2]);
		gDateTime.Sec		= bcd2i(buf[INDEX_1]);
		gDateTime.mSec	= bcd2i(buf[0]);
	  }
	  else
		printf(" PCF2127_readTime error!!!\n");

	}

	if((gDateTime.Year > YEAR_MAX) ||
	   			(gDateTime.Year < YEAR_MIN) ||
				(gDateTime.Month < 1) ||
				(gDateTime.Month > MONTH_MAX) ||
				(gDateTime.Day < 1) ||
				(gDateTime.Day > DAY_MAX) ||
				(gDateTime.Hour >= HOUR_MAX) ||
				(gDateTime.Min >= MIN_MAX) ||
				(gDateTime.Sec >= MIN_MAX))
	{
		gDateTime.Year = changeDateTime.Year = YEAR_MIN;
		gDateTime.Month = changeDateTime.Month = 1;
		gDateTime.Day = changeDateTime.Day = 1;
		gDateTime.Hour = changeDateTime.Hour = 0;
		gDateTime.Min = changeDateTime.Min = 0;
		gDateTime.Sec = changeDateTime.Sec = 0;
		(void)PCF2127_set_time();
		(void)printf("PCF2127_set_time!!!!!....\n");
	}
	if(gDebug)
		(void)printf("%d/%d/%d %d:%d:%d.%d(%d)\n", gDateTime.Year, gDateTime.Month, gDateTime.Day, gDateTime.Hour, gDateTime.Min, gDateTime.Sec, gDateTime.mSec, HAL_GetTick());
}
//PRQA S 1503 1
uint16_t RTCBatteryStatus(void)
{
	uint16_t ret = (uint16_t)PCF2129_read_register(Control_3);
	if(gDebug)
		(void)printf("RTCBatteryStatus => %04X", ret);
	return(ret & RTCBATTERYSTATUS_MASK);
}

#if __WATCHDOG__ //[[ by kys.2018.06.17_BEGIN -- watchdog
/* IWDG init function */
static void MX_IWDG_Init(void)
{
    hiwdg.Instance = IWDG;
    hiwdg.Init.Prescaler = IWDG_PRESCALER_32;
    hiwdg.Init.Reload = RELOAD_TIME;
    if (HAL_IWDG_Init(&hiwdg) != HAL_OK)
    {
        _Error_Handler(__FILE__, __LINE__);
    }
}
#endif

#if 0

/* ADC1 init function */
static void MX_ADC1_Init(void)
{

  ADC_ChannelConfTypeDef sConfig;

    /**Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion)
    */
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV4;
  hadc1.Init.Resolution = ADC_RESOLUTION_6B;
  hadc1.Init.ScanConvMode = DISABLE;
  hadc1.Init.ContinuousConvMode = DISABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 1;
  hadc1.Init.DMAContinuousRequests = DISABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    /**Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
    */
  sConfig.Channel = ADC_CHANNEL_1;
  sConfig.Rank = 1;
  sConfig.SamplingTime = ADC_SAMPLETIME_112CYCLES;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}


void PVD_Config(void)
{
  NVIC_InitTypeDef NVIC_InitStructure;

  /* Enable PWR clock */
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR, ENABLE);

  /* Configure one bit for preemption priority */
  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);

  /* Enable the PVD Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = PVD_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);

  /* Configure the PVD Level to 3 (2.5V) */
  PWR_PVDLevelConfig(PWR_PVDLevel_3);

  /* Enable the PVD Output */
  PWR_PVDCmd(ENABLE);
}
#endif

extern uint8_t KeyChanged[KEY_MAX];

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
  /* Prevent unused argument(s) compilation warning */
  GPIO_PinState status = HAL_GPIO_ReadPin(GPIOA, GPIO_Pin);
  if(status != GPIO_PIN_RESET)
	  return;
  volatile static uint32_t last = 0;
  uint32_t curr = HAL_GetTick();
  if(( curr - last) < 50)
	  return;
  last = curr;

	for(E_KEY i = KEY_SETUP; i < KEY_MAX; i++)
	{
		if(KeyChanged[i] == 1)
		{
			return;
		}
		if(GPIO_Pin == KeyPin[i])
		{
			KeyChanged[i] = 1;
			break;
		}
	}
  /* NOTE: This function Should not be modified, when the callback is needed,
           the HAL_GPIO_EXTI_Callback could be implemented in the user file
   */
}

void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();
  __HAL_RCC_DMA2_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Stream5_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream5_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream5_IRQn);
  /* DMA1_Stream6_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream6_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream6_IRQn);
  /* DMA2_Stream2_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA2_Stream2_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream2_IRQn);
  /* DMA2_Stream7_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA2_Stream7_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream7_IRQn);

}

/**
  * @brief NVIC Configuration.
  * @retval None
  */
static void MX_NVIC_Init(void)
{
  /* USART6_IRQn interrupt configuration */
 // HAL_NVIC_SetPriority(USART6_IRQn, 0, 0);
 // HAL_NVIC_EnableIRQ(USART6_IRQn);
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart)
{
  	if(huart->Instance == USART1)
	{
		printf("{1,0}(%d)",HAL_GetTick());
	    Pol_Delay_us(3000);
		printf("{1,0}(%d)",HAL_GetTick());
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_RESET);

	}
	else
 	if(huart->Instance == USART2)
	{
		printf("{2,0}(%d)",HAL_GetTick());
	    Pol_Delay_us(3000);
		printf("{2,0}(%d)",HAL_GetTick());
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_RESET);
	}
}

void SystemReset(void)
{
	NVIC_SystemReset();
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

