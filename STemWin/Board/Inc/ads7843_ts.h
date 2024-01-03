#ifndef __ADS7843_TS_H__
#define __ADS7843_TS_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx.h"

/* Private typedef -----------------------------------------------------------*/
typedef	struct POINT 
{
   uint16_t x;
   uint16_t y;
}Coordinate;


typedef struct Matrix {
long double An,
            Bn,
            Cn,
            Dn,
            En,
            Fn,
            Divider ;
} Matrix;

typedef struct
{
  uint16_t TouchDetected;
  uint16_t X;
  uint16_t Y;
  uint16_t Z;
}TS_StateTypeDef;



/* Private variables ---------------------------------------------------------*/
extern Coordinate ScreenSample[3];
extern Coordinate DisplaySample[3];
extern Matrix matrix ;
extern Coordinate  display ;

extern SPI_HandleTypeDef hspi3;

/* Private define ------------------------------------------------------------*/

#define	CHX 	0x90		// 0b1001.0000		
#define	CHY 	0xd0		// 0b1101.0000		

#define	ScreenSizeX		320
#define	ScreenSizeY		480

/* Private function prototypes -----------------------------------------------*/				
Coordinate *Read_Ads7843(void);
void TouchPanel_Calibrate(void);
void DrawCross(uint16_t Xpos,uint16_t Ypos);
void TP_DrawPoint(uint16_t Xpos,uint16_t Ypos);
FunctionalState setCalibrationMatrix( Coordinate * displayPtr,Coordinate * screenPtr,Matrix * matrixPtr);
FunctionalState getDisplayPoint(Coordinate * displayPtr,Coordinate * screenPtr,Matrix * matrixPtr );
void TS_Get_Coordinate_Display();

void BSP_Pointer_Update(void);
void BSP_TS_GetState(TS_StateTypeDef* TsState);


#endif	/*__ADS7843_TS_H__ */
