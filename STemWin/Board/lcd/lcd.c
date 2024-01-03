
//******************************************************
// Model 
// KJCT035320480-A7WMR-008
//******************************************************
#include <string.h>
#include <stdlib.h>

#include "stm32f4xx_hal.h"
#include "../inc/lcd.h"

// PRQA S 1505 EOF
// PRQA S 1503 EOF

const unsigned char ASCII_TABLE[] =
{
0x00,0x00,0x00,0x00,0x00,0x00,0x00,  // 
0x20,0x20,0x20,0x20,0x00,0x00,0x20,  // !
0x50,0x50,0x50,0x00,0x00,0x00,0x00,  // "
0x50,0x50,0xF8,0x50,0xF8,0x50,0x50,  // #
0x20,0x78,0xA0,0x70,0x28,0xF0,0x20,  // $
0xC0,0xC8,0x10,0x20,0x40,0x98,0x18,  // %
0x60,0x90,0xA0,0x40,0xA0,0x90,0x68,  // &
0x60,0x20,0x40,0x00,0x00,0x00,0x00,  // '
0x10,0x20,0x40,0x40,0x40,0x20,0x10,  // (
0x40,0x20,0x10,0x10,0x10,0x20,0x40,  // )
0x00,0x20,0xA8,0x70,0xA8,0x20,0x00,  // *
0x00,0x20,0x20,0xF8,0x20,0x20,0x00,  // +
0x00,0x00,0x00,0x00,0x60,0x20,0x40,  // ,
0x00,0x00,0x00,0xF8,0x00,0x00,0x00,  // -
0x00,0x00,0x00,0x00,0x00,0x60,0x60,  // .
0x00,0x08,0x10,0x20,0x40,0x80,0x00,  // /

0x70,0x88,0x98,0xA8,0xC8,0x88,0x70,  // 0
0x20,0x60,0x20,0x20,0x20,0x20,0x70,  // 1
0x70,0x88,0x08,0x10,0x20,0x40,0xF8,  // 2
0xF8,0x10,0x20,0x10,0x08,0x88,0x70,  // 3
0x10,0x30,0x50,0x90,0xF8,0x10,0x10,  // 4
0xF8,0x80,0xF0,0x08,0x08,0x88,0x70,  // 5
0x30,0x40,0x80,0xF0,0x88,0x88,0x70,  // 6
0xF8,0x08,0x10,0x20,0x40,0x40,0x40,  // 7
0x70,0x88,0x88,0x70,0x88,0x88,0x70,  // 8
0x70,0x88,0x88,0x78,0x08,0x10,0x60,  // 9
0x00,0x60,0x60,0x00,0x60,0x60,0x00,  // :
0x60,0x60,0x00,0x60,0x20,0x40,0x00,  // ;
0x10,0x20,0x40,0x80,0x40,0x20,0x10,  // <
0x00,0x00,0xF8,0x00,0xF8,0x00,0x00,  // =
0x40,0x20,0x10,0x08,0x10,0x20,0x40,  // >
0x70,0x88,0x08,0x10,0x20,0x00,0x20,  // ?

0x70,0x88,0x08,0x68,0xA8,0xA8,0x70,  // @
0x70,0x88,0x88,0xF8,0x88,0x88,0x88,  // A
0xF0,0x88,0x88,0xF0,0x88,0x88,0xF0,  // B
0x70,0x88,0x80,0x80,0x80,0x88,0x70,  // C
0xE0,0x90,0x88,0x88,0x88,0x90,0xE0,  // D
0xF8,0x80,0x80,0xE0,0x80,0x80,0xF8,  // E
0xF8,0x80,0x80,0xF0,0x80,0x80,0x80,  // F
0x70,0x88,0x80,0xB8,0x88,0x88,0x78,  // G
0x88,0x88,0x88,0xF8,0x88,0x88,0x88,  // H
0x70,0x20,0x20,0x20,0x20,0x20,0x70,  // I
0x38,0x10,0x10,0x10,0x10,0x90,0x60,  // J
0x88,0x90,0xA0,0xC0,0xA0,0x90,0x88,  // K
0x80,0x80,0x80,0x80,0x80,0x80,0xF8,  // L
0x88,0xD8,0xA8,0xA8,0x88,0x88,0x88,  // M
0x88,0x88,0xC8,0xA8,0x98,0x88,0x88,  // N
0x70,0x88,0x88,0x88,0x88,0x88,0x70,  // O

0xF0,0x88,0x88,0xF0,0x80,0x80,0x80,  // P
0x70,0x88,0x88,0x88,0xA8,0x90,0x68,  // Q
0xF0,0x88,0x88,0xF0,0xA0,0x90,0x88,  // R
0x78,0x80,0x80,0x70,0x08,0x08,0xF0,  // S
0xF8,0x20,0x20,0x20,0x20,0x20,0x20,  // T
0x88,0x88,0x88,0x88,0x88,0x88,0x70,  // U
0x88,0x88,0x88,0x88,0x88,0x50,0x20,  // V
0x88,0x88,0x88,0xA8,0xA8,0xA8,0x50,  // W
0x88,0x88,0x50,0x20,0x50,0x88,0x88,  // X
0x88,0x88,0x88,0x50,0x20,0x20,0x20,  // Y
0xF8,0x08,0x10,0x20,0x40,0x80,0xF8,  // Z
0x70,0x40,0x40,0x40,0x40,0x40,0x70,  // [
0x00,0x80,0x40,0x20,0x10,0x08,0x00,  // \  0x88,0x50,0xF8,0x20,0xF8,0x20,0x20,  // ＄
0x70,0x10,0x10,0x10,0x10,0x10,0x70,  // ]
0x20,0x50,0x88,0x00,0x00,0x00,0x00,  // ^
0x00,0x00,0x00,0x00,0x00,0x00,0xF8,  // _

0x40,0x20,0x10,0x00,0x00,0x00,0x00,  // `
0x00,0x00,0x70,0x08,0x78,0x88,0x78,  // a
0x80,0x80,0xB0,0xC8,0x88,0x88,0xF0,  // b
0x00,0x00,0x70,0x80,0x80,0x88,0x70,  // c
0x08,0x08,0x68,0x98,0x88,0x88,0x78,  // d
0x00,0x00,0x70,0x88,0xF8,0x80,0x70,  // e
0x30,0x48,0x40,0xE0,0x40,0x40,0x40,  // f
0x00,0x78,0x88,0x88,0x78,0x08,0x70,  // g
0x80,0x80,0xB0,0xC8,0x88,0x88,0x88,  // h
0x20,0x00,0x60,0x20,0x20,0x20,0x70,  // i
0x10,0x00,0x30,0x10,0x10,0x90,0x60,  // j
0x80,0x80,0x90,0xA0,0xC0,0xA0,0x90,  // k
0x60,0x20,0x20,0x20,0x20,0x20,0x70,  // l
0x00,0x00,0xD0,0xA8,0xA8,0x88,0x88,  // m
0x00,0x00,0xB0,0xC8,0x88,0x88,0x88,  // n
0x00,0x00,0x70,0x88,0x88,0x88,0x70,  // o

0x00,0x00,0xF0,0x88,0xF0,0x80,0x80,  // p
0x00,0x00,0x68,0x98,0x78,0x08,0x08,  // q
0x00,0x00,0xB0,0xC8,0x80,0x80,0x80,  // r
0x00,0x00,0x70,0x80,0x70,0x08,0xF0,  // s
0x40,0x40,0xE0,0x40,0x40,0x48,0x30,  // t
0x00,0x00,0x88,0x88,0x88,0x98,0x68,  // u
0x00,0x00,0x88,0x88,0x88,0x50,0x20,  // v
0x00,0x00,0x88,0x88,0xA8,0xA8,0x50,  // w
0x00,0x00,0x88,0x50,0x20,0x50,0x88,  // x
0x00,0x00,0x88,0x88,0x78,0x08,0x70,  // y
0x00,0x00,0xF8,0x10,0x20,0x40,0xF8,  // z
0x10,0x20,0x20,0x40,0x20,0x20,0x10,  // {
0x20,0x20,0x20,0x20,0x20,0x20,0x20,  // |
0x40,0x20,0x20,0x10,0x20,0x20,0x40,  // }
//0x00,0x20,0x10,0xF8,0x10,0x20,0x00,  // ->
0x00,0x00,0x40,0xa8,0x10,0x00,0x00,  // ~
0x00,0x20,0x40,0xF8,0x40,0x20,0x00,  // <-

0x38,0xF8,0x38,0x38,0x38,0xF8,0x38,  //Exit      80
0x00,0x88,0xD0,0xE0,0xC0,0x80,0x00,  //Power     81
0x00,0x80,0x40,0x20,0x18,0x00,0x00,  //Icon      82

0x38,0x20,0x68,0x68,0x68,0x20,0x38,  //Battery   83
0xF8,0x00,0xB0,0xB0,0xB0,0x00,0xF8,  //Full      84
0xF0,0x10,0xD0,0xD0,0xD0,0x10,0xF0,  //Icon      85

0x38,0x20,0x60,0x60,0x60,0x20,0x38,  //Battery   86
0xF8,0x00,0x30,0x30,0x30,0x00,0xF8,  //60        87
//0xF0,0x10,0xD0,0xD0,0xD0,0x10,0xF0,  //Percent

//0x38,0x20,0x60,0x60,0x60,0x20,0x38,  //Battery
0xF8,0x00,0x00,0x00,0x00,0x00,0xF8,  //30        88
//0xF0,0x10,0xD0,0xD0,0xD0,0x10,0xF0,  //Percent

//0x38,0x20,0x60,0x60,0x60,0x20,0x38,  //Battery
0xF8,0x00,0x00,0x00,0x00,0x00,0xF8,    // Low    89
0xF0,0x10,0x10,0x10,0x10,0x10,0xF0,    // Icon   8a


0x38,0x20,0x08,0xF8,0x08,0x20,0x38,   //Battery  8b
0xF8,0x00,0x30,0xB0,0x30,0x00,0xF8,   //Charging 8c
//0xF0,0x10,0xD0,0xD0,0xD0,0x10,0xF0    //Icon

0x20,0x20,0x20,0xf8,0x70,0x20,0x00,    //Stepping down 8D
0x20,0x70,0xf8,0x20,0x20,0x20,0x00,    //Stepping up   8e

0xf8,0x88,0x88,0x88,0x88,0x88,0xf8,     // Unknown character

};

static void _CPU_Ram_Write(unsigned long lData);
static void Set_Window_Size(unsigned int X0, unsigned int Y0, unsigned int X1, unsigned int Y1);
static void Draw_Line(int X0, int Y0, int X1, int Y1, unsigned long color);

#define LCD_REG      (*((volatile unsigned short *) 0x60000000)) 
#define LCD_RAM      (*((volatile unsigned short *) 0x60020000)) 			// 10.0000.0000.0000.0000

#define	US_DIV		1000000
#define	MS_MUL		1000
#define	COLOR_BLUE	0x0000FF
#define	COLOR_GREEN	0x00FF00
#define	COLOR_RED	0xFF0000
#define	SHIFT_2		2
#define	SHIFT_3		3
#define	SHIFT_5		5
#define	SHIFT_8		8
#define	SHIFT_11	11
#define	SHIFT_16	16
#define	DISPLAY_ON	0x29
#define	DISPLAY_OFF	0x28

#define	DELAY_10	10
#define	DELAY_100	100

//static unsigned int getUs(void);

void CPU_Command_Write(unsigned short nData)
{
	LCD_REG = nData;
}

void CPU_Data_Write(unsigned short nData)
{
	LCD_RAM = nData;
}

unsigned short CPU_Data_Read(void)
{
	return LCD_RAM;
}

//micro-sec.
//static unsigned int getUs(void) 
//{
//	unsigned int usTicks = HAL_RCC_GetSysClockFreq() / US_DIV;
//	register unsigned int ms, cycle_cnt;
//	do {
//		ms = HAL_GetTick();
//		cycle_cnt = SysTick->VAL;
//	} while (ms != HAL_GetTick());
//
//	return (ms * MS_MUL) + (((usTicks * MS_MUL) - cycle_cnt) / usTicks);
//}
 /*
void delayUs(unsigned short micros) 
{
	unsigned int start = getUs();
	while (getUs()-start < (unsigned int) micros) 
	{
#if 0 //[[ by kys.2017.12.30_BEGIN -- test
		asm("nop");
#else
		__ASM volatile ("NOP");
#endif //]] by kys.2017.12.30_END -- test
	}
	
	return;
}
*/

/*
static void delay(void)
{
  volatile	int i;
  for(i=0;i<2;i++);
}  
*/

static void _CPU_Ram_Write(unsigned long lData)
{
#if 0
#else
	unsigned short nRGB;	
	unsigned short nBlue 		= (lData & COLOR_BLUE);
	unsigned short nGreen 	= (lData & COLOR_GREEN) >> SHIFT_8;
	unsigned short nRed 		= (lData & COLOR_RED) >> SHIFT_16;

	nRed 		= nRed>>SHIFT_3;
	nGreen 	= nGreen>>SHIFT_2;
	nBlue 		= nBlue>>SHIFT_3;
	nRGB = (nRed<<SHIFT_11) | (nGreen<<SHIFT_5) | (nBlue);
	CPU_Data_Write(nRGB);
#endif
}


void LCD_OnOff(int nOnOff)
{
//	int nOFSwitch;
//	if( (nOnOff != 0) ||(nOnOff != 1) )
//		return;
	
	if(nOnOff == 1)
	{
		CPU_Command_Write(DISPLAY_ON);	// DISPON (DISPLAY ON)
	}
	else
	{
		CPU_Command_Write(DISPLAY_OFF);	// DISPON (DISPLAY OFF)
	}
	
	return;
}


// PRQA S 3120 ++
#if 0
void LCD_init(void)
{
	//unsigned short DeviceCode;

	/////////////////////////////////////////////////////
	// Lcd Reset 
	// GPIO PE3 - 
	// High(10ms) -> Low(100ms) -> High(10ms)
	HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_SET);
	HAL_Delay(DELAY_10);
	HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_RESET);
	HAL_Delay(DELAY_100);
	HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_SET);
	HAL_Delay(DELAY_10);
	/////////////////////////////////////////////////////


	CPU_Command_Write(0xda);
	//DeviceCode = 
	    (void)CPU_Data_Read();	/* Read LCD ID1	*/	
//	DeviceCode = CPU_Data_Read();	/* Read LCD ID	*/	
//	DeviceCode = CPU_Data_Read();	/* Read LCD ID	*/	
//	if(DeviceCode )

	CPU_Command_Write(0x36);     
#if 0 //[[ by kys.2018.01.15_BEGIN -- test
	CPU_Data_Write(0x08); 
#else
	CPU_Data_Write(0x48);		// 0100.11-- 가로반전 
#endif //]] by kys.2018.01.15_END -- test

	CPU_Command_Write(0x3A);     // Interface Pixel Format
	//CPU_Data_Write(0x66); 
	CPU_Data_Write(0x05); 				// by kys // cpu 565

	////////////////////////////////
	////////////////////////////////
	// command set control -enable
	CPU_Command_Write(0xF0);     
	CPU_Data_Write(0xC3);   

	CPU_Command_Write(0xF0);     
	CPU_Data_Write(0x96);   
	////////////////////////////////
	////////////////////////////////
	CPU_Command_Write(0xB4);     // DIC (DISPLAY INVERSION CONTROL) - 역상 
	CPU_Data_Write(0x01); 

	CPU_Command_Write(0xB6);     	// display function control
	//CPU_Data_Write(0xA0); 				// 1010.0000 
	CPU_Data_Write(0x80); 					// 1000.0000 		// by kys
	CPU_Data_Write(0x02); 
	CPU_Data_Write(0x3B);

	CPU_Command_Write(0xB7);	// EM (ENTRY MODE SET)		// by kys
	CPU_Data_Write(0xc0);

	CPU_Command_Write(0xC1);    // Power Control 2
	CPU_Data_Write(0x13); 

	CPU_Command_Write(0xC2);     // Power Control 3
	CPU_Data_Write(0xA7); 

	CPU_Command_Write(0xC5);   		// Vcom Control
	CPU_Data_Write(0x26); 

	CPU_Command_Write(0xE8);     // Display Output // CTRL Adjust
	CPU_Data_Write(0x40);   
	CPU_Data_Write(0x8A);   
	CPU_Data_Write(0x00);   
	CPU_Data_Write(0x00);   
	CPU_Data_Write(0x29);
	CPU_Data_Write(0x19);
	CPU_Data_Write(0xA5);
	CPU_Data_Write(0x33);       

	CPU_Command_Write(0xE0);     // Positive Gamma Control
	CPU_Data_Write(0xF0); 
	CPU_Data_Write(0x07);
	CPU_Data_Write(0x0B);
	CPU_Data_Write(0x08);
	CPU_Data_Write(0x07);
	CPU_Data_Write(0x04);
	CPU_Data_Write(0x2E);
	CPU_Data_Write(0x33);
	CPU_Data_Write(0x45);
	CPU_Data_Write(0x17);
	CPU_Data_Write(0x13);
	CPU_Data_Write(0x13);
	CPU_Data_Write(0x29);
	CPU_Data_Write(0x30); 

	CPU_Command_Write(0xE1);     // Negative Gamma Control
	CPU_Data_Write(0xF0); 
	CPU_Data_Write(0x07);
	CPU_Data_Write(0x0B);
	CPU_Data_Write(0x08);
	CPU_Data_Write(0x07);
	CPU_Data_Write(0x04);
	CPU_Data_Write(0x2E);
	CPU_Data_Write(0x33);
	CPU_Data_Write(0x45);
	CPU_Data_Write(0x17);
	CPU_Data_Write(0x13);
	CPU_Data_Write(0x13);
	CPU_Data_Write(0x29);
	CPU_Data_Write(0x30);

	////////////////////////////////
	////////////////////////////////
	// command set control -disable
	CPU_Command_Write(0xF0);     
	CPU_Data_Write(0x3C);   

	CPU_Command_Write(0xF0);     
	CPU_Data_Write(0x69);
	////////////////////////////////
	////////////////////////////////

	CPU_Command_Write(0x21); // Display inversion on
	CPU_Command_Write(0x11);	// Sleep out
	CPU_Command_Write(0x29); // Display on
	CPU_Command_Write(0x2C); // Memory write (GRam)

}
#else

void LCD_init(void)
{
	/////////////////////////////////////////////////////
	// Lcd Reset 
	// GPIO PE3 - 
	// High(10ms) -> Low(100ms) -> High(10ms)
	HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_SET);
	HAL_Delay(DELAY_10);
	HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_RESET);
	HAL_Delay(DELAY_100);
	HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_SET);
	HAL_Delay(DELAY_10);
	/////////////////////////////////////////////////////

#if 1 //[[ by kys.2018.11.28_BEGIN --  
    CPU_Command_Write(0xF0);    // command set control -enable
    CPU_Data_Write(0xC3);
    
    CPU_Command_Write(0xF0);
    CPU_Data_Write(0x96);
        
    CPU_Command_Write(0x36);
    CPU_Data_Write(0x44);           // 0100.0100 -- 가로반전, RGB
    
    CPU_Command_Write(0x3A);   // Interface Pixel Format
    CPU_Data_Write(0x55);           // cpu 565
    
    CPU_Command_Write(0xB4);   // DIC (DISPLAY INVERSION CONTROL) - 역상   
    CPU_Data_Write(0x00);
    
    CPU_Command_Write(0xB6);    // display function control   
    CPU_Data_Write(0x80);
    CPU_Data_Write(0x02);
    CPU_Data_Write(0x3B);
    
    CPU_Command_Write(0xC1);    // Power Control 2   
    CPU_Data_Write(0x13);
    
    CPU_Command_Write(0xC2);    // Power Control 3  
    CPU_Data_Write(0xA7);
    
    CPU_Command_Write(0xC5);   	// Vcom Control
    CPU_Data_Write(0x26);
    
    CPU_Command_Write(0xE8);     // Display Output // CTRL Adjust     
    CPU_Data_Write(0x40);
    CPU_Data_Write(0x8A);
    CPU_Data_Write(0x00);
    CPU_Data_Write(0x00);
    CPU_Data_Write(0x29);
    CPU_Data_Write(0x19);
    CPU_Data_Write(0xA5);
    CPU_Data_Write(0x33);
    
    CPU_Command_Write(0xE0);     // Positive Gamma Control     
    CPU_Data_Write(0xF0);
    CPU_Data_Write(0x07);
    CPU_Data_Write(0x0B);
    CPU_Data_Write(0x08);
    CPU_Data_Write(0x07);
    CPU_Data_Write(0x04);
    CPU_Data_Write(0x2E);
    CPU_Data_Write(0x33);
    CPU_Data_Write(0x45);
    CPU_Data_Write(0x17);
    CPU_Data_Write(0x13);
    CPU_Data_Write(0x13);
    CPU_Data_Write(0x29);
    CPU_Data_Write(0x30); 
    
    CPU_Command_Write(0xE1);     // Negative Gamma Control
    CPU_Data_Write(0xF0); 
    CPU_Data_Write(0x07);
    CPU_Data_Write(0x0B);
    CPU_Data_Write(0x08);
    CPU_Data_Write(0x07);
    CPU_Data_Write(0x04);
    CPU_Data_Write(0x2E);
    CPU_Data_Write(0x33);
    CPU_Data_Write(0x45);
    CPU_Data_Write(0x17);
    CPU_Data_Write(0x13);
    CPU_Data_Write(0x13);
    CPU_Data_Write(0x29);
    CPU_Data_Write(0x30);
    
    // command set control -disable
    CPU_Command_Write(0xF0);
    CPU_Data_Write(0x3C);
    
    CPU_Command_Write(0xF0);
    CPU_Data_Write(0x69);
    
    CPU_Command_Write(0x21);  // Display inversion on
    CPU_Command_Write(0x11);  // Sleep out
    HAL_Delay(120);
    CPU_Command_Write(0x29);  // Display on
    HAL_Delay(10);
    //CPU_Command_Write(0x2C); // Memory write (GRam)
#else

#if 0 //[[ by kys.2018.10.21_BEGIN --  
    CPU_Command_Write(0xda);
    DeviceCode = CPU_Data_Read();	/* Read LCD ID1	*/
//	DeviceCode = CPU_Data_Read();	/* Read LCD ID	*/
//	DeviceCode = CPU_Data_Read();	/* Read LCD ID	*/
//	if(DeviceCode )
#endif //]] by kys.2018.10.21_END --  

    ////////////////////////////////
    // command set control -enable
    CPU_Command_Write(0xF0);
    CPU_Data_Write(0xC3);

    CPU_Command_Write(0xF0);
    CPU_Data_Write(0x96);
    ////////////////////////////////

    CPU_Command_Write(0x36);
#if 0 //[[ by kys.2018.01.15_BEGIN -- test
    CPU_Data_Write(0x08);
#else
    CPU_Data_Write(0x48);		// 0100.11-- 가로반전
#endif //]] by kys.2018.01.15_END -- test

    CPU_Command_Write(0x3A);     // Interface Pixel Format
    //CPU_Data_Write(0x66);
    CPU_Data_Write(0x05); 				// by kys // cpu 565


    CPU_Command_Write(0xB4);     // DIC (DISPLAY INVERSION CONTROL) - 역상
    CPU_Data_Write(0x01);

    CPU_Command_Write(0xB6);     	// display function control
    //CPU_Data_Write(0xA0); 				// 1010.0000
    CPU_Data_Write(0x80); 				// 1000.0000 		// by kys
    CPU_Data_Write(0x02);
    CPU_Data_Write(0x3B);

#if 0 //[[ by kys.2018.12.05_BEGIN --  
    CPU_Data_Write(0xc0);
    CPU_Command_Write(0xB7);	// EM (ENTRY MODE SET)		// by kys
#endif //]] by kys.2018.12.05_END --  

    CPU_Command_Write(0xC1);    // Power Control 2
    CPU_Data_Write(0x13);

    CPU_Command_Write(0xC2);     // Power Control 3
    CPU_Data_Write(0xA7);

    CPU_Command_Write(0xC5);     // Vcom Control
    CPU_Data_Write(0x26);

    CPU_Command_Write(0xE8);     // Display Output // CTRL Adjust
    CPU_Data_Write(0x40);
    CPU_Data_Write(0x8A);
    CPU_Data_Write(0x00);
    CPU_Data_Write(0x00);
    CPU_Data_Write(0x29);
    CPU_Data_Write(0x19);
    CPU_Data_Write(0xA5);
    CPU_Data_Write(0x33);

    CPU_Command_Write(0xE0);     // Positive Gamma Control
    CPU_Data_Write(0xF0);
    CPU_Data_Write(0x07);
    CPU_Data_Write(0x0B);
    CPU_Data_Write(0x08);
    CPU_Data_Write(0x07);
    CPU_Data_Write(0x04);
    CPU_Data_Write(0x2E);
    CPU_Data_Write(0x33);
    CPU_Data_Write(0x45);
    CPU_Data_Write(0x17);
    CPU_Data_Write(0x13);
    CPU_Data_Write(0x13);
    CPU_Data_Write(0x29);
    CPU_Data_Write(0x30);

    CPU_Command_Write(0xE1);     // Negative Gamma Control
    CPU_Data_Write(0xF0);
    CPU_Data_Write(0x07);
    CPU_Data_Write(0x0B);
    CPU_Data_Write(0x08);
    CPU_Data_Write(0x07);
    CPU_Data_Write(0x04);
    CPU_Data_Write(0x2E);
    CPU_Data_Write(0x33);
    CPU_Data_Write(0x45);
    CPU_Data_Write(0x17);
    CPU_Data_Write(0x13);
    CPU_Data_Write(0x13);
    CPU_Data_Write(0x29);
    CPU_Data_Write(0x30);

    ////////////////////////////////
    // command set control -disable
    CPU_Command_Write(0xF0);
    CPU_Data_Write(0x3C);

    CPU_Command_Write(0xF0);
    CPU_Data_Write(0x69);
    ////////////////////////////////

    CPU_Command_Write(0x21); // Display inversion on
    CPU_Command_Write(0x11); // Sleep out
    CPU_Command_Write(0x29); // Display on
    CPU_Command_Write(0x2C); // Memory write (GRam)
#endif //]] by kys.2018.11.28_END --  

}
#endif

static void Set_Window_Size(unsigned int X0, unsigned int Y0, unsigned int X1, unsigned int Y1)
{
	CPU_Command_Write(0x2a);
	CPU_Data_Write((unsigned char)((X0)>>8));
	CPU_Data_Write((unsigned char)X0);
	CPU_Data_Write((unsigned char)((X1)>>8));
	CPU_Data_Write((unsigned char)X1);
	
	CPU_Command_Write(0x2b);
	CPU_Data_Write((unsigned char)(Y0>>8));
	CPU_Data_Write((unsigned char)Y0);
	CPU_Data_Write((unsigned char)(Y1>>8));
	CPU_Data_Write((unsigned char)Y1);

	CPU_Command_Write(0x2c);	// write data to GRAM
}

void 	LCD_Clear(unsigned int X0, unsigned int Y0, unsigned int width, unsigned int height, unsigned long Fill_Color)
{
	unsigned int i, j;

	CPU_Command_Write(0x2a);
	CPU_Data_Write((unsigned char)((X0)>>8));
	CPU_Data_Write((unsigned char)X0);
	CPU_Data_Write((unsigned char)((width+X0)>>8));
	CPU_Data_Write((unsigned char)(width+X0));
	
	CPU_Command_Write(0x2b);
	CPU_Data_Write((unsigned char)(Y0>>8));
	CPU_Data_Write((unsigned char)Y0);
	CPU_Data_Write((unsigned char)(((height+Y0)-1)>>8));
	CPU_Data_Write((unsigned char)((height+Y0)-1));

	CPU_Command_Write( 0x2c );

	for(i = 0; i< height; i++)
	{
		for(j=0; j<width; j++)
		{ 
			_CPU_Ram_Write(Fill_Color);
		}
	}

	LCD_OnOff(1);
}

#define DISP_ORIENTATION					270
#define  MAX_X  320
#define  MAX_Y  480   
#if 0 

static void LCD_SetCursor( uint16_t Xpos, uint16_t Ypos )
{				   
  	uint16_t temp;	

	#if (DISP_ORIENTATION == 0)
		
	#elif (DISP_ORIENTATION == 90)
		temp = Xpos;
		Xpos = Ypos;
		Ypos = MAX_X - 1 - temp;				
	#elif (DISP_ORIENTATION == 180)
		Xpos = MAX_X - 1 - Xpos; 
		Ypos = MAX_Y - 1 - Ypos; 
	#elif (DISP_ORIENTATION == 270)
		temp = Ypos;
		Ypos = Xpos;
		Xpos = MAX_Y - 1 - temp;
	#endif

		CPU_Command_Write(0x0020);
		CPU_Data_Write(Xpos);
	
		CPU_Command_Write(0x0021);    
		CPU_Data_Write(Ypos);
}
static void LCD_SetPoint(uint16_t Xpos,uint16_t Ypos,uint16_t point)
{
	if((Xpos >= MAX_X) || (Ypos >= MAX_Y ))
	{
		return;
	}
	LCD_SetCursor(Xpos,Ypos);
	CPU_Command_Write(0x0022);
	CPU_Data_Write(point);
}



static void GetASCIICode(unsigned char* pBuffer,unsigned char ASCII)
{  
//   memcpy(pBuffer, AsciiLib[(ASCII - 32)] ,16);
   memcpy(pBuffer, (void const *)ASCII_TABLE[(ASCII - 32)] ,16);
	 
}
void PutChar( uint16_t Xpos, uint16_t Ypos, uint8_t ASCI, uint16_t charColor, uint16_t bkColor )
{
	uint16_t i, j;
    uint8_t buffer[16], tmp_char;
    GetASCIICode(buffer,ASCI);
    for( i=0; i<16; i++ )
    {
        tmp_char = buffer[i];
        for( j=0; j<8; j++ )
        {
            if( (tmp_char >> 7 - j) & 0x01 == 0x01 )
            {
                LCD_SetPoint( Xpos + j, Ypos + i, charColor );
            }
            else
            {
                LCD_SetPoint( Xpos + j, Ypos + i, bkColor );
            }
        }
    }
}

void GUI_Text(uint16_t Xpos, uint16_t Ypos, uint8_t *str,uint16_t Color, uint16_t bkColor)
{
    uint8_t TempChar;
    do
    {
        TempChar = *str++;  
        PutChar( Xpos, Ypos, TempChar, Color, bkColor );    
        if( Xpos < MAX_X - 8 )
        {
            Xpos += 8;
        } 
        else if ( Ypos < MAX_Y - 16 )
        {
            Xpos = 0;
            Ypos += 16;
        }   
        else
        {
            Xpos = 0;
            Ypos = 0;
        }    
    }
    while ( *str != 0 );
}

void Display_String (unsigned int X0, unsigned int Y0, unsigned long Font_Color, char Print_String[])
{
	unsigned char i,j,m,CharLength, CHAR;
	unsigned int  Char_Address;
	unsigned int  x,y;

	x = X0;
	y = Y0;

	CharLength = strlen((char*)Print_String);  // Get string length
	
	for (i=0; i<CharLength; i++)
	{
		Char_Address = ( Print_String[i] - 32) * 7; //Get character start address in ascii table
		for (j=0; j<7; j++)        // Font height is 7
		{
			CHAR = ASCII_TABLE[Char_Address++];

			for (m = 0; m<5; m++)
			{
				if((CHAR & 0x80) == 0x80)
				{
					Set_Window_Size (X0, Y0, X0, Y0);		  
					//CPU_Command_Write(0x2c);
					_CPU_Ram_Write(Font_Color);
				}
				X0++;
				CHAR = CHAR<<1;
			}
			X0 = x;
			Y0++;
		}

		Y0 = y;
		x += 6;
		if(x > (x_end - 4))
		{
			x = x_start; //x_start+1;
			Y0 += 8;

			if(Y0 > (y_end - 7))
			{
				Y0 =y_start+1;
			}
		}
		X0 = x;      
	}
}

void Display_String_2X (unsigned int X0, unsigned int Y0, unsigned long Font_Color, char Print_String[])
{
	unsigned char i, j, m, CharLength, CHAR;
	unsigned int  x, y;
	unsigned int  Char_Address;

	x = X0;
	y = Y0;
  

	CharLength = strlen((char*)Print_String);  // Get string length

	for (i=0; i<CharLength; i++)
	{
		Char_Address = (Print_String[i] - 32) * 7; //Get character start address in ascii table

		for (j=0; j<7; j++)        // Font height is 7
		{
			CHAR = ASCII_TABLE[Char_Address++];
			for (m = 0; m<5; m++)
			{
				if((CHAR & 0x80) == 0x80)
				{
					Set_Window_Size (X0, Y0, X0+1, Y0+1);		  
				//CPU_Command_Write(0x22);
					_CPU_Ram_Write(Font_Color);
					_CPU_Ram_Write(Font_Color);
					_CPU_Ram_Write(Font_Color);
					_CPU_Ram_Write(Font_Color);
				}

				X0+=2;
				CHAR = CHAR<<1;
			}

			X0 = x;
			Y0+=2;
		}

		Y0 = y;
		x += 11;
		if(x > (x_end - 10))
		{
			x = x_start; //x_start+1;
			Y0 += 16;
			if(Y0 > (y_end - 14))
			{
				Y0 =y_start+1;
			}
		}
		X0 = x;      
	}
}
#endif
/*
static void Display_Char_2X (unsigned int X0, unsigned int Y0, unsigned long font_color, unsigned char print_char)
{
	unsigned int Char_Address;
	unsigned int x;
	unsigned char j, m, CHAR;

	x  = X0;
	Char_Address = (print_char - 32) * 7; //Get character start address in ascii table

	for (j=0; j<7; j++)
	{
		CHAR = ASCII_TABLE[Char_Address++];
		
		for (m = 0; m<5; m++)
		{
			if ((CHAR & 0x80) == 0x80)
			{
				Set_Window_Size (X0, Y0, X0+1, Y0+1);
			//CPU_Command_Write(0x22);
				_CPU_Ram_Write(font_color);
				_CPU_Ram_Write(font_color);
				_CPU_Ram_Write(font_color);
				_CPU_Ram_Write(font_color);
			}

			X0 +=2;
			CHAR= CHAR<<1;
		}
		X0 = x;
		Y0+=2;
	}
}
*/
static void Draw_Line(int X0, int Y0, int X1, int Y1, unsigned long color)
{
	unsigned int length1,length2;
	unsigned int i;
	int x, y;

	if((X0==X1) && (Y0==Y1))                             //if only have one point
	{
		Set_Window_Size(X0, Y0, X1, Y1);
//	CPU_Command_Write(0x22);
		_CPU_Ram_Write(color);
	}

	else                                           //line between two point
	{
		length1=abs(X1-X0)+1;
		length2=abs(Y1-Y0)+1;
		if(length1>length2)
		{
			for(i=0;i<length1;i++)
			{
				if (X0<X1)
				{
					x = X0 + i;
				}
				else
				{
					x = X0 - i;
				}
				y=Y0 + (((Y1-Y0) * (x-X0)) / (X1-X0));
				Set_Window_Size(x,y,x,y);
		//	CPU_Command_Write(0x22);
				_CPU_Ram_Write(color);
			}
		}
		else
		{
			for(i=0;i<length2;i++)
			{
				if (Y0<Y1)
				{
					y=Y0+i;
				}
				else
				{
					y = Y0-i;
				}

				x=X0 + (((X1-X0) * (y-Y0)) / (Y1-Y0));
				Set_Window_Size(x,y,x,y);
		//	CPU_Command_Write(0x22);
				_CPU_Ram_Write(color);		  
			}
		}
	}
}
// PRQA S 3120 --

void Draw_Rectangle(unsigned int X0, unsigned int Y0, unsigned int X1, unsigned int Y1, unsigned long color)
{
	Draw_Line(X0,Y0, X1, Y0, color);
	Draw_Line(X1,Y0, X1, Y1, color);
	Draw_Line(X0,Y0, X0, Y1, color);
	Draw_Line(X0,Y1, X1, Y1, color);
}

#if 0
void Set_BMP_24Bpp (unsigned long bmp_sector)
{
}
#endif

