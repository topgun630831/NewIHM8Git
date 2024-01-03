
#include "stm32f4xx_hal.h"
#include "backlight.h"
#define EXTERN extern
#include "GuiData.h"

#define PWM_PRESCALER				(420-1)
#define	PWM_PERIOD					(2000-1)
#define BACKLIGHTBRGHTNESS_BASE		1900
#define BACKLIGHTBRGHTNESS_MUL		16
#define BACKLIGHTBRGHTNESS_MAX		5000

void User_Pwm_Setup(void)
{
	TIM_MasterConfigTypeDef sMasterConfig;
	TIM_OC_InitTypeDef sConfigOC;
	htim4.Instance = TIM4;
	htim4.Init.Prescaler = PWM_PRESCALER;
	htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim4.Init.Period = PWM_PERIOD;
	htim4.Init.ClockDivision = TIM_CLOCKDIVISION_DIV4;
	if (HAL_TIM_PWM_Init(&htim4) != HAL_OK)
	{
		Error_Handler();
	}
	
	sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
	sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
	if (HAL_TIMEx_MasterConfigSynchronization(&htim4, &sMasterConfig) != HAL_OK)
	{
		Error_Handler();
	}
	
	sConfigOC.OCMode = TIM_OCMODE_PWM1;
	sConfigOC.Pulse = 0;
	sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
	sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
	if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
	{
		Error_Handler();
	}
	
	HAL_TIM_MspPostInit(&htim4);
	
#if 0
	// 반복적으로 value 값 0~ 2000 으로 변경..
	{
		TIM_OC_InitTypeDef sConfigOC;
		//uint32_t value = 500; 	// 500이 적당. 1500~부터 전원이 흔들림  //  2000주면 전압강하 발생 2.73V~ // by kys
		uint32_t value = 500; 	// 200(3.96) 500(3.67v) ~ 1900(2.38v)
		sConfigOC.OCMode = TIM_OCMODE_PWM1;
		sConfigOC.Pulse = value;
		sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
		sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
		HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_3);
		HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_3);
		if(HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_3) != HAL_OK)
		{
			/* Starting Error */
			Error_Handler();
		}
	}
#endif
	
}

// PRQA S 1503 1
void BacklightBrghtness(const uint16_t brightness, const uint16_t flag)
{
	uint32_t value = BACKLIGHTBRGHTNESS_BASE - (brightness * BACKLIGHTBRGHTNESS_MUL); //200(3.96), 500(3.67v) ~ 1900(2.33v)

	if(flag == TRUE)
	{
		value = BACKLIGHTBRGHTNESS_MAX;
	}
	(void)HAL_TIM_PWM_Stop(&htim4, TIM_CHANNEL_3);
	TIM_OC_InitTypeDef sConfigOC;
	sConfigOC.OCMode = TIM_OCMODE_PWM1;
	sConfigOC.Pulse = value;
	sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
	sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
	(void)HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_3);
	(void)HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_3);
}	

//end
