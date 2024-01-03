#ifdef __MODBUS_COMM_H__
#define	__MODBUS_COMM_H__

#include "stm32f4xx.h"
#include "stm32f4xx_hal.h"
#include "RTOS.h"

////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////

extern void HwsetPac_Parser(uint8_t *Local_RxBuf);
extern void RelayPac_Parser(uint8_t *Local_RxBuf);

extern void Relay_Packet();
extern void Hwset_Pac();
extern void CB_ClearData_Addr();

extern void PowerRly_byp_Host_Comm();
extern void Host_byp_PowerRly_Comm();

extern void Module_Req_Data();
extern void Module_Res_Data(uint8_t *Local_RxBuf);
extern void UsbH_Rcv_Process();



#endif /* __MODBUS_COMM_H__*/
