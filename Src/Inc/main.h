/**
  ******************************************************************************
  * File Name          : main.hpp
  * Description        : This file contains the common defines of the application
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
  *    this license.
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
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#define __WATCHDOG__					0			// 0=wd off, 1=wd on

/* Includes ------------------------------------------------------------------*/

/* Includes ------------------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "GUI.h"
#include "stm32f4xx_hal.h"
#include "time.h"

/* USER CODE END Includes */

/* Private define ------------------------------------------------------------*/

#define LCD_RESET_Pin			GPIO_PIN_3
#define LCD_RESET_GPIO_Port 	GPIOE
#define LCD_POWER_Pin			GPIO_PIN_2
#define LCD_POWER_GPIO_Port 	GPIOE
#define TEST_TS_IRQ_Pin 		GPIO_PIN_4
#define TEST_TS_IRQ_GPIO_Port 	GPIOE
#define USER_LED_Pin 			GPIO_PIN_0
#define USER_LED_GPIO_Port 		GPIOC
#define LCDTS_CS_Pin 			GPIO_PIN_15
#define LCDTS_CS_GPIO_Port 		GPIOA
#define LCDTS_CLK_Pin 			GPIO_PIN_10
#define LCDTS_CLK_GPIO_Port 	GPIOC
#define LCDTS_DOUT_Pin 			GPIO_PIN_11
#define LCDTS_DOUT_GPIO_Port 	GPIOC
#define LCDTS_DIN_Pin 			GPIO_PIN_12
#define LCDTS_DIN_GPIO_Port 	GPIOC
#define BLE_RESET_Pin 			GPIO_PIN_0
#define BLE_RESET_GPIO_Port 	GPIOE
#define L_reset_Pin 			GPIO_PIN_1
#define L_reset_GPIO_Port 		GPIOE

#define KEY_GPIO_Port 			GPIOA
#define BEEP_GPIO_Port 			GPIOE
#define BACKLIGHT_GPIO_Port			GPIOB

#define SETUP_KEY_Pin 			GPIO_PIN_4
#define UP_KEY_Pin 				GPIO_PIN_5
#define DOWN_KEY_Pin 			GPIO_PIN_6
#define ENTER_KEY_Pin 			GPIO_PIN_7
#define CANCEL_KEY_Pin 			GPIO_PIN_8

#define BEEP_Pin	 			GPIO_PIN_6
#define BACKLIGHT_Pin 			GPIO_PIN_8

#define	SETUP_WRITE_ID					0x5599


/* ########################## Assert Selection ############################## */
/**
  * @brief Uncomment the line below to expanse the "assert_param" macro in the
  *        HAL drivers code
  */
/* #define USE_FULL_ASSERT    1U */

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */
/* Base address of the Flash sectors */
#define ADDR_FLASH_SECTOR_0     ((uint32_t)0x08000000) /* Base @ of Sector 0, 16 Kbytes */
#define ADDR_FLASH_SECTOR_1     ((uint32_t)0x08004000) /* Base @ of Sector 1, 16 Kbytes */
#define ADDR_FLASH_SECTOR_2     ((uint32_t)0x08008000) /* Base @ of Sector 2, 16 Kbytes */
#define ADDR_FLASH_SECTOR_3     ((uint32_t)0x0800C000) /* Base @ of Sector 3, 16 Kbytes */
#define ADDR_FLASH_SECTOR_4     ((uint32_t)0x08010000) /* Base @ of Sector 4, 64 Kbytes */
#define ADDR_FLASH_SECTOR_5     ((uint32_t)0x08020000) /* Base @ of Sector 5, 128 Kbytes */
#define ADDR_FLASH_SECTOR_6     ((uint32_t)0x08040000) /* Base @ of Sector 6, 128 Kbytes */
#define ADDR_FLASH_SECTOR_7     ((uint32_t)0x08060000) /* Base @ of Sector 7, 128 Kbytes */
#define ADDR_FLASH_SECTOR_8     ((uint32_t)0x08080000) /* Base @ of Sector 8, 128 Kbytes */
#define ADDR_FLASH_SECTOR_9     ((uint32_t)0x080A0000) /* Base @ of Sector 9, 128 Kbytes */
#define ADDR_FLASH_SECTOR_10    ((uint32_t)0x080C0000) /* Base @ of Sector 10, 128 Kbytes */
#define ADDR_FLASH_SECTOR_11    ((uint32_t)0x080E0000) /* Base @ of Sector 11, 128 Kbytes */

#define FLASH_USER_START_ADDR   ADDR_FLASH_SECTOR_10   /* Start @ of user Flash area */
#define FLASH_USER_END_ADDR     ADDR_FLASH_SECTOR_10   /* End @ of user Flash area */

#define FLASH_FAULT_START_ADDR   ADDR_FLASH_SECTOR_11   /* Start @ of user Flash area */
#define FLASH_FAULT_END_ADDR     ADDR_FLASH_SECTOR_11   /* End @ of user Flash area */

#ifdef __cplusplus
 extern "C" {
#endif
void _Error_Handler(char *, int);

#define Error_Handler() _Error_Handler(__FILE__, __LINE__)
#ifdef __cplusplus
}
#endif

// PCF2129AT RTC
#define     PCF2127_I2C_SLAVE_ADDRESS   0xA2


/** name of the PCF2127 registers */
typedef enum {
	Control_1,
	Control_2,
	Control_3,
	Seconds,
	Minutes,
	Hours,
	Days,
	Weekdays,
	Months,
	Years,
	Second_alarm,
	Minute_alarm,
	Hour_alarm,
	Day_alarm,
	Weekday_alarm,
	CLKOUT_ctl,
	Watchdg_tim_ctl,
	Watchdg_tim_val,
	Timestp_ctl,
	Sec_timestp,
	Min_timestp,
	Hour_timestp,
	Day_timestp,
	Mon_timestp,
	Year_timestp,
	Aging_offset,
	RAM_addr_MSB,
	RAM_addr_LSB,
	RAM_wrt_cmd,
	RAM_rd_cmd
} RegisterName;

#define	Cntl1   0x03
#define Cntl2  	0x00
#define	Cntl3   0x00
#define	ClkOut  0x46

/** Error code */
#define	NO_ERROR                0
#define	CLOCK_INTEGRITY_FAIL    1
#define	I2C_ACCESS_FAIL         2
#define	TIME_FUNC_ERROR         ((time_t)-1)

void GuiMain(void);
void Beep(void);
void FlashRead(void);
void FlashWrite(void);
void FaultCountRead(void);
void FaultCountWrite(void);

#endif /* __MAIN_H */
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
