/*********************************************************************
*                SEGGER Microcontroller GmbH & Co. KG                *
*                        The Embedded Experts                        *
**********************************************************************
*                                                                    *
*       (c) 1995 - 2017 SEGGER Microcontroller GmbH & Co. KG         *
*                                                                    *
*       Internet: segger.com  Support: support_embos@segger.com      *
*                                                                    *
**********************************************************************
*                                                                    *
*       embOS * Real time operating system for microcontrollers      *
*                                                                    *
*       Please note:                                                 *
*                                                                    *
*       Knowledge of this file may under no circumstances            *
*       be used to write a similar product or a real-time            *
*       operating system for in-house use.                           *
*                                                                    *
*       Thank you for your fairness !                                *
*                                                                    *
**********************************************************************
*                                                                    *
*       OS version: 4.38                                             *
*                                                                    *
**********************************************************************

----------------------------------------------------------------------
Licensing information
Licensor:                 SEGGER Software GmbH
Licensed to:              LSIS Ltd., 68, WOLMYEONG-RO 201, HEUNG DEOK GU CHEONGJU SI, South Korea
Licensed SEGGER software: embOS
License number:           OS-01068
License model:            PF-SCL [Product Family Source Code License], signed on  8th August 2017
Licensed product:         Air Circuit Breaker-Over Current Relay, "ACB-OCR"
Licensed platform:        STM32F407, IAR
Licensed number of seats: -
----------------------------------------------------------------------
Support and Update Agreement (SUA)
SUA period:               2017-08-14 - 2018-08-16
Contact to extend SUA:    sales@segger.com
----------------------------------------------------------------------
File    : BSP.c
Purpose : BSP for the ST STM32F4-Discovery eval board
--------  END-OF-HEADER  ---------------------------------------------
*/

#include "BSP.h"

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/

/****** SFRs used for LED-Port **************************************/

#define GPIOD_BASE_ADDR           ((unsigned int)0x40020C00)

#define GPIOD_MODER               (*(volatile unsigned int*)(GPIOD_BASE_ADDR + 0x00))
#define GPIOD_ODR                 (*(volatile unsigned int*)(GPIOD_BASE_ADDR + 0x14))
#define GPIOD_BSRR                (*(volatile unsigned int*)(GPIOD_BASE_ADDR + 0x18))

#define RCC_BASE_ADDR             ((unsigned int)(0x40023800))
#define RCC_AHB1RSTR              (*(volatile unsigned int*)(RCC_BASE_ADDR + 0x10))
#define RCC_AHBENR                (*(volatile unsigned int*)(RCC_BASE_ADDR + 0x30))

#define RCC_LEDPORT_RSTR          RCC_AHB1RSTR
#define RCC_LEDPORT_ENR           RCC_AHBENR
#define RCC_LEDPORT_BIT           (3)

/****** Assign LEDs to Ports ****************************************/

#define LED_PORT_MODER            GPIOD_MODER
#define LED_PORT_ODR              GPIOD_ODR
#define LED_PORT_BSRR             GPIOD_BSRR

#define LED0_BIT                  (12)
#define LED1_BIT                  (14)

/*********************************************************************
*
*       Global functions
*
**********************************************************************
*/

/*********************************************************************
*
*       BSP_Init()
*/
void BSP_Init(void) {
  //
  // Initialize port for LEDs (sample application)
  //
  RCC_LEDPORT_ENR  &= ~(1uL << RCC_LEDPORT_BIT);
  RCC_LEDPORT_RSTR &= ~(1uL << RCC_LEDPORT_BIT);
  RCC_LEDPORT_ENR  |=  (1uL << RCC_LEDPORT_BIT);

  LED_PORT_MODER &= ~(3uL << (LED0_BIT * 2)) | (3uL << (LED1_BIT * 2));   // Reset mode; sets port to input
  LED_PORT_MODER |=  (1uL << (LED0_BIT * 2)) | (1uL << (LED1_BIT * 2));   // Set to output mode
  LED_PORT_BSRR   =  (0x10000uL << LED0_BIT) | (0x10000uL << LED1_BIT);   // Initially clear LEDs
}

/*********************************************************************
*
*       BSP_SetLED()
*/
void BSP_SetLED(int Index) {
  if (Index == 0) {
    LED_PORT_BSRR = (1uL << LED0_BIT);       // Switch on LED0
  } else if (Index == 1) {
    LED_PORT_BSRR = (1uL << LED1_BIT);       // Switch on LED1
  }
}

/*********************************************************************
*
*       BSP_ClrLED()
*/
void BSP_ClrLED(int Index) {
  if (Index == 0) {
    LED_PORT_BSRR = (0x10000uL << LED0_BIT); // Switch off LED0
  } else if (Index == 1) {
    LED_PORT_BSRR = (0x10000uL << LED1_BIT); // Switch off LED1
  }
}

/*********************************************************************
*
*       BSP_ToggleLED()
*/
void BSP_ToggleLED(int Index) {
  if (Index == 0) {
    if ((LED_PORT_ODR & (1uL << LED0_BIT)) == 0) {  // LED is switched off
      LED_PORT_BSRR = (1uL << LED0_BIT);            // Switch on LED0
    } else {
      LED_PORT_BSRR = (0x10000uL << LED0_BIT);      // Switch off LED0
    }
  } else if (Index == 1) {
    if ((LED_PORT_ODR & (1uL << LED1_BIT)) == 0) {  // LED is switched off
      LED_PORT_BSRR = (1uL << LED1_BIT);            // Switch on LED1
    } else {
      LED_PORT_BSRR = (0x10000uL << LED1_BIT);      // Switch off LED1
    }
  }
}

/****** End Of File *************************************************/
