
/* Includes ------------------------------------------------------------------*/
#include "ads7843_ts.h"
#include "lcd.h"

/* Private variables ---------------------------------------------------------*/
Matrix matrix ;
Coordinate  display ;
Coordinate ScreenSample[3];
Coordinate DisplaySample[3] = {
                            { 50,  45 },
								{ 290, 100},
                            { 160,210}
};
//							{ 410, 45},
//                         { 410, 290} }; // { 50, 290} };

/* Private define ------------------------------------------------------------*/
#define THRESHOLD 2



 /* Configure TouchPanel pins:   TP_CS-> PC4 and TP_IRQ-> PC5 */
#if 1 //[[ by kys.2018.01.11_BEGIN -- test
#define TP_CS_PIN					GPIO_PIN_15
#define TP_CS_PORT				GPIOA
#define TP_IRQ_PIN				GPIO_PIN_4
#define TP_IRQ_PORT				GPIOB
#endif //]] by kys.2018.01.11_END -- test

#define TP_CS(x)		x ? HAL_GPIO_WritePin(TP_CS_PORT, TP_CS_PIN, GPIO_PIN_SET) : HAL_GPIO_WritePin(TP_CS_PORT, TP_CS_PIN, GPIO_PIN_RESET)
#define TP_INT_IN  HAL_GPIO_ReadPin(TP_IRQ_PORT, TP_IRQ_PIN)


void DelayUS(uint32_t cnt)
{
  uint32_t i;
  i = cnt * 4;
  while(i--);
}


void WR_CMD (uint8_t cmd)
{ 
	HAL_StatusTypeDef nErrStats;

	nErrStats = HAL_SPI_Transmit(&hspi3, &cmd, 1, 1000);
	if(nErrStats != HAL_OK) printf("wr err : 0x%x\n\r", nErrStats);
} 

int RD_AD(void)  
{ 
  uint8_t buf[2];
  int value;

  HAL_SPI_Receive(&hspi3, buf, 2, 1000);
  value = (uint16_t)((buf[0] << 8) + buf[1]) >> 3;

  return value;
} 


int Read_X(void)
{  
	int i; 

	//TP_CS(0);	//NSS - CS-  LOW EN
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_RESET);
		
	delayUs(1);
	WR_CMD(CHX); 
	delayUs(1);
	i=RD_AD(); 

	//TP_CS(1);		//NSS - CS-  HIGH DIS
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_SET);

	return i;    
} 

int Read_Y(void)
{
	int i;

	//TP_CS(0);	//NSS - CS-  LOW EN
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_RESET);

	delayUs(1);
	WR_CMD(CHY);
	delayUs(1);
	i=RD_AD();

	//TP_CS(1);		//NSS - CS-  HIGH DIS
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_SET);

	return i;
} 

void TP_GetAdXY(int *x, int *y)
{ 
	int adx, ady; 
	adx=Read_X();
	delayUs(1);
	ady=Read_Y();
	*x=adx; 
	*y=ady; 
}

void TP_DrawPoint(uint16_t Xpos,uint16_t Ypos)
{
#if 0
  LCD_SetPoint(Xpos, Ypos, Blue);     /* Center point */
  LCD_SetPoint(Xpos+1, Ypos, Blue);
  LCD_SetPoint(Xpos, Ypos+1, Blue);
  LCD_SetPoint(Xpos+1, Ypos+1, Blue);	
#else
	DrawCross(Xpos, Ypos);
#endif
}	

///ÁÂÇ¥ Ç¥½Ã
void DrawCross(uint16_t Xpos,uint16_t Ypos)
{
  Draw_Line(Xpos-15, Ypos, Xpos-2, Ypos, White);
  Draw_Line(Xpos+2, Ypos, Xpos+15, Ypos, White);
  Draw_Line(Xpos, Ypos-15, Xpos, Ypos-2, White);
  Draw_Line(Xpos, Ypos+2, Xpos, Ypos+15, White);
  
#if 0 //[[ by kys.2018.01.16_BEGIN -- test
  Draw_Line(Xpos-15, Ypos+15, Xpos-7, Ypos+15, RGB565CONVERT(184,158,131));
  Draw_Line(Xpos-15, Ypos+7, Xpos-15, Ypos+15, RGB565CONVERT(184,158,131));

  Draw_Line(Xpos-15, Ypos-15, Xpos-7, Ypos-15, RGB565CONVERT(184,158,131));
  Draw_Line(Xpos-15, Ypos-7, Xpos-15, Ypos-15, RGB565CONVERT(184,158,131));

  Draw_Line(Xpos+7, Ypos+15, Xpos+15, Ypos+15, RGB565CONVERT(184,158,131));
  Draw_Line(Xpos+15, Ypos+7, Xpos+15, Ypos+15, RGB565CONVERT(184,158,131));

  Draw_Line(Xpos+7, Ypos-15, Xpos+15, Ypos-15, RGB565CONVERT(184,158,131));
  Draw_Line(Xpos+15, Ypos-15, Xpos+15, Ypos-7, RGB565CONVERT(184,158,131));	  	
#endif //]] by kys.2018.01.16_END -- test
}	


Coordinate *Read_Ads7843(void)
{
  static Coordinate  screen;
  int m0,m1,m2,TP_X[1],TP_Y[1],temp[3];
  uint8_t count=0;
  int buffer[2][9]={{0},{0}};

  do
  {
    TP_GetAdXY(TP_X, TP_Y);
	buffer[0][count] = TP_X[0];
	buffer[1][count] = TP_Y[0];
	count++;
  }
  while( !TP_INT_IN && (count<9));
//  while( !(HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_4) ) && (count<9));

  if(count==9)   /* Average X Y  */
  {
	/* Average X  */
   temp[0]=(buffer[0][0]+buffer[0][1]+buffer[0][2])/3;
	temp[1]=(buffer[0][3]+buffer[0][4]+buffer[0][5])/3;
	temp[2]=(buffer[0][6]+buffer[0][7]+buffer[0][8])/3;

	m0=temp[0]-temp[1];
	m1=temp[1]-temp[2];
	m2=temp[2]-temp[0];

	m0=m0>0?m0:(-m0);
	m1=m1>0?m1:(-m1);
	m2=m2>0?m2:(-m2);

	if( m0>THRESHOLD  &&  m1>THRESHOLD  &&  m2>THRESHOLD )
	{
		return 0;
	}

	if(m0<m1)
	{
	  if(m2<m0) 
	    screen.x=(temp[0]+temp[2])/2;
	  else 
	    screen.x=(temp[0]+temp[1])/2;	
	}
	else if(m2<m1) 
	  screen.x=(temp[0]+temp[2])/2;
	else 
	  screen.x=(temp[1]+temp[2])/2;

	/* Average Y  */
  temp[0]=(buffer[1][0]+buffer[1][1]+buffer[1][2])/3;
	temp[1]=(buffer[1][3]+buffer[1][4]+buffer[1][5])/3;
	temp[2]=(buffer[1][6]+buffer[1][7]+buffer[1][8])/3;
	m0=temp[0]-temp[1];
	m1=temp[1]-temp[2];
	m2=temp[2]-temp[0];
	m0=m0>0?m0:(-m0);
	m1=m1>0?m1:(-m1);
	m2=m2>0?m2:(-m2);
	if(m0>THRESHOLD&&m1>THRESHOLD&&m2>THRESHOLD) return 0;

	if(m0<m1)
	{
	  if(m2<m0) 
	    screen.y=(temp[0]+temp[2])/2;
	  else 
	    screen.y=(temp[0]+temp[1])/2;	
    }
	else if(m2<m1) 
	   screen.y=(temp[0]+temp[2])/2;
	else
	   screen.y=(temp[1]+temp[2])/2;

	return &screen;
  }  
  return 0; 
}
	 

FunctionalState setCalibrationMatrix( Coordinate * displayPtr, Coordinate * screenPtr, Matrix * matrixPtr)
{

  FunctionalState retTHRESHOLD = ENABLE ;
  
  matrixPtr->Divider = ((screenPtr[0].x - screenPtr[2].x) * (screenPtr[1].y - screenPtr[2].y)) - ((screenPtr[1].x - screenPtr[2].x) * (screenPtr[0].y - screenPtr[2].y)) ;/* K£½(X0£­X2) (Y1£­Y2)£­(X1£­X2) (Y0£­Y2) */
  if( matrixPtr->Divider == 0 )
  {
    retTHRESHOLD = DISABLE;
  }
  else
  {
    matrixPtr->An = ((displayPtr[0].x - displayPtr[2].x) * (screenPtr[1].y - screenPtr[2].y)) - ((displayPtr[1].x - displayPtr[2].x) * (screenPtr[0].y - screenPtr[2].y)) ;/* A£½((XD0£­XD2) (Y1£­Y2)£­(XD1£­XD2) (Y0£­Y2))£¯K	*/
    matrixPtr->Bn = ((screenPtr[0].x - screenPtr[2].x) * (displayPtr[1].x - displayPtr[2].x)) - ((displayPtr[0].x - displayPtr[2].x) * (screenPtr[1].x - screenPtr[2].x)) ;/* B£½((X0£­X2) (XD1£­XD2)£­(XD0£­XD2) (X1£­X2))£¯K	*/
    matrixPtr->Cn = (screenPtr[2].x * displayPtr[1].x - screenPtr[1].x * displayPtr[2].x) * screenPtr[0].y + (screenPtr[0].x * displayPtr[2].x - screenPtr[2].x * displayPtr[0].x) * screenPtr[1].y + (screenPtr[1].x * displayPtr[0].x - screenPtr[0].x * displayPtr[1].x) * screenPtr[2].y ;/* C£½(Y0(X2XD1£­X1XD2)+Y1(X0XD2£­X2XD0)+Y2(X1XD0£­X0XD1))£¯K */
    matrixPtr->Dn = ((displayPtr[0].y - displayPtr[2].y) * (screenPtr[1].y - screenPtr[2].y)) - ((displayPtr[1].y - displayPtr[2].y) * (screenPtr[0].y - screenPtr[2].y)) ;/* D£½((YD0£­YD2) (Y1£­Y2)£­(YD1£­YD2) (Y0£­Y2))£¯K	*/
    matrixPtr->En = ((screenPtr[0].x - screenPtr[2].x) * (displayPtr[1].y - displayPtr[2].y)) - ((displayPtr[0].y - displayPtr[2].y) * (screenPtr[1].x - screenPtr[2].x)) ;/* E£½((X0£­X2) (YD1£­YD2)£­(YD0£­YD2) (X1£­X2))£¯K	*/
    matrixPtr->Fn = (screenPtr[2].x * displayPtr[1].y - screenPtr[1].x * displayPtr[2].y) * screenPtr[0].y +  (screenPtr[0].x * displayPtr[2].y - screenPtr[2].x * displayPtr[0].y) * screenPtr[1].y + (screenPtr[1].x * displayPtr[0].y - screenPtr[0].x * displayPtr[1].y) * screenPtr[2].y ;/* F£½(Y0(X2YD1£­X1YD2)+Y1(X0YD2£­X2YD0)+Y2(X1YD0£­X0YD1))£¯K */
  }
  return( retTHRESHOLD ) ;
}

FunctionalState getDisplayPoint(Coordinate * displayPtr, Coordinate * screenPtr, Matrix * matrixPtr )
{
  FunctionalState retTHRESHOLD = ENABLE;

  /*  An=168  */
  if( matrixPtr->Divider != 0 )
  {
    /* XD = AX+BY+C */        
    displayPtr->x = (uint16_t)(( (matrixPtr->An * screenPtr->x) + (matrixPtr->Bn * screenPtr->y) + matrixPtr->Cn ) / matrixPtr->Divider);
	/* YD = DX+EY+F */        
    displayPtr->y = (uint16_t)(( (matrixPtr->Dn * screenPtr->x) + (matrixPtr->En * screenPtr->y) + matrixPtr->Fn  ) / matrixPtr->Divider);
  }
  else
  {
    retTHRESHOLD = DISABLE;
  }
  return(retTHRESHOLD);
} 

void TouchPanel_Calibrate(void)
{
	uint8_t i;
	Coordinate * Ptr;
	char txtbuf[60]={0};
	
	LCD_Clear(0, 0, 320, 480, Black);
	
	for(i=0;i<3;i++)
	{
		Display_String(44, 10, White, "Touch crosshair to calibrate");
		HAL_Delay(300);
		DrawCross(DisplaySample[i].x,DisplaySample[i].y);
		do
		{
			Ptr = Read_Ads7843();
		}
		while( Ptr == (void*)0 );
		
		ScreenSample[i].x= Ptr->x; 
		ScreenSample[i].y= Ptr->y;

		sprintf(txtbuf, "%d:X:%d, Y:%d", i, ScreenSample[i].x, ScreenSample[i].y);
		Display_String(44, (30+(i*10)), White, (unsigned char*)txtbuf );
	}

	HAL_Delay(3000);

	if(setCalibrationMatrix( &DisplaySample[0],&ScreenSample[0],&matrix ) == DISABLE)
	{
		LCD_Clear(0, 0, 320, 480, Red);
	}
	else
	{
		LCD_Clear(0, 0, 320, 480, Black);
	}

} 


uint16_t tempx=0, tempy=0;
void TS_Get_Coordinate_Display()
{
	char	temp[20]={0};

	getDisplayPoint(&display, Read_Ads7843(), &matrix );
	TP_DrawPoint(display.x,display.y);
	if(tempx != display.x || tempy != display.y)
	{
		sprintf(temp,"X:%3d, Y:%3d", tempx, tempy);
		LCD_Clear(10, 10, 100, 100, Black);
		Display_String(10, 10, Yellow, (unsigned char *)temp);
		tempx = display.x;
		tempy = display.y;
	}	
}


//////////////////////////////////////////////////////////////////////
//emWin start
//////////////////////////////////////////////////////////////////////
#define emWin_Use
#ifdef emWin_Use


/**
  * @brief  Return if there is touch detected or not.
  * @param  DeviceAddr: Device address on communication Bus.
  * @retval Touch detected state.
  */
uint8_t BSP_TS_DetectTouch()
{
#if 0 //[[ by kys.2018.01.17_BEGIN -- test
	if( HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_4) == GPIO_PIN_RESET )	// Get ts
	{
		return 1;
	}
	return 0;
#else
	return 1;
#endif //]] by kys.2018.01.17_END -- test
}

void BSP_TS_GetXY(uint16_t *X, uint16_t *Y)
{
	TP_GetAdXY((int *)X, (int *)Y);
}

/**
  * @brief  Returns status and positions of the touch screen.
  * @param  TsState: Pointer to touch screen current state structure
  */
void BSP_TS_GetState(TS_StateTypeDef* TsState)
{
  static uint32_t _x = 0, _y = 0;
  uint16_t xDiff, yDiff , x , y, xr, yr;
  
  TsState->TouchDetected = BSP_TS_DetectTouch();
  
  if(TsState->TouchDetected)
  {
    BSP_TS_GetXY(&x, &y);
    
    /* Y value first correction */
    y -= 360;  
    
    /* Y value second correction */
    yr = y / 11;
    
    /* Return y position value */
    if(yr <= 0)
    {
      yr = 0;
    }
    else if (yr > ScreenSizeY)
    {
      yr = ScreenSizeY - 1;
    }
    else
    {}
    y = yr;
    
    /* X value first correction */
    if(x <= 3000)
    {
      x = 3870 - x;
    }
    else
    {
      x = 3800 - x;
    }
    
    /* X value second correction */  
    xr = x / 15;
    
    /* Return X position value */
    if(xr <= 0)
    {
      xr = 0;
    }
    else if (xr > ScreenSizeX)
    {
      xr = ScreenSizeX - 1;
    }
    else 
    {}
    
    x = xr;
    xDiff = x > _x? (x - _x): (_x - x);
    yDiff = y > _y? (y - _y): (_y - y); 
    
    if (xDiff + yDiff > 5)
    {
      _x = x;
      _y = y; 
    }
    
    /* Update the X position */
    TsState->X = _x;
    
    /* Update the Y position */  
    TsState->Y = _y;
  }
}

/**
  * @brief  Provide the GUI with current state of the touch screen
  * @param  None
  * @retval None
  */
void BSP_Pointer_Update(void)
{
  GUI_PID_STATE TS_State;
  static TS_StateTypeDef prev_state;
  TS_StateTypeDef  ts;

  uint16_t xDiff, yDiff;  


  BSP_TS_GetState(&ts);
  
  TS_State.Pressed = ts.TouchDetected;

  xDiff = (prev_state.X > ts.X) ? (prev_state.X - ts.X) : (ts.X - prev_state.X);
  yDiff = (prev_state.Y > ts.Y) ? (prev_state.Y - ts.Y) : (ts.Y - prev_state.Y);
  
  if((prev_state.TouchDetected != ts.TouchDetected )||
     (xDiff > 3 )||
       (yDiff > 3))
  {
    prev_state.TouchDetected = ts.TouchDetected;
    
    if((ts.X != 0) &&  (ts.Y != 0)) 
    {
      prev_state.X = ts.X;
      prev_state.Y = ts.Y;
    }
      
#if 0 //[[ by kys.2018.01.17_BEGIN -- calTest
    if(CALIBRATION_IsDone())
    {
      TS_State.Layer = 0;
      TS_State.x = CALIBRATION_GetX (prev_state.X);
      TS_State.y = CALIBRATION_GetY (prev_state.Y);
    }
    else
#endif //]] by kys.2018.01.17_END -- calTest
    {
      TS_State.Layer = 0;
      TS_State.x = prev_state.X;
      TS_State.y = prev_state.Y;
    }

    GUI_TOUCH_StoreStateEx(&TS_State);
  }
}
#endif
//////////////////////////////////////////////////////////////
//emWin end///////////////
//////////////////////////////////////////////////////////////

//end
