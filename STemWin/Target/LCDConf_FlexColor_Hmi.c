/*********************************************************************
*                SEGGER Microcontroller GmbH & Co. KG                *
*        Solutions for real time microcontroller applications        *
**********************************************************************
*                                                                    *
*        (c) 1996 - 2017  SEGGER Microcontroller GmbH & Co. KG       *
*                                                                    *
*        Internet: www.segger.com    Support:  support@segger.com    *
*                                                                    *
**********************************************************************

** emWin V5.40 - Graphical user interface for embedded applications **
All  Intellectual Property rights  in the Software belongs to  SEGGER.
emWin is protected by  international copyright laws.  Knowledge of the
source code may not be used to write a similar product.  This file may
only be used in accordance with the following terms:

The  software has  been licensed  to STMicroelectronics International
N.V. a Dutch company with a Swiss branch and its headquarters in Plan-
les-Ouates, Geneva, 39 Chemin du Champ des Filles, Switzerland for the
purposes of creating libraries for ARM Cortex-M-based 32-bit microcon_
troller products commercialized by Licensee only, sublicensed and dis_
tributed under the terms and conditions of the End User License Agree_
ment supplied by STMicroelectronics International N.V.
Full source code is available at: www.segger.com

We appreciate your understanding and fairness.
----------------------------------------------------------------------
File        : LCDConf_FlexColor_Template.c
Purpose     : Display controller configuration (single layer)
---------------------------END-OF-HEADER------------------------------
*/

/**
******************************************************************************
* @attention
*
* Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
* You may not use this file except in compliance with the License.
* You may obtain a copy of the License at:
*
*        http://www.st.com/software_license_agreement_liberty_v2
*
* Unless required by applicable law or agreed to in writing, software 
* distributed under the License is distributed on an "AS IS" BASIS, 
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
******************************************************************************
*/

#include "GUIDRV_FlexColor.h"
#include "lcd.h"

#include "main.h"
#if 0 //[[ by kys.2017.12.31_BEGIN -- test
#include "GUIDRV_Lin.h"

#include "GUI_Private.h"
#endif //]] by kys.2017.12.31_END -- test

#include "stm32f4xx_hal.h"


/*********************************************************************
*
*       Layer configuration (to be modified)
*
**********************************************************************
*/

static void LcdWriteReg(U16 Data);
static void LcdWriteData(U16 Data);
static void LcdWriteDataMultiple(const U16 pData[], int NumItems);
static void LcdReadDataMultiple(U16 pData[], int NumItems);

#if 1 	// by kys
//#undef  LCD_SWAP_XY
//#undef  LCD_MIRROR_Y

#define LCD_SWAP_XY  0 
#define LCD_MIRROR_Y 0
#define LCD_MIRROR_X 1
#endif

//
// Physical display size
//
#if 1 //[[ by kys.2017.12.30_BEGIN -- test
#define XSIZE_PHYS  320 // To be adapted to x-screen size
#define YSIZE_PHYS  480 // To be adapted to y-screen size
#else
#define XSIZE_PHYS  240 // To be adapted to x-screen size
#define YSIZE_PHYS  320 // To be adapted to y-screen size
#endif //]] by kys.2017.12.30_END -- test

#define NUM_BUFFERS  1 // Number of multiple buffers to be used
#define NUM_VSCREENS 2 // Number of virtual screens to be used

#define BK_COLOR GUI_DARKBLUE

//#undef  GUI_NUM_LAYERS
//#if 1
//#define GUI_NUM_LAYERS 1
//#else		// by kys
//#define GUI_NUM_LAYERS 2
//#endif

#if 0
#define COLOR_CONVERSION_0 GUICC_M8888I
#define DISPLAY_DRIVER_0   GUIDRV_LIN_OX_32
#else
#define COLOR_CONVERSION_0 GUICC_565
#define DISPLAY_DRIVER_0   GUIDRV_LIN_OX_16
#endif


/*********************************************************************
*
*       Configuration checking
*
**********************************************************************
*/
#ifndef   VXSIZE_PHYS
#define VXSIZE_PHYS XSIZE_PHYS
#endif
#ifndef   VYSIZE_PHYS
#define VYSIZE_PHYS YSIZE_PHYS
#endif
#ifndef   XSIZE_PHYS
#error Physical X size of display is not defined!
#endif
#ifndef   YSIZE_PHYS
#error Physical Y size of display is not defined!
#endif
#ifndef   GUICC_565
#error Color conversion not defined!
#endif
#ifndef   GUIDRV_FLEXCOLOR
#error No display driver defined!
#endif

/*********************************************************************
*
*       Local functions
*
**********************************************************************
*/
#if 0
#define LCD_REG      (*((volatile unsigned short *) 0x60000000)) 
#define LCD_RAM      (*((volatile unsigned short *) 0x60020000)) 			// 10.0000.0000.0000.0000


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
#endif

/********************************************************************
*
*       LcdWriteReg
*
* Function description:
*   Sets display register
*/

static void LcdWriteReg(U16 Data)
{
	// ... TBD by user
	CPU_Command_Write(Data);
}

/********************************************************************
*
*       LcdWriteData
*
* Function description:
*   Writes a value to a display register
*/
static void LcdWriteData(U16 Data)
{
	// ... TBD by user
	CPU_Data_Write(Data);
}

/********************************************************************
*
*       LcdWriteDataMultiple
*
* Function description:
*   Writes multiple values to a display register.
*/
static void LcdWriteDataMultiple(const U16 pData[], int NumItems)
{
//	while (NumItems--)
//	{
//		// ... TBD by user
//		CPU_Data_Write( *pData++ );
//	}
    int i=0;
    U16 pD;
        
    while (NumItems--)
    {
        // ... TBD by user
        pD = pData[i];
        CPU_Data_Write( pD );
        i++;
    }
}

/********************************************************************
*
*       LcdReadDataMultiple
*
* Function description:
*   Reads multiple values from a display register.
*/
static void LcdReadDataMultiple(U16 pData[], int NumItems)
{
//	while (NumItems--)
//	{
//		// ... TBD by user
//		*pData++ = CPU_Data_Read();
//	}
    int i=0;

    while (NumItems--)
    {
        // ... TBD by user
        pData[i++] = CPU_Data_Read();
    }
}

/*********************************************************************
*
*       Public functions
*
**********************************************************************
*/
#if 0 //[[ by kys.2017.12.31_BEGIN -- test
void _GPIO_Init(void)
{
	
	GPIO_InitTypeDef GPIO_InitStruct;
	
	/* GPIO Ports Clock Enable */
	__HAL_RCC_GPIOE_CLK_ENABLE();
	__HAL_RCC_GPIOH_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();
	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();
	__HAL_RCC_GPIOD_CLK_ENABLE();
	
	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOE, LCD_RESET_Pin|BLE_RESET_Pin, GPIO_PIN_SET);
	
	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(BOOT0_GPIO_Port, BOOT0_Pin, GPIO_PIN_RESET);
	
	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(USER_LED_GPIO_Port, USER_LED_Pin, GPIO_PIN_RESET);
	
	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(LCDTS_CS_GPIO_Port, LCDTS_CS_Pin, GPIO_PIN_SET);
	
	/*Configure GPIO pins : LCD_RESET_Pin BOOT0_Pin */
	GPIO_InitStruct.Pin = LCD_RESET_Pin|BOOT0_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);
	
	/*Configure GPIO pin : USER_LED_Pin */
	GPIO_InitStruct.Pin = USER_LED_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(USER_LED_GPIO_Port, &GPIO_InitStruct);
	
	/*Configure GPIO pin : LCDTS_CS_Pin */
	GPIO_InitStruct.Pin = LCDTS_CS_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(LCDTS_CS_GPIO_Port, &GPIO_InitStruct);
	
	/*Configure GPIO pin : LCDTS_IRQ_Pin */
	GPIO_InitStruct.Pin = LCDTS_IRQ_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(LCDTS_IRQ_GPIO_Port, &GPIO_InitStruct);
	
	/*Configure GPIO pin : BLE_RESET_Pin */
	GPIO_InitStruct.Pin = BLE_RESET_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(BLE_RESET_GPIO_Port, &GPIO_InitStruct);
	
	/*Configure GPIO pin : L_reset_Pin */
	GPIO_InitStruct.Pin = L_reset_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(L_reset_GPIO_Port, &GPIO_InitStruct);
	
}

extern SRAM_HandleTypeDef hsram1;

void _FSMC_Init(void)
{
	FSMC_NORSRAM_TimingTypeDef Timing;
	
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
	Timing.AddressSetupTime = 0;//4;
	Timing.AddressHoldTime = 10;//15;
	Timing.DataSetupTime = 10;//40;
	Timing.BusTurnAroundDuration = 0;
	Timing.CLKDivision = 0;//16;
	Timing.DataLatency = 0;//17;
	Timing.AccessMode = FSMC_ACCESS_MODE_A;
	/* ExtTiming */
	
	if (HAL_SRAM_Init(&hsram1, &Timing, NULL) != HAL_OK)
	{
		_Error_Handler(__FILE__, __LINE__);
	}
	
}
#endif //]] by kys.2017.12.31_END -- test

/*********************************************************************
*
*       LCD_X_Config
*
* Function description:
*   Called during the initialization process in order to set up the
*   display driver configuration.
*
*/
// PRQA S 1503 1
void LCD_X_Config(void) {
	GUI_DEVICE * pDevice;
	CONFIG_FLEXCOLOR Config = {0};
	GUI_PORT_API PortAPI = {0};
	
	//
	// Set display driver and color conversion
	//
	pDevice = GUI_DEVICE_CreateAndLink(GUIDRV_FLEXCOLOR, GUICC_565, 0, 0);
	//  pDevice = GUI_DEVICE_CreateAndLink(DISPLAY_DRIVER_0, COLOR_CONVERSION_0, 0, 0);
	
	//
	// Display driver configuration, required for Lin-driver
	//
#if 1
	(void)LCD_SetSizeEx (0, XSIZE_PHYS , YSIZE_PHYS);
	(void)LCD_SetVSizeEx(0, VXSIZE_PHYS, VYSIZE_PHYS);
#else
	/* Set size of 1st layer */
	if (LCD_GetSwapXYEx(0)) {
		LCD_SetSizeEx (0, YSIZE_PHYS, XSIZE_PHYS);
		LCD_SetVSizeEx(0, YSIZE_PHYS * NUM_VSCREENS, XSIZE_PHYS);
	} else {
		LCD_SetSizeEx (0, XSIZE_PHYS, YSIZE_PHYS);
		LCD_SetVSizeEx(0, XSIZE_PHYS, YSIZE_PHYS * NUM_VSCREENS);
	}
#endif
	
	//
	// Orientation
	//
	//Config.Orientation = GUI_MIRROR_X;
	Config.Orientation = GUI_MIRROR_X | GUI_MIRROR_Y | GUI_SWAP_XY;
	
	GUIDRV_FlexColor_Config(pDevice, &Config);
	
	
	//
	// Set controller and operation mode
	//
    PortAPI.pfWrite16_A0  = &LcdWriteReg;
    PortAPI.pfWrite16_A1  = &LcdWriteData;
    PortAPI.pfWriteM16_A1 = &LcdWriteDataMultiple;
    PortAPI.pfReadM16_A1  = &LcdReadDataMultiple;
    GUIDRV_FlexColor_SetFunc(pDevice, &PortAPI, &GUIDRV_FLEXCOLOR_F66709, &GUIDRV_FLEXCOLOR_M16C0B16);

	
}

/*********************************************************************
*
*       LCD_X_DisplayDriver
*
* Function description:
*   This function is called by the display driver for several purposes.
*   To support the according task the routine needs to be adapted to
*   the display controller. Please note that the commands marked with
*   'optional' are not cogently required and should only be adapted if
*   the display controller supports these features.
*
* Parameter:
*   LayerIndex - Index of layer to be configured
*   Cmd        - Please refer to the details in the switch statement below
*   pData      - Pointer to a LCD_X_DATA structure
*
* Return Value:
*   < -1 - Error
*     -1 - Command not handled
*      0 - Ok
*/
// PRQA S 1503 1
int LCD_X_DisplayDriver(unsigned LayerIndex, unsigned Cmd, void * pData)
{
	int r;
//	(void) LayerIndex;
//	(void) pData;
	
	switch (Cmd) {
		case LCD_X_INITCONTROLLER:
		{
			//
			// Called during the initialization process in order to set up the
			// display controller and put it into operation. If the display
			// controller is not initialized by any external routine this needs
			// to be adapted by the customer...
			//
			// ...
			LCD_init();
			
			return 0;
			break;
		}
		default:
			r = -1;
			break;
	}
	return r;
}

/*************************** End of file ****************************/

