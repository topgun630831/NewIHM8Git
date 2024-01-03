#ifndef __BACKLIGHT_H__
#define __BACKLIGHT_H__


extern TIM_HandleTypeDef htim4;

extern void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);
extern void User_Pwm_Setup();





#endif /*__BACKLIGHT_H__*/
