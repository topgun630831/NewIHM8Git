#ifndef __LCD_DRV_H__
#define __LCD_DRV_H__

#include "stm32f4xx_hal.h"

#define   Red     0xff0000
#define   Green   0x00ff00
#define   Blue    0x0000ff
#define   Yellow  0xffff00
#define   Cyne    0x00ffff
#define   Purple  0xff00ff
#define   Black   0x000000
#define   White   0xffffff
#define   Gray    0x808080
#define   LGray   0xc0c0c0

#define 	RGB565CONVERT(red, green, blue) 		(int) (((red >> 3) << 11) | ((green >> 2) << 5) | (blue >> 3))


#define LCD_HORIZ_PIXELS	320
#define LCD_VERT_PIXELS		480

#define x_start   0x00
#define x_end     (LCD_HORIZ_PIXELS-1) //MAIN_WINDOW_HORIZ_PIXELS - 1
#define y_start   0x00
#define y_end     (LCD_VERT_PIXELS-1) //MAIN_WINDOW_VERT_PIXELS - 1


/*################################ LCD #######################################*/
/** 
  * @brief  LCD Control pin  
  */ 
#define LCD_NCS_PIN                             		GPIO_PIN_7
#define LCD_NCS_GPIO_PORT                       	GPIOD
#define LCD_NCS_GPIO_CLK_ENABLE()         	__HAL_RCC_GPIOC_CLK_ENABLE()
#define LCD_NCS_GPIO_CLK_DISABLE()       	__HAL_RCC_GPIOC_CLK_DISABLE()

/** 
  * @brief  LCD Command/data pin  
  */
#define LCD_WRX_PIN                             		GPIO_PIN_11
#define LCD_WRX_GPIO_PORT                       GPIOD
#define LCD_WRX_GPIO_CLK_ENABLE()        	__HAL_RCC_GPIOD_CLK_ENABLE()
#define LCD_WRX_GPIO_CLK_DISABLE()       __HAL_RCC_GPIOD_CLK_DISABLE()
  
#if 0 //[[ by kys.2018.01.15_BEGIN -- test
#define LCD_RDX_PIN                             		GPIO_PIN_12
#define LCD_RDX_GPIO_PORT                       	GPIOD
#define LCD_RDX_GPIO_CLK_ENABLE()         	__HAL_RCC_GPIOD_CLK_ENABLE()
#define LCD_RDX_GPIO_CLK_DISABLE()       	__HAL_RCC_GPIOD_CLK_DISABLE()
#endif //]] by kys.2018.01.15_END -- test

/* Chip Select macro definition */
#define LCD_CS_LOW()       HAL_GPIO_WritePin(LCD_NCS_GPIO_PORT, LCD_NCS_PIN, GPIO_PIN_RESET)
#define LCD_CS_HIGH()      HAL_GPIO_WritePin(LCD_NCS_GPIO_PORT, LCD_NCS_PIN, GPIO_PIN_SET)

/* Set WRX High to send data */
#define LCD_WRX_LOW()      HAL_GPIO_WritePin(LCD_WRX_GPIO_PORT, LCD_WRX_PIN, GPIO_PIN_RESET)
#define LCD_WRX_HIGH()     HAL_GPIO_WritePin(LCD_WRX_GPIO_PORT, LCD_WRX_PIN, GPIO_PIN_SET)

#if 0 //[[ by kys.2018.01.15_BEGIN -- test
/* Set WRX High to send data */
#define LCD_RDX_LOW()      HAL_GPIO_WritePin(LCD_RDX_GPIO_PORT, LCD_RDX_PIN, GPIO_PIN_RESET)
#define LCD_RDX_HIGH()     HAL_GPIO_WritePin(LCD_RDX_GPIO_PORT, LCD_RDX_PIN, GPIO_PIN_SET)
#endif //]] by kys.2018.01.15_END -- test


unsigned int getUs(void);
void delayUs(unsigned short micros);


void LCD_OnOff(int nOnOff);

void LCD_init();
void LCD_Clear(unsigned int X0, unsigned int Y0, unsigned int width, unsigned int height, unsigned long Fill_Color);
void Display_String (unsigned int X0, unsigned int Y0, unsigned long Font_Color, unsigned char *Print_String);
void Display_String_2X (unsigned int X0, unsigned int Y0, unsigned long Font_Color, unsigned char *Print_String);
void Draw_Rectangle(unsigned int X0, unsigned int Y0, unsigned int X1, unsigned int Y1, unsigned long color);

extern void CPU_Command_Write(unsigned short nData);
extern void CPU_Data_Write(unsigned short nData);
extern unsigned short CPU_Data_Read(void);

void GUI_Text(uint16_t Xpos, uint16_t Ypos, uint8_t *str,uint16_t Color, uint16_t bkColor);

extern const unsigned char ASCII_TABLE[];


#endif /* __LCD_DRV_H__*/
