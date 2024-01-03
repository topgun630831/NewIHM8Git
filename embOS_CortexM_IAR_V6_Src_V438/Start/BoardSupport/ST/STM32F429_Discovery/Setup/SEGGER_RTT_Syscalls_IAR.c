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
--------  END-OF-HEADER  ---------------------------------------------
File    : SEGGER_RTT_Syscalls_IAR.c
Purpose : Low-level functions for using printf() via RTT in IAR.
          To use RTT for printf output, include this file in your 
          application and set the Library Configuration to Normal.
Revision: $Rev: 3667 $
----------------------------------------------------------------------
*/
#include <yfuns.h>
#include "SEGGER_RTT.h"
#pragma module_name = "?__write"

/*********************************************************************
*
*       Function prototypes
*
**********************************************************************
*/
size_t __write(int handle, const unsigned char * buffer, size_t size);

/*********************************************************************
*
*       Global functions
*
**********************************************************************
*/
/*********************************************************************
*
*       __write()
*
* Function description
*   Low-level write function.
*   Standard library subroutines will use this system routine
*   for output to all files, including stdout.
*   Write data via RTT.
*/
size_t __write(int handle, const unsigned char * buffer, size_t size) {
  (void) handle;  /* Not used, avoid warning */
  SEGGER_RTT_Write(0, (const char*)buffer, size);
  return size;
}

/*********************************************************************
*
*       __write_buffered()
*
* Function description
*   Low-level write function.
*   Standard library subroutines will use this system routine
*   for output to all files, including stdout.
*   Write data via RTT.
*/
size_t __write_buffered(int handle, const unsigned char * buffer, size_t size) {
  (void) handle;  /* Not used, avoid warning */
  SEGGER_RTT_Write(0, (const char*)buffer, size);
  return size;
}
/****** End Of File *************************************************/
