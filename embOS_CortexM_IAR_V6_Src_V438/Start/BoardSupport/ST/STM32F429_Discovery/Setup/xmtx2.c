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
File    : xmtx2.c
Purpose : xmtx file interface -- thread locking and unlocking
          functions for file i/o, adapted to embOS
--------- END-OF-HEADER ----------------------------------------------
*/

#include <yvals.h>
#include "RTOS.h"


#if _MULTI_THREAD

#if _DLIB_FILE_DESCRIPTOR

/*********************************************************************
*
*       Global functions
*
**********************************************************************
*/

/*********************************************************************
*
*       __iar_file_Mtxinit()
*/
__ATTRIBUTES void __iar_file_Mtxinit(__iar_Rmtx* m) {
  OS__iar_system_Mtxinit(m);    // Mapped to system mutex
}

/*********************************************************************
*
*       __iar_file_Mtxdst()
*/
__ATTRIBUTES void __iar_file_Mtxdst(__iar_Rmtx* m) {
  OS__iar_system_Mtxdst(m);     // Mapped to system mutex
}

/*********************************************************************
*
*       __iar_file_Mtxlock()
*/
__ATTRIBUTES void __iar_file_Mtxlock(__iar_Rmtx* m) {
  OS__iar_system_Mtxlock(m);    // Mapped to system mutex
}

/*********************************************************************
*
*       __iar_file_Mtxunlock()
*/
__ATTRIBUTES void __iar_file_Mtxunlock(__iar_Rmtx* m) {
  OS__iar_system_Mtxunlock(m);  // Mapped to system mutex
}
#endif /* _DLIB_FILE_DESCRIPTOR */

#endif /* _MULTI_THREAD */

/****** End Of File *************************************************/
