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
File    : JLINKMEM.h
Purpose : Header file for J-Link ARM communication using memory
---------------------------END-OF-HEADER------------------------------
*/

#ifndef JLINKMEM_H
#define JLINKMEM_H             // Avoid multiple inclusion

#ifdef __cplusplus
extern "C" {
#endif

void JLINKMEM_Process(void);
void JLINKMEM_SetpfOnRx(void (* pf)(unsigned char Data));
void JLINKMEM_SetpfOnTx(void (* pf)(void));
void JLINKMEM_SetpfGetNextChar(OS_INT (* pf)(void));
void JLINKMEM_SendChar(unsigned char Data);

#ifdef __cplusplus
}
#endif

#endif                         // Avoid multiple inclusion

/*************************** end of file ****************************/

