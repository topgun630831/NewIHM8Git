/*
 * C:/CodeInspection/DisplayUnit/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h
 */
/*    82 */ typedef enum
/*    83 */ {
/*    85 */    NonMaskableInt_IRQn = -14,
/*    86 */    MemoryManagement_IRQn = -12,
/*    87 */    BusFault_IRQn = -11,
/*    88 */    UsageFault_IRQn = -10,
/*    89 */    SVCall_IRQn = -5,
/*    90 */    DebugMonitor_IRQn = -4,
/*    91 */    PendSV_IRQn = -2,
/*    92 */    SysTick_IRQn = -1,
/*    94 */    WWDG_IRQn = 0,
/*    95 */    PVD_IRQn = 1,
/*    96 */    TAMP_STAMP_IRQn = 2,
/*    97 */    RTC_WKUP_IRQn = 3,
/*    98 */    FLASH_IRQn = 4,
/*    99 */    RCC_IRQn = 5,
/*   100 */    EXTI0_IRQn = 6,
/*   101 */    EXTI1_IRQn = 7,
/*   102 */    EXTI2_IRQn = 8,
/*   103 */    EXTI3_IRQn = 9,
/*   104 */    EXTI4_IRQn = 10,
/*   105 */    DMA1_Stream0_IRQn = 11,
/*   106 */    DMA1_Stream1_IRQn = 12,
/*   107 */    DMA1_Stream2_IRQn = 13,
/*   108 */    DMA1_Stream3_IRQn = 14,
/*   109 */    DMA1_Stream4_IRQn = 15,
/*   110 */    DMA1_Stream5_IRQn = 16,
/*   111 */    DMA1_Stream6_IRQn = 17,
/*   112 */    ADC_IRQn = 18,
/*   113 */    CAN1_TX_IRQn = 19,
/*   114 */    CAN1_RX0_IRQn = 20,
/*   115 */    CAN1_RX1_IRQn = 21,
/*   116 */    CAN1_SCE_IRQn = 22,
/*   117 */    EXTI9_5_IRQn = 23,
/*   118 */    TIM1_BRK_TIM9_IRQn = 24,
/*   119 */    TIM1_UP_TIM10_IRQn = 25,
/*   120 */    TIM1_TRG_COM_TIM11_IRQn = 26,
/*   121 */    TIM1_CC_IRQn = 27,
/*   122 */    TIM2_IRQn = 28,
/*   123 */    TIM3_IRQn = 29,
/*   124 */    TIM4_IRQn = 30,
/*   125 */    I2C1_EV_IRQn = 31,
/*   126 */    I2C1_ER_IRQn = 32,
/*   127 */    I2C2_EV_IRQn = 33,
/*   128 */    I2C2_ER_IRQn = 34,
/*   129 */    SPI1_IRQn = 35,
/*   130 */    SPI2_IRQn = 36,
/*   131 */    USART1_IRQn = 37,
/*   132 */    USART2_IRQn = 38,
/*   133 */    USART3_IRQn = 39,
/*   134 */    EXTI15_10_IRQn = 40,
/*   135 */    RTC_Alarm_IRQn = 41,
/*   136 */    OTG_FS_WKUP_IRQn = 42,
/*   137 */    TIM8_BRK_TIM12_IRQn = 43,
/*   138 */    TIM8_UP_TIM13_IRQn = 44,
/*   139 */    TIM8_TRG_COM_TIM14_IRQn = 45,
/*   140 */    TIM8_CC_IRQn = 46,
/*   141 */    DMA1_Stream7_IRQn = 47,
/*   142 */    FSMC_IRQn = 48,
/*   143 */    SDIO_IRQn = 49,
/*   144 */    TIM5_IRQn = 50,
/*   145 */    SPI3_IRQn = 51,
/*   146 */    UART4_IRQn = 52,
/*   147 */    UART5_IRQn = 53,
/*   148 */    TIM6_DAC_IRQn = 54,
/*   149 */    TIM7_IRQn = 55,
/*   150 */    DMA2_Stream0_IRQn = 56,
/*   151 */    DMA2_Stream1_IRQn = 57,
/*   152 */    DMA2_Stream2_IRQn = 58,
/*   153 */    DMA2_Stream3_IRQn = 59,
/*   154 */    DMA2_Stream4_IRQn = 60,
/*   155 */    ETH_IRQn = 61,
/*   156 */    ETH_WKUP_IRQn = 62,
/*   157 */    CAN2_TX_IRQn = 63,
/*   158 */    CAN2_RX0_IRQn = 64,
/*   159 */    CAN2_RX1_IRQn = 65,
/*   160 */    CAN2_SCE_IRQn = 66,
/*   161 */    OTG_FS_IRQn = 67,
/*   162 */    DMA2_Stream5_IRQn = 68,
/*   163 */    DMA2_Stream6_IRQn = 69,
/*   164 */    DMA2_Stream7_IRQn = 70,
/*   165 */    USART6_IRQn = 71,
/*   166 */    I2C3_EV_IRQn = 72,
/*   167 */    I2C3_ER_IRQn = 73,
/*   168 */    OTG_HS_EP1_OUT_IRQn = 74,
/*   169 */    OTG_HS_EP1_IN_IRQn = 75,
/*   170 */    OTG_HS_WKUP_IRQn = 76,
/*   171 */    OTG_HS_IRQn = 77,
/*   172 */    DCMI_IRQn = 78,
/*   173 */    RNG_IRQn = 80,
/*   174 */    FPU_IRQn = 81
/*   175 */ } IRQn_Type;
/*
 * C:/CodeInspection/DisplayUnit/qac/lib/yvals.h
 */
/*   232 */ typedef unsigned short int _Wchart;
/*   238 */ typedef unsigned int _Wintt;
/*   260 */ typedef unsigned int _Sizet;
/*   263 */ typedef struct _Mbstatet
/*   264 */ {
/*   266 */    unsigned int _Wchar;
/*   267 */    unsigned int _State;
/*   299 */ } _Mbstatet;
/*   315 */ typedef struct __va_list
/*   316 */ {
/*   317 */    char *_Ap;
/*   318 */ } __va_list;
/*   319 */ typedef __va_list __Va_list;
/*   337 */ typedef struct
/*   338 */ {
/*   340 */    long long _Off;
/*   344 */    _Mbstatet _Wstate;
/*   345 */ } _Fpost;
/*   358 */ void __iar_Locksyslock_Malloc(void);
/*   359 */ void __iar_Locksyslock_Stream(void);
/*   360 */ void __iar_Locksyslock_Debug(void);
/*   361 */ void __iar_Locksyslock_StaticGuard(void);
/*   362 */ void __iar_Unlocksyslock_Malloc(void);
/*   363 */ void __iar_Unlocksyslock_Stream(void);
/*   364 */ void __iar_Unlocksyslock_Debug(void);
/*   365 */ void __iar_Unlocksyslock_StaticGuard(void);
/*   374 */ typedef void *__iar_Rmtx;
/*   376 */ void __iar_Initdynamiclock(__iar_Rmtx *);
/*   377 */ void __iar_Dstdynamiclock(__iar_Rmtx *);
/*   378 */ void __iar_Lockdynamiclock(__iar_Rmtx *);
/*   379 */ void __iar_Unlockdynamiclock(__iar_Rmtx *);
/*
 * C:/CodeInspection/DisplayUnit/qac/lib/stdint.h
 */
/*    19 */ typedef signed char int8_t;
/*    20 */ typedef unsigned char unsigned char;
/*    24 */ typedef signed short int int16_t;
/*    25 */ typedef unsigned short int unsigned short;
/*    29 */ typedef signed int int32_t;
/*    30 */ typedef unsigned int uint32_t;
/*    34 */ typedef signed long long int int64_t;
/*    35 */ typedef unsigned long long int uint64_t;
/*    40 */ typedef signed char int_least8_t;
/*    41 */ typedef unsigned char uint_least8_t;
/*    43 */ typedef signed short int int_least16_t;
/*    44 */ typedef unsigned short int uint_least16_t;
/*    46 */ typedef signed int int_least32_t;
/*    47 */ typedef unsigned int uint_least32_t;
/*    51 */ typedef signed long long int int_least64_t;
/*    54 */ typedef unsigned long long int uint_least64_t;
/*    60 */ typedef signed int int_fast8_t;
/*    61 */ typedef unsigned int uint_fast8_t;
/*    63 */ typedef signed int int_fast16_t;
/*    64 */ typedef unsigned int uint_fast16_t;
/*    66 */ typedef signed int int_fast32_t;
/*    67 */ typedef unsigned int uint_fast32_t;
/*    70 */ typedef signed long long int int_fast64_t;
/*    73 */ typedef unsigned long long int uint_fast64_t;
/*    77 */ typedef signed long long int intmax_t;
/*    78 */ typedef unsigned long long int uintmax_t;
/*    82 */ typedef signed long int intptr_t;
/*    83 */ typedef unsigned long int uintptr_t;
/*    89 */ typedef int __data_intptr_t; typedef unsigned int __data_uintptr_t;
/*
 * C:/CodeInspection/DisplayUnit/qac/lib/intrinsics.h
 */
/*    41 */ void __no_operation(void);
/*    43 */ void __disable_interrupt(void);
/*    44 */ void __enable_interrupt(void);
/*    46 */ typedef unsigned long __istate_t;
/*    48 */ __istate_t __get_interrupt_state(void);
/*    49 */ void __set_interrupt_state(__istate_t);
/*    77 */ void __disable_irq(void);
/*    78 */ void __enable_irq(void);
/*    81 */ void __disable_fiq(void);
/*    82 */ void __enable_fiq(void);
/*    87 */ unsigned long __SWP( unsigned long, volatile unsigned long * );
/*    88 */ unsigned char __SWPB( unsigned char, volatile unsigned char * );
/*    90 */ typedef unsigned long __ul;
/*    99 */ void __CDP (unsigned coproc, unsigned opc1, unsigned CRd, unsigned CRn, unsigned CRm, unsigned opc2) ;
/*   100 */ void __CDP2(unsigned coproc, unsigned opc1, unsigned CRd, unsigned CRn, unsigned CRm, unsigned opc2) ;
/*   103 */ void __MCR( unsigned coproc, unsigned opcode_1, __ul src,
/*   104 */     unsigned CRn, unsigned CRm, unsigned opcode_2 ) ;
/*   105 */ unsigned long __MRC( unsigned coproc, unsigned opcode_1,
/*   106 */     unsigned CRn, unsigned CRm, unsigned opcode_2 ) ;
/*   107 */ void __MCR2( unsigned coproc, unsigned opcode_1, __ul src,
/*   108 */     unsigned CRn, unsigned CRm, unsigned opcode_2 ) ;
/*   109 */ unsigned long __MRC2( unsigned coproc, unsigned opcode_1,
/*   110 */     unsigned CRn, unsigned CRm, unsigned opcode_2 ) ;
/*   112 */ void __MCRR (unsigned coproc, unsigned opc1, unsigned long long src, unsigned CRm) ;
/*   113 */ void __MCRR2(unsigned coproc, unsigned opc1, unsigned long long src, unsigned CRm) ;
/*   115 */ unsigned long long __MRRC (unsigned coproc, unsigned opc1, unsigned CRm) ;
/*   116 */ unsigned long long __MRRC2(unsigned coproc, unsigned opc1, unsigned CRm) ;
/*   119 */ void __LDC ( unsigned coproc, unsigned CRn, volatile __ul const *src) ;
/*   120 */ void __LDCL ( unsigned coproc, unsigned CRn, volatile __ul const *src) ;
/*   121 */ void __LDC2 ( unsigned coproc, unsigned CRn, volatile __ul const *src) ;
/*   122 */ void __LDC2L( unsigned coproc, unsigned CRn, volatile __ul const *src) ;
/*   125 */ void __STC ( unsigned coproc, unsigned CRn, volatile __ul *dst) ;
/*   126 */ void __STCL ( unsigned coproc, unsigned CRn, volatile __ul *dst) ;
/*   127 */ void __STC2 ( unsigned coproc, unsigned CRn, volatile __ul *dst) ;
/*   128 */ void __STC2L( unsigned coproc, unsigned CRn, volatile __ul *dst) ;
/*   131 */ void __LDC_noidx( unsigned coproc, unsigned CRn, volatile __ul const *src,
/*   132 */     unsigned option);
/*   134 */ void __LDCL_noidx( unsigned coproc, unsigned CRn, volatile __ul const *src,
/*   135 */     unsigned option);
/*   137 */ void __LDC2_noidx( unsigned coproc, unsigned CRn, volatile __ul const *src,
/*   138 */     unsigned option);
/*   140 */ void __LDC2L_noidx( unsigned coproc, unsigned CRn, volatile __ul const *src,
/*   141 */     unsigned option);
/*   144 */ void __STC_noidx( unsigned coproc, unsigned CRn, volatile __ul *dst,
/*   145 */     unsigned option);
/*   147 */ void __STCL_noidx( unsigned coproc, unsigned CRn, volatile __ul *dst,
/*   148 */     unsigned option);
/*   150 */ void __STC2_noidx( unsigned coproc, unsigned CRn, volatile __ul *dst,
/*   151 */     unsigned option);
/*   153 */ void __STC2L_noidx( unsigned coproc, unsigned CRn, volatile __ul *dst,
/*   154 */     unsigned option);
/*   159 */ unsigned long __arm_rsr(const char * special_register) ;
/*   160 */ unsigned long long __arm_rsr64(const char * special_register) ;
/*   161 */ void* __arm_rsrp(const char * special_register) ;
/*   164 */ void __arm_wsr(const char * special_register, unsigned long value) ;
/*   165 */ void __arm_wsr64(const char * special_register, unsigned long long value) ;
/*   166 */ void __arm_wsrp(const char * special_register, const void *value) ;
/*   169 */ void __arm_cdp (unsigned coproc, unsigned opc1, unsigned CRd, unsigned CRn, unsigned CRm, unsigned opc2) ;
/*   170 */ void __arm_cdp2(unsigned coproc, unsigned opc1, unsigned CRd, unsigned CRn, unsigned CRm, unsigned opc2) ;
/*   172 */ void __arm_ldc (unsigned coproc, unsigned CRd, const void* p) ;
/*   173 */ void __arm_ldcl (unsigned coproc, unsigned CRd, const void* p) ;
/*   174 */ void __arm_ldc2 (unsigned coproc, unsigned CRd, const void* p) ;
/*   175 */ void __arm_ldc2l(unsigned coproc, unsigned CRd, const void* p) ;
/*   177 */ void __arm_stc (unsigned coproc, unsigned CRd, const void* p) ;
/*   178 */ void __arm_stcl (unsigned coproc, unsigned CRd, const void* p) ;
/*   179 */ void __arm_stc2 (unsigned coproc, unsigned CRd, const void* p) ;
/*   180 */ void __arm_stc2l(unsigned coproc, unsigned CRd, const void* p) ;
/*   182 */ void __arm_mcr (unsigned coproc, unsigned opc1, __ul src, unsigned CRn, unsigned CRm, unsigned opc2) ;
/*   183 */ void __arm_mcr2(unsigned coproc, unsigned opc1, __ul src, unsigned CRn, unsigned CRm, unsigned opc2) ;
/*   185 */ unsigned long __arm_mrc (unsigned coproc, unsigned opc1, unsigned CRn, unsigned CRm, unsigned opc2) ;
/*   186 */ unsigned long __arm_mrc2(unsigned coproc, unsigned opc1, unsigned CRn, unsigned CRm, unsigned opc2) ;
/*   188 */ void __arm_mcrr (unsigned coproc, unsigned opc1, unsigned long long src, unsigned CRm) ;
/*   189 */ void __arm_mcrr2(unsigned coproc, unsigned opc1, unsigned long long src, unsigned CRm) ;
/*   191 */ unsigned long long __arm_mrrc (unsigned coproc, unsigned opc1, unsigned CRm) ;
/*   192 */ unsigned long long __arm_mrrc2(unsigned coproc, unsigned opc1, unsigned CRm) ;
/*   200 */ unsigned long __get_CPSR( void );
/*   201 */ void __set_CPSR( unsigned long );
/*   205 */ unsigned long __get_FPSCR( void );
/*   206 */ void __set_FPSCR( unsigned long );
/*   209 */ unsigned char __CLZ( unsigned long );
/*   213 */ signed long __QADD( signed long, signed long );
/*   214 */ signed long __QDADD( signed long, signed long );
/*   215 */ signed long __QSUB( signed long, signed long );
/*   216 */ signed long __QDSUB( signed long, signed long );
/*   218 */ signed long __QDOUBLE( signed long );
/*   220 */ int __QFlag( void );
/*   221 */ void __reset_Q_flag( void );
/*   224 */ int __QCFlag( void );
/*   225 */ void __reset_QC_flag( void );
/*   227 */ signed long __SMUL( signed short, signed short );
/*   230 */ unsigned long __REV( unsigned long );
/*   231 */ signed long __REVSH( short );
/*   233 */ unsigned long __REV16( unsigned long );
/*   234 */ unsigned long __RBIT( unsigned long );
/*   236 */ unsigned char __LDREXB( volatile unsigned char const * );
/*   237 */ unsigned short __LDREXH( volatile unsigned short const * );
/*   238 */ unsigned long __LDREX ( volatile unsigned long const * );
/*   239 */ unsigned long long __LDREXD( volatile unsigned long long const * );
/*   241 */ unsigned long __STREXB( unsigned char, volatile unsigned char * );
/*   242 */ unsigned long __STREXH( unsigned short, volatile unsigned short * );
/*   243 */ unsigned long __STREX ( unsigned long, volatile unsigned long * );
/*   244 */ unsigned long __STREXD( unsigned long long, volatile unsigned long long * );
/*   246 */ void __CLREX( void );
/*   248 */ void __SEV( void );
/*   249 */ void __WFE( void );
/*   250 */ void __WFI( void );
/*   251 */ void __YIELD( void );
/*   253 */ void __PLI( volatile void const * );
/*   254 */ void __PLD( volatile void const * );
/*   255 */ void __PLDW( volatile void const * );
/*   257 */ signed long __SSAT (unsigned long val,
/*   258 */     unsigned int sat );
/*   259 */ unsigned long __USAT (unsigned long val,
/*   260 */     unsigned int sat );
/*   424 */ void __DMB(void);
/*   425 */ void __DSB(void);
/*   426 */ void __ISB(void);
/*   429 */ unsigned long __TT(unsigned long);
/*   430 */ unsigned long __TTT(unsigned long);
/*   431 */ unsigned long __TTA(unsigned long);
/*   432 */ unsigned long __TTAT(unsigned long);
/*   437 */ unsigned long __get_LR(void);
/*   438 */ void __set_LR(unsigned long);
/*   440 */ unsigned long __get_SP(void);
/*   441 */ void __set_SP(unsigned long);
/*
 * C:/CodeInspection/DisplayUnit/qac/lib/cmsis_iar.h
 */
/*   188 */ static uint32_t __get_xPSR(void)
/*   189 */ {
/*   190 */    return __get_PSR();
/*   191 */ }
/*   335 */ static inline uint32_t __ROR(uint32_t op1, uint32_t op2)
/*   336 */ {
/*   337 */    return (op1 >> op2) | (op1 << ((sizeof(op1)*8)-op2));
/*   338 */ }
/*
 * C:/CodeInspection/DisplayUnit/Drivers/CMSIS/Include/core_cm4.h
 */
/*   308 */ typedef union
/*   309 */ {
/*   310 */    struct
/*   311 */    {
/*   312 */       uint32_t _reserved0:16;
/*   313 */       uint32_t GE:4;
/*   314 */       uint32_t _reserved1:7;
/*   315 */       uint32_t Q:1;
/*   316 */       uint32_t V:1;
/*   317 */       uint32_t C:1;
/*   318 */       uint32_t Z:1;
/*   319 */       uint32_t N:1;
/*   320 */    } b;
/*   321 */    uint32_t w;
/*   322 */ } APSR_Type;
/*   347 */ typedef union
/*   348 */ {
/*   349 */    struct
/*   350 */    {
/*   351 */       uint32_t ISR:9;
/*   352 */       uint32_t _reserved0:23;
/*   353 */    } b;
/*   354 */    uint32_t w;
/*   355 */ } IPSR_Type;
/*   365 */ typedef union
/*   366 */ {
/*   367 */    struct
/*   368 */    {
/*   369 */       uint32_t ISR:9;
/*   370 */       uint32_t _reserved0:7;
/*   371 */       uint32_t GE:4;
/*   372 */       uint32_t _reserved1:4;
/*   373 */       uint32_t T:1;
/*   374 */       uint32_t IT:2;
/*   375 */       uint32_t Q:1;
/*   376 */       uint32_t V:1;
/*   377 */       uint32_t C:1;
/*   378 */       uint32_t Z:1;
/*   379 */       uint32_t N:1;
/*   380 */    } b;
/*   381 */    uint32_t w;
/*   382 */ } xPSR_Type;
/*   416 */ typedef union
/*   417 */ {
/*   418 */    struct
/*   419 */    {
/*   420 */       uint32_t nPRIV:1;
/*   421 */       uint32_t SPSEL:1;
/*   422 */       uint32_t FPCA:1;
/*   423 */       uint32_t _reserved0:29;
/*   424 */    } b;
/*   425 */    uint32_t w;
/*   426 */ } CONTROL_Type;
/*   451 */ typedef struct
/*   452 */ {
/*   453 */    volatile uint32_t ISER[8U];
/*   454 */    uint32_t RESERVED0[24U];
/*   455 */    volatile uint32_t ICER[8U];
/*   456 */    uint32_t RSERVED1[24U];
/*   457 */    volatile uint32_t ISPR[8U];
/*   458 */    uint32_t RESERVED2[24U];
/*   459 */    volatile uint32_t ICPR[8U];
/*   460 */    uint32_t RESERVED3[24U];
/*   461 */    volatile uint32_t IABR[8U];
/*   462 */    uint32_t RESERVED4[56U];
/*   463 */    volatile unsigned char IP[240U];
/*   464 */    uint32_t RESERVED5[644U];
/*   465 */    volatile uint32_t STIR;
/*   466 */ } NVIC_Type;
/*   485 */ typedef struct
/*   486 */ {
/*   487 */    volatile const uint32_t CPUID;
/*   488 */    volatile uint32_t ICSR;
/*   489 */    volatile uint32_t VTOR;
/*   490 */    volatile uint32_t AIRCR;
/*   491 */    volatile uint32_t SCR;
/*   492 */    volatile uint32_t CCR;
/*   493 */    volatile unsigned char SHP[12U];
/*   494 */    volatile uint32_t SHCSR;
/*   495 */    volatile uint32_t CFSR;
/*   496 */    volatile uint32_t HFSR;
/*   497 */    volatile uint32_t DFSR;
/*   498 */    volatile uint32_t MMFAR;
/*   499 */    volatile uint32_t BFAR;
/*   500 */    volatile uint32_t AFSR;
/*   501 */    volatile const uint32_t PFR[2U];
/*   502 */    volatile const uint32_t DFR;
/*   503 */    volatile const uint32_t ADR;
/*   504 */    volatile const uint32_t MMFR[4U];
/*   505 */    volatile const uint32_t ISAR[5U];
/*   506 */    uint32_t RESERVED0[5U];
/*   507 */    volatile uint32_t CPACR;
/*   508 */ } SCB_Type;
/*   704 */ typedef struct
/*   705 */ {
/*   706 */    uint32_t RESERVED0[1U];
/*   707 */    volatile const uint32_t ICTR;
/*   708 */    volatile uint32_t ACTLR;
/*   709 */ } SCnSCB_Type;
/*   744 */ typedef struct
/*   745 */ {
/*   746 */    volatile uint32_t CTRL;
/*   747 */    volatile uint32_t LOAD;
/*   748 */    volatile uint32_t VAL;
/*   749 */    volatile const uint32_t CALIB;
/*   750 */ } SysTick_Type;
/*   796 */ typedef struct
/*   797 */ {
/*   798 */    volatile union
/*   799 */    {
/*   800 */       volatile unsigned char u8;
/*   801 */       volatile unsigned short u16;
/*   802 */       volatile uint32_t u32;
/*   803 */    } PORT [32U];
/*   804 */    uint32_t RESERVED0[864U];
/*   805 */    volatile uint32_t TER;
/*   806 */    uint32_t RESERVED1[15U];
/*   807 */    volatile uint32_t TPR;
/*   808 */    uint32_t RESERVED2[15U];
/*   809 */    volatile uint32_t TCR;
/*   810 */    uint32_t RESERVED3[29U];
/*   811 */    volatile uint32_t IWR;
/*   812 */    volatile const uint32_t IRR;
/*   813 */    volatile uint32_t IMCR;
/*   814 */    uint32_t RESERVED4[43U];
/*   815 */    volatile uint32_t LAR;
/*   816 */    volatile const uint32_t LSR;
/*   817 */    uint32_t RESERVED5[6U];
/*   818 */    volatile const uint32_t PID4;
/*   819 */    volatile const uint32_t PID5;
/*   820 */    volatile const uint32_t PID6;
/*   821 */    volatile const uint32_t PID7;
/*   822 */    volatile const uint32_t PID0;
/*   823 */    volatile const uint32_t PID1;
/*   824 */    volatile const uint32_t PID2;
/*   825 */    volatile const uint32_t PID3;
/*   826 */    volatile const uint32_t CID0;
/*   827 */    volatile const uint32_t CID1;
/*   828 */    volatile const uint32_t CID2;
/*   829 */    volatile const uint32_t CID3;
/*   830 */ } ITM_Type;
/*   899 */ typedef struct
/*   900 */ {
/*   901 */    volatile uint32_t CTRL;
/*   902 */    volatile uint32_t CYCCNT;
/*   903 */    volatile uint32_t CPICNT;
/*   904 */    volatile uint32_t EXCCNT;
/*   905 */    volatile uint32_t SLEEPCNT;
/*   906 */    volatile uint32_t LSUCNT;
/*   907 */    volatile uint32_t FOLDCNT;
/*   908 */    volatile const uint32_t PCSR;
/*   909 */    volatile uint32_t COMP0;
/*   910 */    volatile uint32_t MASK0;
/*   911 */    volatile uint32_t FUNCTION0;
/*   912 */    uint32_t RESERVED0[1U];
/*   913 */    volatile uint32_t COMP1;
/*   914 */    volatile uint32_t MASK1;
/*   915 */    volatile uint32_t FUNCTION1;
/*   916 */    uint32_t RESERVED1[1U];
/*   917 */    volatile uint32_t COMP2;
/*   918 */    volatile uint32_t MASK2;
/*   919 */    volatile uint32_t FUNCTION2;
/*   920 */    uint32_t RESERVED2[1U];
/*   921 */    volatile uint32_t COMP3;
/*   922 */    volatile uint32_t MASK3;
/*   923 */    volatile uint32_t FUNCTION3;
/*   924 */ } DWT_Type;
/*  1046 */ typedef struct
/*  1047 */ {
/*  1048 */    volatile uint32_t SSPSR;
/*  1049 */    volatile uint32_t CSPSR;
/*  1050 */    uint32_t RESERVED0[2U];
/*  1051 */    volatile uint32_t ACPR;
/*  1052 */    uint32_t RESERVED1[55U];
/*  1053 */    volatile uint32_t SPPR;
/*  1054 */    uint32_t RESERVED2[131U];
/*  1055 */    volatile const uint32_t FFSR;
/*  1056 */    volatile uint32_t FFCR;
/*  1057 */    volatile const uint32_t FSCR;
/*  1058 */    uint32_t RESERVED3[759U];
/*  1059 */    volatile const uint32_t TRIGGER;
/*  1060 */    volatile const uint32_t FIFO0;
/*  1061 */    volatile const uint32_t ITATBCTR2;
/*  1062 */    uint32_t RESERVED4[1U];
/*  1063 */    volatile const uint32_t ITATBCTR0;
/*  1064 */    volatile const uint32_t FIFO1;
/*  1065 */    volatile uint32_t ITCTRL;
/*  1066 */    uint32_t RESERVED5[39U];
/*  1067 */    volatile uint32_t CLAIMSET;
/*  1068 */    volatile uint32_t CLAIMCLR;
/*  1069 */    uint32_t RESERVED7[8U];
/*  1070 */    volatile const uint32_t DEVID;
/*  1071 */    volatile const uint32_t DEVTYPE;
/*  1072 */ } TPI_Type;
/*  1202 */ typedef struct
/*  1203 */ {
/*  1204 */    volatile const uint32_t TYPE;
/*  1205 */    volatile uint32_t CTRL;
/*  1206 */    volatile uint32_t RNR;
/*  1207 */    volatile uint32_t RBAR;
/*  1208 */    volatile uint32_t RASR;
/*  1209 */    volatile uint32_t RBAR_A1;
/*  1210 */    volatile uint32_t RASR_A1;
/*  1211 */    volatile uint32_t RBAR_A2;
/*  1212 */    volatile uint32_t RASR_A2;
/*  1213 */    volatile uint32_t RBAR_A3;
/*  1214 */    volatile uint32_t RASR_A3;
/*  1215 */ } MPU_Type;
/*  1297 */ typedef struct
/*  1298 */ {
/*  1299 */    uint32_t RESERVED0[1U];
/*  1300 */    volatile uint32_t FPCCR;
/*  1301 */    volatile uint32_t FPCAR;
/*  1302 */    volatile uint32_t FPDSCR;
/*  1303 */    volatile const uint32_t MVFR0;
/*  1304 */    volatile const uint32_t MVFR1;
/*  1305 */ } FPU_Type;
/*  1404 */ typedef struct
/*  1405 */ {
/*  1406 */    volatile uint32_t DHCSR;
/*  1407 */    volatile uint32_t DCRSR;
/*  1408 */    volatile uint32_t DCRDR;
/*  1409 */    volatile uint32_t DEMCR;
/*  1410 */ } CoreDebug_Type;
/*  1596 */ static inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
/*  1597 */ {
/*  1598 */    uint32_t reg_value;
/*  1599 */    uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
/*  1601 */    reg_value = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;
/*  1602 */    reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));
/*  1603 */    reg_value = (reg_value |
/*  1604 */        ((uint32_t)0x5FAUL << 16U) |
/*  1605 */        (PriorityGroupTmp << 8U) );
/*  1606 */    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = reg_value;
/*  1607 */ }
/*  1615 */ static inline uint32_t NVIC_GetPriorityGrouping(void)
/*  1616 */ {
/*  1617 */    return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
/*  1618 */ }
/*  1626 */ static inline void NVIC_EnableIRQ(IRQn_Type IRQn)
/*  1627 */ {
/*  1628 */    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
/*  1629 */ }
/*  1637 */ static inline void NVIC_DisableIRQ(IRQn_Type IRQn)
/*  1638 */ {
/*  1639 */    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
/*  1640 */ }
/*  1650 */ static inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
/*  1651 */ {
/*  1652 */    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
/*  1653 */ }
/*  1661 */ static inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
/*  1662 */ {
/*  1663 */    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
/*  1664 */ }
/*  1672 */ static inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
/*  1673 */ {
/*  1674 */    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
/*  1675 */ }
/*  1685 */ static inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
/*  1686 */ {
/*  1687 */    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)(int32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
/*  1688 */ }
/*  1698 */ static inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
/*  1699 */ {
/*  1700 */    if ((int32_t)(IRQn) < 0)
/*  1701 */    {
/*  1702 */       ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)(int32_t)IRQn) & 0xFUL)-4UL] = (unsigned char)((priority << (8U - 4U)) & (uint32_t)0xFFUL);
/*  1703 */    }
/*  1704 */    else
/*  1705 */    {
/*  1706 */       ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)(int32_t)IRQn)] = (unsigned char)((priority << (8U - 4U)) & (uint32_t)0xFFUL);
/*  1707 */    }
/*  1708 */ }
/*  1720 */ static inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
/*  1721 */ {
/*  1723 */    if ((int32_t)(IRQn) < 0)
/*  1724 */    {
/*  1725 */       return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)(int32_t)IRQn) & 0xFUL)-4UL] >> (8U - 4U)));
/*  1726 */    }
/*  1727 */    else
/*  1728 */    {
/*  1729 */       return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)(int32_t)IRQn)] >> (8U - 4U)));
/*  1730 */    }
/*  1731 */ }
/*  1745 */ static inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
/*  1746 */ {
/*  1747 */    uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
/*  1748 */    uint32_t PreemptPriorityBits;
/*  1749 */    uint32_t SubPriorityBits;
/*  1751 */    PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4U)) ? (uint32_t)(4U) : (uint32_t)(7UL - PriorityGroupTmp);
/*  1752 */    SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4U));
/*  1754 */    return (
/*  1755 */        ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
/*  1756 */        ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
/*  1757 */    );
/*  1758 */ }
/*  1772 */ static inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
/*  1773 */ {
/*  1774 */    uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
/*  1775 */    uint32_t PreemptPriorityBits;
/*  1776 */    uint32_t SubPriorityBits;
/*  1778 */    PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4U)) ? (uint32_t)(4U) : (uint32_t)(7UL - PriorityGroupTmp);
/*  1779 */    SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4U));
/*  1781 */    *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
/*  1782 */    *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
/*  1783 */ }
/*  1790 */ static inline void NVIC_SystemReset(void)
/*  1791 */ {
/*  1792 */    __DSB();
/*  1794 */    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = (uint32_t)((0x5FAUL << 16U) |
/*  1795 */        (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
/*  1796 */        (1UL << 2U) );
/*  1797 */    __DSB();
/*  1799 */    for(;;)
/*  1800 */    {
/*  1801 */       __no_operation();
/*  1802 */    }
/*  1803 */ }
/*  1830 */ static inline uint32_t SysTick_Config(uint32_t ticks)
/*  1831 */ {
/*  1832 */    if ((ticks - 1UL) > (0xFFFFFFUL ))
/*  1833 */    {
/*  1834 */       return (1UL);
/*  1835 */    }
/*  1837 */    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
/*  1838 */    NVIC_SetPriority (SysTick_IRQn, (1UL << 4U) - 1UL);
/*  1839 */    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
/*  1840 */    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
/*  1841 */    (1UL << 1U) |
/*  1842 */    (1UL );
/*  1843 */    return (0UL);
/*  1844 */ }
/*  1860 */ extern volatile int32_t ITM_RxBuffer;
/*  1872 */ static inline uint32_t ITM_SendChar (uint32_t ch)
/*  1873 */ {
/*  1874 */    if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&
/*  1875 */        ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL ) != 0UL) )
/*  1876 */    {
/*  1877 */       while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
/*  1878 */       {
/*  1879 */          __no_operation();
/*  1880 */       }
/*  1881 */       ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (unsigned char)ch;
/*  1882 */    }
/*  1883 */    return (ch);
/*  1884 */ }
/*  1893 */ static inline int32_t ITM_ReceiveChar (void)
/*  1894 */ {
/*  1895 */    int32_t ch = -1;
/*  1897 */    if (ITM_RxBuffer != 0x5AA55AA5U)
/*  1898 */    {
/*  1899 */       ch = ITM_RxBuffer;
/*  1900 */       ITM_RxBuffer = 0x5AA55AA5U;
/*  1901 */    }
/*  1903 */    return (ch);
/*  1904 */ }
/*  1913 */ static inline int32_t ITM_CheckChar (void)
/*  1914 */ {
/*  1916 */    if (ITM_RxBuffer == 0x5AA55AA5U)
/*  1917 */    {
/*  1918 */       return (0);
/*  1919 */    }
/*  1920 */    else
/*  1921 */    {
/*  1922 */       return (1);
/*  1923 */    }
/*  1924 */ }
/*
 * C:/CodeInspection/DisplayUnit/Drivers/CMSIS/Device/ST/STM32F4xx/Include/system_stm32f4xx.h
 */
/*    74 */ extern uint32_t SystemCoreClock;
/*    76 */ extern const unsigned char AHBPrescTable[16];
/*    77 */ extern const unsigned char APBPrescTable[8];
/*   103 */ extern void SystemInit(void);
/*   104 */ extern void SystemCoreClockUpdate(void);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h
 */
/*   195 */ typedef struct
/*   196 */ {
/*   197 */    volatile uint32_t SR;
/*   198 */    volatile uint32_t CR1;
/*   199 */    volatile uint32_t CR2;
/*   200 */    volatile uint32_t SMPR1;
/*   201 */    volatile uint32_t SMPR2;
/*   202 */    volatile uint32_t JOFR1;
/*   203 */    volatile uint32_t JOFR2;
/*   204 */    volatile uint32_t JOFR3;
/*   205 */    volatile uint32_t JOFR4;
/*   206 */    volatile uint32_t HTR;
/*   207 */    volatile uint32_t LTR;
/*   208 */    volatile uint32_t SQR1;
/*   209 */    volatile uint32_t SQR2;
/*   210 */    volatile uint32_t SQR3;
/*   211 */    volatile uint32_t JSQR;
/*   212 */    volatile uint32_t JDR1;
/*   213 */    volatile uint32_t JDR2;
/*   214 */    volatile uint32_t JDR3;
/*   215 */    volatile uint32_t JDR4;
/*   216 */    volatile uint32_t DR;
/*   217 */ } ADC_TypeDef;
/*   219 */ typedef struct
/*   220 */ {
/*   221 */    volatile uint32_t CSR;
/*   222 */    volatile uint32_t CCR;
/*   223 */    volatile uint32_t CDR;
/*   225 */ } ADC_Common_TypeDef;
/*   232 */ typedef struct
/*   233 */ {
/*   234 */    volatile uint32_t TIR;
/*   235 */    volatile uint32_t TDTR;
/*   236 */    volatile uint32_t TDLR;
/*   237 */    volatile uint32_t TDHR;
/*   238 */ } CAN_TxMailBox_TypeDef;
/*   244 */ typedef struct
/*   245 */ {
/*   246 */    volatile uint32_t RIR;
/*   247 */    volatile uint32_t RDTR;
/*   248 */    volatile uint32_t RDLR;
/*   249 */    volatile uint32_t RDHR;
/*   250 */ } CAN_FIFOMailBox_TypeDef;
/*   256 */ typedef struct
/*   257 */ {
/*   258 */    volatile uint32_t FR1;
/*   259 */    volatile uint32_t FR2;
/*   260 */ } CAN_FilterRegister_TypeDef;
/*   266 */ typedef struct
/*   267 */ {
/*   268 */    volatile uint32_t MCR;
/*   269 */    volatile uint32_t MSR;
/*   270 */    volatile uint32_t TSR;
/*   271 */    volatile uint32_t RF0R;
/*   272 */    volatile uint32_t RF1R;
/*   273 */    volatile uint32_t IER;
/*   274 */    volatile uint32_t ESR;
/*   275 */    volatile uint32_t BTR;
/*   276 */    uint32_t RESERVED0[88];
/*   277 */    CAN_TxMailBox_TypeDef sTxMailBox[3];
/*   278 */    CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
/*   279 */    uint32_t RESERVED1[12];
/*   280 */    volatile uint32_t FMR;
/*   281 */    volatile uint32_t FM1R;
/*   282 */    uint32_t RESERVED2;
/*   283 */    volatile uint32_t FS1R;
/*   284 */    uint32_t RESERVED3;
/*   285 */    volatile uint32_t FFA1R;
/*   286 */    uint32_t RESERVED4;
/*   287 */    volatile uint32_t FA1R;
/*   288 */    uint32_t RESERVED5[8];
/*   289 */    CAN_FilterRegister_TypeDef sFilterRegister[28];
/*   290 */ } CAN_TypeDef;
/*   296 */ typedef struct
/*   297 */ {
/*   298 */    volatile uint32_t DR;
/*   299 */    volatile unsigned char IDR;
/*   300 */    unsigned char RESERVED0;
/*   301 */    unsigned short RESERVED1;
/*   302 */    volatile uint32_t CR;
/*   303 */ } CRC_TypeDef;
/*   309 */ typedef struct
/*   310 */ {
/*   311 */    volatile uint32_t CR;
/*   312 */    volatile uint32_t SWTRIGR;
/*   313 */    volatile uint32_t DHR12R1;
/*   314 */    volatile uint32_t DHR12L1;
/*   315 */    volatile uint32_t DHR8R1;
/*   316 */    volatile uint32_t DHR12R2;
/*   317 */    volatile uint32_t DHR12L2;
/*   318 */    volatile uint32_t DHR8R2;
/*   319 */    volatile uint32_t DHR12RD;
/*   320 */    volatile uint32_t DHR12LD;
/*   321 */    volatile uint32_t DHR8RD;
/*   322 */    volatile uint32_t DOR1;
/*   323 */    volatile uint32_t DOR2;
/*   324 */    volatile uint32_t SR;
/*   325 */ } DAC_TypeDef;
/*   331 */ typedef struct
/*   332 */ {
/*   333 */    volatile uint32_t IDCODE;
/*   334 */    volatile uint32_t CR;
/*   335 */    volatile uint32_t APB1FZ;
/*   336 */    volatile uint32_t APB2FZ;
/*   337 */ }DBGMCU_TypeDef;
/*   343 */ typedef struct
/*   344 */ {
/*   345 */    volatile uint32_t CR;
/*   346 */    volatile uint32_t SR;
/*   347 */    volatile uint32_t RISR;
/*   348 */    volatile uint32_t IER;
/*   349 */    volatile uint32_t MISR;
/*   350 */    volatile uint32_t ICR;
/*   351 */    volatile uint32_t ESCR;
/*   352 */    volatile uint32_t ESUR;
/*   353 */    volatile uint32_t CWSTRTR;
/*   354 */    volatile uint32_t CWSIZER;
/*   355 */    volatile uint32_t DR;
/*   356 */ } DCMI_TypeDef;
/*   362 */ typedef struct
/*   363 */ {
/*   364 */    volatile uint32_t CR;
/*   365 */    volatile uint32_t NDTR;
/*   366 */    volatile uint32_t PAR;
/*   367 */    volatile uint32_t M0AR;
/*   368 */    volatile uint32_t M1AR;
/*   369 */    volatile uint32_t FCR;
/*   370 */ } DMA_Stream_TypeDef;
/*   372 */ typedef struct
/*   373 */ {
/*   374 */    volatile uint32_t LISR;
/*   375 */    volatile uint32_t HISR;
/*   376 */    volatile uint32_t LIFCR;
/*   377 */    volatile uint32_t HIFCR;
/*   378 */ } DMA_TypeDef;
/*   384 */ typedef struct
/*   385 */ {
/*   386 */    volatile uint32_t MACCR;
/*   387 */    volatile uint32_t MACFFR;
/*   388 */    volatile uint32_t MACHTHR;
/*   389 */    volatile uint32_t MACHTLR;
/*   390 */    volatile uint32_t MACMIIAR;
/*   391 */    volatile uint32_t MACMIIDR;
/*   392 */    volatile uint32_t MACFCR;
/*   393 */    volatile uint32_t MACVLANTR;
/*   394 */    uint32_t RESERVED0[2];
/*   395 */    volatile uint32_t MACRWUFFR;
/*   396 */    volatile uint32_t MACPMTCSR;
/*   397 */    uint32_t RESERVED1;
/*   398 */    volatile uint32_t MACDBGR;
/*   399 */    volatile uint32_t MACSR;
/*   400 */    volatile uint32_t MACIMR;
/*   401 */    volatile uint32_t MACA0HR;
/*   402 */    volatile uint32_t MACA0LR;
/*   403 */    volatile uint32_t MACA1HR;
/*   404 */    volatile uint32_t MACA1LR;
/*   405 */    volatile uint32_t MACA2HR;
/*   406 */    volatile uint32_t MACA2LR;
/*   407 */    volatile uint32_t MACA3HR;
/*   408 */    volatile uint32_t MACA3LR;
/*   409 */    uint32_t RESERVED2[40];
/*   410 */    volatile uint32_t MMCCR;
/*   411 */    volatile uint32_t MMCRIR;
/*   412 */    volatile uint32_t MMCTIR;
/*   413 */    volatile uint32_t MMCRIMR;
/*   414 */    volatile uint32_t MMCTIMR;
/*   415 */    uint32_t RESERVED3[14];
/*   416 */    volatile uint32_t MMCTGFSCCR;
/*   417 */    volatile uint32_t MMCTGFMSCCR;
/*   418 */    uint32_t RESERVED4[5];
/*   419 */    volatile uint32_t MMCTGFCR;
/*   420 */    uint32_t RESERVED5[10];
/*   421 */    volatile uint32_t MMCRFCECR;
/*   422 */    volatile uint32_t MMCRFAECR;
/*   423 */    uint32_t RESERVED6[10];
/*   424 */    volatile uint32_t MMCRGUFCR;
/*   425 */    uint32_t RESERVED7[334];
/*   426 */    volatile uint32_t PTPTSCR;
/*   427 */    volatile uint32_t PTPSSIR;
/*   428 */    volatile uint32_t PTPTSHR;
/*   429 */    volatile uint32_t PTPTSLR;
/*   430 */    volatile uint32_t PTPTSHUR;
/*   431 */    volatile uint32_t PTPTSLUR;
/*   432 */    volatile uint32_t PTPTSAR;
/*   433 */    volatile uint32_t PTPTTHR;
/*   434 */    volatile uint32_t PTPTTLR;
/*   435 */    volatile uint32_t RESERVED8;
/*   436 */    volatile uint32_t PTPTSSR;
/*   437 */    uint32_t RESERVED9[565];
/*   438 */    volatile uint32_t DMABMR;
/*   439 */    volatile uint32_t DMATPDR;
/*   440 */    volatile uint32_t DMARPDR;
/*   441 */    volatile uint32_t DMARDLAR;
/*   442 */    volatile uint32_t DMATDLAR;
/*   443 */    volatile uint32_t DMASR;
/*   444 */    volatile uint32_t DMAOMR;
/*   445 */    volatile uint32_t DMAIER;
/*   446 */    volatile uint32_t DMAMFBOCR;
/*   447 */    volatile uint32_t DMARSWTR;
/*   448 */    uint32_t RESERVED10[8];
/*   449 */    volatile uint32_t DMACHTDR;
/*   450 */    volatile uint32_t DMACHRDR;
/*   451 */    volatile uint32_t DMACHTBAR;
/*   452 */    volatile uint32_t DMACHRBAR;
/*   453 */ } ETH_TypeDef;
/*   459 */ typedef struct
/*   460 */ {
/*   461 */    volatile uint32_t IMR;
/*   462 */    volatile uint32_t EMR;
/*   463 */    volatile uint32_t RTSR;
/*   464 */    volatile uint32_t FTSR;
/*   465 */    volatile uint32_t SWIER;
/*   466 */    volatile uint32_t PR;
/*   467 */ } EXTI_TypeDef;
/*   473 */ typedef struct
/*   474 */ {
/*   475 */    volatile uint32_t ACR;
/*   476 */    volatile uint32_t KEYR;
/*   477 */    volatile uint32_t OPTKEYR;
/*   478 */    volatile uint32_t SR;
/*   479 */    volatile uint32_t CR;
/*   480 */    volatile uint32_t OPTCR;
/*   481 */    volatile uint32_t OPTCR1;
/*   482 */ } FLASH_TypeDef;
/*   490 */ typedef struct
/*   491 */ {
/*   492 */    volatile uint32_t BTCR[8];
/*   493 */ } FSMC_Bank1_TypeDef;
/*   499 */ typedef struct
/*   500 */ {
/*   501 */    volatile uint32_t BWTR[7];
/*   502 */ } FSMC_Bank1E_TypeDef;
/*   508 */ typedef struct
/*   509 */ {
/*   510 */    volatile uint32_t PCR2;
/*   511 */    volatile uint32_t SR2;
/*   512 */    volatile uint32_t PMEM2;
/*   513 */    volatile uint32_t PATT2;
/*   514 */    uint32_t RESERVED0;
/*   515 */    volatile uint32_t ECCR2;
/*   516 */    uint32_t RESERVED1;
/*   517 */    uint32_t RESERVED2;
/*   518 */    volatile uint32_t PCR3;
/*   519 */    volatile uint32_t SR3;
/*   520 */    volatile uint32_t PMEM3;
/*   521 */    volatile uint32_t PATT3;
/*   522 */    uint32_t RESERVED3;
/*   523 */    volatile uint32_t ECCR3;
/*   524 */ } FSMC_Bank2_3_TypeDef;
/*   530 */ typedef struct
/*   531 */ {
/*   532 */    volatile uint32_t PCR4;
/*   533 */    volatile uint32_t SR4;
/*   534 */    volatile uint32_t PMEM4;
/*   535 */    volatile uint32_t PATT4;
/*   536 */    volatile uint32_t PIO4;
/*   537 */ } FSMC_Bank4_TypeDef;
/*   543 */ typedef struct
/*   544 */ {
/*   545 */    volatile uint32_t MODER;
/*   546 */    volatile uint32_t OTYPER;
/*   547 */    volatile uint32_t OSPEEDR;
/*   548 */    volatile uint32_t PUPDR;
/*   549 */    volatile uint32_t IDR;
/*   550 */    volatile uint32_t ODR;
/*   551 */    volatile uint32_t BSRR;
/*   552 */    volatile uint32_t LCKR;
/*   553 */    volatile uint32_t AFR[2];
/*   554 */ } GPIO_TypeDef;
/*   560 */ typedef struct
/*   561 */ {
/*   562 */    volatile uint32_t MEMRMP;
/*   563 */    volatile uint32_t PMC;
/*   564 */    volatile uint32_t EXTICR[4];
/*   565 */    uint32_t RESERVED[2];
/*   566 */    volatile uint32_t CMPCR;
/*   567 */ } SYSCFG_TypeDef;
/*   573 */ typedef struct
/*   574 */ {
/*   575 */    volatile uint32_t CR1;
/*   576 */    volatile uint32_t CR2;
/*   577 */    volatile uint32_t OAR1;
/*   578 */    volatile uint32_t OAR2;
/*   579 */    volatile uint32_t DR;
/*   580 */    volatile uint32_t SR1;
/*   581 */    volatile uint32_t SR2;
/*   582 */    volatile uint32_t CCR;
/*   583 */    volatile uint32_t TRISE;
/*   584 */ } I2C_TypeDef;
/*   590 */ typedef struct
/*   591 */ {
/*   592 */    volatile uint32_t KR;
/*   593 */    volatile uint32_t PR;
/*   594 */    volatile uint32_t RLR;
/*   595 */    volatile uint32_t SR;
/*   596 */ } IWDG_TypeDef;
/*   603 */ typedef struct
/*   604 */ {
/*   605 */    volatile uint32_t CR;
/*   606 */    volatile uint32_t CSR;
/*   607 */ } PWR_TypeDef;
/*   613 */ typedef struct
/*   614 */ {
/*   615 */    volatile uint32_t CR;
/*   616 */    volatile uint32_t PLLCFGR;
/*   617 */    volatile uint32_t CFGR;
/*   618 */    volatile uint32_t CIR;
/*   619 */    volatile uint32_t AHB1RSTR;
/*   620 */    volatile uint32_t AHB2RSTR;
/*   621 */    volatile uint32_t AHB3RSTR;
/*   622 */    uint32_t RESERVED0;
/*   623 */    volatile uint32_t APB1RSTR;
/*   624 */    volatile uint32_t APB2RSTR;
/*   625 */    uint32_t RESERVED1[2];
/*   626 */    volatile uint32_t AHB1ENR;
/*   627 */    volatile uint32_t AHB2ENR;
/*   628 */    volatile uint32_t AHB3ENR;
/*   629 */    uint32_t RESERVED2;
/*   630 */    volatile uint32_t APB1ENR;
/*   631 */    volatile uint32_t APB2ENR;
/*   632 */    uint32_t RESERVED3[2];
/*   633 */    volatile uint32_t AHB1LPENR;
/*   634 */    volatile uint32_t AHB2LPENR;
/*   635 */    volatile uint32_t AHB3LPENR;
/*   636 */    uint32_t RESERVED4;
/*   637 */    volatile uint32_t APB1LPENR;
/*   638 */    volatile uint32_t APB2LPENR;
/*   639 */    uint32_t RESERVED5[2];
/*   640 */    volatile uint32_t BDCR;
/*   641 */    volatile uint32_t CSR;
/*   642 */    uint32_t RESERVED6[2];
/*   643 */    volatile uint32_t SSCGR;
/*   644 */    volatile uint32_t PLLI2SCFGR;
/*   645 */ } RCC_TypeDef;
/*   651 */ typedef struct
/*   652 */ {
/*   653 */    volatile uint32_t TR;
/*   654 */    volatile uint32_t DR;
/*   655 */    volatile uint32_t CR;
/*   656 */    volatile uint32_t ISR;
/*   657 */    volatile uint32_t PRER;
/*   658 */    volatile uint32_t WUTR;
/*   659 */    volatile uint32_t CALIBR;
/*   660 */    volatile uint32_t ALRMAR;
/*   661 */    volatile uint32_t ALRMBR;
/*   662 */    volatile uint32_t WPR;
/*   663 */    volatile uint32_t SSR;
/*   664 */    volatile uint32_t SHIFTR;
/*   665 */    volatile uint32_t TSTR;
/*   666 */    volatile uint32_t TSDR;
/*   667 */    volatile uint32_t TSSSR;
/*   668 */    volatile uint32_t CALR;
/*   669 */    volatile uint32_t TAFCR;
/*   670 */    volatile uint32_t ALRMASSR;
/*   671 */    volatile uint32_t ALRMBSSR;
/*   672 */    uint32_t RESERVED7;
/*   673 */    volatile uint32_t BKP0R;
/*   674 */    volatile uint32_t BKP1R;
/*   675 */    volatile uint32_t BKP2R;
/*   676 */    volatile uint32_t BKP3R;
/*   677 */    volatile uint32_t BKP4R;
/*   678 */    volatile uint32_t BKP5R;
/*   679 */    volatile uint32_t BKP6R;
/*   680 */    volatile uint32_t BKP7R;
/*   681 */    volatile uint32_t BKP8R;
/*   682 */    volatile uint32_t BKP9R;
/*   683 */    volatile uint32_t BKP10R;
/*   684 */    volatile uint32_t BKP11R;
/*   685 */    volatile uint32_t BKP12R;
/*   686 */    volatile uint32_t BKP13R;
/*   687 */    volatile uint32_t BKP14R;
/*   688 */    volatile uint32_t BKP15R;
/*   689 */    volatile uint32_t BKP16R;
/*   690 */    volatile uint32_t BKP17R;
/*   691 */    volatile uint32_t BKP18R;
/*   692 */    volatile uint32_t BKP19R;
/*   693 */ } RTC_TypeDef;
/*   699 */ typedef struct
/*   700 */ {
/*   701 */    volatile uint32_t POWER;
/*   702 */    volatile uint32_t CLKCR;
/*   703 */    volatile uint32_t ARG;
/*   704 */    volatile uint32_t CMD;
/*   705 */    volatile const uint32_t RESPCMD;
/*   706 */    volatile const uint32_t RESP1;
/*   707 */    volatile const uint32_t RESP2;
/*   708 */    volatile const uint32_t RESP3;
/*   709 */    volatile const uint32_t RESP4;
/*   710 */    volatile uint32_t DTIMER;
/*   711 */    volatile uint32_t DLEN;
/*   712 */    volatile uint32_t DCTRL;
/*   713 */    volatile const uint32_t DCOUNT;
/*   714 */    volatile const uint32_t STA;
/*   715 */    volatile uint32_t ICR;
/*   716 */    volatile uint32_t MASK;
/*   717 */    uint32_t RESERVED0[2];
/*   718 */    volatile const uint32_t FIFOCNT;
/*   719 */    uint32_t RESERVED1[13];
/*   720 */    volatile uint32_t FIFO;
/*   721 */ } SDIO_TypeDef;
/*   727 */ typedef struct
/*   728 */ {
/*   729 */    volatile uint32_t CR1;
/*   730 */    volatile uint32_t CR2;
/*   731 */    volatile uint32_t SR;
/*   732 */    volatile uint32_t DR;
/*   733 */    volatile uint32_t CRCPR;
/*   734 */    volatile uint32_t RXCRCR;
/*   735 */    volatile uint32_t TXCRCR;
/*   736 */    volatile uint32_t I2SCFGR;
/*   737 */    volatile uint32_t I2SPR;
/*   738 */ } SPI_TypeDef;
/*   745 */ typedef struct
/*   746 */ {
/*   747 */    volatile uint32_t CR1;
/*   748 */    volatile uint32_t CR2;
/*   749 */    volatile uint32_t SMCR;
/*   750 */    volatile uint32_t DIER;
/*   751 */    volatile uint32_t SR;
/*   752 */    volatile uint32_t EGR;
/*   753 */    volatile uint32_t CCMR1;
/*   754 */    volatile uint32_t CCMR2;
/*   755 */    volatile uint32_t CCER;
/*   756 */    volatile uint32_t CNT;
/*   757 */    volatile uint32_t PSC;
/*   758 */    volatile uint32_t ARR;
/*   759 */    volatile uint32_t RCR;
/*   760 */    volatile uint32_t CCR1;
/*   761 */    volatile uint32_t CCR2;
/*   762 */    volatile uint32_t CCR3;
/*   763 */    volatile uint32_t CCR4;
/*   764 */    volatile uint32_t BDTR;
/*   765 */    volatile uint32_t DCR;
/*   766 */    volatile uint32_t DMAR;
/*   767 */    volatile uint32_t OR;
/*   768 */ } TIM_TypeDef;
/*   774 */ typedef struct
/*   775 */ {
/*   776 */    volatile uint32_t SR;
/*   777 */    volatile uint32_t DR;
/*   778 */    volatile uint32_t BRR;
/*   779 */    volatile uint32_t CR1;
/*   780 */    volatile uint32_t CR2;
/*   781 */    volatile uint32_t CR3;
/*   782 */    volatile uint32_t GTPR;
/*   783 */ } USART_TypeDef;
/*   789 */ typedef struct
/*   790 */ {
/*   791 */    volatile uint32_t CR;
/*   792 */    volatile uint32_t CFR;
/*   793 */    volatile uint32_t SR;
/*   794 */ } WWDG_TypeDef;
/*   800 */ typedef struct
/*   801 */ {
/*   802 */    volatile uint32_t CR;
/*   803 */    volatile uint32_t SR;
/*   804 */    volatile uint32_t DR;
/*   805 */ } RNG_TypeDef;
/*   810 */ typedef struct
/*   811 */ {
/*   812 */    volatile uint32_t GOTGCTL;
/*   813 */    volatile uint32_t GOTGINT;
/*   814 */    volatile uint32_t GAHBCFG;
/*   815 */    volatile uint32_t GUSBCFG;
/*   816 */    volatile uint32_t GRSTCTL;
/*   817 */    volatile uint32_t GINTSTS;
/*   818 */    volatile uint32_t GINTMSK;
/*   819 */    volatile uint32_t GRXSTSR;
/*   820 */    volatile uint32_t GRXSTSP;
/*   821 */    volatile uint32_t GRXFSIZ;
/*   822 */    volatile uint32_t DIEPTXF0_HNPTXFSIZ;
/*   823 */    volatile uint32_t HNPTXSTS;
/*   824 */    uint32_t Reserved30[2];
/*   825 */    volatile uint32_t GCCFG;
/*   826 */    volatile uint32_t CID;
/*   827 */    uint32_t Reserved40[48];
/*   828 */    volatile uint32_t HPTXFSIZ;
/*   829 */    volatile uint32_t DIEPTXF[0x0F];
/*   830 */ } USB_OTG_GlobalTypeDef;
/*   835 */ typedef struct
/*   836 */ {
/*   837 */    volatile uint32_t DCFG;
/*   838 */    volatile uint32_t DCTL;
/*   839 */    volatile uint32_t DSTS;
/*   840 */    uint32_t Reserved0C;
/*   841 */    volatile uint32_t DIEPMSK;
/*   842 */    volatile uint32_t DOEPMSK;
/*   843 */    volatile uint32_t DAINT;
/*   844 */    volatile uint32_t DAINTMSK;
/*   845 */    uint32_t Reserved20;
/*   846 */    uint32_t Reserved9;
/*   847 */    volatile uint32_t DVBUSDIS;
/*   848 */    volatile uint32_t DVBUSPULSE;
/*   849 */    volatile uint32_t DTHRCTL;
/*   850 */    volatile uint32_t DIEPEMPMSK;
/*   851 */    volatile uint32_t DEACHINT;
/*   852 */    volatile uint32_t DEACHMSK;
/*   853 */    uint32_t Reserved40;
/*   854 */    volatile uint32_t DINEP1MSK;
/*   855 */    uint32_t Reserved44[15];
/*   856 */    volatile uint32_t DOUTEP1MSK;
/*   857 */ } USB_OTG_DeviceTypeDef;
/*   862 */ typedef struct
/*   863 */ {
/*   864 */    volatile uint32_t DIEPCTL;
/*   865 */    uint32_t Reserved04;
/*   866 */    volatile uint32_t DIEPINT;
/*   867 */    uint32_t Reserved0C;
/*   868 */    volatile uint32_t DIEPTSIZ;
/*   869 */    volatile uint32_t DIEPDMA;
/*   870 */    volatile uint32_t DTXFSTS;
/*   871 */    uint32_t Reserved18;
/*   872 */ } USB_OTG_INEndpointTypeDef;
/*   877 */ typedef struct
/*   878 */ {
/*   879 */    volatile uint32_t DOEPCTL;
/*   880 */    uint32_t Reserved04;
/*   881 */    volatile uint32_t DOEPINT;
/*   882 */    uint32_t Reserved0C;
/*   883 */    volatile uint32_t DOEPTSIZ;
/*   884 */    volatile uint32_t DOEPDMA;
/*   885 */    uint32_t Reserved18[2];
/*   886 */ } USB_OTG_OUTEndpointTypeDef;
/*   891 */ typedef struct
/*   892 */ {
/*   893 */    volatile uint32_t HCFG;
/*   894 */    volatile uint32_t HFIR;
/*   895 */    volatile uint32_t HFNUM;
/*   896 */    uint32_t Reserved40C;
/*   897 */    volatile uint32_t HPTXSTS;
/*   898 */    volatile uint32_t HAINT;
/*   899 */    volatile uint32_t HAINTMSK;
/*   900 */ } USB_OTG_HostTypeDef;
/*   905 */ typedef struct
/*   906 */ {
/*   907 */    volatile uint32_t HCCHAR;
/*   908 */    volatile uint32_t HCSPLT;
/*   909 */    volatile uint32_t HCINT;
/*   910 */    volatile uint32_t HCINTMSK;
/*   911 */    volatile uint32_t HCTSIZ;
/*   912 */    volatile uint32_t HCDMA;
/*   913 */    uint32_t Reserved[2];
/*   914 */ } USB_OTG_HostChannelTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f4xx.h
 */
/*   201 */ typedef enum
/*   202 */ {
/*   203 */    RESET = 0U,
/*   204 */    SET = !RESET
/*   205 */ } FlagStatus, ITStatus;
/*   207 */ typedef enum
/*   208 */ {
/*   209 */    DISABLE = 0U,
/*   210 */    ENABLE = !DISABLE
/*   211 */ } FunctionalState;
/*   214 */ typedef enum
/*   215 */ {
/*   216 */    ERROR = 0U,
/*   217 */    SUCCESS = !ERROR
/*   218 */ } ErrorStatus;
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/LCD.h
 */
/*   113 */ typedef int LCD_DRAWMODE;
/*   114 */ typedef unsigned long LCD_COLOR;
/*   120 */ typedef struct { signed short x,y; } GUI_POINT;
/*   121 */ typedef struct { signed short x0,y0,x1,y1; } LCD_RECT;
/*   123 */ typedef struct {
/*   124 */    int NumEntries;
/*   125 */    char HasTrans;
/*   126 */    const LCD_COLOR * pPalEntries;
/*   127 */ } LCD_LOGPALETTE;
/*   130 */ typedef struct {
/*   131 */    int x,y;
/*   132 */    unsigned char KeyStat;
/*   133 */ } LCD_tMouseState;
/*   135 */ typedef struct {
/*   136 */    int NumEntries;
/*   137 */    const LCD_COLOR * pPalEntries;
/*   138 */ } LCD_PHYSPALETTE;
/*   144 */ typedef LCD_COLOR tLCDDEV_Index2Color (unsigned long Index);
/*   145 */ typedef unsigned long tLCDDEV_Color2Index (LCD_COLOR Color);
/*   146 */ typedef unsigned long tLCDDEV_GetIndexMask (void);
/*   148 */ typedef void tLCDDEV_Index2ColorBulk(void * pIndex, LCD_COLOR * pColor, unsigned long NumItems, unsigned char SizeOfIndex);
/*   149 */ typedef void tLCDDEV_Color2IndexBulk(LCD_COLOR * pColor, void * pIndex, unsigned long NumItems, unsigned char SizeOfIndex);
/*   155 */ typedef struct {
/*   156 */    tLCDDEV_Color2Index * pfColor2Index;
/*   157 */    tLCDDEV_Index2Color * pfIndex2Color;
/*   158 */    tLCDDEV_GetIndexMask * pfGetIndexMask;
/*   159 */    int NoAlpha;
/*   160 */    tLCDDEV_Color2IndexBulk * pfColor2IndexBulk;
/*   161 */    tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk;
/*   162 */ } LCD_API_COLOR_CONV;
/*   164 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_0;
/*   165 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1;
/*   166 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_2;
/*   167 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_4;
/*   168 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_5;
/*   169 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_8;
/*   170 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_16;
/*   171 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_24;
/*   172 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_2;
/*   173 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_4;
/*   174 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_5;
/*   175 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_6;
/*   176 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8;
/*   177 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_16;
/*   178 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1616I;
/*   179 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_111;
/*   180 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_222;
/*   181 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_233;
/*   182 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_323;
/*   183 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_332;
/*   184 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_444_12;
/*   185 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_444_12_1;
/*   186 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_444_16;
/*   187 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_555;
/*   188 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_565;
/*   189 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_556;
/*   190 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_655;
/*   191 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_666;
/*   192 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_666_9;
/*   193 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_822216;
/*   194 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_84444;
/*   195 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8666;
/*   196 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8666_1;
/*   197 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_88666I;
/*   198 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_888;
/*   199 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8888;
/*   200 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M111;
/*   201 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M1555I;
/*   202 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M222;
/*   203 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M233;
/*   204 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M323;
/*   205 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M332;
/*   206 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M4444I;
/*   207 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M444_12;
/*   208 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M444_12_1;
/*   209 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M444_16;
/*   210 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M555;
/*   211 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M565;
/*   212 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M556;
/*   213 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M655;
/*   214 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M666;
/*   215 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M666_9;
/*   216 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M8565;
/*   217 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M888;
/*   218 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M8888;
/*   219 */ extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M8888I;
/*   278 */ void GUICC_M1555I_SetCustColorConv(tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
/*   279 */ void GUICC_M565_SetCustColorConv (tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
/*   280 */ void GUICC_M4444I_SetCustColorConv(tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
/*   281 */ void GUICC_M888_SetCustColorConv (tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
/*   282 */ void GUICC_M8888I_SetCustColorConv(tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
/*   309 */ typedef void tLCDDEV_DrawPixel (int x, int y);
/*   310 */ typedef void tLCDDEV_DrawHLine (int x0, int y0, int x1);
/*   311 */ typedef void tLCDDEV_DrawVLine (int x , int y0, int y1);
/*   312 */ typedef void tLCDDEV_FillRect (int x0, int y0, int x1, int y1);
/*   313 */ typedef unsigned int tLCDDEV_GetPixelIndex(int x, int y);
/*   314 */ typedef void tLCDDEV_SetPixelIndex(int x, int y, int ColorIndex);
/*   315 */ typedef void tLCDDEV_XorPixel (int x, int y);
/*   316 */ typedef void tLCDDEV_FillPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
/*   317 */ typedef void tLCDDEV_FillPolygonAA(const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
/*   318 */ typedef void tLCDDEV_GetRect (LCD_RECT * pRect);
/*   319 */ typedef int tLCDDEV_Init (void);
/*   320 */ typedef void tLCDDEV_On (void);
/*   321 */ typedef void tLCDDEV_Off (void);
/*   322 */ typedef void tLCDDEV_SetLUTEntry (unsigned char Pos, LCD_COLOR color);
/*   323 */ typedef void * tLCDDEV_GetDevFunc (int Index);
/*   324 */ typedef signed long tLCDDEV_GetDevProp (int Index);
/*   325 */ typedef void tLCDDEV_SetOrg (int x, int y);
/*   331 */ typedef struct GUI_DEVICE GUI_DEVICE;
/*   332 */ typedef struct GUI_DEVICE_API GUI_DEVICE_API;
/*   334 */ typedef void tLCDDEV_DrawBitmap (int x0, int y0, int xsize, int ysize,
/*   335 */     int BitsPerPixel, int BytesPerLine,
/*   336 */     const unsigned char * pData, int Diff,
/*   337 */     const void * pTrans);
/*   374 */ int LCD_GetXSizeMax(void);
/*   375 */ int LCD_GetYSizeMax(void);
/*   376 */ int LCD_GetVXSizeMax(void);
/*   377 */ int LCD_GetVYSizeMax(void);
/*   378 */ int LCD_GetBitsPerPixelMax(void);
/*   379 */ void LCD_SetDisplaySize(int xSizeDisplay, int ySizeDisplay);
/*   380 */ int LCD_GetXSizeDisplay(void);
/*   381 */ int LCD_GetYSizeDisplay(void);
/*   383 */ int LCD_GetXSizeEx (int LayerIndex);
/*   384 */ int LCD_GetYSizeEx (int LayerIndex);
/*   385 */ int LCD_GetVXSizeEx (int LayerIndex);
/*   386 */ int LCD_GetVYSizeEx (int LayerIndex);
/*   387 */ int LCD_GetBitsPerPixelEx (int LayerIndex);
/*   388 */ unsigned long LCD_GetNumColorsEx (int LayerIndex);
/*   389 */ int LCD_GetXMagEx (int LayerIndex);
/*   390 */ int LCD_GetYMagEx (int LayerIndex);
/*   391 */ int LCD_GetMirrorXEx (int LayerIndex);
/*   392 */ int LCD_GetMirrorYEx (int LayerIndex);
/*   393 */ int LCD_GetSwapXYEx (int LayerIndex);
/*   394 */ int LCD_GetReversLUTEx (int LayerIndex);
/*   395 */ int LCD_GetPhysColorsInRAMEx(int LayerIndex);
/*   397 */ int LCD_GetXSize (void);
/*   398 */ int LCD_GetYSize (void);
/*   399 */ int LCD_GetVXSize (void);
/*   400 */ int LCD_GetVYSize (void);
/*   401 */ int LCD_GetBitsPerPixel (void);
/*   402 */ unsigned long LCD_GetNumColors (void);
/*   403 */ int LCD_GetXMag (void);
/*   404 */ int LCD_GetYMag (void);
/*   405 */ int LCD_GetMirrorX (void);
/*   406 */ int LCD_GetMirrorY (void);
/*   407 */ int LCD_GetSwapXY (void);
/*   408 */ int LCD_GetReversLUT (void);
/*   409 */ int LCD_GetPhysColorsInRAM (void);
/*   411 */ signed long LCD__GetBPP (unsigned long IndexMask);
/*   412 */ signed long LCD__GetBPPDevice(unsigned long IndexMask);
/*   414 */ tLCDDEV_Index2Color * LCD_GetpfIndex2ColorEx(int LayerIndex);
/*   415 */ tLCDDEV_Color2Index * LCD_GetpfColor2IndexEx(int LayerIndex);
/*   417 */ tLCDDEV_Color2Index * LCD_GetpfColor2Index(void);
/*   419 */ int LCD_GetNumLayers(void);
/*   421 */ LCD_COLOR * LCD_GetPalette (void);
/*   422 */ LCD_COLOR * LCD_GetPaletteEx(int LayerIndex);
/*   424 */ void (* LCD_GetDevFunc(int LayerIndex, int Item))(void);
/*   486 */ typedef struct {
/*   487 */    void * pVRAM;
/*   488 */ } LCD_X_SETVRAMADDR_INFO;
/*   490 */ typedef struct {
/*   491 */    int xPos, yPos;
/*   492 */ } LCD_X_SETORG_INFO;
/*   494 */ typedef struct {
/*   495 */    LCD_COLOR Color;
/*   496 */    unsigned char Pos;
/*   497 */ } LCD_X_SETLUTENTRY_INFO;
/*   499 */ typedef struct {
/*   500 */    int xSize, ySize;
/*   501 */ } LCD_X_SETSIZE_INFO;
/*   503 */ typedef struct {
/*   504 */    int xPos, yPos;
/*   505 */    int xLen, yLen;
/*   506 */    int BytesPerPixel;
/*   507 */    unsigned long Off;
/*   508 */ } LCD_X_SETPOS_INFO;
/*   510 */ typedef struct {
/*   511 */    int Alpha;
/*   512 */ } LCD_X_SETALPHA_INFO;
/*   514 */ typedef struct {
/*   515 */    int OnOff;
/*   516 */ } LCD_X_SETVIS_INFO;
/*   518 */ typedef struct {
/*   519 */    int AlphaMode;
/*   520 */ } LCD_X_SETALPHAMODE_INFO;
/*   522 */ typedef struct {
/*   523 */    int ChromaMode;
/*   524 */ } LCD_X_SETCHROMAMODE_INFO;
/*   526 */ typedef struct {
/*   527 */    LCD_COLOR ChromaMin;
/*   528 */    LCD_COLOR ChromaMax;
/*   529 */ } LCD_X_SETCHROMA_INFO;
/*   531 */ typedef struct {
/*   532 */    int Index;
/*   533 */ } LCD_X_SHOWBUFFER_INFO;
/*   554 */ int LCD_X_DisplayDriver(unsigned LayerIndex, unsigned Cmd, void * pData);
/*   555 */ void LCD_X_Config(void);
/*   561 */ int LCD_SetAlphaEx (int LayerIndex, int Alpha);
/*   562 */ int LCD_SetPosEx (int LayerIndex, int xPos, int yPos);
/*   563 */ int LCD_SetSizeEx (int LayerIndex, int xSize, int ySize);
/*   564 */ int LCD_SetVisEx (int LayerIndex, int OnOff);
/*   565 */ int LCD_SetVRAMAddrEx (int LayerIndex, void * pVRAM);
/*   566 */ int LCD_SetVSizeEx (int LayerIndex, int xSize, int ySize);
/*   567 */ int LCD_SetAlphaModeEx (int LayerIndex, int AlphaMode);
/*   568 */ int LCD_SetChromaModeEx(int LayerIndex, int ChromaMode);
/*   569 */ int LCD_SetChromaEx (int LayerIndex, LCD_COLOR ChromaMin, LCD_COLOR ChromaMax);
/*   571 */ int LCD_SetAlpha (int Alpha);
/*   572 */ int LCD_SetVRAMAddr (void * pVRAM);
/*   573 */ int LCD_SetVSize (int xSize, int ySize);
/*   574 */ int LCD_SetSize (int xSize, int ySize);
/*   575 */ int LCD_SetVis (int OnOff);
/*   576 */ int LCD_SetPos (int xPos, int yPos);
/*   577 */ int LCD_SetAlphaMode (int AlphaMode);
/*   578 */ int LCD_SetChromaMode(int ChromaMode);
/*   579 */ int LCD_SetChroma (LCD_COLOR ChromaMin, LCD_COLOR ChromaMax);
/*   580 */ int LCD_SetLUTEntry (unsigned char Pos, LCD_COLOR Color);
/*   581 */ int LCD_SetDevFunc (int LayerIndex, int IdFunc, void (* pDriverFunc)(void));
/*   583 */ void LCD_SetOrg(int xOrg, int yOrg);
/*   585 */ int LCD_OnEx (int LayerIndex);
/*   586 */ int LCD_OffEx(int LayerIndex);
/*   587 */ int LCD_On (void);
/*   588 */ int LCD_Off (void);
/*   594 */ int LCD_GetPosEx(int LayerIndex, int * pxPos, int * pyPos);
/*   596 */ int LCD_GetPos (int * pxPos, int * pyPos);
/*   602 */ int LCD_Refresh (void);
/*   603 */ int LCD_RefreshEx(int LayerIndex);
/*   609 */ typedef struct {
/*   610 */    int (* pfStart) (int x0, int y0, int x1, int y1);
/*   611 */    void (* pfSetPixel)(unsigned long PixelIndex);
/*   612 */    void (* pfNextLine)(void);
/*   613 */    void (* pfEnd) (void);
/*   614 */ } LCD_API_NEXT_PIXEL;
/*   616 */ LCD_API_NEXT_PIXEL * LCD_GetNextPixelAPI(void);
/*   622 */ typedef void tLCD_HL_DrawHLine (int x0, int y0, int x1);
/*   623 */ typedef void tLCD_HL_DrawPixel (int x0, int y0);
/*   625 */ typedef struct {
/*   626 */    tLCD_HL_DrawHLine * pfDrawHLine;
/*   627 */    tLCD_HL_DrawPixel * pfDrawPixel;
/*   628 */ } tLCD_HL_APIList;
/*   630 */ void LCD_DrawHLine(int x0, int y0, int x1);
/*   631 */ void LCD_DrawPixel(int x0, int y0);
/*   632 */ void LCD_DrawVLine(int x, int y0, int y1);
/*   639 */ void LCD_SetClipRectEx(const LCD_RECT * pRect);
/*   640 */ void LCD_SetClipRectMax(void);
/*   643 */ signed long LCD_GetDevCap (int Index);
/*   644 */ signed long LCD_GetDevCapEx(int LayerIndex, int Index);
/*   647 */ int emWin_LCD_Init(void);
/*   648 */ int LCD_InitColors(void);
/*   650 */ void LCD_SetBkColor (LCD_COLOR Color);
/*   651 */ void LCD_SetColor (LCD_COLOR Color);
/*   652 */ void LCD_SetPixelIndex(int x, int y, int ColorIndex);
/*   655 */ void LCD_InitLUT(void);
/*   656 */ int LCD_SetLUTEntryEx(int LayerIndex, unsigned char Pos, LCD_COLOR Color);
/*   657 */ void LCD_SetLUTEx(int LayerIndex, const LCD_PHYSPALETTE * pPalette);
/*   658 */ void LCD_SetLUT (const LCD_PHYSPALETTE * pPalette);
/*   660 */ LCD_DRAWMODE LCD_SetDrawMode (LCD_DRAWMODE dm);
/*   661 */ void LCD_SetColorIndex(unsigned PixelIndex);
/*   662 */ void LCD_SetBkColorIndex(unsigned PixelIndex);
/*   663 */ void LCD_FillRect(int x0, int y0, int x1, int y1);
/*   664 */ typedef void tLCD_SetPixelAA(int x, int y, unsigned char Intens);
/*   666 */ void LCD_SetPixelAA4_Trans (int x, int y, unsigned char Intens);
/*   667 */ void LCD_SetPixelAA4_NoTrans(int x, int y, unsigned char Intens);
/*   669 */ void LCD_SetPixelAA8_Trans (int x, int y, unsigned char Intens);
/*   670 */ void LCD_SetPixelAA8_NoTrans(int x, int y, unsigned char Intens);
/*   672 */ void LCD_AA_EnableGamma(int OnOff);
/*   673 */ void LCD_AA_SetGamma (unsigned char * pGamma);
/*   674 */ void LCD_AA_GetGamma (unsigned char * pGamma);
/*   676 */ LCD_COLOR LCD_AA_MixColors16 (LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
/*   677 */ LCD_COLOR LCD_AA_MixColors256(LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
/*   678 */ LCD_COLOR LCD_MixColors256 (LCD_COLOR Color, LCD_COLOR BkColor, unsigned Intens);
/*   679 */ LCD_COLOR LCD_GetPixelColor(int x, int y);
/*   680 */ unsigned int LCD_GetPixelIndex(int x, int y);
/*   681 */ int LCD_GetBkColorIndex (void);
/*   682 */ int LCD_GetColorIndex (void);
/*   686 */ unsigned long LCD_AA_SetAndMask(unsigned long AndMask);
/*   690 */ int LCD_SetMaxNumColors(unsigned MaxNumColors);
/*   691 */ int LCD_GetMaxNumColors(void);
/*   692 */ void LCD__SetPaletteConversionHook(void (* pfPaletteConversionHook)(const LCD_LOGPALETTE * pLogPal));
/*   700 */ typedef void tLCD_DrawBitmap(int x0, int y0, int xsize, int ysize,
/*   701 */     int xMul, int yMul, int BitsPerPixel, int BytesPerLine,
/*   702 */     const unsigned char * pPixel, const void * pTrans);
/*   703 */ typedef void tRect2TextRect (LCD_RECT * pRect);
/*   705 */ struct tLCD_APIList_struct {
/*   706 */    tLCD_DrawBitmap * pfDrawBitmap;
/*   707 */    tRect2TextRect * pfRect2TextRect;
/*   708 */    tRect2TextRect * pfTransformRect;
/*   709 */ };
/*   711 */ typedef struct tLCD_APIList_struct tLCD_APIList;
/*   713 */ extern tLCD_APIList LCD_APIListCCW;
/*   714 */ extern tLCD_APIList LCD_APIListCW;
/*   715 */ extern tLCD_APIList LCD_APIList180;
/*   723 */ tLCD_SetPixelAA * LCD__GetPfSetPixel(int BitsPerPixel);
/*   731 */ void LCD__SetPhysColor(unsigned char Pos, LCD_COLOR Color);
/*   741 */ int LCD_ControlCache (int Cmd);
/*   742 */ int LCD_ControlCacheEx(int LayerIndex, int Cmd);
/*   748 */ unsigned long LCD_Color2Index (LCD_COLOR Color);
/*   749 */ LCD_COLOR LCD_Index2Color (int Index);
/*   750 */ LCD_COLOR LCD_Index2ColorEx (int i, unsigned LayerIndex);
/*   756 */ unsigned char LCD_X_Read00(void);
/*   757 */ unsigned char LCD_X_Read01(void);
/*   758 */ void LCD_X_Write00 (unsigned char c);
/*   759 */ void LCD_X_Write01 (unsigned char c);
/*   760 */ void LCD_X_WriteM01(unsigned char * pData, int NumBytes);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/GUI_Type.h
 */
/*    67 */ typedef const char * GUI_ConstString;
/*    69 */ typedef LCD_COLOR GUI_COLOR;
/*    70 */ typedef LCD_LOGPALETTE GUI_LOGPALETTE;
/*    71 */ typedef LCD_DRAWMODE GUI_DRAWMODE;
/*    72 */ typedef LCD_RECT GUI_RECT;
/*    74 */ typedef struct {
/*    75 */    void (* pfDraw) (int x0,
/*    76 */        int y0,
/*    77 */        int xsize,
/*    78 */        int ysize,
/*    79 */        const unsigned char * pPixel,
/*    80 */        const LCD_LOGPALETTE * pLogPal,
/*    81 */        int xMag,
/*    82 */        int yMag);
/*    83 */    GUI_COLOR (* pfIndex2Color)(unsigned long Index);
/*    84 */    void (* pfDrawHW)(int x0,
/*    85 */        int y0,
/*    86 */        int xsize,
/*    87 */        int ysize,
/*    88 */        const unsigned char * pPixel,
/*    89 */        const LCD_LOGPALETTE * pLogPal,
/*    90 */        int xMag,
/*    91 */        int yMag);
/*    92 */    const LCD_API_COLOR_CONV * pColorConvAPI;
/*    93 */ } GUI_BITMAP_METHODS;
/*    95 */ typedef struct {
/*    96 */    unsigned short XSize;
/*    97 */    unsigned short YSize;
/*    98 */    unsigned short BytesPerLine;
/*    99 */    unsigned short BitsPerPixel;
/*   100 */    const unsigned char * pData;
/*   101 */    const GUI_LOGPALETTE * pPal;
/*   102 */    const GUI_BITMAP_METHODS * pMethods;
/*   103 */ } GUI_BITMAP;
/*   110 */ typedef struct {
/*   111 */    unsigned short ID;
/*   112 */    unsigned short Format;
/*   113 */    unsigned short XSize;
/*   114 */    unsigned short YSize;
/*   115 */    unsigned short BytesPerLine;
/*   116 */    unsigned short BitsPerPixel;
/*   117 */    unsigned short NumColors;
/*   118 */    unsigned short HasTrans;
/*   119 */ } GUI_BITMAP_STREAM;
/*   121 */ typedef struct {
/*   122 */    int Cmd;
/*   123 */    unsigned long v;
/*   124 */    void * p;
/*   125 */ } GUI_BITMAPSTREAM_PARAM;
/*   127 */ typedef struct {
/*   128 */    int XSize;
/*   129 */    int YSize;
/*   130 */    int BitsPerPixel;
/*   131 */    int NumColors;
/*   132 */    int HasTrans;
/*   133 */ } GUI_BITMAPSTREAM_INFO;
/*   135 */ typedef void * (* GUI_BITMAPSTREAM_CALLBACK)(GUI_BITMAPSTREAM_PARAM * pParam);
/*   137 */ typedef struct {
/*   138 */    int x,y;
/*   139 */    unsigned char Pressed;
/*   140 */    unsigned char Layer;
/*   141 */ } GUI_PID_STATE;
/*   143 */ typedef struct {
/*   144 */    int Key;
/*   145 */    int Pressed;
/*   146 */ } GUI_KEY_STATE;
/*   148 */ typedef struct {
/*   149 */    int xPos;
/*   150 */    int yPos;
/*   151 */    int xSize;
/*   152 */    int ySize;
/*   153 */    int Delay;
/*   154 */ } GUI_GIF_IMAGE_INFO;
/*   156 */ typedef struct {
/*   157 */    int xSize;
/*   158 */    int ySize;
/*   159 */    int NumImages;
/*   160 */ } GUI_GIF_INFO;
/*   162 */ typedef struct GUI_REGISTER_EXIT GUI_REGISTER_EXIT;
/*   164 */ struct GUI_REGISTER_EXIT {
/*   165 */    void (* pfVoid)(void);
/*   166 */    GUI_REGISTER_EXIT * pNext;
/*   167 */ };
/*   169 */ typedef struct {
/*   170 */    void (* cbBegin)(void);
/*   171 */    void (* cbEnd) (void);
/*   172 */ } GUI_MULTIBUF_API;
/*   174 */ typedef struct {
/*   175 */    void (* cbBeginEx)(int LayerIndex);
/*   176 */    void (* cbEndEx) (int LayerIndex);
/*   177 */ } GUI_MULTIBUF_API_EX;
/*   187 */ typedef struct {
/*   188 */    signed short c0;
/*   189 */    signed short c1;
/*   190 */ } GUI_FONT_TRANSLIST;
/*   192 */ typedef struct {
/*   193 */    unsigned short FirstChar;
/*   194 */    unsigned short LastChar;
/*   195 */    const GUI_FONT_TRANSLIST * pList;
/*   196 */ } GUI_FONT_TRANSINFO;
/*   198 */ typedef struct {
/*   199 */    unsigned char XSize;
/*   200 */    unsigned char XDist;
/*   201 */    unsigned char BytesPerLine;
/*   202 */    const unsigned char * pData;
/*   203 */ } GUI_CHARINFO;
/*   205 */ typedef struct {
/*   206 */    unsigned char XSize;
/*   207 */    unsigned char YSize;
/*   208 */    signed char XPos;
/*   209 */    signed char YPos;
/*   210 */    unsigned char XDist;
/*   211 */    const unsigned char * pData;
/*   212 */ } GUI_CHARINFO_EXT;
/*   214 */ typedef struct GUI_FONT_PROP {
/*   215 */    unsigned short First;
/*   216 */    unsigned short Last;
/*   217 */    const GUI_CHARINFO * paCharInfo;
/*   218 */    const struct GUI_FONT_PROP * pNext;
/*   219 */ } GUI_FONT_PROP;
/*   221 */ typedef struct GUI_FONT_PROP_EXT {
/*   222 */    unsigned short First;
/*   223 */    unsigned short Last;
/*   224 */    const GUI_CHARINFO_EXT * paCharInfo;
/*   225 */    const struct GUI_FONT_PROP_EXT * pNext;
/*   226 */ } GUI_FONT_PROP_EXT;
/*   228 */ typedef struct {
/*   229 */    const unsigned char * pData;
/*   230 */    const unsigned char * pTransData;
/*   231 */    const GUI_FONT_TRANSINFO * pTrans;
/*   232 */    unsigned short FirstChar;
/*   233 */    unsigned short LastChar;
/*   234 */    unsigned char XSize;
/*   235 */    unsigned char XDist;
/*   236 */    unsigned char BytesPerLine;
/*   237 */ } GUI_FONT_MONO;
/*   246 */ typedef struct {
/*   247 */    unsigned short Flags;
/*   248 */    unsigned char Baseline;
/*   249 */    unsigned char LHeight;
/*   250 */    unsigned char CHeight;
/*   251 */ } GUI_FONTINFO;
/*   264 */ typedef unsigned short tGUI_GetCharCode (const char * s);
/*   265 */ typedef int tGUI_GetCharSize (const char * s);
/*   266 */ typedef int tGUI_CalcSizeOfChar(unsigned short Char);
/*   267 */ typedef int tGUI_Encode (char * s, unsigned short Char);
/*   269 */ typedef struct {
/*   270 */    tGUI_GetCharCode * pfGetCharCode;
/*   271 */    tGUI_GetCharSize * pfGetCharSize;
/*   272 */    tGUI_CalcSizeOfChar * pfCalcSizeOfChar;
/*   273 */    tGUI_Encode * pfEncode;
/*   274 */ } GUI_UC_ENC_APILIST;
/*   280 */ typedef int tGUI_GetLineDistX(const char * s, int Len);
/*   281 */ typedef int tGUI_GetLineLen (const char * s, int MaxLen);
/*   282 */ typedef void tGL_DispLine (const char * s, int Len);
/*   284 */ typedef struct {
/*   285 */    tGUI_GetLineDistX * pfGetLineDistX;
/*   286 */    tGUI_GetLineLen * pfGetLineLen;
/*   287 */    tGL_DispLine * pfDispLine;
/*   288 */ } tGUI_ENC_APIList;
/*   290 */ extern const tGUI_ENC_APIList GUI_ENC_APIList_SJIS;
/*   291 */ extern const tGUI_ENC_APIList GUI_ENC_APIList_EXT;
/*   297 */ typedef struct GUI_FONT GUI_FONT;
/*   299 */ typedef void GUI_DISPCHAR (unsigned short c);
/*   300 */ typedef int GUI_GETCHARDISTX(unsigned short c, int * pSizeX);
/*   301 */ typedef void GUI_GETFONTINFO (const GUI_FONT * pFont, GUI_FONTINFO * pfi);
/*   302 */ typedef char GUI_ISINFONT (const GUI_FONT * pFont, unsigned short c);
/*   303 */ typedef int GUI_GETCHARINFO (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   316 */ void GUIMONO_DispChar (unsigned short c); int GUIMONO_GetCharDistX(unsigned short c, int * pSizeX); void GUIMONO_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIMONO_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIMONO_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   317 */ void GUIPROP_DispChar (unsigned short c); int GUIPROP_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   318 */ void GUIPROP_EXT_DispChar (unsigned short c); int GUIPROP_EXT_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_EXT_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_EXT_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_EXT_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   319 */ void GUIPROP_FRM_DispChar (unsigned short c); int GUIPROP_FRM_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_FRM_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_FRM_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_FRM_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   320 */ void GUIPROPAA_DispChar (unsigned short c); int GUIPROPAA_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROPAA_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROPAA_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROPAA_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   321 */ void GUIPROP_AA2_DispChar (unsigned short c); int GUIPROP_AA2_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_AA2_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA2_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_AA2_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   322 */ void GUIPROP_AA2_EXT_DispChar (unsigned short c); int GUIPROP_AA2_EXT_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_AA2_EXT_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA2_EXT_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_AA2_EXT_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   323 */ void GUIPROP_AA4_DispChar (unsigned short c); int GUIPROP_AA4_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_AA4_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA4_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_AA4_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   324 */ void GUIPROP_AA4_EXT_DispChar (unsigned short c); int GUIPROP_AA4_EXT_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_AA4_EXT_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA4_EXT_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_AA4_EXT_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   438 */ struct GUI_FONT {
/*   439 */    GUI_DISPCHAR * pfDispChar;
/*   440 */    GUI_GETCHARDISTX * pfGetCharDistX;
/*   441 */    GUI_GETFONTINFO * pfGetFontInfo;
/*   442 */    GUI_ISINFONT * pfIsInFont;
/*   443 */    GUI_GETCHARINFO * pfGetCharInfo;
/*   444 */    const tGUI_ENC_APIList* pafEncode;
/*   445 */    unsigned char YSize;
/*   446 */    unsigned char YDist;
/*   447 */    unsigned char XMag;
/*   448 */    unsigned char YMag;
/*   449 */    union {
/*   450 */       const void * pFontData;
/*   451 */       const GUI_FONT_MONO * pMono;
/*   452 */       const GUI_FONT_PROP * pProp;
/*   453 */       const GUI_FONT_PROP_EXT * pPropExt;
/*   454 */    } p;
/*   455 */    unsigned char Baseline;
/*   456 */    unsigned char LHeight;
/*   457 */    unsigned char CHeight;
/*   458 */ };
/*   464 */ typedef void GUI_CALLBACK_VOID_U8_P(unsigned char Data, void * p);
/*   470 */ typedef struct {
/*   471 */    unsigned long ID;
/*   472 */    unsigned short YSize;
/*   473 */    unsigned short YDist;
/*   474 */    unsigned short Baseline;
/*   475 */    unsigned short LHeight;
/*   476 */    unsigned short CHeight;
/*   477 */    unsigned short NumAreas;
/*   478 */ } GUI_SI_FONT;
/*   480 */ typedef struct {
/*   481 */    unsigned short First;
/*   482 */    unsigned short Last;
/*   483 */ } GUI_SIF_CHAR_AREA;
/*   485 */ typedef struct {
/*   486 */    unsigned short XSize;
/*   487 */    unsigned short XDist;
/*   488 */    unsigned short BytesPerLine;
/*   489 */    unsigned short Dummy;
/*   490 */    unsigned long OffData;
/*   491 */ } GUI_SIF_CHARINFO;
/*   493 */ typedef struct {
/*   494 */    unsigned short XSize;
/*   495 */    unsigned short YSize;
/*   496 */    signed short XOff;
/*   497 */    signed short YOff;
/*   498 */    unsigned short XDist;
/*   499 */    unsigned short Dummy;
/*   500 */    unsigned long OffData;
/*   501 */ } GUI_SIF_CHARINFO_EXT;
/*   503 */ typedef struct tGUI_SIF_APIList_struct {
/*   504 */    GUI_DISPCHAR * pfDispChar;
/*   505 */    GUI_GETCHARDISTX * pfGetCharDistX;
/*   506 */    GUI_GETFONTINFO * pfGetFontInfo;
/*   507 */    GUI_ISINFONT * pfIsInFont;
/*   508 */    GUI_GETCHARINFO * pfGetCharInfo;
/*   509 */    const tGUI_ENC_APIList* pafEncode;
/*   510 */ } tGUI_SIF_APIList;
/*   525 */ typedef int GUI_XBF_GET_DATA_FUNC(unsigned long Off, unsigned short NumBytes, void * pVoid, void * pBuffer);
/*   527 */ typedef struct {
/*   528 */    unsigned short First;
/*   529 */    unsigned short Last;
/*   530 */    void * pVoid;
/*   531 */    GUI_XBF_GET_DATA_FUNC * pfGetData;
/*   532 */ } GUI_XBF_DATA;
/*   534 */ typedef struct tGUI_XBF_APIList_struct {
/*   535 */    GUI_DISPCHAR * pfDispChar;
/*   536 */    GUI_GETCHARDISTX * pfGetCharDistX;
/*   537 */    GUI_GETFONTINFO * pfGetFontInfo;
/*   538 */    GUI_ISINFONT * pfIsInFont;
/*   539 */    GUI_GETCHARINFO * pfGetCharInfo;
/*   540 */    const tGUI_ENC_APIList* pafEncode;
/*   541 */ } tGUI_XBF_APIList;
/*   554 */ typedef struct {
/*   555 */    const void * pData;
/*   556 */    unsigned long NumBytes;
/*   557 */ } GUI_TTF_DATA;
/*   559 */ typedef struct {
/*   560 */    GUI_TTF_DATA * pTTF;
/*   561 */    unsigned long aImageTypeBuffer[4];
/*   562 */    int PixelHeight;
/*   566 */    int FaceIndex;
/*   569 */ } GUI_TTF_CS;
/*   575 */ typedef void (* GUI_SIGNAL_EVENT_FUNC) (void);
/*   576 */ typedef void (* GUI_WAIT_EVENT_FUNC) (void);
/*   577 */ typedef void (* GUI_WAIT_EVENT_TIMED_FUNC)(int Period);
/*   587 */ typedef signed long GUI_HWIN;
/*   588 */ typedef signed long GUI_HSPRITE;
/*   598 */ typedef struct {
/*   599 */    signed long x;
/*   600 */    signed long y;
/*   601 */    unsigned long Id;
/*   602 */    unsigned short Flags;
/*   603 */ } GUI_MTOUCH_INPUT;
/*   605 */ typedef struct {
/*   606 */    int LayerIndex;
/*   607 */    unsigned NumPoints;
/*   608 */    int TimeStamp;
/*   609 */    signed long hInput;
/*   610 */ } GUI_MTOUCH_EVENT;
/*   615 */ typedef struct {
/*   616 */    unsigned char Layer;
/*   617 */    unsigned char NumPoints;
/*   618 */    signed short ax[5];
/*   619 */    signed short ay[5];
/*   620 */    unsigned short aId[5];
/*   621 */    unsigned char aFlags[5];
/*   622 */ } GUI_MTOUCH_STATE;
/*   624 */ typedef void (* T_GUI_MTOUCH_STOREEVENT)(GUI_MTOUCH_EVENT *, GUI_MTOUCH_INPUT * pInput);
/*   630 */ typedef struct {
/*   634 */    void (* pfWrite8_A0) (unsigned char Data);
/*   635 */    void (* pfWrite8_A1) (unsigned char Data);
/*   636 */    void (* pfWriteM8_A0) (unsigned char * pData, int NumItems);
/*   637 */    void (* pfWriteM8_A1) (unsigned char * pData, int NumItems);
/*   638 */    unsigned char (* pfRead8_A0) (void);
/*   639 */    unsigned char (* pfRead8_A1) (void);
/*   640 */    void (* pfReadM8_A0) (unsigned char * pData, int NumItems);
/*   641 */    void (* pfReadM8_A1) (unsigned char * pData, int NumItems);
/*   645 */    void (* pfWrite16_A0) (unsigned short Data);
/*   646 */    void (* pfWrite16_A1) (unsigned short Data);
/*   647 */    void (* pfWriteM16_A0)(unsigned short * pData, int NumItems);
/*   648 */    void (* pfWriteM16_A1)(unsigned short * pData, int NumItems);
/*   649 */    unsigned short (* pfRead16_A0) (void);
/*   650 */    unsigned short (* pfRead16_A1) (void);
/*   651 */    void (* pfReadM16_A0) (unsigned short * pData, int NumItems);
/*   652 */    void (* pfReadM16_A1) (unsigned short * pData, int NumItems);
/*   656 */    void (* pfWrite32_A0) (unsigned long Data);
/*   657 */    void (* pfWrite32_A1) (unsigned long Data);
/*   658 */    void (* pfWriteM32_A0)(unsigned long * pData, int NumItems);
/*   659 */    void (* pfWriteM32_A1)(unsigned long * pData, int NumItems);
/*   660 */    unsigned long (* pfRead32_A0) (void);
/*   661 */    unsigned long (* pfRead32_A1) (void);
/*   662 */    void (* pfReadM32_A0) (unsigned long * pData, int NumItems);
/*   663 */    void (* pfReadM32_A1) (unsigned long * pData, int NumItems);
/*   667 */    void (* pfSetCS) (unsigned char NotActive);
/*   671 */    void (* pfFlushBuffer)(void);
/*   672 */ } GUI_PORT_API;
/*   678 */ typedef int (* GUI_tSend) (const unsigned char * pData, int len, void * p);
/*   679 */ typedef int (* GUI_tRecv) ( unsigned char * pData, int len, void * p);
/*   685 */ typedef void * (* GUI_tMalloc)(unsigned int);
/*   686 */ typedef void (* GUI_tFree) (void *);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/GUI.h
 */
/*    87 */ typedef struct GUI_CONTEXT GUI_CONTEXT;
/*    95 */ void GUI_Lock(void);
/*    96 */ void GUI_Unlock(void);
/*    97 */ void GUITASK_Init(void);
/*    98 */ void GUITASK_CopyContext(void);
/*    99 */ void GUITASK_SetMaxTask(int MaxTask);
/*   100 */ int GUITASK_GetMaxTask(void);
/*   101 */ GUI_CONTEXT * GUITASK_GetpContext(int Index);
/*   112 */ struct GUI_DEVICE_API {
/*   116 */    int DeviceClassIndex;
/*   120 */    void (* pfDrawBitmap )(GUI_DEVICE * pDevice, int x0, int y0, int xsize, int ysize, int BitsPerPixel, int BytesPerLine, const unsigned char * pData, int Diff, const unsigned long * pTrans);
/*   121 */    void (* pfDrawHLine )(GUI_DEVICE * pDevice, int x0, int y0, int x1);
/*   122 */    void (* pfDrawVLine )(GUI_DEVICE * pDevice, int x , int y0, int y1);
/*   123 */    void (* pfFillRect )(GUI_DEVICE * pDevice, int x0, int y0, int x1, int y1);
/*   124 */    unsigned long (* pfGetPixelIndex)(GUI_DEVICE * pDevice, int x, int y);
/*   125 */    void (* pfSetPixelIndex)(GUI_DEVICE * pDevice, int x, int y, unsigned long ColorIndex);
/*   126 */    void (* pfXorPixel )(GUI_DEVICE * pDevice, int x, int y);
/*   130 */    void (* pfSetOrg )(GUI_DEVICE * pDevice, int x, int y);
/*   134 */    void (*(* pfGetDevFunc) (GUI_DEVICE ** ppDevice, int Index))(void);
/*   135 */    signed long (* pfGetDevProp )(GUI_DEVICE * pDevice, int Index);
/*   136 */    void *(* pfGetDevData )(GUI_DEVICE * pDevice, int Index);
/*   137 */    void (* pfGetRect )(GUI_DEVICE * pDevice, LCD_RECT * pRect);
/*   138 */ };
/*   144 */ typedef enum {
/*   145 */    DEVICE_CLASS_DRIVER = 0,
/*   146 */    DEVICE_CLASS_DRIVER_MODIFIER,
/*   147 */    DEVICE_CLASS_VNC,
/*   148 */    DEVICE_CLASS_SPRITE,
/*   149 */    DEVICE_CLASS_MEMDEV,
/*   150 */    DEVICE_CLASS_ALPHA,
/*   151 */    DEVICE_CLASS_AUTOALPHA,
/*   152 */    DEVICE_CLASS_MEASDEV
/*   153 */ } DEVICE_CLASS;
/*   164 */ extern const GUI_DEVICE_API GUIDRV_Win_API;
/*   165 */ extern const GUI_DEVICE_API GUIDRV_Template_API;
/*   182 */ struct GUI_DEVICE {
/*   186 */    GUI_DEVICE * pNext;
/*   187 */    GUI_DEVICE * pPrev;
/*   191 */    union {
/*   192 */       signed long hContext;
/*   193 */       void * pContext;
/*   194 */    } u;
/*   198 */    const GUI_DEVICE_API * pDeviceAPI;
/*   199 */    const LCD_API_COLOR_CONV * pColorConvAPI;
/*   200 */    unsigned short Flags;
/*   201 */    int LayerIndex;
/*   202 */ };
/*   204 */ extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_1;
/*   205 */ extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_8;
/*   206 */ extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_16;
/*   207 */ extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_32;
/*   216 */ typedef union {
/*   217 */    unsigned char aColorIndex8[2];
/*   218 */    unsigned short aColorIndex16[2];
/*   219 */    unsigned long aColorIndex32[2];
/*   220 */ } LCD_COLORINDEX_UNION;
/*   222 */ struct GUI_CONTEXT {
/*   226 */    LCD_COLORINDEX_UNION uLCD;
/*   227 */    LCD_RECT ClipRect;
/*   228 */    unsigned char DrawMode;
/*   229 */    unsigned char SelLayer;
/*   230 */    unsigned char TextStyle;
/*   234 */    GUI_RECT * pClipRect_HL;
/*   235 */    unsigned char PenSize;
/*   236 */    unsigned char PenShape;
/*   237 */    unsigned char LineStyle;
/*   241 */    const GUI_FONT * pAFont;
/*   242 */    signed short LBorder;
/*   243 */    signed short DispPosX, DispPosY;
/*   244 */    signed short DrawPosX, DrawPosY;
/*   245 */    signed short TextMode, TextAlign;
/*   246 */    GUI_COLOR Color, BkColor;
/*   250 */    unsigned long * LCD_pBkColorIndex;
/*   251 */    unsigned long * LCD_pColorIndex;
/*   252 */    unsigned long * LCD_pAColorIndex;
/*   257 */    const GUI_RECT * WM__pUserClipRect;
/*   258 */    GUI_HWIN hAWin;
/*   259 */    int xOff, yOff;
/*   260 */    unsigned char WM_IsActive;
/*   265 */    GUI_DEVICE * apDriver[2];
/*   269 */    signed long hDevData;
/*   273 */    const tLCD_HL_APIList * pLCD_HL;
/*   274 */    unsigned char AA_Factor;
/*   275 */    unsigned char AA_HiResEnable;
/*   276 */    void (* AA_pfSetPixelAA)(int x, int y, unsigned char Intens);
/*   277 */ };
/*   290 */ GUI_DEVICE * GUI_DEVICE_Create (const GUI_DEVICE_API * pDeviceAPI, const LCD_API_COLOR_CONV * pColorConvAPI, unsigned short Flags, int LayerIndex);
/*   291 */ GUI_DEVICE * GUI_DEVICE_CreateAndLink(const GUI_DEVICE_API * pDeviceAPI, const LCD_API_COLOR_CONV * pColorConvAPI, unsigned short Flags, int LayerIndex);
/*   292 */ void GUI_DEVICE_Delete (GUI_DEVICE * pDevice);
/*   293 */ int GUI_DEVICE_Link (GUI_DEVICE * pDevice);
/*   294 */ void GUI_DEVICE_Unlink (GUI_DEVICE * pDevice);
/*   295 */ GUI_DEVICE * GUI_DEVICE__GetpDriver (int LayerIndex);
/*   296 */ GUI_DEVICE * GUI_DEVICE__GetpDevice (int LayerIndex, int DeviceClass);
/*   298 */ GUI_DEVICE * GUI_DEVICE_UnlinkTaskDevices(void);
/*   299 */ void GUI_DEVICE_LinkDevices (GUI_DEVICE * pDevice);
/*   305 */ typedef struct {
/*   306 */    void * pData;
/*   307 */    int x0, y0;
/*   308 */    int xSize, ySize;
/*   309 */    int LineOff;
/*   310 */    int BytesPerPixel;
/*   311 */    int IsDirty;
/*   312 */ } GUI_DIRTYDEVICE_INFO;
/*   314 */ int GUI_DIRTYDEVICE_Create (void);
/*   315 */ int GUI_DIRTYDEVICE_CreateEx (int LayerIndex);
/*   316 */ int GUI_DIRTYDEVICE_CreateExInfo(GUI_DIRTYDEVICE_INFO * pInfo, int LayerIndex);
/*   317 */ int GUI_DIRTYDEVICE_Delete (void);
/*   318 */ int GUI_DIRTYDEVICE_DeleteEx (int LayerIndex);
/*   319 */ int GUI_DIRTYDEVICE_Fetch (GUI_DIRTYDEVICE_INFO * pInfo);
/*   320 */ int GUI_DIRTYDEVICE_FetchEx (GUI_DIRTYDEVICE_INFO * pInfo, int LayerIndex);
/*   326 */ int GUI_GCACHE_4_Create(const LCD_API_COLOR_CONV * pColorConvAPI);
/*   327 */ int GUI_GCACHE_4_CreateEx(int LayerIndex, const LCD_API_COLOR_CONV * pColorConvAPI);
/*   333 */ void GUI_DCACHE_SetClearCacheHook(void (* pFunc)(unsigned long LayerMask));
/*   334 */ void GUI_DCACHE_Clear (unsigned long LayerMask);
/*   336 */ extern void (* GUI_DCACHE__pfClearCacheHook)(unsigned long LayerMask);
/*   342 */ typedef struct {
/*   343 */    int xPos;
/*   344 */    int yPos;
/*   345 */    int xSize;
/*   346 */    int ySize;
/*   347 */    int Visible;
/*   348 */ } GUI_SOFTLAYER_CONFIG;
/*   350 */ int GUI_SOFTLAYER_Enable (GUI_SOFTLAYER_CONFIG * pConfig, int NumLayers, GUI_COLOR CompositeColor);
/*   351 */ int GUI_SOFTLAYER_Refresh (void);
/*   352 */ void GUI_SOFTLAYER_SetCompositeColor(unsigned long Color);
/*   353 */ int GUI_SOFTLAYER_MULTIBUF_Enable (int OnOff);
/*   359 */ void GUI_Exit (void);
/*   360 */ GUI_COLOR GUI_GetDefaultBkColor(void);
/*   361 */ GUI_COLOR GUI_GetDefaultColor (void);
/*   362 */ const GUI_FONT * GUI_GetDefaultFont (void);
/*   363 */ int GUI_GetScreenSizeX (void);
/*   364 */ int GUI_GetScreenSizeY (void);
/*   365 */ const char * GUI_GetVersionString (void);
/*   366 */ int GUI_Init (void);
/*   367 */ int GUI_IsInitialized (void);
/*   368 */ void GUI_SetAfterInitHook (void (* pFunc)(void));
/*   369 */ void GUI_RestoreContext (const GUI_CONTEXT * pContext);
/*   370 */ void GUI_SaveContext_W (GUI_CONTEXT * pContext);
/*   371 */ const GUI_RECT * GUI_SetClipRect (const GUI_RECT * pRect);
/*   372 */ void GUI_SetControlHook (void (* pFunc)(int LayerIndex, int Cmd));
/*   373 */ void GUI_SetDefault (void);
/*   374 */ void GUI_SetDefaultBkColor(GUI_COLOR Color);
/*   375 */ void GUI_SetDefaultColor (GUI_COLOR Color);
/*   376 */ void GUI_SetDefaultFont (const GUI_FONT * pFont);
/*   377 */ GUI_DRAWMODE GUI_SetDrawMode (GUI_DRAWMODE dm);
/*   378 */ void GUI_SetScreenSizeX (int xSize);
/*   379 */ void GUI_SetScreenSizeY (int ySize);
/*   380 */ void GUI_SetRefreshHook (void (* pFunc)(void));
/*   381 */ void MainTask (void);
/*   389 */ void GUI_SetpfMemset(void * (* pFunc)(void * pDest, int c, unsigned Cnt));
/*   390 */ void GUI_SetpfMemcpy(void * (* pFunc)(void * pDest, const void * pSrc, unsigned Cnt));
/*   396 */ int GUI_RectsIntersect(const GUI_RECT * pr0, const GUI_RECT * pr1);
/*   397 */ void GUI_MoveRect (GUI_RECT * pRect, int x, int y);
/*   398 */ void GUI_MergeRect (GUI_RECT * pDest, const GUI_RECT * pr0, const GUI_RECT * pr1);
/*   399 */ int GUI__IntersectRects(GUI_RECT * pDest, const GUI_RECT * pr0, const GUI_RECT * pr1);
/*   400 */ void GUI__IntersectRect (GUI_RECT * pDest, const GUI_RECT * pr0);
/*   401 */ void GUI__ReduceRect (GUI_RECT * pDest, const GUI_RECT * pRect, int Dist);
/*   407 */ signed long GUI__ATan2(signed long x, signed long y, signed long * ph);
/*   408 */ signed long GUI__ASinHQ(signed long SinHQ);
/*   409 */ int GUI__CompactPixelIndices (unsigned long * pBuffer, int NumPixels, int BitsPerPixel);
/*   410 */ int GUI__CompactPixelIndicesEx(unsigned long * pBuffer, int NumPixels, int BitsPerPixel, const LCD_API_COLOR_CONV * pColorConvAPI);
/*   411 */ int GUI__ConvertColor2Index (unsigned long * pBuffer, int NumPixels, int BitsPerPixel, const LCD_API_COLOR_CONV * pColorConvAPI, void * pResult);
/*   412 */ void GUI__Config(void);
/*   413 */ signed long GUI__CosHQ(signed long Ang1000);
/*   414 */ int GUI__DivideRound (int a, int b);
/*   415 */ signed long GUI__DivideRound32 (signed long a, signed long b);
/*   416 */ void GUI__ExpandPixelIndices (void * pBuffer, int NumPixels, int BitsPerPixel);
/*   417 */ void GUI__ExpandPixelIndicesEx (void * pBuffer, int NumPixels, int BitsPerPixel, const LCD_API_COLOR_CONV * pColorConvAPI);
/*   418 */ int GUI__SetText(signed long * phText, const char * s);
/*   419 */ signed long GUI__SinHQ(signed long Ang1000);
/*   420 */ signed long GUI__sqrt32(signed long Square);
/*   421 */ void GUI__DrawTwinArc2(int xl, int xr, int y0, int r, GUI_COLOR ColorR0, GUI_COLOR ColorR1, GUI_COLOR ColorFill);
/*   422 */ void GUI__DrawTwinArc4(int x0, int y0, int x1, int y1, int r, GUI_COLOR ColorR0, GUI_COLOR ColorR1, GUI_COLOR ColorFill);
/*   423 */ void GUI__FillTrippleArc(int x0, int y0, int Size, GUI_COLOR ColorR0, GUI_COLOR ColorR1, GUI_COLOR ColorR2, GUI_COLOR ColorFill);
/*   424 */ void GUI__RegisterExit(GUI_REGISTER_EXIT * pRegisterExit);
/*   430 */ void * GUI__memcpy(void * pDest, const void * pSrc, unsigned NumBytes);
/*   431 */ void * GUI__memset(void * pDest, int c, unsigned Cnt);
/*   437 */ GUI_COLOR GUI_GetBkColor (void);
/*   438 */ int GUI_GetBkColorIndex(void);
/*   439 */ GUI_COLOR GUI_GetColor (void);
/*   440 */ int GUI_GetColorIndex (void);
/*   441 */ unsigned char GUI_GetLineStyle (void);
/*   442 */ unsigned char GUI_GetPenSize (void);
/*   443 */ unsigned char GUI_GetPenShape (void);
/*   444 */ unsigned GUI_GetPixelIndex (int x, int y);
/*   446 */ void GUI_SetBkColor (GUI_COLOR);
/*   447 */ void GUI_SetColor (GUI_COLOR);
/*   448 */ void GUI_SetBkColorIndex(int Index);
/*   449 */ void GUI_SetColorIndex(int Index);
/*   451 */ unsigned char GUI_SetPenSize (unsigned char Size);
/*   452 */ unsigned char GUI_SetPenShape (unsigned char Shape);
/*   453 */ unsigned char GUI_SetLineStyle (unsigned char Style);
/*   456 */ char GUI_GetDecChar(void);
/*   457 */ char GUI_SetDecChar(char c);
/*   463 */ int GUI_Color2Index(GUI_COLOR color);
/*   464 */ GUI_COLOR GUI_Color2VisColor(GUI_COLOR color);
/*   465 */ char GUI_ColorIsAvailable(GUI_COLOR color);
/*   466 */ GUI_COLOR GUI_Index2Color(int Index);
/*   467 */ unsigned long GUI_CalcColorDist (GUI_COLOR Color0, GUI_COLOR Color1);
/*   468 */ unsigned long GUI_CalcVisColorError(GUI_COLOR color);
/*   474 */ void GUI_SetOnErrorFunc(void (* pFunc)(const char * s));
/*   480 */ void GUI_Log (const char * s);
/*   481 */ void GUI_Log1 (const char * s, signed long p0);
/*   482 */ void GUI_Log2 (const char * s, signed long p0, signed long p1);
/*   483 */ void GUI_Log3 (const char * s, signed long p0, signed long p1, signed long p2);
/*   484 */ void GUI_Log4 (const char * s, signed long p0, signed long p1, signed long p2,signed long p3);
/*   485 */ void GUI_Warn (const char * s);
/*   486 */ void GUI_Warn1 (const char * s, signed long p0);
/*   487 */ void GUI_Warn2 (const char * s, signed long p0, signed long p1);
/*   488 */ void GUI_Warn3 (const char * s, signed long p0, signed long p1, signed long p2);
/*   489 */ void GUI_Warn4 (const char * s, signed long p0, signed long p1, signed long p2, signed long p3);
/*   490 */ void GUI_ErrorOut (const char * s);
/*   491 */ void GUI_ErrorOut1(const char * s, signed long p0);
/*   492 */ void GUI_ErrorOut2(const char * s, signed long p0, signed long p1);
/*   493 */ void GUI_ErrorOut3(const char * s, signed long p0, signed long p1, signed long p2);
/*   494 */ void GUI_ErrorOut4(const char * s, signed long p0, signed long p1, signed long p2, signed long p3);
/*   500 */ void GUI_Clear (void);
/*   501 */ void GUI_ClearRect (int x0, int y0, int x1, int y1);
/*   502 */ void GUI_ClearRectEx (const GUI_RECT * pRect);
/*   503 */ void GUI_CopyRect (int x0, int y0, int x1, int y1, int dx, int dy);
/*   504 */ void GUI_DrawArc (int x0, int y0, int rx, int ry, int a0, int a1);
/*   505 */ void GUI_DrawBitmap (const GUI_BITMAP * pBM, int x0, int y0);
/*   506 */ void GUI_DrawBitmapMag (const GUI_BITMAP * pBM, int x0, int y0, int XMul, int YMul);
/*   507 */ void GUI_DrawBitmapEx (const GUI_BITMAP * pBM, int x0, int y0, int xCenter, int yCenter, int xMag, int yMag);
/*   508 */ void GUI_DrawBitmapExp (int x0, int y0, int XSize, int YSize, int XMul, int YMul, int BitsPerPixel, int BytesPerLine, const unsigned char * pData, const GUI_LOGPALETTE * pPal);
/*   509 */ void GUI_DrawBitmapHWAlpha(const GUI_BITMAP * pBM, int x0, int y0);
/*   510 */ void GUI_DrawCircle (int x0, int y0, int r);
/*   511 */ void GUI_DrawEllipse (int x0, int y0, int rx, int ry);
/*   512 */ void GUI_DrawGradientH (int x0, int y0, int x1, int y1, GUI_COLOR Color0, GUI_COLOR Color1);
/*   513 */ void GUI_DrawGradientV (int x0, int y0, int x1, int y1, GUI_COLOR Color0, GUI_COLOR Color1);
/*   514 */ void GUI_DrawGradientRoundedH(int x0, int y0, int x1, int y1, int rd, GUI_COLOR Color0, GUI_COLOR Color1);
/*   515 */ void GUI_DrawGradientRoundedV(int x0, int y0, int x1, int y1, int rd, GUI_COLOR Color0, GUI_COLOR Color1);
/*   516 */ void GUI_DrawGraph (signed short * pay, int NumPoints, int x0, int y0);
/*   517 */ void GUI_DrawGraphEx (signed short * pay, int NumPoints, int x0, int y0, int Numerator, int Denominator, int MirrorX);
/*   518 */ void GUI_DrawHLine (int y0, int x0, int x1);
/*   519 */ void GUI_DrawLine (int x0, int y0, int x1, int y1);
/*   520 */ void GUI_DrawLineRel (int dx, int dy);
/*   521 */ void GUI_DrawLineTo (int x, int y);
/*   522 */ void GUI_DrawPie (int x0, int y0, int r, int a0, int a1, int Type);
/*   523 */ void GUI_DrawPixel (int x, int y);
/*   524 */ void GUI_DrawPoint (int x, int y);
/*   525 */ void GUI_DrawPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
/*   526 */ void GUI_DrawPolyLine (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
/*   527 */ void GUI_DrawFocusRect (const GUI_RECT * pRect, int Dist);
/*   528 */ void GUI_DrawRect (int x0, int y0, int x1, int y1);
/*   529 */ void GUI_DrawRectEx (const GUI_RECT * pRect);
/*   530 */ void GUI_DrawRoundedFrame (int x0, int y0, int x1, int y1, int r, int w);
/*   531 */ void GUI_DrawRoundedRect (int x0, int y0, int x1, int y1, int r);
/*   532 */ void GUI_DrawVLine (int x0, int y0, int y1);
/*   533 */ void GUI_FillCircle (int x0, int y0, int r);
/*   534 */ void GUI_FillEllipse (int x0, int y0, int rx, int ry);
/*   535 */ void GUI_FillPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
/*   536 */ void GUI_FillRect (int x0, int y0, int x1, int y1);
/*   537 */ void GUI_FillRectEx (const GUI_RECT * pRect);
/*   538 */ void GUI_FillRoundedFrame (int x0, int y0, int x1, int y1, int r, int w);
/*   539 */ void GUI_FillRoundedRect (int x0, int y0, int x1, int y1, int r);
/*   540 */ void GUI_FillRoundedRectB (int x0, int y0, int x1, int y1, int r);
/*   541 */ void GUI_FillRoundedRectT (int x0, int y0, int x1, int y1, int r);
/*   542 */ void GUI_GetClientRect (GUI_RECT * pRect);
/*   543 */ void GUI_InvertRect (int x0, int y0, int x1, int y1);
/*   544 */ void GUI_MoveRel (int dx, int dy);
/*   545 */ void GUI_MoveTo (int x, int y);
/*   546 */ void GUI_SetAlphaMask8888 (unsigned long OrMask, unsigned long AndMask);
/*   552 */ typedef int GUI_GET_DATA_FUNC(void * p, const unsigned char ** ppData, unsigned NumBytes, unsigned long Off);
/*   558 */ int GUI_GIF_Draw (const void * pGIF, unsigned long NumBytes, int x0, int y0);
/*   559 */ int GUI_GIF_DrawEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
/*   560 */ int GUI_GIF_DrawSub (const void * pGIF, unsigned long NumBytes, int x0, int y0, int Index);
/*   561 */ int GUI_GIF_DrawSubEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Index);
/*   562 */ int GUI_GIF_DrawSubScaled (const void * pGIF, unsigned long NumBytes, int x0, int y0, int Index, int Num, int Denom);
/*   563 */ int GUI_GIF_DrawSubScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Index, int Num, int Denom);
/*   564 */ int GUI_GIF_GetComment (const void * pGIF, unsigned long NumBytes, unsigned char * pBuffer, int MaxSize, int Index);
/*   565 */ int GUI_GIF_GetCommentEx (GUI_GET_DATA_FUNC * pfGetData, void * p, unsigned char * pBuffer, int MaxSize, int Index);
/*   566 */ int GUI_GIF_GetImageInfo (const void * pGIF, unsigned long NumBytes, GUI_GIF_IMAGE_INFO * pInfo, int Index);
/*   567 */ int GUI_GIF_GetImageInfoEx (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_GIF_IMAGE_INFO * pInfo, int Index);
/*   568 */ int GUI_GIF_GetInfo (const void * pGIF, unsigned long NumBytes, GUI_GIF_INFO * pInfo);
/*   569 */ int GUI_GIF_GetInfoEx (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_GIF_INFO * pInfo);
/*   570 */ int GUI_GIF_GetXSize (const void * pGIF);
/*   571 */ int GUI_GIF_GetXSizeEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
/*   572 */ int GUI_GIF_GetYSize (const void * pGIF);
/*   573 */ int GUI_GIF_GetYSizeEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
/*   574 */ int GUI_GIF_SetFillTrans (int OnOff);
/*   580 */ int GUI_BMP_Draw (const void * pFileData, int x0, int y0);
/*   581 */ int GUI_BMP_DrawEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
/*   582 */ int GUI_BMP_DrawScaled (const void * pFileData, int x0, int y0, int Num, int Denom);
/*   583 */ int GUI_BMP_DrawScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Num, int Denom);
/*   584 */ int GUI_BMP_GetXSize (const void * pFileData);
/*   585 */ int GUI_BMP_GetXSizeEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
/*   586 */ int GUI_BMP_GetYSize (const void * pFileData);
/*   587 */ int GUI_BMP_GetYSizeEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
/*   588 */ void GUI_BMP_EnableAlpha (void);
/*   589 */ void GUI_BMP_DisableAlpha(void);
/*   595 */ int GUI_PNG_Draw (const void * pFileData, int DataSize, int x0, int y0);
/*   596 */ int GUI_PNG_DrawEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
/*   597 */ int GUI_PNG_GetXSize (const void * pFileData, int FileSize);
/*   598 */ int GUI_PNG_GetXSizeEx(GUI_GET_DATA_FUNC * pfGetData, void * p);
/*   599 */ int GUI_PNG_GetYSize (const void * pFileData, int FileSize);
/*   600 */ int GUI_PNG_GetYSizeEx(GUI_GET_DATA_FUNC * pfGetData, void * p);
/*   606 */ typedef struct {
/*   607 */    int XSize;
/*   608 */    int YSize;
/*   609 */ } GUI_JPEG_INFO;
/*   611 */ int GUI_JPEG_Draw (const void * pFileData, int DataSize, int x0, int y0);
/*   612 */ int GUI_JPEG_DrawEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
/*   613 */ int GUI_JPEG_DrawScaled (const void * pFileData, int DataSize, int x0, int y0, int Num, int Denom);
/*   614 */ int GUI_JPEG_DrawScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Num, int Denom);
/*   615 */ int GUI_JPEG_GetInfo (const void * pFileData, int DataSize, GUI_JPEG_INFO * pInfo);
/*   616 */ int GUI_JPEG_GetInfoEx (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_JPEG_INFO * pInfo);
/*   628 */ typedef signed long GUI_MOVIE_HANDLE;
/*   630 */ typedef void GUI_MOVIE_FUNC(GUI_MOVIE_HANDLE hMovie, int Notification, unsigned long CurrentFrame);
/*   632 */ typedef struct {
/*   633 */    int xSize;
/*   634 */    int ySize;
/*   635 */    int msPerFrame;
/*   636 */    unsigned long NumFrames;
/*   637 */ } GUI_MOVIE_INFO;
/*   639 */ GUI_MOVIE_HANDLE GUI_MOVIE_Create (const void * pFileData, unsigned long FileSize, GUI_MOVIE_FUNC * pfNotify);
/*   640 */ GUI_MOVIE_HANDLE GUI_MOVIE_CreateEx (GUI_GET_DATA_FUNC * pfGetData, void * pParam, GUI_MOVIE_FUNC * pfNotify);
/*   641 */ int GUI_MOVIE_Delete (GUI_MOVIE_HANDLE hMovie);
/*   642 */ void GUI_MOVIE_DrawFrame (GUI_MOVIE_HANDLE hMovie, int Index, int x, int y);
/*   643 */ unsigned long GUI_MOVIE_GetFrameIndex(GUI_MOVIE_HANDLE hMovie);
/*   644 */ int GUI_MOVIE_GetInfo (const void * pFileData, unsigned long FileSize, GUI_MOVIE_INFO * pInfo);
/*   645 */ int GUI_MOVIE_GetInfoEx (GUI_GET_DATA_FUNC * pfGetData, void * pParam, GUI_MOVIE_INFO * pInfo);
/*   646 */ int GUI_MOVIE_GetPos (GUI_MOVIE_HANDLE hMovie, int * pxPos, int * pyPos, int * pxSize, int * pySize);
/*   647 */ int GUI_MOVIE_GotoFrame (GUI_MOVIE_HANDLE hMovie, unsigned long Frame);
/*   648 */ int GUI_MOVIE_Pause (GUI_MOVIE_HANDLE hMovie);
/*   649 */ int GUI_MOVIE_Play (GUI_MOVIE_HANDLE hMovie);
/*   650 */ int GUI_MOVIE_SetPeriod (GUI_MOVIE_HANDLE hMovie, unsigned Period);
/*   651 */ int GUI_MOVIE_SetPos (GUI_MOVIE_HANDLE hMovie, int xPos, int yPos);
/*   652 */ int GUI_MOVIE_Show (GUI_MOVIE_HANDLE hMovie, int xPos, int yPos, int DoLoop);
/*   653 */ int GUI_MOVIE_ShowScaled (GUI_MOVIE_HANDLE hMovie, int xPos, int yPos, int num, int denom, int DoLoop);
/*   661 */ typedef struct {
/*   662 */    const GUI_BITMAP * pBitmap;
/*   663 */    int xHot;
/*   664 */    int yHot;
/*   665 */ } GUI_CURSOR;
/*   667 */ typedef struct {
/*   668 */    const GUI_BITMAP ** ppBm;
/*   669 */    int xHot;
/*   670 */    int yHot;
/*   671 */    unsigned Period;
/*   672 */    const unsigned * pPeriod;
/*   673 */    int NumItems;
/*   674 */ } GUI_CURSOR_ANIM;
/*   677 */ int GUI_CURSOR_GetState (void);
/*   678 */ int GUI_CURSOR_GetStateEx (int Layer);
/*   679 */ void GUI_CURSOR_Hide (void);
/*   680 */ void GUI_CURSOR_HideEx (int Layer);
/*   681 */ const GUI_CURSOR * GUI_CURSOR_Select (const GUI_CURSOR * pCursor);
/*   682 */ const GUI_CURSOR * GUI_CURSOR_SelectEx (const GUI_CURSOR * pCursor, int Layer);
/*   683 */ int GUI_CURSOR_SelectAnim (const GUI_CURSOR_ANIM * pCursorAnim);
/*   684 */ int GUI_CURSOR_SelectAnimEx (const GUI_CURSOR_ANIM * pCursorAnim, int LayerIndex);
/*   685 */ int GUI_CURSOR_SetBitmap (const GUI_BITMAP * pBM);
/*   686 */ int GUI_CURSOR_SetBitmapEx (const GUI_BITMAP * pBM, int Layer);
/*   687 */ void GUI_CURSOR_SetPosition (int x, int y);
/*   688 */ void GUI_CURSOR_SetPositionEx(int xNewPos, int yNewPos, int Layer);
/*   689 */ void GUI_CURSOR_Show (void);
/*   690 */ void GUI_CURSOR_ShowEx (int Layer);
/*   691 */ GUI_HSPRITE GUI_CURSOR__GetSpriteEx (int LayerIndex, int * pxPos, int * pyPos);
/*   692 */ void GUI_CURSOR__SetSpriteEx (GUI_HSPRITE hSprite, const GUI_CURSOR * pCursor, int LayerIndex);
/*   708 */ GUI_HSPRITE GUI_SPRITE__CreateEx (const GUI_BITMAP * pBM, int x, int y, int Layer, unsigned short Flags);
/*   709 */ void GUI_SPRITE__SetCallback (GUI_HSPRITE hSprite, signed long hContext, void (* pCB)(GUI_HSPRITE, int));
/*   710 */ GUI_HSPRITE GUI_SPRITE_Create (const GUI_BITMAP * pBM, int x, int y);
/*   711 */ GUI_HSPRITE GUI_SPRITE_CreateAnim (const GUI_BITMAP ** ppBm, int x, int y, unsigned Period, const unsigned * pPeriod, int NumItems);
/*   712 */ GUI_HSPRITE GUI_SPRITE_CreateEx (const GUI_BITMAP * pBM, int x, int y, int Layer);
/*   713 */ GUI_HSPRITE GUI_SPRITE_CreateExAnim (const GUI_BITMAP ** ppBm, int x, int y, unsigned Period, const unsigned * pPeriod, int NumItems, int LayerIndex);
/*   714 */ GUI_HSPRITE GUI_SPRITE_CreateHidden (const GUI_BITMAP * pBM, int x, int y);
/*   715 */ GUI_HSPRITE GUI_SPRITE_CreateHiddenEx (const GUI_BITMAP * pBM, int x, int y, int Layer);
/*   716 */ void GUI_SPRITE_Delete (GUI_HSPRITE hSprite);
/*   717 */ int GUI_SPRITE_GetState (GUI_HSPRITE hSprite);
/*   718 */ void GUI_SPRITE_Hide (GUI_HSPRITE hSprite);
/*   719 */ int GUI_SPRITE_SetBitmap (GUI_HSPRITE hSprite, const GUI_BITMAP * pBM);
/*   720 */ int GUI_SPRITE_SetBitmapAndPosition(GUI_HSPRITE hSprite, const GUI_BITMAP * pBM, int x, int y);
/*   721 */ int GUI_SPRITE_SetLoop (GUI_HSPRITE hSprite, int OnOff);
/*   722 */ void GUI_SPRITE_SetPosition (GUI_HSPRITE hSprite, int x, int y);
/*   723 */ int GUI_SPRITE_StartAnim (GUI_HSPRITE hSprite);
/*   724 */ int GUI_SPRITE_StopAnim (GUI_HSPRITE hSprite);
/*   725 */ void GUI_SPRITE_Show (GUI_HSPRITE hSprite);
/*   731 */ extern const GUI_CURSOR GUI_CursorArrowS, GUI_CursorArrowSI;
/*   732 */ extern const GUI_CURSOR GUI_CursorArrowM, GUI_CursorArrowMI;
/*   733 */ extern const GUI_CURSOR GUI_CursorArrowL, GUI_CursorArrowLI;
/*   734 */ extern const GUI_CURSOR GUI_CursorCrossS, GUI_CursorCrossSI;
/*   735 */ extern const GUI_CURSOR GUI_CursorCrossM, GUI_CursorCrossMI;
/*   736 */ extern const GUI_CURSOR GUI_CursorCrossL, GUI_CursorCrossLI;
/*   737 */ extern const GUI_CURSOR GUI_CursorHeaderM, GUI_CursorHeaderMI;
/*   738 */ extern const GUI_CURSOR_ANIM GUI_CursorAnimHourglassM;
/*   744 */ typedef enum { GUI_WRAPMODE_NONE, GUI_WRAPMODE_WORD, GUI_WRAPMODE_CHAR } GUI_WRAPMODE;
/*   750 */ void GUI_DispCEOL (void);
/*   751 */ void GUI_DispChar (unsigned short c);
/*   752 */ void GUI_DispCharAt (unsigned short c, signed short x, signed short y);
/*   753 */ void GUI_DispChars (unsigned short c, int Cnt);
/*   754 */ void GUI_DispNextLine (void);
/*   755 */ void GUI_DispString (const char * s);
/*   756 */ void GUI_DispStringAt (const char * s, int x, int y);
/*   757 */ void GUI_DispStringAtCEOL (const char * s, int x, int y);
/*   758 */ void GUI_DispStringHCenterAt (const char * s, int x, int y);
/*   759 */ void GUI__DispStringInRect (const char * s, GUI_RECT * pRect, int TextAlign, int MaxNumChars);
/*   760 */ void GUI_DispStringInRect (const char * s, GUI_RECT * pRect, int TextAlign);
/*   762 */ void GUI_DispStringInRectEx (const char * s, GUI_RECT * pRect, int TextAlign, int MaxLen, const tLCD_APIList * pLCD_Api);
/*   764 */ void GUI_DispStringInRectMax (const char * s, GUI_RECT * pRect, int TextAlign, int MaxLen);
/*   765 */ void GUI_DispStringInRectWrap (const char * s, GUI_RECT * pRect, int TextAlign, GUI_WRAPMODE WrapMode);
/*   766 */ void GUI_DispStringLen (const char * s, int Len);
/*   767 */ void GUI_GetTextExtend (GUI_RECT* pRect, const char * s, int Len);
/*   768 */ int GUI_GetYAdjust (void);
/*   769 */ int GUI_GetDispPosX (void);
/*   770 */ int GUI_GetDispPosY (void);
/*   771 */ const GUI_FONT * GUI_GetFont(void);
/*   772 */ int GUI_GetCharDistX (unsigned short c);
/*   773 */ int GUI_GetCharDistXEx (unsigned short c, int * pSizeX);
/*   774 */ int GUI_GetStringDistX (const char * s);
/*   775 */ GUI_DRAWMODE GUI_GetDrawMode (void);
/*   776 */ int GUI_GetFontDistY (void);
/*   777 */ int GUI_GetFontSizeY (void);
/*   778 */ void GUI_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi);
/*   779 */ void GUI_GetOrg (int * px, int * py);
/*   780 */ int GUI_GetYSizeOfFont (const GUI_FONT * pFont);
/*   781 */ int GUI_GetYDistOfFont (const GUI_FONT * pFont);
/*   782 */ int GUI_GetTextAlign (void);
/*   783 */ int GUI_GetTextMode (void);
/*   784 */ char GUI_IsInFont (const GUI_FONT * pFont, unsigned short c);
/*   785 */ int GUI_SetTextAlign (int Align);
/*   786 */ int GUI_SetTextMode (int Mode);
/*   787 */ char GUI_SetTextStyle (char Style);
/*   788 */ int GUI_SetLBorder (int x);
/*   789 */ const GUI_FONT * GUI_SetFont(const GUI_FONT * pNewFont);
/*   790 */ char GUI_GotoXY (int x, int y);
/*   791 */ char GUI_GotoX (int x);
/*   792 */ char GUI_GotoY (int y);
/*   793 */ int GUI_WrapGetNumLines (const char * pText, int xSize, GUI_WRAPMODE WrapMode);
/*   794 */ int GUI_WrapGetPositions (const char * pText, int xSize, GUI_WRAPMODE WrapMode, int * aPos, int NumItems);
/*   795 */ void GUI_WrapSetSeparators (const unsigned short * pSep, int NumSeps);
/*   797 */ int GUI_GetLeadingBlankCols (unsigned short c);
/*   798 */ int GUI_GetTrailingBlankCols(unsigned short c);
/*   805 */ void GUI_SIF_CreateFont(const void * pFontData, GUI_FONT * pFont, const tGUI_SIF_APIList * pFontType);
/*   806 */ void GUI_SIF_DeleteFont(GUI_FONT * pFont);
/*   812 */ int GUI_XBF_CreateFont(GUI_FONT * pFont, GUI_XBF_DATA * pXBF, const tGUI_XBF_APIList * pFontType, GUI_XBF_GET_DATA_FUNC * pfGetData, void * pVoid);
/*   813 */ void GUI_XBF_DeleteFont(GUI_FONT * pFont);
/*   819 */ int GUI_TTF_CreateFont (GUI_FONT * pFont, GUI_TTF_CS * pCS);
/*   820 */ int GUI_TTF_CreateFontAA (GUI_FONT * pFont, GUI_TTF_CS * pCS);
/*   821 */ void GUI_TTF_DestroyCache (void);
/*   822 */ void GUI_TTF_Done (void);
/*   823 */ int GUI_TTF_GetFamilyName(GUI_FONT * pFont, char * pBuffer, int NumBytes);
/*   824 */ int GUI_TTF_GetStyleName (GUI_FONT * pFont, char * pBuffer, int NumBytes);
/*   825 */ void GUI_TTF_SetCacheSize (unsigned MaxFaces, unsigned MaxSizes, unsigned long MaxBytes);
/*   831 */ int GUI_LANG_GetLang (void);
/*   832 */ int GUI_LANG_GetNumItems (int IndexLang);
/*   833 */ const char * GUI_LANG_GetText (int IndexText);
/*   834 */ int GUI_LANG_GetTextBuffered (int IndexText, char * pBuffer, int SizeOfBuffer);
/*   835 */ int GUI_LANG_GetTextBufferedEx(int IndexText, int IndexLang, char * pBuffer, int SizeOfBuffer);
/*   836 */ const char * GUI_LANG_GetTextEx (int IndexText, int IndexLang);
/*   837 */ int GUI_LANG_LoadCSV (unsigned char * pFileData, unsigned long FileSize);
/*   838 */ int GUI_LANG_LoadCSVEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
/*   839 */ int GUI_LANG_LoadText (unsigned char * pFileData, unsigned long FileSize, int IndexLang);
/*   840 */ int GUI_LANG_LoadTextEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int IndexLang);
/*   841 */ int GUI_LANG_SetLang (int IndexLang);
/*   842 */ unsigned GUI_LANG_SetMaxNumLang (unsigned MaxNumLang);
/*   843 */ unsigned short GUI_LANG_SetSep (unsigned short Sep);
/*   849 */ int GUI_UC_ConvertUC2UTF8(const unsigned short * s, int Len, char * pBuffer, int BufferSize);
/*   850 */ int GUI_UC_ConvertUTF82UC(const char * s, int Len, unsigned short * pBuffer, int BufferSize);
/*   851 */ int GUI_UC_EnableBIDI (int OnOff);
/*   852 */ int GUI_UC_Encode (char * s, unsigned short Char);
/*   853 */ int GUI_UC_GetCharSize (const char * s);
/*   854 */ unsigned short GUI_UC_GetCharCode (const char * s);
/*   855 */ void GUI_UC_SetEncodeNone (void);
/*   856 */ void GUI_UC_SetEncodeUTF8 (void);
/*   857 */ void GUI_UC_SetBaseDir (int Dir);
/*   858 */ int GUI_UC_GetBaseDir (void);
/*   860 */ void GUI_UC_DispString(const unsigned short * s);
/*   861 */ void GUI_UC2DB (unsigned short Code, unsigned char * pOut);
/*   862 */ unsigned short GUI_DB2UC (unsigned char Byte0, unsigned char Byte1);
/*   876 */ void GUI_DispBin (unsigned long v, unsigned char Len);
/*   877 */ void GUI_DispBinAt(unsigned long v, signed short x, signed short y, unsigned char Len);
/*   878 */ void GUI_DispDec (signed long v, unsigned char Len);
/*   879 */ void GUI_DispDecAt (signed long v, signed short x, signed short y, unsigned char Len);
/*   880 */ void GUI_DispDecMin(signed long v);
/*   881 */ void GUI_DispDecShift(signed long v, unsigned char Len, unsigned char Shift);
/*   882 */ void GUI_DispDecSpace(signed long v, unsigned char MaxDigits);
/*   883 */ void GUI_DispHex (unsigned long v, unsigned char Len);
/*   884 */ void GUI_DispHexAt(unsigned long v, signed short x, signed short y, unsigned char Len);
/*   885 */ void GUI_DispSDec(signed long v, unsigned char Len);
/*   886 */ void GUI_DispSDecShift(signed long v, unsigned char Len, unsigned char Shift);
/*   892 */ void GUI_DispFloat (float v, char Len);
/*   893 */ void GUI_DispFloatFix (float v, char Len, char Fract);
/*   894 */ void GUI_DispFloatMin (float v, char Fract);
/*   895 */ void GUI_DispSFloatFix(float v, char Len, char Fract);
/*   896 */ void GUI_DispSFloatMin(float v, char Fract);
/*   902 */ typedef struct {
/*   903 */    unsigned long TotalBytes;
/*   904 */    unsigned long FreeBytes;
/*   905 */    unsigned long UsedBytes;
/*   906 */    unsigned long AllocSize;
/*   907 */    unsigned long NumFixedBytes;
/*   908 */    unsigned long MaxUsedBytes;
/*   909 */ } GUI_ALLOC_INFO;
/*   911 */ signed long GUI_ALLOC_GetNumFreeBlocks(void);
/*   912 */ signed long GUI_ALLOC_GetNumFreeBytes (void);
/*   913 */ signed long GUI_ALLOC_GetNumUsedBlocks(void);
/*   914 */ signed long GUI_ALLOC_GetNumUsedBytes (void);
/*   915 */ signed long GUI_ALLOC_GetMaxUsedBytes (void);
/*   917 */ void GUI_ALLOC_GetMemInfo (GUI_ALLOC_INFO * pInfo);
/*   918 */ void GUI_ALLOC_SuppressPeak(int OnOff);
/*   920 */ signed long GUI_ALLOC_AllocInit (const void * pInitData, signed long Size);
/*   921 */ signed long GUI_ALLOC_AllocNoInit (signed long size);
/*   922 */ signed long GUI_ALLOC_AllocZero (signed long size);
/*   923 */ void GUI_ALLOC_AssignMemory (void * p, unsigned long NumBytes);
/*   924 */ void GUI_ALLOC_Free (signed long hMem);
/*   925 */ void GUI_ALLOC_FreeFixedBlock (void * p);
/*   926 */ void GUI_ALLOC_FreePtrArray (signed long * pArray, int NumElems);
/*   927 */ void GUI_ALLOC_FreePtr (signed long * phMem);
/*   928 */ void * GUI_ALLOC_GetFixedBlock (signed long Size);
/*   929 */ signed long GUI_ALLOC_GetMaxSize (void);
/*   930 */ signed long GUI_ALLOC_GetSize (signed long hMem);
/*   931 */ void * GUI_ALLOC_h2p (signed long hMem);
/*   932 */ signed long GUI_ALLOC_p2h (void * p);
/*   933 */ void GUI_ALLOC_Init (void);
/*   934 */ void GUI_ALLOC_Lock (void);
/*   935 */ void * GUI_ALLOC_LockH (signed long hMem);
/*   936 */ signed long GUI_ALLOC_Realloc (signed long hOld, int NewSize);
/*   937 */ signed long GUI_ALLOC_RequestSize (void);
/*   938 */ void GUI_ALLOC_SetAvBlockSize (unsigned long BlockSize);
/*   939 */ void GUI_ALLOC_Unlock (void);
/*   940 */ void * GUI_ALLOC_UnlockH (void ** pp);
/*   941 */ int GUI_ALLOC_SetMaxPercentage(int MaxPercentage);
/*   942 */ void GUI_ALLOC_Exit (void);
/*   951 */ typedef signed long GUI_MEMDEV_Handle;
/*   952 */ typedef void GUI_CALLBACK_VOID_P (void * p);
/*   953 */ typedef int GUI_ANIMATION_CALLBACK_FUNC(int TimeRem, void * pVoid);
/*   954 */ typedef void GUI_DRAWMEMDEV_16BPP_FUNC (void * pDst, const void * pSrc, int xSize, int ySize, int BytesPerLineDst, int BytesPerLineSrc);
/*   958 */ typedef void GUI_DRAWBITMAP_FUNC (int LayerIndex, int x, int y, const void * p, int xSize, int ySize, int BytesPerLine);
/*   960 */ int GUI_SetFuncDrawAlpha(GUI_DRAWMEMDEV_16BPP_FUNC * pfDrawMemdevFunc, GUI_DRAWBITMAP_FUNC * pfDrawBitmapFunc);
/*   961 */ int GUI_SetFuncDrawM565 (GUI_DRAWMEMDEV_16BPP_FUNC * pfDrawMemdevFunc, GUI_DRAWBITMAP_FUNC * pfDrawBitmapFunc);
/*   963 */ extern GUI_ANIMATION_CALLBACK_FUNC * GUI_MEMDEV__pCbAnimation;
/*   964 */ extern void * GUI_MEMDEV__pVoid;
/*   966 */ extern void (* GUI_MEMDEV__pfMEMDEV_Write) (GUI_MEMDEV_Handle hMem);
/*   967 */ extern void (* GUI_MEMDEV__pfMEMDEV_CopyToLCD)(GUI_MEMDEV_Handle hMem);
/*   969 */ typedef struct {
/*   970 */    GUI_RECT rView, rPrev;
/*   971 */    char FirstCall;
/*   972 */ } GUI_AUTODEV;
/*   974 */ typedef struct {
/*   975 */    char DrawFixed;
/*   976 */    char IsMeasurement;
/*   977 */ } GUI_AUTODEV_INFO;
/*   979 */ int GUI_MEMDEV_CreateAuto(GUI_AUTODEV * pAutoDev);
/*   980 */ void GUI_MEMDEV_DeleteAuto(GUI_AUTODEV * pAutoDev);
/*   981 */ int GUI_MEMDEV_DrawAuto (GUI_AUTODEV * pAutoDev, GUI_AUTODEV_INFO * pAutoDevInfo, GUI_CALLBACK_VOID_P * pfDraw, void * pData);
/*   984 */ GUI_MEMDEV_Handle GUI_MEMDEV_Create (int x0, int y0, int xSize, int ySize);
/*   985 */ GUI_MEMDEV_Handle GUI_MEMDEV_CreateEx (int x0, int y0, int xSize, int ySize, int Flags);
/*   986 */ GUI_MEMDEV_Handle GUI_MEMDEV_CreateFixed (int x0, int y0, int xSize, int ySize, int Flags,
/*   987 */     const GUI_DEVICE_API * pDeviceAPI,
/*   988 */     const LCD_API_COLOR_CONV * pColorConvAPI);
/*   989 */ GUI_MEMDEV_Handle GUI_MEMDEV_CreateFixed32(int x0, int y0, int xSize, int ySize);
/*   991 */ void GUI_MEMDEV_Clear (GUI_MEMDEV_Handle hMem);
/*   992 */ int GUI_MEMDEV_ClearAlpha (GUI_MEMDEV_Handle hMemData, GUI_MEMDEV_Handle hMemMask);
/*   993 */ void GUI_MEMDEV_CopyFromLCD (GUI_MEMDEV_Handle hMem);
/*   994 */ void GUI_MEMDEV_CopyFromLCDAA (GUI_MEMDEV_Handle hMem);
/*   995 */ void GUI_MEMDEV_CopyToLCD (GUI_MEMDEV_Handle hMem);
/*   996 */ void GUI_MEMDEV_CopyToLCDAA (GUI_MEMDEV_Handle hMem);
/*   997 */ void GUI_MEMDEV_CopyToLCDAt (GUI_MEMDEV_Handle hMem, int x, int y);
/*   998 */ int GUI_MEMDEV_CompareWithLCD (GUI_MEMDEV_Handle hMem, int * px, int * py, int * pExp, int * pAct);
/*   999 */ void GUI_MEMDEV_Delete (GUI_MEMDEV_Handle MemDev);
/*  1000 */ void GUI_MEMDEV_DrawPerspectiveX (GUI_MEMDEV_Handle hMem, int x, int y, int h0, int h1, int dx, int dy);
/*  1001 */ int GUI_MEMDEV_GetXPos (GUI_MEMDEV_Handle hMem);
/*  1002 */ int GUI_MEMDEV_GetXSize (GUI_MEMDEV_Handle hMem);
/*  1003 */ int GUI_MEMDEV_GetYPos (GUI_MEMDEV_Handle hMem);
/*  1004 */ int GUI_MEMDEV_GetYSize (GUI_MEMDEV_Handle hMem);
/*  1005 */ void GUI_MEMDEV_MarkDirty (GUI_MEMDEV_Handle hMem, int x0, int y0, int x1, int y1);
/*  1006 */ void GUI_MEMDEV_ReduceYSize (GUI_MEMDEV_Handle hMem, int YSize);
/*  1007 */ void GUI_MEMDEV_Rotate (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
/*  1008 */ void GUI_MEMDEV_RotateAlpha (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag, unsigned char Alpha);
/*  1009 */ void GUI_MEMDEV_RotateHR (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, signed long dx, signed long dy, int a, int Mag);
/*  1010 */ void GUI_MEMDEV__Rotate (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag, unsigned long Mask);
/*  1011 */ void GUI_MEMDEV__RotateHR (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, signed long dx, signed long dy, int a, int Mag, unsigned long Mask);
/*  1012 */ void GUI_MEMDEV_RotateHQ (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
/*  1013 */ void GUI_MEMDEV_RotateHQAlpha (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag, unsigned char Alpha);
/*  1014 */ void GUI_MEMDEV_RotateHQHR (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, signed long dx, signed long dy, int a, int Mag);
/*  1015 */ void GUI_MEMDEV_RotateHQT (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
/*  1016 */ void GUI_MEMDEV_RotateHQTI (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
/*  1017 */ GUI_MEMDEV_Handle GUI_MEMDEV_Select (GUI_MEMDEV_Handle hMem);
/*  1018 */ void GUI_MEMDEV_SetOrg (GUI_MEMDEV_Handle hMem, int x0, int y0);
/*  1019 */ void GUI_MEMDEV_WriteAt (GUI_MEMDEV_Handle hMem, int x, int y);
/*  1020 */ void GUI_MEMDEV_Write (GUI_MEMDEV_Handle hMem);
/*  1021 */ void GUI_MEMDEV_WriteAlphaAt (GUI_MEMDEV_Handle hMem, int Alpha, int x, int y);
/*  1022 */ void GUI_MEMDEV_WriteAlpha (GUI_MEMDEV_Handle hMem, int Alpha);
/*  1023 */ void GUI_MEMDEV_WriteExAt (GUI_MEMDEV_Handle hMem, int x, int y, int xMag, int yMag, int Alpha);
/*  1024 */ void GUI_MEMDEV_WriteEx (GUI_MEMDEV_Handle hMem, int xMag, int yMag, int Alpha);
/*  1025 */ void GUI_MEMDEV_WriteOpaque (GUI_MEMDEV_Handle hMem);
/*  1026 */ void GUI_MEMDEV_WriteOpaqueAt (GUI_MEMDEV_Handle hMem, int x, int y);
/*  1027 */ int GUI_MEMDEV_Draw (GUI_RECT * pRect, GUI_CALLBACK_VOID_P * pfDraw, void * pData, int NumLines, int Flags);
/*  1028 */ void* GUI_MEMDEV_GetDataPtr (GUI_MEMDEV_Handle hMem);
/*  1029 */ void GUI_MEMDEV_SetColorConv (GUI_MEMDEV_Handle hMem, const LCD_API_COLOR_CONV * pColorConvAPI);
/*  1030 */ const LCD_API_COLOR_CONV * GUI_MEMDEV_GetColorConv(GUI_MEMDEV_Handle hMemDev);
/*  1031 */ int GUI_MEMDEV_GetBitsPerPixel (GUI_MEMDEV_Handle hMemDev);
/*  1032 */ int GUI_MEMDEV_FadeInDevices (GUI_MEMDEV_Handle hMem0, GUI_MEMDEV_Handle hMem1, int Period);
/*  1033 */ int GUI_MEMDEV_FadeOutDevices (GUI_MEMDEV_Handle hMem0, GUI_MEMDEV_Handle hMem1, int Period);
/*  1034 */ void GUI_MEMDEV_SerializeBMP (GUI_MEMDEV_Handle hDev, GUI_CALLBACK_VOID_U8_P * pfSerialize, void * p);
/*  1035 */ void GUI_MEMDEV_SetAnimationCallback(GUI_ANIMATION_CALLBACK_FUNC * pCbAnimation, void * pVoid);
/*  1036 */ void GUI_MEMDEV__FadeDevice (GUI_MEMDEV_Handle hMemWin, GUI_MEMDEV_Handle hMemBk, GUI_MEMDEV_Handle hMemDst, unsigned char Intens);
/*  1037 */ void GUI_MEMDEV__FadeDeviceEx (GUI_MEMDEV_Handle hMemWin, GUI_MEMDEV_Handle hMemBk, GUI_MEMDEV_Handle hMemDst, unsigned char Intens, int xPosWin, int yPosWin);
/*  1038 */ int GUI_MEMDEV_PunchOutDevice (GUI_MEMDEV_Handle hMemData, GUI_MEMDEV_Handle hMemMask);
/*  1039 */ void GUI_MEMDEV_SetTimePerFrame (unsigned TimePerFrame);
/*  1040 */ int GUI_MEMDEV_MULTIBUF_Enable (int OnOff);
/*  1042 */ void GUI_SelectLCD(void);
/*  1045 */ GUI_MEMDEV_Handle GUI_MEMDEV_CreateBlurredDevice32 (GUI_MEMDEV_Handle hMem, unsigned char Depth);
/*  1046 */ GUI_MEMDEV_Handle GUI_MEMDEV_CreateBlurredDevice32HQ(GUI_MEMDEV_Handle hMem, unsigned char Depth);
/*  1047 */ GUI_MEMDEV_Handle GUI_MEMDEV_CreateBlurredDevice32LQ(GUI_MEMDEV_Handle hMem, unsigned char Depth);
/*  1048 */ void GUI_MEMDEV_SetBlurHQ (void);
/*  1049 */ void GUI_MEMDEV_SetBlurLQ (void);
/*  1050 */ int GUI_MEMDEV_BlendColor32 (GUI_MEMDEV_Handle hMem, unsigned long BlendColor, unsigned char BlendIntens);
/*  1051 */ int GUI_MEMDEV_Dither32 (GUI_MEMDEV_Handle hMem, const LCD_API_COLOR_CONV * pColorConvAPI);
/*  1054 */ void GUI_MEMDEV_SetDrawMemdev16bppFunc(GUI_DRAWMEMDEV_16BPP_FUNC * pfDrawMemdev16bppFunc);
/*  1060 */ typedef struct {
/*  1061 */    unsigned long UserAlpha;
/*  1062 */ } GUI_ALPHA_STATE;
/*  1066 */ unsigned GUI_EnableAlpha (unsigned OnOff);
/*  1067 */ unsigned long GUI_RestoreUserAlpha (GUI_ALPHA_STATE * pAlphaState);
/*  1068 */ unsigned GUI_SetAlpha (unsigned char Alpha);
/*  1069 */ unsigned long GUI_SetUserAlpha (GUI_ALPHA_STATE * pAlphaState, unsigned long UserAlpha);
/*  1070 */ void (* GUI_SetFuncAlphaBlending(void (* pfAlphaBlending)(LCD_COLOR *, LCD_COLOR *, LCD_COLOR *, unsigned long)))
/*  1071 */ (LCD_COLOR *, LCD_COLOR *, LCD_COLOR *, unsigned long);
/*  1072 */ LCD_COLOR (* GUI_SetFuncMixColors (LCD_COLOR (* pFunc)(LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens)))
/*  1073 */ (LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
/*  1074 */ void (* GUI_SetFuncMixColorsBulk(void (* pFunc)(unsigned long * pFG, unsigned long * pBG, unsigned long * pDst, unsigned OffFG, unsigned OffBG, unsigned OffDest, unsigned xSize, unsigned ySize, unsigned char Intens)))
/*  1075 */ (unsigned long * pFG, unsigned long * pBG, unsigned long * pDst, unsigned OffFG, unsigned OffBG, unsigned OffDest, unsigned xSize, unsigned ySize, unsigned char Intens);
/*  1076 */ unsigned GUI_PreserveTrans (unsigned OnOff);
/*  1082 */ unsigned GUI_SelectLayer(unsigned Index);
/*  1083 */ unsigned GUI_GetSelLayer(void);
/*  1085 */ int GUI_SetLayerPosEx (unsigned Index, int xPos, int yPos);
/*  1086 */ int GUI_SetLayerSizeEx (unsigned Index, int xSize, int ySize);
/*  1087 */ int GUI_SetLayerVisEx (unsigned Index, int OnOff);
/*  1088 */ int GUI_SetLayerAlphaEx(unsigned Index, int Alpha);
/*  1089 */ int GUI_GetLayerPosEx (unsigned Index, int * pxPos, int * pyPos);
/*  1091 */ void GUI_AssignCursorLayer(unsigned Index, unsigned CursorLayer);
/*  1092 */ unsigned GUI_GetCursorLayer (unsigned Index);
/*  1098 */ void GUI_SetOrg(int x, int y);
/*  1100 */ void GUI_MULTIBUF_Begin (void);
/*  1101 */ void GUI_MULTIBUF_BeginEx (int LayerIndex);
/*  1102 */ void GUI_MULTIBUF_End (void);
/*  1103 */ void GUI_MULTIBUF_EndEx (int LayerIndex);
/*  1104 */ void GUI_MULTIBUF_Config (int NumBuffers);
/*  1105 */ void GUI_MULTIBUF_ConfigEx (int LayerIndex, int NumBuffers);
/*  1106 */ void GUI_MULTIBUF_Confirm (int Index);
/*  1107 */ void GUI_MULTIBUF_ConfirmEx (int LayerIndex, int BufferIndex);
/*  1108 */ int GUI_MULTIBUF_GetNumBuffers (void);
/*  1109 */ int GUI_MULTIBUF_GetNumBuffersEx(int LayerIndex);
/*  1110 */ void GUI_MULTIBUF_SetLayerMask (unsigned long LayerMask);
/*  1111 */ void GUI_MULTIBUF_UseSingleBuffer(void);
/*  1117 */ int GUI_SPY_Process (GUI_tSend pfSend, GUI_tRecv pfRecv, void * pConnectInfo);
/*  1118 */ void GUI_SPY_SetMemHandler(GUI_tMalloc pMalloc, GUI_tFree pFree);
/*  1119 */ int GUI_SPY_StartServer (void);
/*  1120 */ int GUI_SPY_X_StartServer(void);
/*  1131 */ typedef struct {
/*  1132 */    int Version;
/*  1133 */    int Width;
/*  1134 */    int Size;
/*  1135 */ } GUI_QR_INFO;
/*  1137 */ signed long GUI_QR_Create (const char * pText, int PixelSize, int EccLevel, int Version);
/*  1138 */ void GUI_QR_Draw (signed long hQR, int xPos, int yPos);
/*  1139 */ void GUI_QR_GetInfo(signed long hQR, GUI_QR_INFO * pInfo);
/*  1140 */ void GUI_QR_Delete (signed long hQR);
/*  1159 */ typedef signed long GUI_ANIM_HANDLE;
/*  1161 */ typedef signed long (* GUI_ANIM_GETPOS_FUNC)(int ts, int te, int tNow);
/*  1163 */ typedef struct {
/*  1164 */    int Pos;
/*  1165 */    int State;
/*  1166 */    GUI_ANIM_HANDLE hAnim;
/*  1167 */    int Period;
/*  1168 */ } GUI_ANIM_INFO;
/*  1170 */ typedef void GUI_ANIMATION_FUNC(GUI_ANIM_INFO * pInfo, void * pVoid);
/*  1172 */ signed long GUI_ANIM__Linear (int ts, int te, int tNow);
/*  1173 */ signed long GUI_ANIM__Decel (int ts, int te, int tNow);
/*  1174 */ signed long GUI_ANIM__Accel (int ts, int te, int tNow);
/*  1175 */ signed long GUI_ANIM__AccelDecel(int ts, int te, int tNow);
/*  1177 */ int GUI_ANIM_AddItem(GUI_ANIM_HANDLE hAnim, int ts, int te, GUI_ANIM_GETPOS_FUNC pfGetPos, void * pVoid, GUI_ANIMATION_FUNC * pfAnim);
/*  1178 */ GUI_ANIM_HANDLE GUI_ANIM_Create (int Period, unsigned MinTimePerFrame, void * pVoid, void (* pfSliceInfo)(int State, void * pVoid));
/*  1179 */ void GUI_ANIM_Delete (GUI_ANIM_HANDLE hAnim);
/*  1180 */ int GUI_ANIM_Exec (GUI_ANIM_HANDLE hAnim);
/*  1181 */ void GUI_ANIM_Start (GUI_ANIM_HANDLE hAnim);
/*  1182 */ void GUI_ANIM_StartEx(GUI_ANIM_HANDLE hAnim, int NumLoops, void (* pfOnDelete)(void * pVoid));
/*  1183 */ void GUI_ANIM_Stop (GUI_ANIM_HANDLE hAnim);
/*  1193 */ typedef struct {
/*  1194 */    void (* pfDrawBitmap )(GUI_DEVICE * pDevice, int x0, int y0, int xsize, int ysize, int BitsPerPixel, int BytesPerLine, const unsigned char * pData, int Diff, const unsigned long * pTrans);
/*  1195 */    void (* pfDrawHLine )(GUI_DEVICE * pDevice, int x0, int y0, int x1);
/*  1196 */    void (* pfDrawVLine )(GUI_DEVICE * pDevice, int x , int y0, int y1);
/*  1197 */    void (* pfFillRect )(GUI_DEVICE * pDevice, int x0, int y0, int x1, int y1);
/*  1198 */    unsigned long (* pfGetPixelIndex)(GUI_DEVICE * pDevice, int x, int y);
/*  1199 */    void (* pfSetPixelIndex)(GUI_DEVICE * pDevice, int x, int y, unsigned long ColorIndex);
/*  1200 */    void (* pfXorPixel )(GUI_DEVICE * pDevice, int x, int y);
/*  1201 */    int BytesPerPixel;
/*  1202 */ } GUI_ORIENTATION_API;
/*  1204 */ extern const GUI_ORIENTATION_API GUI_OrientationAPI_C0;
/*  1205 */ extern const GUI_ORIENTATION_API GUI_OrientationAPI_C8;
/*  1206 */ extern const GUI_ORIENTATION_API GUI_OrientationAPI_C16;
/*  1207 */ extern const GUI_ORIENTATION_API GUI_OrientationAPI_C32;
/*  1214 */ int GUI_SetOrientation (int Orientation);
/*  1215 */ int GUI_SetOrientationEx (int Orientation, int LayerIndex);
/*  1216 */ int GUI_SetOrientationExCached(int Orientation, int LayerIndex, const GUI_ORIENTATION_API * pAPI);
/*  1222 */ typedef signed long GUI_MEASDEV_Handle;
/*  1224 */ GUI_MEASDEV_Handle GUI_MEASDEV_Create (void);
/*  1225 */ void GUI_MEASDEV_Delete (GUI_MEASDEV_Handle hMemDev);
/*  1226 */ void GUI_MEASDEV_Select (GUI_MEASDEV_Handle hMem);
/*  1227 */ void GUI_MEASDEV_GetRect(GUI_MEASDEV_Handle hMem, GUI_RECT * pRect);
/*  1228 */ void GUI_MEASDEV_ClearRect(GUI_MEASDEV_Handle hMem);
/*  1234 */ void GUI_RotatePolygon (GUI_POINT * pDest, const GUI_POINT * pSrc, int NumPoints, float Angle);
/*  1235 */ void GUI_MagnifyPolygon(GUI_POINT * pDest, const GUI_POINT * pSrc, int NumPoints, int Mag);
/*  1236 */ void GUI_EnlargePolygon(GUI_POINT * pDest, const GUI_POINT * pSrc, int NumPoints, int Len);
/*  1248 */ int GUI_CreateBitmapFromStreamIDX(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1249 */ int GUI_CreateBitmapFromStreamRLE4(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1250 */ int GUI_CreateBitmapFromStreamRLE8(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1251 */ int GUI_CreateBitmapFromStream565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1252 */ int GUI_CreateBitmapFromStreamM565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1253 */ int GUI_CreateBitmapFromStream555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1254 */ int GUI_CreateBitmapFromStreamM555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1255 */ int GUI_CreateBitmapFromStreamA565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1256 */ int GUI_CreateBitmapFromStreamAM565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1257 */ int GUI_CreateBitmapFromStreamA555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1258 */ int GUI_CreateBitmapFromStreamAM555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1259 */ int GUI_CreateBitmapFromStreamRLE16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1260 */ int GUI_CreateBitmapFromStreamRLEM16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1261 */ int GUI_CreateBitmapFromStream24(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1262 */ int GUI_CreateBitmapFromStreamAlpha(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1263 */ int GUI_CreateBitmapFromStreamM8888I(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1264 */ int GUI_CreateBitmapFromStreamRLEAlpha(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1265 */ int GUI_CreateBitmapFromStreamRLE32(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1266 */ int GUI_CreateBitmapFromStream444_12(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1267 */ int GUI_CreateBitmapFromStreamM444_12(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1268 */ int GUI_CreateBitmapFromStream444_12_1(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1269 */ int GUI_CreateBitmapFromStreamM444_12_1(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1270 */ int GUI_CreateBitmapFromStream444_16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1271 */ int GUI_CreateBitmapFromStreamM444_16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1273 */ int GUI_CreateBitmapFromStream (GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
/*  1274 */ void GUI_DrawStreamedBitmap (const void * p, int x, int y);
/*  1275 */ void GUI_DrawStreamedBitmapAuto (const void * p, int x, int y);
/*  1276 */ int GUI_DrawStreamedBitmapEx (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1277 */ int GUI_DrawStreamedBitmapExAuto (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1278 */ int GUI_DrawStreamedBitmap555Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1279 */ int GUI_DrawStreamedBitmapM555Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1280 */ int GUI_DrawStreamedBitmap565Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1281 */ int GUI_DrawStreamedBitmapM565Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1282 */ int GUI_DrawStreamedBitmapA555Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1283 */ int GUI_DrawStreamedBitmapAM555Ex(GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1284 */ int GUI_DrawStreamedBitmapA565Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1285 */ int GUI_DrawStreamedBitmapAM565Ex(GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1286 */ int GUI_DrawStreamedBitmap24Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*  1287 */ void GUI_GetStreamedBitmapInfo (const void * p, GUI_BITMAPSTREAM_INFO * pInfo);
/*  1288 */ int GUI_GetStreamedBitmapInfoEx (GUI_GET_DATA_FUNC * pfGetData, const void * p, GUI_BITMAPSTREAM_INFO * pInfo);
/*  1289 */ void GUI_SetStreamedBitmapHook (GUI_BITMAPSTREAM_CALLBACK pfStreamedBitmapHook);
/*  1291 */ void LCD__RLE4_SetFunc (GUI_GET_DATA_FUNC * pfGetData, void * pVoid, unsigned long Off, const LCD_LOGPALETTE * pLogPal);
/*  1292 */ void LCD__RLE8_SetFunc (GUI_GET_DATA_FUNC * pfGetData, void * pVoid, unsigned long Off, const LCD_LOGPALETTE * pLogPal);
/*  1293 */ void LCD__RLE16_SetFunc(GUI_GET_DATA_FUNC * pfGetData, void * pVoid, unsigned long Off);
/*  1294 */ void LCD__RLE32_SetFunc(GUI_GET_DATA_FUNC * pfGetData, void * pVoid, unsigned long Off);
/*  1300 */ void GUI_BMP_Serialize (GUI_CALLBACK_VOID_U8_P * pfSerialize, void * p);
/*  1301 */ void GUI_BMP_SerializeEx (GUI_CALLBACK_VOID_U8_P * pfSerialize, int x0, int y0, int xSize, int ySize, void * p);
/*  1302 */ void GUI_BMP_SerializeExBpp(GUI_CALLBACK_VOID_U8_P * pfSerialize, int x0, int y0, int xSize, int ySize, void * p, int BitsPerPixel);
/*  1304 */ void GUI_BMP__WriteBitmapHeader(GUI_CALLBACK_VOID_U8_P * pfSerialize, int xSize, int ySize, void * p, int BitsPerPixel, int BytesPerLine, int BytesPerPixel, int NumColors, int Padding);
/*  1310 */ void GUI_Delay (int Period);
/*  1311 */ int GUI_GetTime (void);
/*  1312 */ int GUI_GetTimeSlice(void);
/*  1313 */ int GUI_Exec (void);
/*  1314 */ int GUI_Exec1 (void);
/*  1315 */ void GUI_SetTimeSlice(int TimeSlice);
/*  1321 */ int GUI_MessageBox (const char * sMessage, const char * sCaption, int Flags);
/*  1335 */ typedef signed long GUI_TIMER_HANDLE;
/*  1337 */ typedef struct {
/*  1338 */    int Time;
/*  1339 */    unsigned long Context;
/*  1340 */    GUI_TIMER_HANDLE hTimer;
/*  1341 */ } GUI_TIMER_MESSAGE;
/*  1343 */ typedef void GUI_TIMER_CALLBACK( GUI_TIMER_MESSAGE* pTM);
/*  1345 */ GUI_TIMER_HANDLE GUI_TIMER_Create (GUI_TIMER_CALLBACK * cb, int Time, unsigned long Context, unsigned short Flags);
/*  1346 */ void GUI_TIMER_Delete (GUI_TIMER_HANDLE hObj);
/*  1349 */ int GUI_TIMER_GetPeriod(GUI_TIMER_HANDLE hObj);
/*  1350 */ void GUI_TIMER_SetPeriod(GUI_TIMER_HANDLE hObj, int Period);
/*  1351 */ void GUI_TIMER_SetTime (GUI_TIMER_HANDLE hObj, int Period);
/*  1352 */ void GUI_TIMER_SetDelay (GUI_TIMER_HANDLE hObj, int Delay);
/*  1353 */ void GUI_TIMER_Restart (GUI_TIMER_HANDLE hObj);
/*  1354 */ int GUI_TIMER_GetFlag (GUI_TIMER_HANDLE hObj, int Flag);
/*  1355 */ int GUI_TIMER_Exec (void);
/*  1364 */ void GUI_AA_DisableHiRes (void);
/*  1365 */ void GUI_AA_EnableHiRes (void);
/*  1366 */ int GUI_AA_GetFactor (void);
/*  1367 */ void GUI_AA_SetFactor (int Factor);
/*  1368 */ void GUI_AA_DrawArc (int x0, int y0, int rx, int ry, int a0, int a1);
/*  1369 */ void GUI_AA_DrawLine (int x0, int y0, int x1, int y1);
/*  1370 */ void GUI_AA_DrawPolyOutline (const GUI_POINT * pSrc, int NumPoints, int Thickness, int x, int y);
/*  1371 */ void GUI_AA_DrawPolyOutlineEx(const GUI_POINT * pSrc, int NumPoints, int Thickness, int x, int y, GUI_POINT * pBuffer);
/*  1372 */ void GUI_AA_DrawRoundedRect (int x0, int y0, int x1, int y1, int r);
/*  1373 */ void GUI_AA_DrawRoundedRectEx(GUI_RECT * pRect, int r);
/*  1374 */ void GUI_AA_FillCircle (int x0, int y0, int r);
/*  1375 */ void GUI_AA_FillEllipse (int x0, int y0, int rx, int ry);
/*  1376 */ void GUI_AA_FillPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
/*  1377 */ void GUI_AA_FillRoundedRect (int x0, int y0, int x1, int y1, int r);
/*  1378 */ void GUI_AA_FillRoundedRectEx(GUI_RECT * pRect, int r);
/*  1379 */ int GUI_AA_SetDrawMode (int Mode);
/*  1380 */ void GUI_AA_SetpfDrawCharAA4 (int (* pfDrawChar)(int LayerIndex, int x, int y, unsigned char const * p, int xSize, int ySize, int BytesPerLine));
/*  1381 */ void GUI_AA_SetGammaAA4 (unsigned char * pGamma);
/*  1382 */ void GUI_AA_GetGammaAA4 (unsigned char * pGamma);
/*  1383 */ void GUI_AA_EnableGammaAA4 (int OnOff);
/*  1392 */ void GUI_StoreKeyMsg(int Key, int Pressed);
/*  1393 */ void GUI_SendKeyMsg (int Key, int Pressed);
/*  1394 */ int GUI_PollKeyMsg (void);
/*  1395 */ void GUI_GetKeyState(GUI_KEY_STATE * pState);
/*  1397 */ void GUI_KEY__SetHook(void (* pfHook)(const GUI_KEY_STATE *));
/*  1400 */ int GUI_GetKey(void);
/*  1401 */ int GUI_WaitKey(void);
/*  1402 */ void GUI_StoreKey(int c);
/*  1403 */ void GUI_ClearKeyBuffer(void);
/*  1409 */ void GUI_WaitEvent (void);
/*  1410 */ void GUI_SignalEvent (void);
/*  1411 */ void GUI_SetSignalEventFunc (GUI_SIGNAL_EVENT_FUNC pfSignalEvent);
/*  1412 */ void GUI_SetWaitEventFunc (GUI_WAIT_EVENT_FUNC pfWaitEvent);
/*  1413 */ void GUI_SetWaitEventTimedFunc(GUI_WAIT_EVENT_TIMED_FUNC pfWaitEventTimed);
/*  1419 */ void GUI_JOYSTICK_StoreState(const GUI_PID_STATE * pState);
/*  1425 */ void GUI_PID_StoreState (const GUI_PID_STATE * pState);
/*  1426 */ int GUI_PID_GetState ( GUI_PID_STATE * pState);
/*  1427 */ void GUI_PID_GetCurrentState( GUI_PID_STATE * pState);
/*  1428 */ int GUI_PID_IsEmpty (void);
/*  1429 */ int GUI_PID_IsPressed (void);
/*  1430 */ void GUI_PID_SetHook (void (* pfHook)( GUI_PID_STATE *));
/*  1431 */ void GUI_PID__SetHook (void (* pfHook)(const GUI_PID_STATE *));
/*  1437 */ int GUI_MOUSE_GetState ( GUI_PID_STATE * pState);
/*  1438 */ void GUI_MOUSE_StoreState(const GUI_PID_STATE * pState);
/*  1444 */ int GUI_TOUCH_GetLayer (void);
/*  1445 */ int GUI_TOUCH_GetState (GUI_PID_STATE * pState);
/*  1446 */ void GUI_TOUCH_GetUnstable (int * px, int * py);
/*  1447 */ void GUI_TOUCH_SetLayer (int Layer);
/*  1448 */ void GUI_TOUCH_StoreState (int x, int y);
/*  1449 */ void GUI_TOUCH_StoreStateEx (const GUI_PID_STATE * pState);
/*  1450 */ void GUI_TOUCH_StoreUnstable(int x, int y);
/*  1456 */ void GUI_MOUSE_DRIVER_PS2_Init(void);
/*  1457 */ void GUI_MOUSE_DRIVER_PS2_OnRx(unsigned char Data);
/*  1463 */ int GUI_TOUCH_CalcCoefficients (int NumPoints, int * pxRef, int * pyRef, int * pxSample, int * pySample, int xSize, int ySize);
/*  1464 */ int GUI_TOUCH_Calibrate (int Coord, int Log0, int Log1, int Phys0, int Phys1);
/*  1465 */ int GUI_TOUCH_CalibratePoint (int * px, int * py);
/*  1466 */ void GUI_TOUCH_EnableCalibration(int OnOff);
/*  1467 */ void GUI_TOUCH_Exec (void);
/*  1468 */ int GUI_TOUCH_GetxPhys (void);
/*  1469 */ int GUI_TOUCH_GetyPhys (void);
/*  1470 */ void GUI_TOUCH_SetCalibration (int (* pFunc)(int *, int *));
/*  1471 */ void GUI_TOUCH_SetOrientation (unsigned Orientation);
/*  1472 */ int GUI_TOUCH_TransformPoint (int * px, int * py);
/*  1482 */ void GUI_TOUCH_X_ActivateX(void);
/*  1483 */ void GUI_TOUCH_X_ActivateY(void);
/*  1484 */ void GUI_TOUCH_X_Disable (void);
/*  1485 */ int GUI_TOUCH_X_MeasureX (void);
/*  1486 */ int GUI_TOUCH_X_MeasureY (void);
/*  1505 */ void GUI_X_Config(void);
/*  1506 */ void GUI_X_Init (void);
/*  1511 */ int GUI_X_GetTime(void);
/*  1512 */ void GUI_X_Delay (int Period);
/*  1517 */ void GUI_X_Unlock (void);
/*  1518 */ void GUI_X_Lock (void);
/*  1519 */ unsigned long GUI_X_GetTaskId(void);
/*  1520 */ void GUI_X_InitOS (void);
/*  1525 */ void GUI_X_ExecIdle (void);
/*  1526 */ void GUI_X_WaitEvent (void);
/*  1527 */ void GUI_X_WaitEventTimed(int Period);
/*  1528 */ void GUI_X_SignalEvent (void);
/*  1533 */ void GUI_X_Log (const char * s);
/*  1534 */ void GUI_X_Warn (const char * s);
/*  1535 */ void GUI_X_ErrorOut(const char * s);
/*  1541 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE4;
/*  1542 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE4Ex;
/*  1543 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE8;
/*  1544 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE8Ex;
/*  1545 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE16;
/*  1546 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE16Ex;
/*  1547 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLEM16;
/*  1548 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLEM16Ex;
/*  1549 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE32;
/*  1550 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE32Ex;
/*  1551 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLEAlpha;
/*  1553 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethods444_12;
/*  1554 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM444_12;
/*  1555 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethods444_12_1;
/*  1556 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM444_12_1;
/*  1557 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethods444_16;
/*  1558 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM444_16;
/*  1559 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethods555;
/*  1560 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM555;
/*  1561 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethods565;
/*  1562 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM565;
/*  1563 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethods24;
/*  1564 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethods888;
/*  1565 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM888;
/*  1566 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethods8888;
/*  1567 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM8888I;
/*  1568 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsA565;
/*  1569 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsAM565;
/*  1570 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsA555;
/*  1571 */ extern const GUI_BITMAP_METHODS GUI_BitmapMethodsAM555;
/*  1603 */ extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop;
/*  1604 */ extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_Ext;
/*  1605 */ extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_Frm;
/*  1606 */ extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA2;
/*  1607 */ extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA4;
/*  1608 */ extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA2_EXT;
/*  1609 */ extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA4_EXT;
/*  1611 */ extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop;
/*  1612 */ extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_Ext;
/*  1613 */ extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_Frm;
/*  1614 */ extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_AA2_Ext;
/*  1615 */ extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_AA4_Ext;
/*  1988 */ extern T_GUI_MTOUCH_STOREEVENT GUI_MTOUCH__pStoreEvent;
/*  1993 */ void GUI_MTOUCH_Enable (int OnOff);
/*  1994 */ int GUI_MTOUCH_GetEvent (GUI_MTOUCH_EVENT * pEvent);
/*  1995 */ int GUI_MTOUCH_GetTouchInput (GUI_MTOUCH_EVENT * pEvent, GUI_MTOUCH_INPUT * pBuffer, unsigned Index);
/*  1996 */ int GUI_MTOUCH_IsEmpty (void);
/*  1997 */ void GUI_MTOUCH_SetOrientation (int Orientation);
/*  1998 */ void GUI_MTOUCH_SetOrientationEx(int Orientation, int LayerIndex);
/*  1999 */ void GUI_MTOUCH_StoreEvent (GUI_MTOUCH_EVENT * pEvent, GUI_MTOUCH_INPUT * pInput);
/*  2015 */ extern const GUI_FONT GUI_Font8_ASCII, GUI_Font8_1;
/*  2016 */ extern const GUI_FONT GUI_Font10S_ASCII, GUI_Font10S_1;
/*  2017 */ extern const GUI_FONT GUI_Font10_ASCII, GUI_Font10_1;
/*  2018 */ extern const GUI_FONT GUI_Font13_ASCII, GUI_Font13_1;
/*  2019 */ extern const GUI_FONT GUI_Font13B_ASCII, GUI_Font13B_1;
/*  2020 */ extern const GUI_FONT GUI_Font13H_ASCII, GUI_Font13H_1;
/*  2021 */ extern const GUI_FONT GUI_Font13HB_ASCII, GUI_Font13HB_1;
/*  2022 */ extern const GUI_FONT GUI_Font16_ASCII, GUI_Font16_1, GUI_Font16_HK, GUI_Font16_1HK;
/*  2023 */ extern const GUI_FONT GUI_Font16B_ASCII, GUI_Font16B_1;
/*  2024 */ extern const GUI_FONT GUI_Font20_ASCII, GUI_Font20_1;
/*  2025 */ extern const GUI_FONT GUI_Font20B_ASCII, GUI_Font20B_1;
/*  2026 */ extern const GUI_FONT GUI_Font24_ASCII, GUI_Font24_1;
/*  2027 */ extern const GUI_FONT GUI_Font24B_ASCII, GUI_Font24B_1;
/*  2028 */ extern const GUI_FONT GUI_Font32_ASCII, GUI_Font32_1;
/*  2029 */ extern const GUI_FONT GUI_Font32B_ASCII, GUI_Font32B_1;
/*  2034 */ extern const GUI_FONT GUI_Font20F_ASCII;
/*  2039 */ extern const GUI_FONT GUI_Font4x6;
/*  2040 */ extern const GUI_FONT GUI_Font6x8, GUI_Font6x9;
/*  2041 */ extern const GUI_FONT GUI_Font6x8_ASCII, GUI_Font6x8_1;
/*  2042 */ extern const GUI_FONT GUI_Font8x8, GUI_Font8x9;
/*  2043 */ extern const GUI_FONT GUI_Font8x8_ASCII, GUI_Font8x8_1;
/*  2044 */ extern const GUI_FONT GUI_Font8x10_ASCII;
/*  2045 */ extern const GUI_FONT GUI_Font8x12_ASCII;
/*  2046 */ extern const GUI_FONT GUI_Font8x13_ASCII, GUI_Font8x13_1;
/*  2047 */ extern const GUI_FONT GUI_Font8x15B_ASCII, GUI_Font8x15B_1;
/*  2048 */ extern const GUI_FONT GUI_Font8x16, GUI_Font8x17, GUI_Font8x18;
/*  2049 */ extern const GUI_FONT GUI_Font8x16x1x2, GUI_Font8x16x2x2, GUI_Font8x16x3x3;
/*  2050 */ extern const GUI_FONT GUI_Font8x16_ASCII, GUI_Font8x16_1;
/*  2055 */ extern const GUI_FONT GUI_FontD24x32;
/*  2056 */ extern const GUI_FONT GUI_FontD32;
/*  2057 */ extern const GUI_FONT GUI_FontD36x48;
/*  2058 */ extern const GUI_FONT GUI_FontD48;
/*  2059 */ extern const GUI_FONT GUI_FontD48x64;
/*  2060 */ extern const GUI_FONT GUI_FontD64;
/*  2061 */ extern const GUI_FONT GUI_FontD60x80;
/*  2062 */ extern const GUI_FONT GUI_FontD80;
/*  2067 */ extern const GUI_FONT GUI_FontComic18B_ASCII, GUI_FontComic18B_1;
/*  2068 */ extern const GUI_FONT GUI_FontComic24B_ASCII, GUI_FontComic24B_1;
/*
 * C:/PRQA/QAC-8.1.2-R/include/ansi/time.h
 */
/*     6 */ typedef unsigned int size_t;
/*    15 */ typedef long clock_t;
/*    16 */ typedef long time_t;
/*    17 */ struct tm
/*    18 */ { int tm_sec, tm_min, tm_hour, tm_mday, tm_mon, tm_year, tm_wday, tm_yday, tm_isdst; };
/*    20 */ extern clock_t clock(void);
/*    21 */ extern double difftime(time_t time1, time_t time0);
/*    22 */ extern time_t mktime(struct tm *timeptr),
/*    23 */ time(time_t *timer);
/*    24 */ extern char *asctime(const struct tm *timeptr),
/*    25 */ *ctime(const time_t *timer);
/*    26 */ extern struct tm *gmtime(const time_t *timer),
/*    27 */ *localtime(const time_t *timer);
/*    28 */ extern size_t strftime(char *s, size_t maxsize, const char *format, const struct tm *timeptr);
/*
 * C:/CodeInspection/DisplayUnit/Inc/main.h
 */
/*   133 */ void _Error_Handler(char *, int);
/*   145 */ typedef enum {
/*   146 */    Control_1,
/*   147 */    Control_2,
/*   148 */    Control_3,
/*   149 */    Seconds,
/*   150 */    Minutes,
/*   151 */    Hours,
/*   152 */    Days,
/*   153 */    Weekdays,
/*   154 */    Months,
/*   155 */    Years,
/*   156 */    Second_alarm,
/*   157 */    Minute_alarm,
/*   158 */    Hour_alarm,
/*   159 */    Day_alarm,
/*   160 */    Weekday_alarm,
/*   161 */    CLKOUT_ctl,
/*   162 */    Watchdg_tim_ctl,
/*   163 */    Watchdg_tim_val,
/*   164 */    Timestp_ctl,
/*   165 */    Sec_timestp,
/*   166 */    Min_timestp,
/*   167 */    Hour_timestp,
/*   168 */    Day_timestp,
/*   169 */    Mon_timestp,
/*   170 */    Year_timestp,
/*   171 */    Aging_offset,
/*   172 */    RAM_addr_MSB,
/*   173 */    RAM_addr_LSB,
/*   174 */    RAM_wrt_cmd,
/*   175 */    RAM_rd_cmd
/*   176 */ } RegisterName;
/*   178 */ typedef enum {
/*   179 */    Cntl1 = 0x03,
/*   180 */    Cntl2 = 0x00,
/*   181 */    Cntl3 = 0x00,
/*   182 */    ClkOut = 0x46
/*   183 */ }DefaultRegParam;
/*   186 */ typedef enum {
/*   187 */    NO_ERROR = 0,
/*   188 */    CLOCK_INTEGRITY_FAIL = 1,
/*   189 */    I2C_ACCESS_FAIL = 2,
/*   190 */    TIME_FUNC_ERROR = ((time_t)-1)
/*   191 */ } ErrorNum;
/*   193 */ void GuiMain(void);
/*   194 */ void Beep(void);
/*   195 */ void FlashRead(void);
/*   196 */ void FlashWrite(void);
/*   197 */ void FaultCountRead(void);
/*   198 */ void FaultCountWrite(void);
/*
 * C:/PRQA/QAC-8.1.2-R/include/ansi/stdio.h
 */
/*    25 */ typedef unsigned long fpos_t;
/*    34 */ typedef struct { unsigned __the_contents_of_FILE_are_not_defined; } FILE;
/*    37 */ extern FILE *stderr, *stdin, *stdout;
/*    41 */ typedef void * va_list;
/*    44 */ extern int remove(const char * filename),
/*    45 */ rename(const char * old, const char * n),
/*    46 */ fclose(FILE *stream),
/*    47 */ fflush(FILE *stream),
/*    48 */ setvbuf(FILE *stream, char *buf, int mode, size_t size),
/*    49 */ fprintf(FILE *stream, const char *format, ...),
/*    50 */ fscanf(FILE *stream, const char *format, ...),
/*    51 */ printf(const char *format, ...),
/*    52 */ scanf(const char *format, ...),
/*    53 */ sprintf(char *s, const char *format, ...),
/*    54 */ sscanf(const char *s, const char *format, ...),
/*    55 */ vfprintf(FILE *stream, const char *format, va_list arg),
/*    56 */ vprintf(const char *format, va_list arg),
/*    57 */ vsprintf(char *s, const char *format, va_list arg),
/*    58 */ fgetc(FILE *stream),
/*    59 */ fputc(int c, FILE *stream),
/*    60 */ fputs(const char *s, FILE *stream),
/*    61 */ getc(FILE *stream),
/*    62 */ getchar(void),
/*    63 */ putc(int c, FILE *stream),
/*    64 */ putchar(int c),
/*    65 */ puts(const char *s),
/*    66 */ ungetc(int c, FILE *stream),
/*    67 */ fgetpos(FILE *stream, fpos_t *pos),
/*    68 */ fseek(FILE *stream, long int offset, int whence),
/*    69 */ fsetpos(FILE *stream, const fpos_t *pos),
/*    70 */ feof(FILE *stream),
/*    71 */ ferror(FILE *stream);
/*    72 */ extern FILE *tmpfile(void),
/*    73 */ *fopen(const char *filename, const char *mode),
/*    74 */ *freopen(const char *filename, const char *mode, FILE *stream);
/*    75 */ extern char *tmpnam(char *s),
/*    76 */ *fgets(char *s, int n, FILE *stream),
/*    77 */ *gets(char *s);
/*    78 */ extern size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream),
/*    79 */ fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);
/*    80 */ extern long ftell(FILE *stream);
/*    81 */ extern void setbuf(FILE *stream, char *buf),
/*    82 */ rewind(FILE *stream),
/*    83 */ clearerr(FILE *stream),
/*    84 */ perror(const char *s);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_def.h
 */
/*    55 */ typedef enum
/*    56 */ {
/*    57 */    HAL_OK = 0x00U,
/*    58 */    HAL_ERROR = 0x01U,
/*    59 */    HAL_BUSY = 0x02U,
/*    60 */    HAL_TIMEOUT = 0x03U
/*    61 */ } HAL_StatusTypeDef;
/*    66 */ typedef enum
/*    67 */ {
/*    68 */    HAL_UNLOCKED = 0x00U,
/*    69 */    HAL_LOCKED = 0x01U
/*    70 */ } HAL_LockTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rcc_ex.h
 */
/*    63 */ typedef struct
/*    64 */ {
/*    65 */    uint32_t PLLState;
/*    68 */    uint32_t PLLSource;
/*    71 */    uint32_t PLLM;
/*    74 */    uint32_t PLLN;
/*    78 */    uint32_t PLLP;
/*    81 */    uint32_t PLLQ;
/*    91 */ }RCC_PLLInitTypeDef;
/*   400 */ typedef struct
/*   401 */ {
/*   407 */    uint32_t PLLI2SN;
/*   412 */    uint32_t PLLI2SR;
/*   416 */ }RCC_PLLI2SInitTypeDef;
/*   421 */ typedef struct
/*   422 */ {
/*   423 */    uint32_t PeriphClockSelection;
/*   426 */    RCC_PLLI2SInitTypeDef PLLI2S;
/*   429 */    uint32_t RTCClockSelection;
/*   435 */ }RCC_PeriphCLKInitTypeDef;
/*  6727 */ HAL_StatusTypeDef HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef *PeriphClkInit);
/*  6728 */ void HAL_RCCEx_GetPeriphCLKConfig(RCC_PeriphCLKInitTypeDef *PeriphClkInit);
/*  6730 */ uint32_t HAL_RCCEx_GetPeriphCLKFreq(uint32_t PeriphClk);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rcc.h
 */
/*    67 */ typedef struct
/*    68 */ {
/*    69 */    uint32_t OscillatorType;
/*    72 */    uint32_t HSEState;
/*    75 */    uint32_t LSEState;
/*    78 */    uint32_t HSIState;
/*    81 */    uint32_t HSICalibrationValue;
/*    84 */    uint32_t LSIState;
/*    87 */    RCC_PLLInitTypeDef PLL;
/*    88 */ }RCC_OscInitTypeDef;
/*    93 */ typedef struct
/*    94 */ {
/*    95 */    uint32_t ClockType;
/*    98 */    uint32_t SYSCLKSource;
/*   101 */    uint32_t AHBCLKDivider;
/*   104 */    uint32_t APB1CLKDivider;
/*   107 */    uint32_t APB2CLKDivider;
/*   110 */ }RCC_ClkInitTypeDef;
/*  1245 */ HAL_StatusTypeDef HAL_RCC_DeInit(void);
/*  1246 */ HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *RCC_OscInitStruct);
/*  1247 */ HAL_StatusTypeDef HAL_RCC_ClockConfig(RCC_ClkInitTypeDef *RCC_ClkInitStruct, uint32_t FLatency);
/*  1256 */ void HAL_RCC_MCOConfig(uint32_t RCC_MCOx, uint32_t RCC_MCOSource, uint32_t RCC_MCODiv);
/*  1257 */ void HAL_RCC_EnableCSS(void);
/*  1258 */ void HAL_RCC_DisableCSS(void);
/*  1259 */ uint32_t HAL_RCC_GetSysClockFreq(void);
/*  1260 */ uint32_t HAL_RCC_GetHCLKFreq(void);
/*  1261 */ uint32_t HAL_RCC_GetPCLK1Freq(void);
/*  1262 */ uint32_t HAL_RCC_GetPCLK2Freq(void);
/*  1263 */ void HAL_RCC_GetOscConfig(RCC_OscInitTypeDef *RCC_OscInitStruct);
/*  1264 */ void HAL_RCC_GetClockConfig(RCC_ClkInitTypeDef *RCC_ClkInitStruct, uint32_t *pFLatency);
/*  1267 */ void HAL_RCC_NMI_IRQHandler(void);
/*  1270 */ void HAL_RCC_CSSCallback(void);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_gpio.h
 */
/*    63 */ typedef struct
/*    64 */ {
/*    65 */    uint32_t Pin;
/*    68 */    uint32_t Mode;
/*    71 */    uint32_t Pull;
/*    74 */    uint32_t Speed;
/*    77 */    uint32_t Alternate;
/*    79 */ }GPIO_InitTypeDef;
/*    84 */ typedef enum
/*    85 */ {
/*    86 */    GPIO_PIN_RESET = 0,
/*    87 */    GPIO_PIN_SET
/*    88 */ }GPIO_PinState;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_gpio.h
 */
/*   241 */ void HAL_GPIO_Init(GPIO_TypeDef *GPIOx, GPIO_InitTypeDef *GPIO_Init);
/*   242 */ void HAL_GPIO_DeInit(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin);
/*   251 */ GPIO_PinState HAL_GPIO_ReadPin(GPIO_TypeDef* GPIOx, unsigned short GPIO_Pin);
/*   252 */ void HAL_GPIO_WritePin(GPIO_TypeDef* GPIOx, unsigned short GPIO_Pin, GPIO_PinState PinState);
/*   253 */ void HAL_GPIO_TogglePin(GPIO_TypeDef* GPIOx, unsigned short GPIO_Pin);
/*   254 */ HAL_StatusTypeDef HAL_GPIO_LockPin(GPIO_TypeDef* GPIOx, unsigned short GPIO_Pin);
/*   255 */ void HAL_GPIO_EXTI_IRQHandler(unsigned short GPIO_Pin);
/*   256 */ void HAL_GPIO_EXTI_Callback(unsigned short GPIO_Pin);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dma.h
 */
/*    65 */ typedef struct
/*    66 */ {
/*    67 */    uint32_t Channel;
/*    70 */    uint32_t Direction;
/*    74 */    uint32_t PeriphInc;
/*    77 */    uint32_t MemInc;
/*    80 */    uint32_t PeriphDataAlignment;
/*    83 */    uint32_t MemDataAlignment;
/*    86 */    uint32_t Mode;
/*    91 */    uint32_t Priority;
/*    94 */    uint32_t FIFOMode;
/*    99 */    uint32_t FIFOThreshold;
/*   102 */    uint32_t MemBurst;
/*   108 */    uint32_t PeriphBurst;
/*   113 */ }DMA_InitTypeDef;
/*   119 */ typedef enum
/*   120 */ {
/*   121 */    HAL_DMA_STATE_RESET = 0x00U,
/*   122 */    HAL_DMA_STATE_READY = 0x01U,
/*   123 */    HAL_DMA_STATE_BUSY = 0x02U,
/*   124 */    HAL_DMA_STATE_TIMEOUT = 0x03U,
/*   125 */    HAL_DMA_STATE_ERROR = 0x04U,
/*   126 */    HAL_DMA_STATE_ABORT = 0x05U,
/*   127 */ }HAL_DMA_StateTypeDef;
/*   132 */ typedef enum
/*   133 */ {
/*   134 */    HAL_DMA_FULL_TRANSFER = 0x00U,
/*   135 */    HAL_DMA_HALF_TRANSFER = 0x01U
/*   136 */ }HAL_DMA_LevelCompleteTypeDef;
/*   141 */ typedef enum
/*   142 */ {
/*   143 */    HAL_DMA_XFER_CPLT_CB_ID = 0x00U,
/*   144 */    HAL_DMA_XFER_HALFCPLT_CB_ID = 0x01U,
/*   145 */    HAL_DMA_XFER_M1CPLT_CB_ID = 0x02U,
/*   146 */    HAL_DMA_XFER_M1HALFCPLT_CB_ID = 0x03U,
/*   147 */    HAL_DMA_XFER_ERROR_CB_ID = 0x04U,
/*   148 */    HAL_DMA_XFER_ABORT_CB_ID = 0x05U,
/*   149 */    HAL_DMA_XFER_ALL_CB_ID = 0x06U
/*   150 */ }HAL_DMA_CallbackIDTypeDef;
/*   155 */ typedef struct __DMA_HandleTypeDef
/*   156 */ {
/*   157 */    DMA_Stream_TypeDef *Instance;
/*   159 */    DMA_InitTypeDef Init;
/*   161 */    HAL_LockTypeDef Lock;
/*   163 */    volatile HAL_DMA_StateTypeDef State;
/*   165 */    void *Parent;
/*   167 */    void (* XferCpltCallback)( struct __DMA_HandleTypeDef * hdma);
/*   169 */    void (* XferHalfCpltCallback)( struct __DMA_HandleTypeDef * hdma);
/*   171 */    void (* XferM1CpltCallback)( struct __DMA_HandleTypeDef * hdma);
/*   173 */    void (* XferM1HalfCpltCallback)( struct __DMA_HandleTypeDef * hdma);
/*   175 */    void (* XferErrorCallback)( struct __DMA_HandleTypeDef * hdma);
/*   177 */    void (* XferAbortCallback)( struct __DMA_HandleTypeDef * hdma);
/*   179 */    volatile uint32_t ErrorCode;
/*   181 */    uint32_t StreamBaseAddress;
/*   183 */    uint32_t StreamIndex;
/*   185 */ }DMA_HandleTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dma_ex.h
 */
/*    64 */ typedef enum
/*    65 */ {
/*    66 */    MEMORY0 = 0x00U,
/*    67 */    MEMORY1 = 0x01U
/*    68 */ }HAL_DMA_MemoryTypeDef;
/*    86 */ HAL_StatusTypeDef HAL_DMAEx_MultiBufferStart(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t SecondMemAddress, uint32_t DataLength);
/*    87 */ HAL_StatusTypeDef HAL_DMAEx_MultiBufferStart_IT(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t SecondMemAddress, uint32_t DataLength);
/*    88 */ HAL_StatusTypeDef HAL_DMAEx_ChangeMemory(DMA_HandleTypeDef *hdma, uint32_t Address, HAL_DMA_MemoryTypeDef memory);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dma.h
 */
/*   669 */ HAL_StatusTypeDef HAL_DMA_Init(DMA_HandleTypeDef *hdma);
/*   670 */ HAL_StatusTypeDef HAL_DMA_DeInit(DMA_HandleTypeDef *hdma);
/*   679 */ HAL_StatusTypeDef HAL_DMA_Start (DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t DataLength);
/*   680 */ HAL_StatusTypeDef HAL_DMA_Start_IT(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t DataLength);
/*   681 */ HAL_StatusTypeDef HAL_DMA_Abort(DMA_HandleTypeDef *hdma);
/*   682 */ HAL_StatusTypeDef HAL_DMA_Abort_IT(DMA_HandleTypeDef *hdma);
/*   683 */ HAL_StatusTypeDef HAL_DMA_PollForTransfer(DMA_HandleTypeDef *hdma, HAL_DMA_LevelCompleteTypeDef CompleteLevel, uint32_t Timeout);
/*   684 */ void HAL_DMA_IRQHandler(DMA_HandleTypeDef *hdma);
/*   685 */ HAL_StatusTypeDef HAL_DMA_CleanCallbacks(DMA_HandleTypeDef *hdma);
/*   686 */ HAL_StatusTypeDef HAL_DMA_RegisterCallback(DMA_HandleTypeDef *hdma, HAL_DMA_CallbackIDTypeDef CallbackID, void (* pCallback)(DMA_HandleTypeDef *_hdma));
/*   687 */ HAL_StatusTypeDef HAL_DMA_UnRegisterCallback(DMA_HandleTypeDef *hdma, HAL_DMA_CallbackIDTypeDef CallbackID);
/*   697 */ HAL_DMA_StateTypeDef HAL_DMA_GetState(DMA_HandleTypeDef *hdma);
/*   698 */ uint32_t HAL_DMA_GetError(DMA_HandleTypeDef *hdma);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_cortex.h
 */
/*    64 */ typedef struct
/*    65 */ {
/*    66 */    unsigned char Enable;
/*    68 */    unsigned char Number;
/*    70 */    uint32_t BaseAddress;
/*    71 */    unsigned char Size;
/*    73 */    unsigned char SubRegionDisable;
/*    75 */    unsigned char TypeExtField;
/*    77 */    unsigned char AccessPermission;
/*    79 */    unsigned char DisableExec;
/*    81 */    unsigned char IsShareable;
/*    83 */    unsigned char IsCacheable;
/*    85 */    unsigned char IsBufferable;
/*    87 */ }MPU_Region_InitTypeDef;
/*   278 */ void HAL_NVIC_SetPriorityGrouping(uint32_t PriorityGroup);
/*   279 */ void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t PreemptPriority, uint32_t SubPriority);
/*   280 */ void HAL_NVIC_EnableIRQ(IRQn_Type IRQn);
/*   281 */ void HAL_NVIC_DisableIRQ(IRQn_Type IRQn);
/*   282 */ void HAL_NVIC_SystemReset(void);
/*   283 */ uint32_t HAL_SYSTICK_Config(uint32_t TicksNumb);
/*   292 */ uint32_t HAL_NVIC_GetPriorityGrouping(void);
/*   293 */ void HAL_NVIC_GetPriority(IRQn_Type IRQn, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority);
/*   294 */ uint32_t HAL_NVIC_GetPendingIRQ(IRQn_Type IRQn);
/*   295 */ void HAL_NVIC_SetPendingIRQ(IRQn_Type IRQn);
/*   296 */ void HAL_NVIC_ClearPendingIRQ(IRQn_Type IRQn);
/*   297 */ uint32_t HAL_NVIC_GetActive(IRQn_Type IRQn);
/*   298 */ void HAL_SYSTICK_CLKSourceConfig(uint32_t CLKSource);
/*   299 */ void HAL_SYSTICK_IRQHandler(void);
/*   300 */ void HAL_SYSTICK_Callback(void);
/*   303 */ void HAL_MPU_Enable(uint32_t MPU_Control);
/*   304 */ void HAL_MPU_Disable(void);
/*   305 */ void HAL_MPU_ConfigRegion(MPU_Region_InitTypeDef *MPU_Init);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_crc.h
 */
/*    64 */ typedef enum
/*    65 */ {
/*    66 */    HAL_CRC_STATE_RESET = 0x00U,
/*    67 */    HAL_CRC_STATE_READY = 0x01U,
/*    68 */    HAL_CRC_STATE_BUSY = 0x02U,
/*    69 */    HAL_CRC_STATE_TIMEOUT = 0x03U,
/*    70 */    HAL_CRC_STATE_ERROR = 0x04U
/*    72 */ }HAL_CRC_StateTypeDef;
/*    80 */ typedef struct
/*    81 */ {
/*    82 */    CRC_TypeDef *Instance;
/*    84 */    HAL_LockTypeDef Lock;
/*    86 */    volatile HAL_CRC_StateTypeDef State;
/*    88 */ }CRC_HandleTypeDef;
/*   142 */ HAL_StatusTypeDef HAL_CRC_Init(CRC_HandleTypeDef *hcrc);
/*   143 */ HAL_StatusTypeDef HAL_CRC_DeInit (CRC_HandleTypeDef *hcrc);
/*   144 */ void HAL_CRC_MspInit(CRC_HandleTypeDef *hcrc);
/*   145 */ void HAL_CRC_MspDeInit(CRC_HandleTypeDef *hcrc);
/*   153 */ uint32_t HAL_CRC_Accumulate(CRC_HandleTypeDef *hcrc, uint32_t pBuffer[], uint32_t BufferLength);
/*   154 */ uint32_t HAL_CRC_Calculate(CRC_HandleTypeDef *hcrc, uint32_t pBuffer[], uint32_t BufferLength);
/*   162 */ HAL_CRC_StateTypeDef HAL_CRC_GetState(CRC_HandleTypeDef *hcrc);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_flash.h
 */
/*    63 */ typedef enum
/*    64 */ {
/*    65 */    FLASH_PROC_NONE = 0U,
/*    66 */    FLASH_PROC_SECTERASE,
/*    67 */    FLASH_PROC_MASSERASE,
/*    68 */    FLASH_PROC_PROGRAM
/*    69 */ } FLASH_ProcedureTypeDef;
/*    74 */ typedef struct
/*    75 */ {
/*    76 */    volatile FLASH_ProcedureTypeDef ProcedureOnGoing;
/*    78 */    volatile uint32_t NbSectorsToErase;
/*    80 */    volatile unsigned char VoltageForErase;
/*    82 */    volatile uint32_t Sector;
/*    84 */    volatile uint32_t Bank;
/*    86 */    volatile uint32_t Address;
/*    88 */    HAL_LockTypeDef Lock;
/*    90 */    volatile uint32_t ErrorCode;
/*    92 */ }FLASH_ProcessTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_flash_ex.h
 */
/*    63 */ typedef struct
/*    64 */ {
/*    65 */    uint32_t TypeErase;
/*    68 */    uint32_t Banks;
/*    71 */    uint32_t Sector;
/*    74 */    uint32_t NbSectors;
/*    77 */    uint32_t VoltageRange
/*    78 */    ;
/*    80 */ } FLASH_EraseInitTypeDef;
/*    85 */ typedef struct
/*    86 */ {
/*    87 */    uint32_t OptionType;
/*    90 */    uint32_t WRPState;
/*    93 */    uint32_t WRPSector;
/*    96 */    uint32_t Banks;
/*    99 */    uint32_t RDPLevel;
/*   102 */    uint32_t BORLevel;
/*   105 */    unsigned char USERConfig;
/*   107 */ } FLASH_OBProgramInitTypeDef;
/*   743 */ HAL_StatusTypeDef HAL_FLASHEx_Erase(FLASH_EraseInitTypeDef *pEraseInit, uint32_t *SectorError);
/*   744 */ HAL_StatusTypeDef HAL_FLASHEx_Erase_IT(FLASH_EraseInitTypeDef *pEraseInit);
/*   745 */ HAL_StatusTypeDef HAL_FLASHEx_OBProgram(FLASH_OBProgramInitTypeDef *pOBInit);
/*   746 */ void HAL_FLASHEx_OBGetConfig(FLASH_OBProgramInitTypeDef *pOBInit);
/*  1062 */ void FLASH_Erase_Sector(uint32_t Sector, unsigned char VoltageRange);
/*  1063 */ void FLASH_FlushCaches(void);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_flash.h
 */
/*   324 */ HAL_StatusTypeDef HAL_FLASH_Program(uint32_t TypeProgram, uint32_t Address, uint64_t Data);
/*   325 */ HAL_StatusTypeDef HAL_FLASH_Program_IT(uint32_t TypeProgram, uint32_t Address, uint64_t Data);
/*   327 */ void HAL_FLASH_IRQHandler(void);
/*   329 */ void HAL_FLASH_EndOfOperationCallback(uint32_t ReturnValue);
/*   330 */ void HAL_FLASH_OperationErrorCallback(uint32_t ReturnValue);
/*   339 */ HAL_StatusTypeDef HAL_FLASH_Unlock(void);
/*   340 */ HAL_StatusTypeDef HAL_FLASH_Lock(void);
/*   341 */ HAL_StatusTypeDef HAL_FLASH_OB_Unlock(void);
/*   342 */ HAL_StatusTypeDef HAL_FLASH_OB_Lock(void);
/*   344 */ HAL_StatusTypeDef HAL_FLASH_OB_Launch(void);
/*   353 */ uint32_t HAL_FLASH_GetError(void);
/*   354 */ HAL_StatusTypeDef FLASH_WaitForLastOperation(uint32_t Timeout);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_ll_fsmc.h
 */
/*    65 */ typedef struct
/*    66 */ {
/*    67 */    uint32_t NSBank;
/*    70 */    uint32_t DataAddressMux;
/*    74 */    uint32_t MemoryType;
/*    78 */    uint32_t MemoryDataWidth;
/*    81 */    uint32_t BurstAccessMode;
/*    85 */    uint32_t WaitSignalPolarity;
/*    89 */    uint32_t WrapMode;
/*    94 */    uint32_t WaitSignalActive;
/*    99 */    uint32_t WriteOperation;
/*   102 */    uint32_t WaitSignal;
/*   106 */    uint32_t ExtendedMode;
/*   109 */    uint32_t AsynchronousWait;
/*   113 */    uint32_t WriteBurst;
/*   116 */    uint32_t ContinuousClock;
/*   122 */    uint32_t WriteFifo;
/*   128 */    uint32_t PageSize;
/*   130 */ }FSMC_NORSRAM_InitTypeDef;
/*   135 */ typedef struct
/*   136 */ {
/*   137 */    uint32_t AddressSetupTime;
/*   142 */    uint32_t AddressHoldTime;
/*   147 */    uint32_t DataSetupTime;
/*   153 */    uint32_t BusTurnAroundDuration;
/*   158 */    uint32_t CLKDivision;
/*   163 */    uint32_t DataLatency;
/*   171 */    uint32_t AccessMode;
/*   174 */ }FSMC_NORSRAM_TimingTypeDef;
/*   180 */ typedef struct
/*   181 */ {
/*   182 */    uint32_t NandBank;
/*   185 */    uint32_t Waitfeature;
/*   188 */    uint32_t MemoryDataWidth;
/*   191 */    uint32_t EccComputation;
/*   194 */    uint32_t ECCPageSize;
/*   197 */    uint32_t TCLRSetupTime;
/*   201 */    uint32_t TARSetupTime;
/*   205 */ }FSMC_NAND_InitTypeDef;
/*   210 */ typedef struct
/*   211 */ {
/*   212 */    uint32_t SetupTime;
/*   218 */    uint32_t WaitSetupTime;
/*   224 */    uint32_t HoldSetupTime;
/*   231 */    uint32_t HiZSetupTime;
/*   237 */ }FSMC_NAND_PCC_TimingTypeDef;
/*   242 */ typedef struct
/*   243 */ {
/*   244 */    uint32_t Waitfeature;
/*   247 */    uint32_t TCLRSetupTime;
/*   251 */    uint32_t TARSetupTime;
/*   255 */ }FSMC_PCCARD_InitTypeDef;
/*   963 */ HAL_StatusTypeDef FSMC_NORSRAM_Init(FSMC_Bank1_TypeDef *Device, FSMC_NORSRAM_InitTypeDef *Init);
/*   964 */ HAL_StatusTypeDef FSMC_NORSRAM_Timing_Init(FSMC_Bank1_TypeDef *Device, FSMC_NORSRAM_TimingTypeDef *Timing, uint32_t Bank);
/*   965 */ HAL_StatusTypeDef FSMC_NORSRAM_Extended_Timing_Init(FSMC_Bank1E_TypeDef *Device, FSMC_NORSRAM_TimingTypeDef *Timing, uint32_t Bank, uint32_t ExtendedMode);
/*   966 */ HAL_StatusTypeDef FSMC_NORSRAM_DeInit(FSMC_Bank1_TypeDef *Device, FSMC_Bank1E_TypeDef *ExDevice, uint32_t Bank);
/*   974 */ HAL_StatusTypeDef FSMC_NORSRAM_WriteOperation_Enable(FSMC_Bank1_TypeDef *Device, uint32_t Bank);
/*   975 */ HAL_StatusTypeDef FSMC_NORSRAM_WriteOperation_Disable(FSMC_Bank1_TypeDef *Device, uint32_t Bank);
/*   990 */ HAL_StatusTypeDef FSMC_NAND_Init(FSMC_Bank2_3_TypeDef *Device, FSMC_NAND_InitTypeDef *Init);
/*   991 */ HAL_StatusTypeDef FSMC_NAND_CommonSpace_Timing_Init(FSMC_Bank2_3_TypeDef *Device, FSMC_NAND_PCC_TimingTypeDef *Timing, uint32_t Bank);
/*   992 */ HAL_StatusTypeDef FSMC_NAND_AttributeSpace_Timing_Init(FSMC_Bank2_3_TypeDef *Device, FSMC_NAND_PCC_TimingTypeDef *Timing, uint32_t Bank);
/*   993 */ HAL_StatusTypeDef FSMC_NAND_DeInit(FSMC_Bank2_3_TypeDef *Device, uint32_t Bank);
/*  1001 */ HAL_StatusTypeDef FSMC_NAND_ECC_Enable(FSMC_Bank2_3_TypeDef *Device, uint32_t Bank);
/*  1002 */ HAL_StatusTypeDef FSMC_NAND_ECC_Disable(FSMC_Bank2_3_TypeDef *Device, uint32_t Bank);
/*  1003 */ HAL_StatusTypeDef FSMC_NAND_GetECC(FSMC_Bank2_3_TypeDef *Device, uint32_t *ECCval, uint32_t Bank, uint32_t Timeout);
/*  1017 */ HAL_StatusTypeDef FSMC_PCCARD_Init(FSMC_Bank4_TypeDef *Device, FSMC_PCCARD_InitTypeDef *Init);
/*  1018 */ HAL_StatusTypeDef FSMC_PCCARD_CommonSpace_Timing_Init(FSMC_Bank4_TypeDef *Device, FSMC_NAND_PCC_TimingTypeDef *Timing);
/*  1019 */ HAL_StatusTypeDef FSMC_PCCARD_AttributeSpace_Timing_Init(FSMC_Bank4_TypeDef *Device, FSMC_NAND_PCC_TimingTypeDef *Timing);
/*  1020 */ HAL_StatusTypeDef FSMC_PCCARD_IOSpace_Timing_Init(FSMC_Bank4_TypeDef *Device, FSMC_NAND_PCC_TimingTypeDef *Timing);
/*  1021 */ HAL_StatusTypeDef FSMC_PCCARD_DeInit(FSMC_Bank4_TypeDef *Device);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_sram.h
 */
/*    77 */ typedef enum
/*    78 */ {
/*    79 */    HAL_SRAM_STATE_RESET = 0x00U,
/*    80 */    HAL_SRAM_STATE_READY = 0x01U,
/*    81 */    HAL_SRAM_STATE_BUSY = 0x02U,
/*    82 */    HAL_SRAM_STATE_ERROR = 0x03U,
/*    83 */    HAL_SRAM_STATE_PROTECTED = 0x04U
/*    85 */ }HAL_SRAM_StateTypeDef;
/*    90 */ typedef struct
/*    91 */ {
/*    92 */    FSMC_Bank1_TypeDef *Instance;
/*    94 */    FSMC_Bank1E_TypeDef *Extended;
/*    96 */    FSMC_NORSRAM_InitTypeDef Init;
/*    98 */    HAL_LockTypeDef Lock;
/*   100 */    volatile HAL_SRAM_StateTypeDef State;
/*   102 */    DMA_HandleTypeDef *hdma;
/*   104 */ }SRAM_HandleTypeDef;
/*   135 */ HAL_StatusTypeDef HAL_SRAM_Init(SRAM_HandleTypeDef *hsram, FSMC_NORSRAM_TimingTypeDef *Timing, FSMC_NORSRAM_TimingTypeDef *ExtTiming);
/*   136 */ HAL_StatusTypeDef HAL_SRAM_DeInit(SRAM_HandleTypeDef *hsram);
/*   137 */ void HAL_SRAM_MspInit(SRAM_HandleTypeDef *hsram);
/*   138 */ void HAL_SRAM_MspDeInit(SRAM_HandleTypeDef *hsram);
/*   140 */ void HAL_SRAM_DMA_XferCpltCallback(DMA_HandleTypeDef *hdma);
/*   141 */ void HAL_SRAM_DMA_XferErrorCallback(DMA_HandleTypeDef *hdma);
/*   150 */ HAL_StatusTypeDef HAL_SRAM_Read_8b(SRAM_HandleTypeDef *hsram, uint32_t *pAddress, unsigned char *pDstBuffer, uint32_t BufferSize);
/*   151 */ HAL_StatusTypeDef HAL_SRAM_Write_8b(SRAM_HandleTypeDef *hsram, uint32_t *pAddress, unsigned char *pSrcBuffer, uint32_t BufferSize);
/*   152 */ HAL_StatusTypeDef HAL_SRAM_Read_16b(SRAM_HandleTypeDef *hsram, uint32_t *pAddress, unsigned short *pDstBuffer, uint32_t BufferSize);
/*   153 */ HAL_StatusTypeDef HAL_SRAM_Write_16b(SRAM_HandleTypeDef *hsram, uint32_t *pAddress, unsigned short *pSrcBuffer, uint32_t BufferSize);
/*   154 */ HAL_StatusTypeDef HAL_SRAM_Read_32b(SRAM_HandleTypeDef *hsram, uint32_t *pAddress, uint32_t *pDstBuffer, uint32_t BufferSize);
/*   155 */ HAL_StatusTypeDef HAL_SRAM_Write_32b(SRAM_HandleTypeDef *hsram, uint32_t *pAddress, uint32_t *pSrcBuffer, uint32_t BufferSize);
/*   156 */ HAL_StatusTypeDef HAL_SRAM_Read_DMA(SRAM_HandleTypeDef *hsram, uint32_t *pAddress, uint32_t *pDstBuffer, uint32_t BufferSize);
/*   157 */ HAL_StatusTypeDef HAL_SRAM_Write_DMA(SRAM_HandleTypeDef *hsram, uint32_t *pAddress, uint32_t *pSrcBuffer, uint32_t BufferSize);
/*   166 */ HAL_StatusTypeDef HAL_SRAM_WriteOperation_Enable(SRAM_HandleTypeDef *hsram);
/*   167 */ HAL_StatusTypeDef HAL_SRAM_WriteOperation_Disable(SRAM_HandleTypeDef *hsram);
/*   176 */ HAL_SRAM_StateTypeDef HAL_SRAM_GetState(SRAM_HandleTypeDef *hsram);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2c.h
 */
/*    63 */ typedef struct
/*    64 */ {
/*    65 */    uint32_t ClockSpeed;
/*    68 */    uint32_t DutyCycle;
/*    71 */    uint32_t OwnAddress1;
/*    74 */    uint32_t AddressingMode;
/*    77 */    uint32_t DualAddressMode;
/*    80 */    uint32_t OwnAddress2;
/*    83 */    uint32_t GeneralCallMode;
/*    86 */    uint32_t NoStretchMode;
/*    89 */ }I2C_InitTypeDef;
/*   117 */ typedef enum
/*   118 */ {
/*   119 */    HAL_I2C_STATE_RESET = 0x00U,
/*   120 */    HAL_I2C_STATE_READY = 0x20U,
/*   121 */    HAL_I2C_STATE_BUSY = 0x24U,
/*   122 */    HAL_I2C_STATE_BUSY_TX = 0x21U,
/*   123 */    HAL_I2C_STATE_BUSY_RX = 0x22U,
/*   124 */    HAL_I2C_STATE_LISTEN = 0x28U,
/*   125 */    HAL_I2C_STATE_BUSY_TX_LISTEN = 0x29U,
/*   127 */    HAL_I2C_STATE_BUSY_RX_LISTEN = 0x2AU,
/*   129 */    HAL_I2C_STATE_ABORT = 0x60U,
/*   130 */    HAL_I2C_STATE_TIMEOUT = 0xA0U,
/*   131 */    HAL_I2C_STATE_ERROR = 0xE0U
/*   133 */ }HAL_I2C_StateTypeDef;
/*   152 */ typedef enum
/*   153 */ {
/*   154 */    HAL_I2C_MODE_NONE = 0x00U,
/*   155 */    HAL_I2C_MODE_MASTER = 0x10U,
/*   156 */    HAL_I2C_MODE_SLAVE = 0x20U,
/*   157 */    HAL_I2C_MODE_MEM = 0x40U
/*   159 */ }HAL_I2C_ModeTypeDef;
/*   164 */ typedef struct
/*   165 */ {
/*   166 */    I2C_TypeDef *Instance;
/*   168 */    I2C_InitTypeDef Init;
/*   170 */    unsigned char *pBuffPtr;
/*   172 */    unsigned short XferSize;
/*   174 */    volatile unsigned short XferCount;
/*   176 */    volatile uint32_t XferOptions;
/*   178 */    volatile uint32_t PreviousState;
/*   181 */    DMA_HandleTypeDef *hdmatx;
/*   183 */    DMA_HandleTypeDef *hdmarx;
/*   185 */    HAL_LockTypeDef Lock;
/*   187 */    volatile HAL_I2C_StateTypeDef State;
/*   189 */    volatile HAL_I2C_ModeTypeDef Mode;
/*   191 */    volatile uint32_t ErrorCode;
/*   193 */    volatile uint32_t Devaddress;
/*   195 */    volatile uint32_t Memaddress;
/*   197 */    volatile uint32_t MemaddSize;
/*   199 */    volatile uint32_t EventCount;
/*   201 */ }I2C_HandleTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2c.h
 */
/*   484 */ HAL_StatusTypeDef HAL_I2C_Init(I2C_HandleTypeDef *hi2c);
/*   485 */ HAL_StatusTypeDef HAL_I2C_DeInit (I2C_HandleTypeDef *hi2c);
/*   486 */ void HAL_I2C_MspInit(I2C_HandleTypeDef *hi2c);
/*   487 */ void HAL_I2C_MspDeInit(I2C_HandleTypeDef *hi2c);
/*   497 */ HAL_StatusTypeDef HAL_I2C_Master_Transmit(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   498 */ HAL_StatusTypeDef HAL_I2C_Master_Receive(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   499 */ HAL_StatusTypeDef HAL_I2C_Slave_Transmit(I2C_HandleTypeDef *hi2c, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   500 */ HAL_StatusTypeDef HAL_I2C_Slave_Receive(I2C_HandleTypeDef *hi2c, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   501 */ HAL_StatusTypeDef HAL_I2C_Mem_Write(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned short MemAddress, unsigned short MemAddSize, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   502 */ HAL_StatusTypeDef HAL_I2C_Mem_Read(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned short MemAddress, unsigned short MemAddSize, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   503 */ HAL_StatusTypeDef HAL_I2C_IsDeviceReady(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, uint32_t Trials, uint32_t Timeout);
/*   506 */ HAL_StatusTypeDef HAL_I2C_Master_Transmit_IT(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned char *pData, unsigned short Size);
/*   507 */ HAL_StatusTypeDef HAL_I2C_Master_Receive_IT(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned char *pData, unsigned short Size);
/*   508 */ HAL_StatusTypeDef HAL_I2C_Slave_Transmit_IT(I2C_HandleTypeDef *hi2c, unsigned char *pData, unsigned short Size);
/*   509 */ HAL_StatusTypeDef HAL_I2C_Slave_Receive_IT(I2C_HandleTypeDef *hi2c, unsigned char *pData, unsigned short Size);
/*   510 */ HAL_StatusTypeDef HAL_I2C_Mem_Write_IT(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned short MemAddress, unsigned short MemAddSize, unsigned char *pData, unsigned short Size);
/*   511 */ HAL_StatusTypeDef HAL_I2C_Mem_Read_IT(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned short MemAddress, unsigned short MemAddSize, unsigned char *pData, unsigned short Size);
/*   513 */ HAL_StatusTypeDef HAL_I2C_Master_Sequential_Transmit_IT(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned char *pData, unsigned short Size, uint32_t XferOptions);
/*   514 */ HAL_StatusTypeDef HAL_I2C_Master_Sequential_Receive_IT(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned char *pData, unsigned short Size, uint32_t XferOptions);
/*   515 */ HAL_StatusTypeDef HAL_I2C_Slave_Sequential_Transmit_IT(I2C_HandleTypeDef *hi2c, unsigned char *pData, unsigned short Size, uint32_t XferOptions);
/*   516 */ HAL_StatusTypeDef HAL_I2C_Slave_Sequential_Receive_IT(I2C_HandleTypeDef *hi2c, unsigned char *pData, unsigned short Size, uint32_t XferOptions);
/*   517 */ HAL_StatusTypeDef HAL_I2C_Master_Abort_IT(I2C_HandleTypeDef *hi2c, unsigned short DevAddress);
/*   518 */ HAL_StatusTypeDef HAL_I2C_EnableListen_IT(I2C_HandleTypeDef *hi2c);
/*   519 */ HAL_StatusTypeDef HAL_I2C_DisableListen_IT(I2C_HandleTypeDef *hi2c);
/*   522 */ HAL_StatusTypeDef HAL_I2C_Master_Transmit_DMA(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned char *pData, unsigned short Size);
/*   523 */ HAL_StatusTypeDef HAL_I2C_Master_Receive_DMA(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned char *pData, unsigned short Size);
/*   524 */ HAL_StatusTypeDef HAL_I2C_Slave_Transmit_DMA(I2C_HandleTypeDef *hi2c, unsigned char *pData, unsigned short Size);
/*   525 */ HAL_StatusTypeDef HAL_I2C_Slave_Receive_DMA(I2C_HandleTypeDef *hi2c, unsigned char *pData, unsigned short Size);
/*   526 */ HAL_StatusTypeDef HAL_I2C_Mem_Write_DMA(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned short MemAddress, unsigned short MemAddSize, unsigned char *pData, unsigned short Size);
/*   527 */ HAL_StatusTypeDef HAL_I2C_Mem_Read_DMA(I2C_HandleTypeDef *hi2c, unsigned short DevAddress, unsigned short MemAddress, unsigned short MemAddSize, unsigned char *pData, unsigned short Size);
/*   530 */ void HAL_I2C_EV_IRQHandler(I2C_HandleTypeDef *hi2c);
/*   531 */ void HAL_I2C_ER_IRQHandler(I2C_HandleTypeDef *hi2c);
/*   532 */ void HAL_I2C_MasterTxCpltCallback(I2C_HandleTypeDef *hi2c);
/*   533 */ void HAL_I2C_MasterRxCpltCallback(I2C_HandleTypeDef *hi2c);
/*   534 */ void HAL_I2C_SlaveTxCpltCallback(I2C_HandleTypeDef *hi2c);
/*   535 */ void HAL_I2C_SlaveRxCpltCallback(I2C_HandleTypeDef *hi2c);
/*   536 */ void HAL_I2C_AddrCallback(I2C_HandleTypeDef *hi2c, unsigned char TransferDirection, unsigned short AddrMatchCode);
/*   537 */ void HAL_I2C_ListenCpltCallback(I2C_HandleTypeDef *hi2c);
/*   538 */ void HAL_I2C_MemTxCpltCallback(I2C_HandleTypeDef *hi2c);
/*   539 */ void HAL_I2C_MemRxCpltCallback(I2C_HandleTypeDef *hi2c);
/*   540 */ void HAL_I2C_ErrorCallback(I2C_HandleTypeDef *hi2c);
/*   541 */ void HAL_I2C_AbortCpltCallback(I2C_HandleTypeDef *hi2c);
/*   550 */ HAL_I2C_StateTypeDef HAL_I2C_GetState(I2C_HandleTypeDef *hi2c);
/*   551 */ HAL_I2C_ModeTypeDef HAL_I2C_GetMode(I2C_HandleTypeDef *hi2c);
/*   552 */ uint32_t HAL_I2C_GetError(I2C_HandleTypeDef *hi2c);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pwr.h
 */
/*    64 */ typedef struct
/*    65 */ {
/*    66 */    uint32_t PVDLevel;
/*    69 */    uint32_t Mode;
/*    71 */ }PWR_PVDTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pwr_ex.h
 */
/*   221 */ void HAL_PWREx_EnableFlashPowerDown(void);
/*   222 */ void HAL_PWREx_DisableFlashPowerDown(void);
/*   223 */ HAL_StatusTypeDef HAL_PWREx_EnableBkUpReg(void);
/*   224 */ HAL_StatusTypeDef HAL_PWREx_DisableBkUpReg(void);
/*   225 */ uint32_t HAL_PWREx_GetVoltageRange(void);
/*   226 */ HAL_StatusTypeDef HAL_PWREx_ControlVoltageScaling(uint32_t VoltageScaling);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pwr.h
 */
/*   301 */ void HAL_PWR_DeInit(void);
/*   302 */ void HAL_PWR_EnableBkUpAccess(void);
/*   303 */ void HAL_PWR_DisableBkUpAccess(void);
/*   313 */ void HAL_PWR_ConfigPVD(PWR_PVDTypeDef *sConfigPVD);
/*   314 */ void HAL_PWR_EnablePVD(void);
/*   315 */ void HAL_PWR_DisablePVD(void);
/*   318 */ void HAL_PWR_EnableWakeUpPin(uint32_t WakeUpPinx);
/*   319 */ void HAL_PWR_DisableWakeUpPin(uint32_t WakeUpPinx);
/*   322 */ void HAL_PWR_EnterSTOPMode(uint32_t Regulator, unsigned char STOPEntry);
/*   323 */ void HAL_PWR_EnterSLEEPMode(uint32_t Regulator, unsigned char SLEEPEntry);
/*   324 */ void HAL_PWR_EnterSTANDBYMode(void);
/*   327 */ void HAL_PWR_PVD_IRQHandler(void);
/*   328 */ void HAL_PWR_PVDCallback(void);
/*   331 */ void HAL_PWR_EnableSleepOnExit(void);
/*   332 */ void HAL_PWR_DisableSleepOnExit(void);
/*   333 */ void HAL_PWR_EnableSEVOnPend(void);
/*   334 */ void HAL_PWR_DisableSEVOnPend(void);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rtc.h
 */
/*    63 */ typedef enum
/*    64 */ {
/*    65 */    HAL_RTC_STATE_RESET = 0x00U,
/*    66 */    HAL_RTC_STATE_READY = 0x01U,
/*    67 */    HAL_RTC_STATE_BUSY = 0x02U,
/*    68 */    HAL_RTC_STATE_TIMEOUT = 0x03U,
/*    69 */    HAL_RTC_STATE_ERROR = 0x04U
/*    70 */ }HAL_RTCStateTypeDef;
/*    75 */ typedef struct
/*    76 */ {
/*    77 */    uint32_t HourFormat;
/*    80 */    uint32_t AsynchPrediv;
/*    83 */    uint32_t SynchPrediv;
/*    86 */    uint32_t OutPut;
/*    89 */    uint32_t OutPutPolarity;
/*    92 */    uint32_t OutPutType;
/*    94 */ }RTC_InitTypeDef;
/*    99 */ typedef struct
/*   100 */ {
/*   101 */    unsigned char Hours;
/*   105 */    unsigned char Minutes;
/*   108 */    unsigned char Seconds;
/*   111 */    unsigned char TimeFormat;
/*   114 */    uint32_t SubSeconds;
/*   118 */    uint32_t SecondFraction;
/*   124 */    uint32_t DayLightSaving;
/*   127 */    uint32_t StoreOperation;
/*   130 */ }RTC_TimeTypeDef;
/*   135 */ typedef struct
/*   136 */ {
/*   137 */    unsigned char WeekDay;
/*   140 */    unsigned char Month;
/*   143 */    unsigned char Date;
/*   146 */    unsigned char Year;
/*   149 */ }RTC_DateTypeDef;
/*   154 */ typedef struct
/*   155 */ {
/*   156 */    RTC_TimeTypeDef AlarmTime;
/*   158 */    uint32_t AlarmMask;
/*   161 */    uint32_t AlarmSubSecondMask;
/*   164 */    uint32_t AlarmDateWeekDaySel;
/*   167 */    unsigned char AlarmDateWeekDay;
/*   171 */    uint32_t Alarm;
/*   173 */ }RTC_AlarmTypeDef;
/*   178 */ typedef struct
/*   179 */ {
/*   180 */    RTC_TypeDef *Instance;
/*   182 */    RTC_InitTypeDef Init;
/*   184 */    HAL_LockTypeDef Lock;
/*   186 */    volatile HAL_RTCStateTypeDef State;
/*   188 */ }RTC_HandleTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rtc_ex.h
 */
/*    63 */ typedef struct
/*    64 */ {
/*    65 */    uint32_t Tamper;
/*    68 */    uint32_t PinSelection;
/*    71 */    uint32_t Trigger;
/*    74 */    uint32_t Filter;
/*    77 */    uint32_t SamplingFrequency;
/*    80 */    uint32_t PrechargeDuration;
/*    83 */    uint32_t TamperPullUp;
/*    86 */    uint32_t TimeStampOnTamperDetection;
/*    88 */ }RTC_TamperTypeDef;
/*   824 */ HAL_StatusTypeDef HAL_RTCEx_SetTimeStamp(RTC_HandleTypeDef *hrtc, uint32_t TimeStampEdge, uint32_t RTC_TimeStampPin);
/*   825 */ HAL_StatusTypeDef HAL_RTCEx_SetTimeStamp_IT(RTC_HandleTypeDef *hrtc, uint32_t TimeStampEdge, uint32_t RTC_TimeStampPin);
/*   826 */ HAL_StatusTypeDef HAL_RTCEx_DeactivateTimeStamp(RTC_HandleTypeDef *hrtc);
/*   827 */ HAL_StatusTypeDef HAL_RTCEx_GetTimeStamp(RTC_HandleTypeDef *hrtc, RTC_TimeTypeDef *sTimeStamp, RTC_DateTypeDef *sTimeStampDate, uint32_t Format);
/*   829 */ HAL_StatusTypeDef HAL_RTCEx_SetTamper(RTC_HandleTypeDef *hrtc, RTC_TamperTypeDef* sTamper);
/*   830 */ HAL_StatusTypeDef HAL_RTCEx_SetTamper_IT(RTC_HandleTypeDef *hrtc, RTC_TamperTypeDef* sTamper);
/*   831 */ HAL_StatusTypeDef HAL_RTCEx_DeactivateTamper(RTC_HandleTypeDef *hrtc, uint32_t Tamper);
/*   832 */ void HAL_RTCEx_TamperTimeStampIRQHandler(RTC_HandleTypeDef *hrtc);
/*   834 */ void HAL_RTCEx_Tamper1EventCallback(RTC_HandleTypeDef *hrtc);
/*   835 */ void HAL_RTCEx_Tamper2EventCallback(RTC_HandleTypeDef *hrtc);
/*   836 */ void HAL_RTCEx_TimeStampEventCallback(RTC_HandleTypeDef *hrtc);
/*   837 */ HAL_StatusTypeDef HAL_RTCEx_PollForTimeStampEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
/*   838 */ HAL_StatusTypeDef HAL_RTCEx_PollForTamper1Event(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
/*   839 */ HAL_StatusTypeDef HAL_RTCEx_PollForTamper2Event(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
/*   848 */ HAL_StatusTypeDef HAL_RTCEx_SetWakeUpTimer(RTC_HandleTypeDef *hrtc, uint32_t WakeUpCounter, uint32_t WakeUpClock);
/*   849 */ HAL_StatusTypeDef HAL_RTCEx_SetWakeUpTimer_IT(RTC_HandleTypeDef *hrtc, uint32_t WakeUpCounter, uint32_t WakeUpClock);
/*   850 */ uint32_t HAL_RTCEx_DeactivateWakeUpTimer(RTC_HandleTypeDef *hrtc);
/*   851 */ uint32_t HAL_RTCEx_GetWakeUpTimer(RTC_HandleTypeDef *hrtc);
/*   852 */ void HAL_RTCEx_WakeUpTimerIRQHandler(RTC_HandleTypeDef *hrtc);
/*   853 */ void HAL_RTCEx_WakeUpTimerEventCallback(RTC_HandleTypeDef *hrtc);
/*   854 */ HAL_StatusTypeDef HAL_RTCEx_PollForWakeUpTimerEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
/*   863 */ void HAL_RTCEx_BKUPWrite(RTC_HandleTypeDef *hrtc, uint32_t BackupRegister, uint32_t Data);
/*   864 */ uint32_t HAL_RTCEx_BKUPRead(RTC_HandleTypeDef *hrtc, uint32_t BackupRegister);
/*   866 */ HAL_StatusTypeDef HAL_RTCEx_SetCoarseCalib(RTC_HandleTypeDef *hrtc, uint32_t CalibSign, uint32_t Value);
/*   867 */ HAL_StatusTypeDef HAL_RTCEx_DeactivateCoarseCalib(RTC_HandleTypeDef *hrtc);
/*   868 */ HAL_StatusTypeDef HAL_RTCEx_SetSmoothCalib(RTC_HandleTypeDef *hrtc, uint32_t SmoothCalibPeriod, uint32_t SmoothCalibPlusPulses, uint32_t SmouthCalibMinusPulsesValue);
/*   869 */ HAL_StatusTypeDef HAL_RTCEx_SetSynchroShift(RTC_HandleTypeDef *hrtc, uint32_t ShiftAdd1S, uint32_t ShiftSubFS);
/*   870 */ HAL_StatusTypeDef HAL_RTCEx_SetCalibrationOutPut(RTC_HandleTypeDef *hrtc, uint32_t CalibOutput);
/*   871 */ HAL_StatusTypeDef HAL_RTCEx_DeactivateCalibrationOutPut(RTC_HandleTypeDef *hrtc);
/*   872 */ HAL_StatusTypeDef HAL_RTCEx_SetRefClock(RTC_HandleTypeDef *hrtc);
/*   873 */ HAL_StatusTypeDef HAL_RTCEx_DeactivateRefClock(RTC_HandleTypeDef *hrtc);
/*   874 */ HAL_StatusTypeDef HAL_RTCEx_EnableBypassShadow(RTC_HandleTypeDef *hrtc);
/*   875 */ HAL_StatusTypeDef HAL_RTCEx_DisableBypassShadow(RTC_HandleTypeDef *hrtc);
/*   884 */ void HAL_RTCEx_AlarmBEventCallback(RTC_HandleTypeDef *hrtc);
/*   885 */ HAL_StatusTypeDef HAL_RTCEx_PollForAlarmBEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rtc.h
 */
/*   645 */ HAL_StatusTypeDef HAL_RTC_Init(RTC_HandleTypeDef *hrtc);
/*   646 */ HAL_StatusTypeDef HAL_RTC_DeInit(RTC_HandleTypeDef *hrtc);
/*   647 */ void HAL_RTC_MspInit(RTC_HandleTypeDef *hrtc);
/*   648 */ void HAL_RTC_MspDeInit(RTC_HandleTypeDef *hrtc);
/*   657 */ HAL_StatusTypeDef HAL_RTC_SetTime(RTC_HandleTypeDef *hrtc, RTC_TimeTypeDef *sTime, uint32_t Format);
/*   658 */ HAL_StatusTypeDef HAL_RTC_GetTime(RTC_HandleTypeDef *hrtc, RTC_TimeTypeDef *sTime, uint32_t Format);
/*   659 */ HAL_StatusTypeDef HAL_RTC_SetDate(RTC_HandleTypeDef *hrtc, RTC_DateTypeDef *sDate, uint32_t Format);
/*   660 */ HAL_StatusTypeDef HAL_RTC_GetDate(RTC_HandleTypeDef *hrtc, RTC_DateTypeDef *sDate, uint32_t Format);
/*   669 */ HAL_StatusTypeDef HAL_RTC_SetAlarm(RTC_HandleTypeDef *hrtc, RTC_AlarmTypeDef *sAlarm, uint32_t Format);
/*   670 */ HAL_StatusTypeDef HAL_RTC_SetAlarm_IT(RTC_HandleTypeDef *hrtc, RTC_AlarmTypeDef *sAlarm, uint32_t Format);
/*   671 */ HAL_StatusTypeDef HAL_RTC_DeactivateAlarm(RTC_HandleTypeDef *hrtc, uint32_t Alarm);
/*   672 */ HAL_StatusTypeDef HAL_RTC_GetAlarm(RTC_HandleTypeDef *hrtc, RTC_AlarmTypeDef *sAlarm, uint32_t Alarm, uint32_t Format);
/*   673 */ void HAL_RTC_AlarmIRQHandler(RTC_HandleTypeDef *hrtc);
/*   674 */ HAL_StatusTypeDef HAL_RTC_PollForAlarmAEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
/*   675 */ void HAL_RTC_AlarmAEventCallback(RTC_HandleTypeDef *hrtc);
/*   684 */ HAL_StatusTypeDef HAL_RTC_WaitForSynchro(RTC_HandleTypeDef* hrtc);
/*   693 */ HAL_RTCStateTypeDef HAL_RTC_GetState(RTC_HandleTypeDef *hrtc);
/*   810 */ HAL_StatusTypeDef RTC_EnterInitMode(RTC_HandleTypeDef* hrtc);
/*   811 */ unsigned char RTC_ByteToBcd2(unsigned char Value);
/*   812 */ unsigned char RTC_Bcd2ToByte(unsigned char Value);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_spi.h
 */
/*    63 */ typedef struct
/*    64 */ {
/*    65 */    uint32_t Mode;
/*    68 */    uint32_t Direction;
/*    71 */    uint32_t DataSize;
/*    74 */    uint32_t CLKPolarity;
/*    77 */    uint32_t CLKPhase;
/*    80 */    uint32_t NSS;
/*    84 */    uint32_t BaudRatePrescaler;
/*    90 */    uint32_t FirstBit;
/*    93 */    uint32_t TIMode;
/*    96 */    uint32_t CRCCalculation;
/*    99 */    uint32_t CRCPolynomial;
/*   101 */ }SPI_InitTypeDef;
/*   106 */ typedef enum
/*   107 */ {
/*   108 */    HAL_SPI_STATE_RESET = 0x00U,
/*   109 */    HAL_SPI_STATE_READY = 0x01U,
/*   110 */    HAL_SPI_STATE_BUSY = 0x02U,
/*   111 */    HAL_SPI_STATE_BUSY_TX = 0x03U,
/*   112 */    HAL_SPI_STATE_BUSY_RX = 0x04U,
/*   113 */    HAL_SPI_STATE_BUSY_TX_RX = 0x05U,
/*   114 */    HAL_SPI_STATE_ERROR = 0x06U
/*   115 */ }HAL_SPI_StateTypeDef;
/*   120 */ typedef struct __SPI_HandleTypeDef
/*   121 */ {
/*   122 */    SPI_TypeDef *Instance;
/*   124 */    SPI_InitTypeDef Init;
/*   126 */    unsigned char *pTxBuffPtr;
/*   128 */    unsigned short TxXferSize;
/*   130 */    volatile unsigned short TxXferCount;
/*   132 */    unsigned char *pRxBuffPtr;
/*   134 */    unsigned short RxXferSize;
/*   136 */    volatile unsigned short RxXferCount;
/*   138 */    void (*RxISR)(struct __SPI_HandleTypeDef * hspi);
/*   140 */    void (*TxISR)(struct __SPI_HandleTypeDef * hspi);
/*   142 */    DMA_HandleTypeDef *hdmatx;
/*   144 */    DMA_HandleTypeDef *hdmarx;
/*   146 */    HAL_LockTypeDef Lock;
/*   148 */    volatile HAL_SPI_StateTypeDef State;
/*   150 */    volatile uint32_t ErrorCode;
/*   152 */ }SPI_HandleTypeDef;
/*   427 */ HAL_StatusTypeDef HAL_SPI_Init(SPI_HandleTypeDef *hspi);
/*   428 */ HAL_StatusTypeDef HAL_SPI_DeInit (SPI_HandleTypeDef *hspi);
/*   429 */ void HAL_SPI_MspInit(SPI_HandleTypeDef *hspi);
/*   430 */ void HAL_SPI_MspDeInit(SPI_HandleTypeDef *hspi);
/*   439 */ HAL_StatusTypeDef HAL_SPI_Transmit(SPI_HandleTypeDef *hspi, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   440 */ HAL_StatusTypeDef HAL_SPI_Receive(SPI_HandleTypeDef *hspi, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   441 */ HAL_StatusTypeDef HAL_SPI_TransmitReceive(SPI_HandleTypeDef *hspi, unsigned char *pTxData, unsigned char *pRxData, unsigned short Size, uint32_t Timeout);
/*   442 */ HAL_StatusTypeDef HAL_SPI_Transmit_IT(SPI_HandleTypeDef *hspi, unsigned char *pData, unsigned short Size);
/*   443 */ HAL_StatusTypeDef HAL_SPI_Receive_IT(SPI_HandleTypeDef *hspi, unsigned char *pData, unsigned short Size);
/*   444 */ HAL_StatusTypeDef HAL_SPI_TransmitReceive_IT(SPI_HandleTypeDef *hspi, unsigned char *pTxData, unsigned char *pRxData, unsigned short Size);
/*   445 */ HAL_StatusTypeDef HAL_SPI_Transmit_DMA(SPI_HandleTypeDef *hspi, unsigned char *pData, unsigned short Size);
/*   446 */ HAL_StatusTypeDef HAL_SPI_Receive_DMA(SPI_HandleTypeDef *hspi, unsigned char *pData, unsigned short Size);
/*   447 */ HAL_StatusTypeDef HAL_SPI_TransmitReceive_DMA(SPI_HandleTypeDef *hspi, unsigned char *pTxData, unsigned char *pRxData, unsigned short Size);
/*   448 */ HAL_StatusTypeDef HAL_SPI_DMAPause(SPI_HandleTypeDef *hspi);
/*   449 */ HAL_StatusTypeDef HAL_SPI_DMAResume(SPI_HandleTypeDef *hspi);
/*   450 */ HAL_StatusTypeDef HAL_SPI_DMAStop(SPI_HandleTypeDef *hspi);
/*   452 */ HAL_StatusTypeDef HAL_SPI_Abort(SPI_HandleTypeDef *hspi);
/*   453 */ HAL_StatusTypeDef HAL_SPI_Abort_IT(SPI_HandleTypeDef *hspi);
/*   455 */ void HAL_SPI_IRQHandler(SPI_HandleTypeDef *hspi);
/*   456 */ void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi);
/*   457 */ void HAL_SPI_RxCpltCallback(SPI_HandleTypeDef *hspi);
/*   458 */ void HAL_SPI_TxRxCpltCallback(SPI_HandleTypeDef *hspi);
/*   459 */ void HAL_SPI_TxHalfCpltCallback(SPI_HandleTypeDef *hspi);
/*   460 */ void HAL_SPI_RxHalfCpltCallback(SPI_HandleTypeDef *hspi);
/*   461 */ void HAL_SPI_TxRxHalfCpltCallback(SPI_HandleTypeDef *hspi);
/*   462 */ void HAL_SPI_ErrorCallback(SPI_HandleTypeDef *hspi);
/*   463 */ void HAL_SPI_AbortCpltCallback(SPI_HandleTypeDef *hspi);
/*   472 */ HAL_SPI_StateTypeDef HAL_SPI_GetState(SPI_HandleTypeDef *hspi);
/*   473 */ uint32_t HAL_SPI_GetError(SPI_HandleTypeDef *hspi);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_tim.h
 */
/*    63 */ typedef struct
/*    64 */ {
/*    65 */    uint32_t Prescaler;
/*    68 */    uint32_t CounterMode;
/*    71 */    uint32_t Period;
/*    75 */    uint32_t ClockDivision;
/*    78 */    uint32_t RepetitionCounter;
/*    86 */ } TIM_Base_InitTypeDef;
/*    92 */ typedef struct
/*    93 */ {
/*    94 */    uint32_t OCMode;
/*    97 */    uint32_t Pulse;
/*   100 */    uint32_t OCPolarity;
/*   103 */    uint32_t OCNPolarity;
/*   107 */    uint32_t OCFastMode;
/*   112 */    uint32_t OCIdleState;
/*   116 */    uint32_t OCNIdleState;
/*   119 */ } TIM_OC_InitTypeDef;
/*   124 */ typedef struct
/*   125 */ {
/*   126 */    uint32_t OCMode;
/*   129 */    uint32_t Pulse;
/*   132 */    uint32_t OCPolarity;
/*   135 */    uint32_t OCNPolarity;
/*   139 */    uint32_t OCIdleState;
/*   143 */    uint32_t OCNIdleState;
/*   147 */    uint32_t ICPolarity;
/*   150 */    uint32_t ICSelection;
/*   153 */    uint32_t ICFilter;
/*   155 */ } TIM_OnePulse_InitTypeDef;
/*   162 */ typedef struct
/*   163 */ {
/*   164 */    uint32_t ICPolarity;
/*   167 */    uint32_t ICSelection;
/*   170 */    uint32_t ICPrescaler;
/*   173 */    uint32_t ICFilter;
/*   175 */ } TIM_IC_InitTypeDef;
/*   181 */ typedef struct
/*   182 */ {
/*   183 */    uint32_t EncoderMode;
/*   186 */    uint32_t IC1Polarity;
/*   189 */    uint32_t IC1Selection;
/*   192 */    uint32_t IC1Prescaler;
/*   195 */    uint32_t IC1Filter;
/*   198 */    uint32_t IC2Polarity;
/*   201 */    uint32_t IC2Selection;
/*   204 */    uint32_t IC2Prescaler;
/*   207 */    uint32_t IC2Filter;
/*   209 */ } TIM_Encoder_InitTypeDef;
/*   214 */ typedef struct
/*   215 */ {
/*   216 */    uint32_t ClockSource;
/*   218 */    uint32_t ClockPolarity;
/*   220 */    uint32_t ClockPrescaler;
/*   222 */    uint32_t ClockFilter;
/*   224 */ }TIM_ClockConfigTypeDef;
/*   229 */ typedef struct
/*   230 */ {
/*   231 */    uint32_t ClearInputState;
/*   233 */    uint32_t ClearInputSource;
/*   235 */    uint32_t ClearInputPolarity;
/*   237 */    uint32_t ClearInputPrescaler;
/*   239 */    uint32_t ClearInputFilter;
/*   241 */ }TIM_ClearInputConfigTypeDef;
/*   246 */ typedef struct {
/*   247 */    uint32_t SlaveMode;
/*   249 */    uint32_t InputTrigger;
/*   251 */    uint32_t TriggerPolarity;
/*   253 */    uint32_t TriggerPrescaler;
/*   255 */    uint32_t TriggerFilter;
/*   258 */ }TIM_SlaveConfigTypeDef;
/*   263 */ typedef enum
/*   264 */ {
/*   265 */    HAL_TIM_STATE_RESET = 0x00U,
/*   266 */    HAL_TIM_STATE_READY = 0x01U,
/*   267 */    HAL_TIM_STATE_BUSY = 0x02U,
/*   268 */    HAL_TIM_STATE_TIMEOUT = 0x03U,
/*   269 */    HAL_TIM_STATE_ERROR = 0x04U
/*   270 */ }HAL_TIM_StateTypeDef;
/*   275 */ typedef enum
/*   276 */ {
/*   277 */    HAL_TIM_ACTIVE_CHANNEL_1 = 0x01U,
/*   278 */    HAL_TIM_ACTIVE_CHANNEL_2 = 0x02U,
/*   279 */    HAL_TIM_ACTIVE_CHANNEL_3 = 0x04U,
/*   280 */    HAL_TIM_ACTIVE_CHANNEL_4 = 0x08U,
/*   281 */    HAL_TIM_ACTIVE_CHANNEL_CLEARED = 0x00U
/*   282 */ }HAL_TIM_ActiveChannel;
/*   287 */ typedef struct
/*   288 */ {
/*   289 */    TIM_TypeDef *Instance;
/*   290 */    TIM_Base_InitTypeDef Init;
/*   291 */    HAL_TIM_ActiveChannel Channel;
/*   292 */    DMA_HandleTypeDef *hdma[7];
/*   294 */    HAL_LockTypeDef Lock;
/*   295 */    volatile HAL_TIM_StateTypeDef State;
/*   296 */ }TIM_HandleTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_tim_ex.h
 */
/*    64 */ typedef struct
/*    65 */ {
/*    67 */    uint32_t IC1Polarity;
/*    70 */    uint32_t IC1Prescaler;
/*    73 */    uint32_t IC1Filter;
/*    76 */    uint32_t Commutation_Delay;
/*    78 */ } TIM_HallSensor_InitTypeDef;
/*    83 */ typedef struct {
/*    84 */    uint32_t MasterOutputTrigger;
/*    87 */    uint32_t MasterSlaveMode;
/*    89 */ }TIM_MasterConfigTypeDef;
/*    94 */ typedef struct
/*    95 */ {
/*    96 */    uint32_t OffStateRunMode;
/*    98 */    uint32_t OffStateIDLEMode;
/*   100 */    uint32_t LockLevel;
/*   102 */    uint32_t DeadTime;
/*   104 */    uint32_t BreakState;
/*   106 */    uint32_t BreakPolarity;
/*   108 */    uint32_t AutomaticOutput;
/*   110 */ }TIM_BreakDeadTimeConfigTypeDef;
/*   175 */ HAL_StatusTypeDef HAL_TIMEx_HallSensor_Init(TIM_HandleTypeDef* htim, TIM_HallSensor_InitTypeDef* sConfig);
/*   176 */ HAL_StatusTypeDef HAL_TIMEx_HallSensor_DeInit(TIM_HandleTypeDef* htim);
/*   178 */ void HAL_TIMEx_HallSensor_MspInit(TIM_HandleTypeDef* htim);
/*   179 */ void HAL_TIMEx_HallSensor_MspDeInit(TIM_HandleTypeDef* htim);
/*   182 */ HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start(TIM_HandleTypeDef* htim);
/*   183 */ HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop(TIM_HandleTypeDef* htim);
/*   185 */ HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_IT(TIM_HandleTypeDef* htim);
/*   186 */ HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_IT(TIM_HandleTypeDef* htim);
/*   188 */ HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_DMA(TIM_HandleTypeDef* htim, uint32_t *pData, unsigned short Length);
/*   189 */ HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_DMA(TIM_HandleTypeDef* htim);
/*   199 */ HAL_StatusTypeDef HAL_TIMEx_OCN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   200 */ HAL_StatusTypeDef HAL_TIMEx_OCN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   203 */ HAL_StatusTypeDef HAL_TIMEx_OCN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   204 */ HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   207 */ HAL_StatusTypeDef HAL_TIMEx_OCN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, unsigned short Length);
/*   208 */ HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   218 */ HAL_StatusTypeDef HAL_TIMEx_PWMN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   219 */ HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   222 */ HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   223 */ HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   225 */ HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, unsigned short Length);
/*   226 */ HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);
/*   236 */ HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
/*   237 */ HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
/*   240 */ HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
/*   241 */ HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
/*   250 */ HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent(TIM_HandleTypeDef* htim, uint32_t InputTrigger, uint32_t CommutationSource);
/*   251 */ HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_IT(TIM_HandleTypeDef* htim, uint32_t InputTrigger, uint32_t CommutationSource);
/*   252 */ HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_DMA(TIM_HandleTypeDef* htim, uint32_t InputTrigger, uint32_t CommutationSource);
/*   253 */ HAL_StatusTypeDef HAL_TIMEx_MasterConfigSynchronization(TIM_HandleTypeDef* htim, TIM_MasterConfigTypeDef * sMasterConfig);
/*   254 */ HAL_StatusTypeDef HAL_TIMEx_ConfigBreakDeadTime(TIM_HandleTypeDef* htim, TIM_BreakDeadTimeConfigTypeDef *sBreakDeadTimeConfig);
/*   255 */ HAL_StatusTypeDef HAL_TIMEx_RemapConfig(TIM_HandleTypeDef* htim, uint32_t Remap);
/*   264 */ void HAL_TIMEx_CommutationCallback(TIM_HandleTypeDef* htim);
/*   265 */ void HAL_TIMEx_BreakCallback(TIM_HandleTypeDef* htim);
/*   266 */ void TIMEx_DMACommutationCplt(DMA_HandleTypeDef *hdma);
/*   275 */ HAL_TIM_StateTypeDef HAL_TIMEx_HallSensor_GetState(TIM_HandleTypeDef* htim);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_tim.h
 */
/*  1301 */ HAL_StatusTypeDef HAL_TIM_Base_Init(TIM_HandleTypeDef *htim);
/*  1302 */ HAL_StatusTypeDef HAL_TIM_Base_DeInit(TIM_HandleTypeDef *htim);
/*  1303 */ void HAL_TIM_Base_MspInit(TIM_HandleTypeDef *htim);
/*  1304 */ void HAL_TIM_Base_MspDeInit(TIM_HandleTypeDef *htim);
/*  1306 */ HAL_StatusTypeDef HAL_TIM_Base_Start(TIM_HandleTypeDef *htim);
/*  1307 */ HAL_StatusTypeDef HAL_TIM_Base_Stop(TIM_HandleTypeDef *htim);
/*  1309 */ HAL_StatusTypeDef HAL_TIM_Base_Start_IT(TIM_HandleTypeDef *htim);
/*  1310 */ HAL_StatusTypeDef HAL_TIM_Base_Stop_IT(TIM_HandleTypeDef *htim);
/*  1312 */ HAL_StatusTypeDef HAL_TIM_Base_Start_DMA(TIM_HandleTypeDef *htim, uint32_t *pData, unsigned short Length);
/*  1313 */ HAL_StatusTypeDef HAL_TIM_Base_Stop_DMA(TIM_HandleTypeDef *htim);
/*  1322 */ HAL_StatusTypeDef HAL_TIM_OC_Init(TIM_HandleTypeDef *htim);
/*  1323 */ HAL_StatusTypeDef HAL_TIM_OC_DeInit(TIM_HandleTypeDef *htim);
/*  1324 */ void HAL_TIM_OC_MspInit(TIM_HandleTypeDef *htim);
/*  1325 */ void HAL_TIM_OC_MspDeInit(TIM_HandleTypeDef *htim);
/*  1327 */ HAL_StatusTypeDef HAL_TIM_OC_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1328 */ HAL_StatusTypeDef HAL_TIM_OC_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1330 */ HAL_StatusTypeDef HAL_TIM_OC_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1331 */ HAL_StatusTypeDef HAL_TIM_OC_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1333 */ HAL_StatusTypeDef HAL_TIM_OC_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, unsigned short Length);
/*  1334 */ HAL_StatusTypeDef HAL_TIM_OC_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1344 */ HAL_StatusTypeDef HAL_TIM_PWM_Init(TIM_HandleTypeDef *htim);
/*  1345 */ HAL_StatusTypeDef HAL_TIM_PWM_DeInit(TIM_HandleTypeDef *htim);
/*  1346 */ void HAL_TIM_PWM_MspInit(TIM_HandleTypeDef *htim);
/*  1347 */ void HAL_TIM_PWM_MspDeInit(TIM_HandleTypeDef *htim);
/*  1349 */ HAL_StatusTypeDef HAL_TIM_PWM_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1350 */ HAL_StatusTypeDef HAL_TIM_PWM_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1352 */ HAL_StatusTypeDef HAL_TIM_PWM_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1353 */ HAL_StatusTypeDef HAL_TIM_PWM_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1355 */ HAL_StatusTypeDef HAL_TIM_PWM_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, unsigned short Length);
/*  1356 */ HAL_StatusTypeDef HAL_TIM_PWM_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1366 */ HAL_StatusTypeDef HAL_TIM_IC_Init(TIM_HandleTypeDef *htim);
/*  1367 */ HAL_StatusTypeDef HAL_TIM_IC_DeInit(TIM_HandleTypeDef *htim);
/*  1368 */ void HAL_TIM_IC_MspInit(TIM_HandleTypeDef *htim);
/*  1369 */ void HAL_TIM_IC_MspDeInit(TIM_HandleTypeDef *htim);
/*  1371 */ HAL_StatusTypeDef HAL_TIM_IC_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1372 */ HAL_StatusTypeDef HAL_TIM_IC_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1374 */ HAL_StatusTypeDef HAL_TIM_IC_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1375 */ HAL_StatusTypeDef HAL_TIM_IC_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1377 */ HAL_StatusTypeDef HAL_TIM_IC_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, unsigned short Length);
/*  1378 */ HAL_StatusTypeDef HAL_TIM_IC_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1388 */ HAL_StatusTypeDef HAL_TIM_OnePulse_Init(TIM_HandleTypeDef *htim, uint32_t OnePulseMode);
/*  1389 */ HAL_StatusTypeDef HAL_TIM_OnePulse_DeInit(TIM_HandleTypeDef *htim);
/*  1390 */ void HAL_TIM_OnePulse_MspInit(TIM_HandleTypeDef *htim);
/*  1391 */ void HAL_TIM_OnePulse_MspDeInit(TIM_HandleTypeDef *htim);
/*  1393 */ HAL_StatusTypeDef HAL_TIM_OnePulse_Start(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
/*  1394 */ HAL_StatusTypeDef HAL_TIM_OnePulse_Stop(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
/*  1397 */ HAL_StatusTypeDef HAL_TIM_OnePulse_Start_IT(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
/*  1398 */ HAL_StatusTypeDef HAL_TIM_OnePulse_Stop_IT(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
/*  1408 */ HAL_StatusTypeDef HAL_TIM_Encoder_Init(TIM_HandleTypeDef *htim, TIM_Encoder_InitTypeDef* sConfig);
/*  1409 */ HAL_StatusTypeDef HAL_TIM_Encoder_DeInit(TIM_HandleTypeDef *htim);
/*  1410 */ void HAL_TIM_Encoder_MspInit(TIM_HandleTypeDef *htim);
/*  1411 */ void HAL_TIM_Encoder_MspDeInit(TIM_HandleTypeDef *htim);
/*  1413 */ HAL_StatusTypeDef HAL_TIM_Encoder_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1414 */ HAL_StatusTypeDef HAL_TIM_Encoder_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1416 */ HAL_StatusTypeDef HAL_TIM_Encoder_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1417 */ HAL_StatusTypeDef HAL_TIM_Encoder_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1419 */ HAL_StatusTypeDef HAL_TIM_Encoder_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData1, uint32_t *pData2, unsigned short Length);
/*  1420 */ HAL_StatusTypeDef HAL_TIM_Encoder_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1430 */ void HAL_TIM_IRQHandler(TIM_HandleTypeDef *htim);
/*  1440 */ HAL_StatusTypeDef HAL_TIM_OC_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OC_InitTypeDef* sConfig, uint32_t Channel);
/*  1441 */ HAL_StatusTypeDef HAL_TIM_PWM_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OC_InitTypeDef* sConfig, uint32_t Channel);
/*  1442 */ HAL_StatusTypeDef HAL_TIM_IC_ConfigChannel(TIM_HandleTypeDef *htim, TIM_IC_InitTypeDef* sConfig, uint32_t Channel);
/*  1443 */ HAL_StatusTypeDef HAL_TIM_OnePulse_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OnePulse_InitTypeDef* sConfig, uint32_t OutputChannel, uint32_t InputChannel);
/*  1444 */ HAL_StatusTypeDef HAL_TIM_ConfigOCrefClear(TIM_HandleTypeDef *htim, TIM_ClearInputConfigTypeDef * sClearInputConfig, uint32_t Channel);
/*  1445 */ HAL_StatusTypeDef HAL_TIM_ConfigClockSource(TIM_HandleTypeDef *htim, TIM_ClockConfigTypeDef * sClockSourceConfig);
/*  1446 */ HAL_StatusTypeDef HAL_TIM_ConfigTI1Input(TIM_HandleTypeDef *htim, uint32_t TI1_Selection);
/*  1447 */ HAL_StatusTypeDef HAL_TIM_SlaveConfigSynchronization(TIM_HandleTypeDef *htim, TIM_SlaveConfigTypeDef * sSlaveConfig);
/*  1448 */ HAL_StatusTypeDef HAL_TIM_SlaveConfigSynchronization_IT(TIM_HandleTypeDef *htim, TIM_SlaveConfigTypeDef * sSlaveConfig);
/*  1449 */ HAL_StatusTypeDef HAL_TIM_DMABurst_WriteStart(TIM_HandleTypeDef *htim, uint32_t BurstBaseAddress, uint32_t BurstRequestSrc,
/*  1450 */     uint32_t *BurstBuffer, uint32_t BurstLength);
/*  1451 */ HAL_StatusTypeDef HAL_TIM_DMABurst_WriteStop(TIM_HandleTypeDef *htim, uint32_t BurstRequestSrc);
/*  1452 */ HAL_StatusTypeDef HAL_TIM_DMABurst_ReadStart(TIM_HandleTypeDef *htim, uint32_t BurstBaseAddress, uint32_t BurstRequestSrc,
/*  1453 */     uint32_t *BurstBuffer, uint32_t BurstLength);
/*  1454 */ HAL_StatusTypeDef HAL_TIM_DMABurst_ReadStop(TIM_HandleTypeDef *htim, uint32_t BurstRequestSrc);
/*  1455 */ HAL_StatusTypeDef HAL_TIM_GenerateEvent(TIM_HandleTypeDef *htim, uint32_t EventSource);
/*  1456 */ uint32_t HAL_TIM_ReadCapturedValue(TIM_HandleTypeDef *htim, uint32_t Channel);
/*  1466 */ void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim);
/*  1467 */ void HAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim);
/*  1468 */ void HAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim);
/*  1469 */ void HAL_TIM_PWM_PulseFinishedCallback(TIM_HandleTypeDef *htim);
/*  1470 */ void HAL_TIM_TriggerCallback(TIM_HandleTypeDef *htim);
/*  1471 */ void HAL_TIM_ErrorCallback(TIM_HandleTypeDef *htim);
/*  1481 */ HAL_TIM_StateTypeDef HAL_TIM_Base_GetState(TIM_HandleTypeDef *htim);
/*  1482 */ HAL_TIM_StateTypeDef HAL_TIM_OC_GetState(TIM_HandleTypeDef *htim);
/*  1483 */ HAL_TIM_StateTypeDef HAL_TIM_PWM_GetState(TIM_HandleTypeDef *htim);
/*  1484 */ HAL_TIM_StateTypeDef HAL_TIM_IC_GetState(TIM_HandleTypeDef *htim);
/*  1485 */ HAL_TIM_StateTypeDef HAL_TIM_OnePulse_GetState(TIM_HandleTypeDef *htim);
/*  1486 */ HAL_TIM_StateTypeDef HAL_TIM_Encoder_GetState(TIM_HandleTypeDef *htim);
/*  1746 */ void TIM_Base_SetConfig(TIM_TypeDef *TIMx, TIM_Base_InitTypeDef *Structure);
/*  1747 */ void TIM_TI1_SetConfig(TIM_TypeDef *TIMx, uint32_t TIM_ICPolarity, uint32_t TIM_ICSelection, uint32_t TIM_ICFilter);
/*  1748 */ void TIM_OC2_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
/*  1749 */ void TIM_DMADelayPulseCplt(DMA_HandleTypeDef *hdma);
/*  1750 */ void TIM_DMAError(DMA_HandleTypeDef *hdma);
/*  1751 */ void TIM_DMACaptureCplt(DMA_HandleTypeDef *hdma);
/*  1752 */ void TIM_CCxChannelCmd(TIM_TypeDef* TIMx, uint32_t Channel, uint32_t ChannelState);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_uart.h
 */
/*    63 */ typedef struct
/*    64 */ {
/*    65 */    uint32_t BaudRate;
/*    71 */    uint32_t WordLength;
/*    74 */    uint32_t StopBits;
/*    77 */    uint32_t Parity;
/*    84 */    uint32_t Mode;
/*    87 */    uint32_t HwFlowCtl;
/*    91 */    uint32_t OverSampling;
/*    93 */ }UART_InitTypeDef;
/*   134 */ typedef enum
/*   135 */ {
/*   136 */    HAL_UART_STATE_RESET = 0x00U,
/*   138 */    HAL_UART_STATE_READY = 0x20U,
/*   140 */    HAL_UART_STATE_BUSY = 0x24U,
/*   142 */    HAL_UART_STATE_BUSY_TX = 0x21U,
/*   144 */    HAL_UART_STATE_BUSY_RX = 0x22U,
/*   146 */    HAL_UART_STATE_BUSY_TX_RX = 0x23U,
/*   149 */    HAL_UART_STATE_TIMEOUT = 0xA0U,
/*   151 */    HAL_UART_STATE_ERROR = 0xE0U
/*   153 */ }HAL_UART_StateTypeDef;
/*   158 */ typedef struct
/*   159 */ {
/*   160 */    USART_TypeDef *Instance;
/*   162 */    UART_InitTypeDef Init;
/*   164 */    unsigned char *pTxBuffPtr;
/*   166 */    unsigned short TxXferSize;
/*   168 */    volatile unsigned short TxXferCount;
/*   170 */    unsigned char *pRxBuffPtr;
/*   172 */    unsigned short RxXferSize;
/*   174 */    volatile unsigned short RxXferCount;
/*   176 */    DMA_HandleTypeDef *hdmatx;
/*   178 */    DMA_HandleTypeDef *hdmarx;
/*   180 */    HAL_LockTypeDef Lock;
/*   182 */    volatile HAL_UART_StateTypeDef gState;
/*   186 */    volatile HAL_UART_StateTypeDef RxState;
/*   189 */    volatile uint32_t ErrorCode;
/*   191 */ }UART_HandleTypeDef;
/*   630 */ HAL_StatusTypeDef HAL_UART_Init(UART_HandleTypeDef *huart);
/*   631 */ HAL_StatusTypeDef HAL_HalfDuplex_Init(UART_HandleTypeDef *huart);
/*   632 */ HAL_StatusTypeDef HAL_LIN_Init(UART_HandleTypeDef *huart, uint32_t BreakDetectLength);
/*   633 */ HAL_StatusTypeDef HAL_MultiProcessor_Init(UART_HandleTypeDef *huart, unsigned char Address, uint32_t WakeUpMethod);
/*   634 */ HAL_StatusTypeDef HAL_UART_DeInit (UART_HandleTypeDef *huart);
/*   635 */ void HAL_UART_MspInit(UART_HandleTypeDef *huart);
/*   636 */ void HAL_UART_MspDeInit(UART_HandleTypeDef *huart);
/*   645 */ HAL_StatusTypeDef HAL_UART_Transmit(UART_HandleTypeDef *huart, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   646 */ HAL_StatusTypeDef HAL_UART_Receive(UART_HandleTypeDef *huart, unsigned char *pData, unsigned short Size, uint32_t Timeout);
/*   647 */ HAL_StatusTypeDef HAL_UART_Transmit_IT(UART_HandleTypeDef *huart, unsigned char *pData, unsigned short Size);
/*   648 */ HAL_StatusTypeDef HAL_UART_Receive_IT(UART_HandleTypeDef *huart, unsigned char *pData, unsigned short Size);
/*   649 */ HAL_StatusTypeDef HAL_UART_Transmit_DMA(UART_HandleTypeDef *huart, unsigned char *pData, unsigned short Size);
/*   650 */ HAL_StatusTypeDef HAL_UART_Receive_DMA(UART_HandleTypeDef *huart, unsigned char *pData, unsigned short Size);
/*   651 */ HAL_StatusTypeDef HAL_UART_DMAPause(UART_HandleTypeDef *huart);
/*   652 */ HAL_StatusTypeDef HAL_UART_DMAResume(UART_HandleTypeDef *huart);
/*   653 */ HAL_StatusTypeDef HAL_UART_DMAStop(UART_HandleTypeDef *huart);
/*   655 */ HAL_StatusTypeDef HAL_UART_Abort(UART_HandleTypeDef *huart);
/*   656 */ HAL_StatusTypeDef HAL_UART_AbortTransmit(UART_HandleTypeDef *huart);
/*   657 */ HAL_StatusTypeDef HAL_UART_AbortReceive(UART_HandleTypeDef *huart);
/*   658 */ HAL_StatusTypeDef HAL_UART_Abort_IT(UART_HandleTypeDef *huart);
/*   659 */ HAL_StatusTypeDef HAL_UART_AbortTransmit_IT(UART_HandleTypeDef *huart);
/*   660 */ HAL_StatusTypeDef HAL_UART_AbortReceive_IT(UART_HandleTypeDef *huart);
/*   662 */ void HAL_UART_IRQHandler(UART_HandleTypeDef *huart);
/*   663 */ void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart);
/*   664 */ void HAL_UART_TxHalfCpltCallback(UART_HandleTypeDef *huart);
/*   665 */ void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart);
/*   666 */ void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef *huart);
/*   667 */ void HAL_UART_ErrorCallback(UART_HandleTypeDef *huart);
/*   668 */ void HAL_UART_AbortCpltCallback (UART_HandleTypeDef *huart);
/*   669 */ void HAL_UART_AbortTransmitCpltCallback (UART_HandleTypeDef *huart);
/*   670 */ void HAL_UART_AbortReceiveCpltCallback (UART_HandleTypeDef *huart);
/*   679 */ HAL_StatusTypeDef HAL_LIN_SendBreak(UART_HandleTypeDef *huart);
/*   680 */ HAL_StatusTypeDef HAL_MultiProcessor_EnterMuteMode(UART_HandleTypeDef *huart);
/*   681 */ HAL_StatusTypeDef HAL_MultiProcessor_ExitMuteMode(UART_HandleTypeDef *huart);
/*   682 */ HAL_StatusTypeDef HAL_HalfDuplex_EnableTransmitter(UART_HandleTypeDef *huart);
/*   683 */ HAL_StatusTypeDef HAL_HalfDuplex_EnableReceiver(UART_HandleTypeDef *huart);
/*   692 */ HAL_UART_StateTypeDef HAL_UART_GetState(UART_HandleTypeDef *huart);
/*   693 */ uint32_t HAL_UART_GetError(UART_HandleTypeDef *huart);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_ll_usb.h
 */
/*    64 */ typedef enum
/*    65 */ {
/*    66 */    USB_OTG_DEVICE_MODE = 0U,
/*    67 */    USB_OTG_HOST_MODE = 1U,
/*    68 */    USB_OTG_DRD_MODE = 2U
/*    70 */ }USB_OTG_ModeTypeDef;
/*    75 */ typedef enum {
/*    76 */    URB_IDLE = 0U,
/*    77 */    URB_DONE,
/*    78 */    URB_NOTREADY,
/*    79 */    URB_NYET,
/*    80 */    URB_ERROR,
/*    81 */    URB_STALL
/*    83 */ }USB_OTG_URBStateTypeDef;
/*    88 */ typedef enum {
/*    89 */    HC_IDLE = 0U,
/*    90 */    HC_XFRC,
/*    91 */    HC_HALTED,
/*    92 */    HC_NAK,
/*    93 */    HC_NYET,
/*    94 */    HC_STALL,
/*    95 */    HC_XACTERR,
/*    96 */    HC_BBLERR,
/*    97 */    HC_DATATGLERR
/*    99 */ }USB_OTG_HCStateTypeDef;
/*   104 */ typedef struct
/*   105 */ {
/*   106 */    uint32_t dev_endpoints;
/*   110 */    uint32_t Host_channels;
/*   114 */    uint32_t speed;
/*   117 */    uint32_t dma_enable;
/*   119 */    uint32_t ep0_mps;
/*   122 */    uint32_t phy_itface;
/*   125 */    uint32_t Sof_enable;
/*   127 */    uint32_t low_power_enable;
/*   129 */    uint32_t lpm_enable;
/*   131 */    uint32_t battery_charging_enable;
/*   133 */    uint32_t vbus_sensing_enable;
/*   135 */    uint32_t use_dedicated_ep1;
/*   137 */    uint32_t use_external_vbus;
/*   139 */ }USB_OTG_CfgTypeDef;
/*   144 */ typedef struct
/*   145 */ {
/*   146 */    unsigned char num;
/*   149 */    unsigned char is_in;
/*   152 */    unsigned char is_stall;
/*   155 */    unsigned char type;
/*   158 */    unsigned char data_pid_start;
/*   161 */    unsigned char even_odd_frame;
/*   164 */    unsigned short tx_fifo_num;
/*   167 */    uint32_t maxpacket;
/*   170 */    unsigned char *xfer_buff;
/*   172 */    uint32_t dma_addr;
/*   174 */    uint32_t xfer_len;
/*   176 */    uint32_t xfer_count;
/*   178 */ }USB_OTG_EPTypeDef;
/*   183 */ typedef struct
/*   184 */ {
/*   185 */    unsigned char dev_addr ;
/*   188 */    unsigned char ch_num;
/*   191 */    unsigned char ep_num;
/*   194 */    unsigned char ep_is_in;
/*   197 */    unsigned char speed;
/*   200 */    unsigned char do_ping;
/*   202 */    unsigned char process_ping;
/*   204 */    unsigned char ep_type;
/*   207 */    unsigned short max_packet;
/*   210 */    unsigned char data_pid;
/*   213 */    unsigned char *xfer_buff;
/*   215 */    uint32_t xfer_len;
/*   217 */    uint32_t xfer_count;
/*   219 */    unsigned char toggle_in;
/*   222 */    unsigned char toggle_out;
/*   225 */    uint32_t dma_addr;
/*   227 */    uint32_t ErrCnt;
/*   229 */    USB_OTG_URBStateTypeDef urb_state;
/*   232 */    USB_OTG_HCStateTypeDef state;
/*   235 */ }USB_OTG_HCTypeDef;
/*   406 */ HAL_StatusTypeDef USB_CoreInit(USB_OTG_GlobalTypeDef *USBx, USB_OTG_CfgTypeDef Init);
/*   407 */ HAL_StatusTypeDef USB_DevInit(USB_OTG_GlobalTypeDef *USBx, USB_OTG_CfgTypeDef Init);
/*   408 */ HAL_StatusTypeDef USB_EnableGlobalInt(USB_OTG_GlobalTypeDef *USBx);
/*   409 */ HAL_StatusTypeDef USB_DisableGlobalInt(USB_OTG_GlobalTypeDef *USBx);
/*   410 */ HAL_StatusTypeDef USB_SetCurrentMode(USB_OTG_GlobalTypeDef *USBx , USB_OTG_ModeTypeDef mode);
/*   411 */ HAL_StatusTypeDef USB_SetDevSpeed(USB_OTG_GlobalTypeDef *USBx , unsigned char speed);
/*   412 */ HAL_StatusTypeDef USB_FlushRxFifo (USB_OTG_GlobalTypeDef *USBx);
/*   413 */ HAL_StatusTypeDef USB_FlushTxFifo (USB_OTG_GlobalTypeDef *USBx, uint32_t num );
/*   414 */ HAL_StatusTypeDef USB_ActivateEndpoint(USB_OTG_GlobalTypeDef *USBx, USB_OTG_EPTypeDef *ep);
/*   415 */ HAL_StatusTypeDef USB_DeactivateEndpoint(USB_OTG_GlobalTypeDef *USBx, USB_OTG_EPTypeDef *ep);
/*   416 */ HAL_StatusTypeDef USB_ActivateDedicatedEndpoint(USB_OTG_GlobalTypeDef *USBx, USB_OTG_EPTypeDef *ep);
/*   417 */ HAL_StatusTypeDef USB_DeactivateDedicatedEndpoint(USB_OTG_GlobalTypeDef *USBx, USB_OTG_EPTypeDef *ep);
/*   418 */ HAL_StatusTypeDef USB_EPStartXfer(USB_OTG_GlobalTypeDef *USBx , USB_OTG_EPTypeDef *ep, unsigned char dma);
/*   419 */ HAL_StatusTypeDef USB_EP0StartXfer(USB_OTG_GlobalTypeDef *USBx , USB_OTG_EPTypeDef *ep, unsigned char dma);
/*   420 */ HAL_StatusTypeDef USB_WritePacket(USB_OTG_GlobalTypeDef *USBx, unsigned char *src, unsigned char ch_ep_num, unsigned short len, unsigned char dma);
/*   421 */ void * USB_ReadPacket(USB_OTG_GlobalTypeDef *USBx, unsigned char *dest, unsigned short len);
/*   422 */ HAL_StatusTypeDef USB_EPSetStall(USB_OTG_GlobalTypeDef *USBx , USB_OTG_EPTypeDef *ep);
/*   423 */ HAL_StatusTypeDef USB_EPClearStall(USB_OTG_GlobalTypeDef *USBx , USB_OTG_EPTypeDef *ep);
/*   424 */ HAL_StatusTypeDef USB_SetDevAddress (USB_OTG_GlobalTypeDef *USBx, unsigned char address);
/*   425 */ HAL_StatusTypeDef USB_DevConnect (USB_OTG_GlobalTypeDef *USBx);
/*   426 */ HAL_StatusTypeDef USB_DevDisconnect (USB_OTG_GlobalTypeDef *USBx);
/*   427 */ HAL_StatusTypeDef USB_StopDevice(USB_OTG_GlobalTypeDef *USBx);
/*   428 */ HAL_StatusTypeDef USB_ActivateSetup (USB_OTG_GlobalTypeDef *USBx);
/*   429 */ HAL_StatusTypeDef USB_EP0_OutStart(USB_OTG_GlobalTypeDef *USBx, unsigned char dma, unsigned char *psetup);
/*   430 */ unsigned char USB_GetDevSpeed(USB_OTG_GlobalTypeDef *USBx);
/*   431 */ uint32_t USB_GetMode(USB_OTG_GlobalTypeDef *USBx);
/*   432 */ uint32_t USB_ReadInterrupts (USB_OTG_GlobalTypeDef *USBx);
/*   433 */ uint32_t USB_ReadDevAllOutEpInterrupt (USB_OTG_GlobalTypeDef *USBx);
/*   434 */ uint32_t USB_ReadDevOutEPInterrupt (USB_OTG_GlobalTypeDef *USBx , unsigned char epnum);
/*   435 */ uint32_t USB_ReadDevAllInEpInterrupt (USB_OTG_GlobalTypeDef *USBx);
/*   436 */ uint32_t USB_ReadDevInEPInterrupt (USB_OTG_GlobalTypeDef *USBx , unsigned char epnum);
/*   437 */ void USB_ClearInterrupts (USB_OTG_GlobalTypeDef *USBx, uint32_t interrupt);
/*   439 */ HAL_StatusTypeDef USB_HostInit (USB_OTG_GlobalTypeDef *USBx, USB_OTG_CfgTypeDef cfg);
/*   440 */ HAL_StatusTypeDef USB_InitFSLSPClkSel(USB_OTG_GlobalTypeDef *USBx , unsigned char freq);
/*   441 */ HAL_StatusTypeDef USB_ResetPort(USB_OTG_GlobalTypeDef *USBx);
/*   442 */ HAL_StatusTypeDef USB_DriveVbus (USB_OTG_GlobalTypeDef *USBx, unsigned char state);
/*   443 */ uint32_t USB_GetHostSpeed (USB_OTG_GlobalTypeDef *USBx);
/*   444 */ uint32_t USB_GetCurrentFrame (USB_OTG_GlobalTypeDef *USBx);
/*   445 */ HAL_StatusTypeDef USB_HC_Init(USB_OTG_GlobalTypeDef *USBx,
/*   446 */     unsigned char ch_num,
/*   447 */     unsigned char epnum,
/*   448 */     unsigned char dev_address,
/*   449 */     unsigned char speed,
/*   450 */     unsigned char ep_type,
/*   451 */     unsigned short mps);
/*   452 */ HAL_StatusTypeDef USB_HC_StartXfer(USB_OTG_GlobalTypeDef *USBx, USB_OTG_HCTypeDef *hc, unsigned char dma);
/*   453 */ uint32_t USB_HC_ReadInterrupt (USB_OTG_GlobalTypeDef *USBx);
/*   454 */ HAL_StatusTypeDef USB_HC_Halt(USB_OTG_GlobalTypeDef *USBx , unsigned char hc_num);
/*   455 */ HAL_StatusTypeDef USB_DoPing(USB_OTG_GlobalTypeDef *USBx , unsigned char ch_num);
/*   456 */ HAL_StatusTypeDef USB_StopHost(USB_OTG_GlobalTypeDef *USBx);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pcd.h
 */
/*    67 */ typedef enum
/*    68 */ {
/*    69 */    HAL_PCD_STATE_RESET = 0x00U,
/*    70 */    HAL_PCD_STATE_READY = 0x01U,
/*    71 */    HAL_PCD_STATE_ERROR = 0x02U,
/*    72 */    HAL_PCD_STATE_BUSY = 0x03U,
/*    73 */    HAL_PCD_STATE_TIMEOUT = 0x04U
/*    74 */ } PCD_StateTypeDef;
/*    87 */ typedef USB_OTG_GlobalTypeDef PCD_TypeDef;
/*    88 */ typedef USB_OTG_CfgTypeDef PCD_InitTypeDef;
/*    89 */ typedef USB_OTG_EPTypeDef PCD_EPTypeDef ;
/*    94 */ typedef struct
/*    95 */ {
/*    96 */    PCD_TypeDef *Instance;
/*    97 */    PCD_InitTypeDef Init;
/*    98 */    PCD_EPTypeDef IN_ep[16U];
/*    99 */    PCD_EPTypeDef OUT_ep[16U];
/*   100 */    HAL_LockTypeDef Lock;
/*   101 */    volatile PCD_StateTypeDef State;
/*   102 */    uint32_t Setup[12U];
/*   113 */    void *pData;
/*   114 */ } PCD_HandleTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pcd_ex.h
 */
/*    89 */ HAL_StatusTypeDef HAL_PCDEx_SetTxFiFo(PCD_HandleTypeDef *hpcd, unsigned char fifo, unsigned short size);
/*    90 */ HAL_StatusTypeDef HAL_PCDEx_SetRxFiFo(PCD_HandleTypeDef *hpcd, unsigned short size);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pcd.h
 */
/*   248 */ HAL_StatusTypeDef HAL_PCD_Init(PCD_HandleTypeDef *hpcd);
/*   249 */ HAL_StatusTypeDef HAL_PCD_DeInit(PCD_HandleTypeDef *hpcd);
/*   250 */ void HAL_PCD_MspInit(PCD_HandleTypeDef *hpcd);
/*   251 */ void HAL_PCD_MspDeInit(PCD_HandleTypeDef *hpcd);
/*   262 */ HAL_StatusTypeDef HAL_PCD_Start(PCD_HandleTypeDef *hpcd);
/*   263 */ HAL_StatusTypeDef HAL_PCD_Stop(PCD_HandleTypeDef *hpcd);
/*   264 */ void HAL_PCD_IRQHandler(PCD_HandleTypeDef *hpcd);
/*   266 */ void HAL_PCD_DataOutStageCallback(PCD_HandleTypeDef *hpcd, unsigned char epnum);
/*   267 */ void HAL_PCD_DataInStageCallback(PCD_HandleTypeDef *hpcd, unsigned char epnum);
/*   268 */ void HAL_PCD_SetupStageCallback(PCD_HandleTypeDef *hpcd);
/*   269 */ void HAL_PCD_SOFCallback(PCD_HandleTypeDef *hpcd);
/*   270 */ void HAL_PCD_ResetCallback(PCD_HandleTypeDef *hpcd);
/*   271 */ void HAL_PCD_SuspendCallback(PCD_HandleTypeDef *hpcd);
/*   272 */ void HAL_PCD_ResumeCallback(PCD_HandleTypeDef *hpcd);
/*   273 */ void HAL_PCD_ISOOUTIncompleteCallback(PCD_HandleTypeDef *hpcd, unsigned char epnum);
/*   274 */ void HAL_PCD_ISOINIncompleteCallback(PCD_HandleTypeDef *hpcd, unsigned char epnum);
/*   275 */ void HAL_PCD_ConnectCallback(PCD_HandleTypeDef *hpcd);
/*   276 */ void HAL_PCD_DisconnectCallback(PCD_HandleTypeDef *hpcd);
/*   285 */ HAL_StatusTypeDef HAL_PCD_DevConnect(PCD_HandleTypeDef *hpcd);
/*   286 */ HAL_StatusTypeDef HAL_PCD_DevDisconnect(PCD_HandleTypeDef *hpcd);
/*   287 */ HAL_StatusTypeDef HAL_PCD_SetAddress(PCD_HandleTypeDef *hpcd, unsigned char address);
/*   288 */ HAL_StatusTypeDef HAL_PCD_EP_Open(PCD_HandleTypeDef *hpcd, unsigned char ep_addr, unsigned short ep_mps, unsigned char ep_type);
/*   289 */ HAL_StatusTypeDef HAL_PCD_EP_Close(PCD_HandleTypeDef *hpcd, unsigned char ep_addr);
/*   290 */ HAL_StatusTypeDef HAL_PCD_EP_Receive(PCD_HandleTypeDef *hpcd, unsigned char ep_addr, unsigned char *pBuf, uint32_t len);
/*   291 */ HAL_StatusTypeDef HAL_PCD_EP_Transmit(PCD_HandleTypeDef *hpcd, unsigned char ep_addr, unsigned char *pBuf, uint32_t len);
/*   292 */ unsigned short HAL_PCD_EP_GetRxCount(PCD_HandleTypeDef *hpcd, unsigned char ep_addr);
/*   293 */ HAL_StatusTypeDef HAL_PCD_EP_SetStall(PCD_HandleTypeDef *hpcd, unsigned char ep_addr);
/*   294 */ HAL_StatusTypeDef HAL_PCD_EP_ClrStall(PCD_HandleTypeDef *hpcd, unsigned char ep_addr);
/*   295 */ HAL_StatusTypeDef HAL_PCD_EP_Flush(PCD_HandleTypeDef *hpcd, unsigned char ep_addr);
/*   296 */ HAL_StatusTypeDef HAL_PCD_ActivateRemoteWakeup(PCD_HandleTypeDef *hpcd);
/*   297 */ HAL_StatusTypeDef HAL_PCD_DeActivateRemoteWakeup(PCD_HandleTypeDef *hpcd);
/*   306 */ PCD_StateTypeDef HAL_PCD_GetState(PCD_HandleTypeDef *hpcd);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_hcd.h
 */
/*    67 */ typedef enum
/*    68 */ {
/*    69 */    HAL_HCD_STATE_RESET = 0x00U,
/*    70 */    HAL_HCD_STATE_READY = 0x01U,
/*    71 */    HAL_HCD_STATE_ERROR = 0x02U,
/*    72 */    HAL_HCD_STATE_BUSY = 0x03U,
/*    73 */    HAL_HCD_STATE_TIMEOUT = 0x04U
/*    74 */ } HCD_StateTypeDef;
/*    76 */ typedef USB_OTG_GlobalTypeDef HCD_TypeDef;
/*    77 */ typedef USB_OTG_CfgTypeDef HCD_InitTypeDef;
/*    78 */ typedef USB_OTG_HCTypeDef HCD_HCTypeDef ;
/*    79 */ typedef USB_OTG_URBStateTypeDef HCD_URBStateTypeDef ;
/*    80 */ typedef USB_OTG_HCStateTypeDef HCD_HCStateTypeDef ;
/*    88 */ typedef struct
/*    89 */ {
/*    90 */    HCD_TypeDef *Instance;
/*    91 */    HCD_InitTypeDef Init;
/*    92 */    HCD_HCTypeDef hc[15U];
/*    93 */    HAL_LockTypeDef Lock;
/*    94 */    volatile HCD_StateTypeDef State;
/*    95 */    void *pData;
/*    96 */ } HCD_HandleTypeDef;
/*   163 */ HAL_StatusTypeDef HAL_HCD_Init(HCD_HandleTypeDef *hhcd);
/*   164 */ HAL_StatusTypeDef HAL_HCD_DeInit(HCD_HandleTypeDef *hhcd);
/*   165 */ HAL_StatusTypeDef HAL_HCD_HC_Init(HCD_HandleTypeDef *hhcd,
/*   166 */     unsigned char ch_num,
/*   167 */     unsigned char epnum,
/*   168 */     unsigned char dev_address,
/*   169 */     unsigned char speed,
/*   170 */     unsigned char ep_type,
/*   171 */     unsigned short mps);
/*   173 */ HAL_StatusTypeDef HAL_HCD_HC_Halt(HCD_HandleTypeDef *hhcd, unsigned char ch_num);
/*   175 */ void HAL_HCD_MspInit(HCD_HandleTypeDef *hhcd);
/*   176 */ void HAL_HCD_MspDeInit(HCD_HandleTypeDef *hhcd);
/*   185 */ HAL_StatusTypeDef HAL_HCD_HC_SubmitRequest(HCD_HandleTypeDef *hhcd,
/*   186 */     unsigned char ch_num,
/*   187 */     unsigned char direction,
/*   188 */     unsigned char ep_type,
/*   189 */     unsigned char token,
/*   190 */     unsigned char* pbuff,
/*   191 */     unsigned short length,
/*   192 */     unsigned char do_ping);
/*   195 */ void HAL_HCD_IRQHandler(HCD_HandleTypeDef *hhcd);
/*   196 */ void HAL_HCD_SOF_Callback(HCD_HandleTypeDef *hhcd);
/*   197 */ void HAL_HCD_Connect_Callback(HCD_HandleTypeDef *hhcd);
/*   198 */ void HAL_HCD_Disconnect_Callback(HCD_HandleTypeDef *hhcd);
/*   199 */ void HAL_HCD_HC_NotifyURBChange_Callback(HCD_HandleTypeDef *hhcd,
/*   200 */     unsigned char chnum,
/*   201 */     HCD_URBStateTypeDef urb_state);
/*   210 */ HAL_StatusTypeDef HAL_HCD_ResetPort(HCD_HandleTypeDef *hhcd);
/*   211 */ HAL_StatusTypeDef HAL_HCD_Start(HCD_HandleTypeDef *hhcd);
/*   212 */ HAL_StatusTypeDef HAL_HCD_Stop(HCD_HandleTypeDef *hhcd);
/*   221 */ HCD_StateTypeDef HAL_HCD_GetState(HCD_HandleTypeDef *hhcd);
/*   222 */ HCD_URBStateTypeDef HAL_HCD_HC_GetURBState(HCD_HandleTypeDef *hhcd, unsigned char chnum);
/*   223 */ uint32_t HAL_HCD_HC_GetXferCount(HCD_HandleTypeDef *hhcd, unsigned char chnum);
/*   224 */ HCD_HCStateTypeDef HAL_HCD_HC_GetState(HCD_HandleTypeDef *hhcd, unsigned char chnum);
/*   225 */ uint32_t HAL_HCD_GetCurrentFrame(HCD_HandleTypeDef *hhcd);
/*   226 */ uint32_t HAL_HCD_GetCurrentSpeed(HCD_HandleTypeDef *hhcd);
/*
 * C:/CodeInspection/DisplayUnit/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal.h
 */
/*   192 */ HAL_StatusTypeDef HAL_Init(void);
/*   193 */ HAL_StatusTypeDef HAL_DeInit(void);
/*   194 */ void HAL_MspInit(void);
/*   195 */ void HAL_MspDeInit(void);
/*   196 */ HAL_StatusTypeDef HAL_InitTick (uint32_t TickPriority);
/*   205 */ void HAL_IncTick(void);
/*   206 */ void HAL_Delay(volatile uint32_t Delay);
/*   207 */ uint32_t HAL_GetTick(void);
/*   208 */ void HAL_SuspendTick(void);
/*   209 */ void HAL_ResumeTick(void);
/*   210 */ uint32_t HAL_GetHalVersion(void);
/*   211 */ uint32_t HAL_GetREVID(void);
/*   212 */ uint32_t HAL_GetDEVID(void);
/*   213 */ void HAL_DBGMCU_EnableDBGSleepMode(void);
/*   214 */ void HAL_DBGMCU_DisableDBGSleepMode(void);
/*   215 */ void HAL_DBGMCU_EnableDBGStopMode(void);
/*   216 */ void HAL_DBGMCU_DisableDBGStopMode(void);
/*   217 */ void HAL_DBGMCU_EnableDBGStandbyMode(void);
/*   218 */ void HAL_DBGMCU_DisableDBGStandbyMode(void);
/*   219 */ void HAL_EnableCompensationCell(void);
/*   220 */ void HAL_DisableCompensationCell(void);
/*   221 */ void HAL_GetUID(uint32_t *UID);
/*
 * C:/CodeInspection/DisplayUnit/Inc/usb_host.h
 */
/*    61 */ typedef enum {
/*    62 */    APPLICATION_IDLE = 0,
/*    63 */    APPLICATION_START,
/*    64 */    APPLICATION_READY,
/*    65 */    APPLICATION_DISCONNECT,
/*    66 */ }ApplicationTypeDef;
/*    68 */ void MX_USB_HOST_Init(void);
/*    69 */ void MX_USB_HOST_Process(void);
/*
 * C:/PRQA/QAC-8.1.2-R/include/ansi/stdlib.h
 */
/*    11 */ typedef unsigned char wchar_t;
/*    18 */ typedef struct { unsigned _undefined_div; } div_t;
/*    19 */ typedef struct { unsigned _undefined_ldiv; } ldiv_t;
/*    24 */ extern double atof(const char *nptr),
/*    25 */ strtod(const char *nptr, char **endptr);
/*    26 */ extern long atol(const char *nptr),
/*    27 */ strtol(const char *nptr, char **endptr, int base),
/*    28 */ labs(long j);
/*    29 */ extern unsigned long strtoul(const char *nptr, char **endptr, int base);
/*    30 */ extern int atoi(const char *nptr),
/*    31 */ rand(void),
/*    32 */ atexit(void (*func)(void)),
/*    33 */ system(const char *string),
/*    34 */ abs(int j),
/*    35 */ mblen(const char *s, size_t n),
/*    36 */ mbtowc(wchar_t *pwc, const char *s, size_t n),
/*    37 */ wctomb(char *s, wchar_t wchar);
/*    38 */ extern void srand(unsigned int seed),
/*    39 */ *calloc(size_t nmemb, size_t size),
/*    40 */ free(void *ptr),
/*    41 */ *malloc(size_t size),
/*    42 */ *realloc(void *ptr, size_t size),
/*    43 */ abort(void),
/*    44 */ exit(int status),
/*    45 */ *bsearch(const void *key,const void *base,size_t nmemb,size_t size,int(*compar)(const void *,const void *)),
/*    46 */ qsort(void *base,size_t nmemb,size_t size,int(*compar)(const void *,const void *));
/*    47 */ extern char *getenv(const char *name);
/*    48 */ extern div_t div(int numer, int denom);
/*    49 */ extern ldiv_t ldiv(long numer, long denom);
/*    50 */ extern size_t mbstowcs(wchar_t *pwcs,const char *s,size_t n),
/*    51 */ wcstombs(char *s,const wchar_t *pwcs, size_t n);
/*
 * C:/PRQA/QAC-8.1.2-R/include/ansi/string.h
 */
/*    13 */ extern void *memcpy(void *s1,const void *s2,size_t n),
/*    14 */ *memmove(void *s1,const void *s2,size_t n),
/*    15 */ *memchr(const void *s, int c, size_t n),
/*    16 */ *memset(void *s, int c, size_t n);
/*    17 */ extern char *strcpy(char *s1, const char *s2),
/*    18 */ *strncpy(char *s1, const char *s2, size_t n),
/*    19 */ *strcat(char *s1, const char *s2),
/*    20 */ *strncat(char *s1, const char *s2, size_t n),
/*    21 */ *strchr(const char *s, int c),
/*    22 */ *strpbrk(const char *s1, const char *s2),
/*    23 */ *strrchr(const char *s, int c),
/*    24 */ *strstr(const char *s1, const char *s2),
/*    25 */ *strtok(char *s1, const char *s2),
/*    26 */ *strerror(int errnum);
/*    27 */ extern int memcmp(const void *s1,const void *s2, size_t n),
/*    28 */ strcmp(const char *s1,const char *s2),
/*    29 */ strcoll(const char *s1,const char *s2),
/*    30 */ strncmp(const char *s1,const char *s2,size_t n);
/*    31 */ extern size_t strxfrm(char *s1,const char *s2,size_t n),
/*    32 */ strcspn(const char *s1,const char *s2),
/*    33 */ strspn(const char *s1, const char *s2),
/*    34 */ strlen(const char *s);
/*
 * C:/CodeInspection/DisplayUnit/STemWin/Board/Inc/LCD.h
 */
/*    68 */ unsigned int getUs(void);
/*    69 */ void delayUs(unsigned short micros);
/*    72 */ void _CPU_Ram_Write(unsigned long lData);
/*    73 */ void LCD_OnOff(int nOnOff);
/*    75 */ void LCD_init();
/*    76 */ void Set_Window_Size(unsigned int X0, unsigned int Y0, unsigned int X1, unsigned int Y1);
/*    77 */ void LCD_Clear(unsigned int X0, unsigned int Y0, unsigned int width, unsigned int height, unsigned long Fill_Color);
/*    78 */ void Display_String (unsigned int X0, unsigned int Y0, unsigned long Font_Color, unsigned char *Print_String);
/*    79 */ void Display_String_2X (unsigned int X0, unsigned int Y0, unsigned long Font_Color, unsigned char *Print_String);
/*    80 */ void Draw_Line(int X0, int Y0, int X1, int Y1, unsigned long color);
/*    81 */ void Draw_Rectangle(unsigned int X0, unsigned int Y0, unsigned int X1, unsigned int Y1, unsigned long color);
/*    83 */ void CPU_Command_Write(unsigned short nData);
/*    84 */ void CPU_Data_Write(unsigned short nData);
/*    85 */ unsigned short CPU_Data_Read(void);
/*    87 */ void GUI_Text(unsigned short Xpos, unsigned short Ypos, unsigned char *str,unsigned short Color, unsigned short bkColor);
/*
 * C:/CodeInspection/DisplayUnit/Inc/usbh_conf.h
 */
/*   125 */ extern int nLine;
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Core/Inc/usbh_def.h
 */
/*   202 */ typedef union
/*   203 */ {
/*   204 */    unsigned short w;
/*   205 */    struct BW
/*   206 */    {
/*   207 */       unsigned char msb;
/*   208 */       unsigned char lsb;
/*   209 */    }
/*   210 */    bw;
/*   211 */ }
/*   212 */ uint16_t_uint8_t;
/*   215 */ typedef union _USB_Setup
/*   216 */ {
/*   217 */    uint32_t d8[2];
/*   219 */    struct _SetupPkt_Struc
/*   220 */    {
/*   221 */       unsigned char bmRequestType;
/*   222 */       unsigned char bRequest;
/*   223 */       uint16_t_uint8_t wValue;
/*   224 */       uint16_t_uint8_t wIndex;
/*   225 */       uint16_t_uint8_t wLength;
/*   226 */    } b;
/*   227 */ }
/*   228 */ USB_Setup_TypeDef;
/*   230 */ typedef struct _DescHeader
/*   231 */ {
/*   232 */    unsigned char bLength;
/*   233 */    unsigned char bDescriptorType;
/*   234 */ }
/*   235 */ USBH_DescHeader_t;
/*   237 */ typedef struct _DeviceDescriptor
/*   238 */ {
/*   239 */    unsigned char bLength;
/*   240 */    unsigned char bDescriptorType;
/*   241 */    unsigned short bcdUSB;
/*   242 */    unsigned char bDeviceClass;
/*   243 */    unsigned char bDeviceSubClass;
/*   244 */    unsigned char bDeviceProtocol;
/*   248 */    unsigned char bMaxPacketSize;
/*   249 */    unsigned short idVendor;
/*   250 */    unsigned short idProduct;
/*   251 */    unsigned short bcdDevice;
/*   252 */    unsigned char iManufacturer;
/*   253 */    unsigned char iProduct;
/*   254 */    unsigned char iSerialNumber;
/*   255 */    unsigned char bNumConfigurations;
/*   256 */ }
/*   257 */ USBH_DevDescTypeDef;
/*   259 */ typedef struct _EndpointDescriptor
/*   260 */ {
/*   261 */    unsigned char bLength;
/*   262 */    unsigned char bDescriptorType;
/*   263 */    unsigned char bEndpointAddress;
/*   264 */    unsigned char bmAttributes;
/*   265 */    unsigned short wMaxPacketSize;
/*   266 */    unsigned char bInterval;
/*   267 */ }
/*   268 */ USBH_EpDescTypeDef;
/*   270 */ typedef struct _InterfaceDescriptor
/*   271 */ {
/*   272 */    unsigned char bLength;
/*   273 */    unsigned char bDescriptorType;
/*   274 */    unsigned char bInterfaceNumber;
/*   275 */    unsigned char bAlternateSetting;
/*   276 */    unsigned char bNumEndpoints;
/*   277 */    unsigned char bInterfaceClass;
/*   278 */    unsigned char bInterfaceSubClass;
/*   279 */    unsigned char bInterfaceProtocol;
/*   280 */    unsigned char iInterface;
/*   281 */    USBH_EpDescTypeDef Ep_Desc[5];
/*   282 */ }
/*   283 */ USBH_InterfaceDescTypeDef;
/*   286 */ typedef struct _ConfigurationDescriptor
/*   287 */ {
/*   288 */    unsigned char bLength;
/*   289 */    unsigned char bDescriptorType;
/*   290 */    unsigned short wTotalLength;
/*   291 */    unsigned char bNumInterfaces;
/*   292 */    unsigned char bConfigurationValue;
/*   293 */    unsigned char iConfiguration;
/*   294 */    unsigned char bmAttributes;
/*   295 */    unsigned char bMaxPower;
/*   296 */    USBH_InterfaceDescTypeDef Itf_Desc[10];
/*   297 */ }
/*   298 */ USBH_CfgDescTypeDef;
/*   302 */ typedef enum
/*   303 */ {
/*   304 */    USBH_OK = 0,
/*   305 */    USBH_BUSY,
/*   306 */    USBH_FAIL,
/*   307 */    USBH_NOT_SUPPORTED,
/*   308 */    USBH_UNRECOVERED_ERROR,
/*   309 */    USBH_ERROR_SPEED_UNKNOWN,
/*   310 */ }USBH_StatusTypeDef;
/*   317 */ typedef enum
/*   318 */ {
/*   319 */    USBH_SPEED_HIGH = 0,
/*   320 */    USBH_SPEED_FULL = 1,
/*   321 */    USBH_SPEED_LOW = 2,
/*   323 */ }USBH_SpeedTypeDef;
/*   326 */ typedef enum
/*   327 */ {
/*   328 */    HOST_IDLE =0,
/*   329 */    HOST_DEV_WAIT_FOR_ATTACHMENT,
/*   330 */    HOST_DEV_ATTACHED,
/*   331 */    HOST_DEV_DISCONNECTED,
/*   332 */    HOST_DETECT_DEVICE_SPEED,
/*   333 */    HOST_ENUMERATION,
/*   334 */    HOST_CLASS_REQUEST,
/*   335 */    HOST_INPUT,
/*   336 */    HOST_SET_CONFIGURATION,
/*   337 */    HOST_CHECK_CLASS,
/*   338 */    HOST_CLASS,
/*   339 */    HOST_SUSPENDED,
/*   340 */    HOST_ABORT_STATE,
/*   341 */ }HOST_StateTypeDef;
/*   344 */ typedef enum
/*   345 */ {
/*   346 */    ENUM_IDLE = 0,
/*   347 */    ENUM_GET_FULL_DEV_DESC,
/*   348 */    ENUM_SET_ADDR,
/*   349 */    ENUM_GET_CFG_DESC,
/*   350 */    ENUM_GET_FULL_CFG_DESC,
/*   351 */    ENUM_GET_MFC_STRING_DESC,
/*   352 */    ENUM_GET_PRODUCT_STRING_DESC,
/*   353 */    ENUM_GET_SERIALNUM_STRING_DESC,
/*   354 */ } ENUM_StateTypeDef;
/*   357 */ typedef enum
/*   358 */ {
/*   359 */    CTRL_IDLE =0,
/*   360 */    CTRL_SETUP,
/*   361 */    CTRL_SETUP_WAIT,
/*   362 */    CTRL_DATA_IN,
/*   363 */    CTRL_DATA_IN_WAIT,
/*   364 */    CTRL_DATA_OUT,
/*   365 */    CTRL_DATA_OUT_WAIT,
/*   366 */    CTRL_STATUS_IN,
/*   367 */    CTRL_STATUS_IN_WAIT,
/*   368 */    CTRL_STATUS_OUT,
/*   369 */    CTRL_STATUS_OUT_WAIT,
/*   370 */    CTRL_ERROR,
/*   371 */    CTRL_STALLED,
/*   372 */    CTRL_COMPLETE
/*   373 */ }CTRL_StateTypeDef;
/*   377 */ typedef enum
/*   378 */ {
/*   379 */    CMD_IDLE =0,
/*   380 */    CMD_SEND,
/*   381 */    CMD_WAIT
/*   382 */ } CMD_StateTypeDef;
/*   384 */ typedef enum {
/*   385 */    USBH_URB_IDLE = 0,
/*   386 */    USBH_URB_DONE,
/*   387 */    USBH_URB_NOTREADY,
/*   388 */    USBH_URB_NYET,
/*   389 */    USBH_URB_ERROR,
/*   390 */    USBH_URB_STALL
/*   391 */ }USBH_URBStateTypeDef;
/*   393 */ typedef enum
/*   394 */ {
/*   395 */    USBH_PORT_EVENT = 1,
/*   396 */    USBH_URB_EVENT,
/*   397 */    USBH_CONTROL_EVENT,
/*   398 */    USBH_CLASS_EVENT,
/*   399 */    USBH_STATE_CHANGED_EVENT,
/*   400 */ }
/*   401 */ USBH_OSEventTypeDef;
/*   404 */ typedef struct
/*   405 */ {
/*   406 */    unsigned char pipe_in;
/*   407 */    unsigned char pipe_out;
/*   408 */    unsigned char pipe_size;
/*   409 */    unsigned char *buff;
/*   410 */    unsigned short length;
/*   411 */    unsigned short timer;
/*   412 */    USB_Setup_TypeDef setup;
/*   413 */    CTRL_StateTypeDef state;
/*   414 */    unsigned char errorcount;
/*   416 */ } USBH_CtrlTypeDef;
/*   419 */ typedef struct
/*   420 */ {
/*   422 */    unsigned char CfgDesc_Raw[256];
/*   424 */    unsigned char Data[512];
/*   425 */    unsigned char address;
/*   426 */    unsigned char speed;
/*   427 */    volatile unsigned char is_connected;
/*   428 */    unsigned char current_interface;
/*   429 */    USBH_DevDescTypeDef DevDesc;
/*   430 */    USBH_CfgDescTypeDef CfgDesc;
/*   432 */ }USBH_DeviceTypeDef;
/*   434 */ struct _USBH_HandleTypeDef;
/*   437 */ typedef struct
/*   438 */ {
/*   439 */    const char *Name;
/*   440 */    unsigned char ClassCode;
/*   441 */    USBH_StatusTypeDef (*Init) (struct _USBH_HandleTypeDef *phost);
/*   442 */    USBH_StatusTypeDef (*DeInit) (struct _USBH_HandleTypeDef *phost);
/*   443 */    USBH_StatusTypeDef (*Requests) (struct _USBH_HandleTypeDef *phost);
/*   444 */    USBH_StatusTypeDef (*BgndProcess) (struct _USBH_HandleTypeDef *phost);
/*   445 */    USBH_StatusTypeDef (*SOFProcess) (struct _USBH_HandleTypeDef *phost);
/*   446 */    void* pData;
/*   447 */ } USBH_ClassTypeDef;
/*   450 */ typedef struct _USBH_HandleTypeDef
/*   451 */ {
/*   452 */    volatile HOST_StateTypeDef gState;
/*   453 */    ENUM_StateTypeDef EnumState;
/*   454 */    CMD_StateTypeDef RequestState;
/*   455 */    USBH_CtrlTypeDef Control;
/*   456 */    USBH_DeviceTypeDef device;
/*   457 */    USBH_ClassTypeDef* pClass[5];
/*   458 */    USBH_ClassTypeDef* pActiveClass;
/*   459 */    uint32_t ClassNumber;
/*   460 */    uint32_t Pipes[15];
/*   461 */    volatile uint32_t Timer;
/*   462 */    unsigned char id;
/*   463 */    void* pData;
/*   464 */    void (* pUser )(struct _USBH_HandleTypeDef *pHandle, unsigned char id);
/*   471 */ } USBH_HandleTypeDef;
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Core/Inc/usbh_ioreq.h
 */
/*    97 */ USBH_StatusTypeDef USBH_CtlSendSetup (USBH_HandleTypeDef *phost,
/*    98 */     unsigned char *buff,
/*    99 */     unsigned char hc_num);
/*   101 */ USBH_StatusTypeDef USBH_CtlSendData (USBH_HandleTypeDef *phost,
/*   102 */     unsigned char *buff,
/*   103 */     unsigned short length,
/*   104 */     unsigned char hc_num,
/*   105 */     unsigned char do_ping );
/*   107 */ USBH_StatusTypeDef USBH_CtlReceiveData(USBH_HandleTypeDef *phost,
/*   108 */     unsigned char *buff,
/*   109 */     unsigned short length,
/*   110 */     unsigned char hc_num);
/*   112 */ USBH_StatusTypeDef USBH_BulkReceiveData(USBH_HandleTypeDef *phost,
/*   113 */     unsigned char *buff,
/*   114 */     unsigned short length,
/*   115 */     unsigned char hc_num);
/*   117 */ USBH_StatusTypeDef USBH_BulkSendData (USBH_HandleTypeDef *phost,
/*   118 */     unsigned char *buff,
/*   119 */     unsigned short length,
/*   120 */     unsigned char hc_num,
/*   121 */     unsigned char do_ping );
/*   123 */ USBH_StatusTypeDef USBH_InterruptReceiveData(USBH_HandleTypeDef *phost,
/*   124 */     unsigned char *buff,
/*   125 */     unsigned char length,
/*   126 */     unsigned char hc_num);
/*   128 */ USBH_StatusTypeDef USBH_InterruptSendData(USBH_HandleTypeDef *phost,
/*   129 */     unsigned char *buff,
/*   130 */     unsigned char length,
/*   131 */     unsigned char hc_num);
/*   134 */ USBH_StatusTypeDef USBH_IsocReceiveData(USBH_HandleTypeDef *phost,
/*   135 */     unsigned char *buff,
/*   136 */     uint32_t length,
/*   137 */     unsigned char hc_num);
/*   140 */ USBH_StatusTypeDef USBH_IsocSendData(USBH_HandleTypeDef *phost,
/*   141 */     unsigned char *buff,
/*   142 */     uint32_t length,
/*   143 */     unsigned char hc_num);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Core/Inc/usbh_pipes.h
 */
/*    85 */ USBH_StatusTypeDef USBH_OpenPipe (USBH_HandleTypeDef *phost,
/*    86 */     unsigned char ch_num,
/*    87 */     unsigned char epnum,
/*    88 */     unsigned char dev_address,
/*    89 */     unsigned char speed,
/*    90 */     unsigned char ep_type,
/*    91 */     unsigned short mps);
/*    93 */ USBH_StatusTypeDef USBH_ClosePipe (USBH_HandleTypeDef *phost,
/*    94 */     unsigned char pipe_num);
/*    96 */ unsigned char USBH_AllocPipe (USBH_HandleTypeDef *phost,
/*    97 */     unsigned char ep_addr);
/*    99 */ USBH_StatusTypeDef USBH_FreePipe (USBH_HandleTypeDef *phost,
/*   100 */     unsigned char idx);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Core/Inc/usbh_ctlreq.h
 */
/*    88 */ extern unsigned char USBH_CfgDesc[512];
/*    96 */ USBH_StatusTypeDef USBH_CtlReq (USBH_HandleTypeDef *phost,
/*    97 */     unsigned char *buff,
/*    98 */     unsigned short length);
/*   100 */ USBH_StatusTypeDef USBH_GetDescriptor(USBH_HandleTypeDef *phost,
/*   101 */     unsigned char req_type,
/*   102 */     unsigned short value_idx,
/*   103 */     unsigned char* buff,
/*   104 */     unsigned short length );
/*   106 */ USBH_StatusTypeDef USBH_Get_DevDesc(USBH_HandleTypeDef *phost,
/*   107 */     unsigned char length);
/*   109 */ USBH_StatusTypeDef USBH_Get_StringDesc(USBH_HandleTypeDef *phost,
/*   110 */     unsigned char string_index,
/*   111 */     unsigned char *buff,
/*   112 */     unsigned short length);
/*   114 */ USBH_StatusTypeDef USBH_SetCfg(USBH_HandleTypeDef *phost,
/*   115 */     unsigned short configuration_value);
/*   117 */ USBH_StatusTypeDef USBH_Get_CfgDesc(USBH_HandleTypeDef *phost,
/*   118 */     unsigned short length);
/*   120 */ USBH_StatusTypeDef USBH_SetAddress(USBH_HandleTypeDef *phost,
/*   121 */     unsigned char DeviceAddress);
/*   123 */ USBH_StatusTypeDef USBH_SetInterface(USBH_HandleTypeDef *phost,
/*   124 */     unsigned char ep_num, unsigned char altSetting);
/*   126 */ USBH_StatusTypeDef USBH_ClrFeature(USBH_HandleTypeDef *phost,
/*   127 */     unsigned char ep_num);
/*   129 */ USBH_DescHeader_t *USBH_GetNextDesc (unsigned char *pbuf,
/*   130 */     unsigned short *ptr);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Core/Inc/usbh_core.h
 */
/*    99 */ USBH_StatusTypeDef USBH_Init(USBH_HandleTypeDef *phost, void (*pUsrFunc)(USBH_HandleTypeDef *phost, unsigned char ), unsigned char id);
/*   100 */ USBH_StatusTypeDef USBH_DeInit(USBH_HandleTypeDef *phost);
/*   101 */ USBH_StatusTypeDef USBH_RegisterClass(USBH_HandleTypeDef *phost, USBH_ClassTypeDef *pclass);
/*   102 */ USBH_StatusTypeDef USBH_SelectInterface(USBH_HandleTypeDef *phost, unsigned char interface);
/*   103 */ unsigned char USBH_FindInterface(USBH_HandleTypeDef *phost,
/*   104 */     unsigned char Class,
/*   105 */     unsigned char SubClass,
/*   106 */     unsigned char Protocol);
/*   107 */ unsigned char USBH_GetActiveClass(USBH_HandleTypeDef *phost);
/*   109 */ unsigned char USBH_FindInterfaceIndex(USBH_HandleTypeDef *phost,
/*   110 */     unsigned char interface_number,
/*   111 */     unsigned char alt_settings);
/*   113 */ USBH_StatusTypeDef USBH_Start (USBH_HandleTypeDef *phost);
/*   114 */ USBH_StatusTypeDef USBH_Stop (USBH_HandleTypeDef *phost);
/*   115 */ USBH_StatusTypeDef USBH_Process (USBH_HandleTypeDef *phost);
/*   116 */ USBH_StatusTypeDef USBH_ReEnumerate (USBH_HandleTypeDef *phost);
/*   119 */ USBH_StatusTypeDef USBH_LL_Init (USBH_HandleTypeDef *phost);
/*   120 */ USBH_StatusTypeDef USBH_LL_DeInit (USBH_HandleTypeDef *phost);
/*   121 */ USBH_StatusTypeDef USBH_LL_Start (USBH_HandleTypeDef *phost);
/*   122 */ USBH_StatusTypeDef USBH_LL_Stop (USBH_HandleTypeDef *phost);
/*   124 */ USBH_StatusTypeDef USBH_LL_Connect (USBH_HandleTypeDef *phost);
/*   125 */ USBH_StatusTypeDef USBH_LL_Disconnect (USBH_HandleTypeDef *phost);
/*   126 */ USBH_SpeedTypeDef USBH_LL_GetSpeed (USBH_HandleTypeDef *phost);
/*   127 */ USBH_StatusTypeDef USBH_LL_ResetPort (USBH_HandleTypeDef *phost);
/*   128 */ uint32_t USBH_LL_GetLastXferSize (USBH_HandleTypeDef *phost, unsigned char );
/*   129 */ USBH_StatusTypeDef USBH_LL_DriverVBUS (USBH_HandleTypeDef *phost, unsigned char );
/*   131 */ USBH_StatusTypeDef USBH_LL_OpenPipe (USBH_HandleTypeDef *phost, unsigned char, unsigned char, unsigned char, unsigned char , unsigned char, unsigned short );
/*   132 */ USBH_StatusTypeDef USBH_LL_ClosePipe (USBH_HandleTypeDef *phost, unsigned char );
/*   133 */ USBH_StatusTypeDef USBH_LL_SubmitURB (USBH_HandleTypeDef *phost, unsigned char, unsigned char,unsigned char, unsigned char, unsigned char*, unsigned short, unsigned char );
/*   134 */ USBH_URBStateTypeDef USBH_LL_GetURBState (USBH_HandleTypeDef *phost, unsigned char );
/*   138 */ USBH_StatusTypeDef USBH_LL_SetToggle (USBH_HandleTypeDef *phost, unsigned char , unsigned char );
/*   139 */ unsigned char USBH_LL_GetToggle (USBH_HandleTypeDef *phost, unsigned char );
/*   142 */ void USBH_Delay (uint32_t Delay);
/*   143 */ void USBH_LL_SetTimer (USBH_HandleTypeDef *phost, uint32_t );
/*   144 */ void USBH_LL_IncTimer (USBH_HandleTypeDef *phost);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/AUDIO/Inc/usbh_audio.h
 */
/*    62 */ typedef enum
/*    63 */ {
/*    64 */    AUDIO_INIT = 0,
/*    65 */    AUDIO_IDLE,
/*    66 */    AUDIO_CS_REQUESTS,
/*    67 */    AUDIO_SET_DEFAULT_FEATURE_UNIT,
/*    68 */    AUDIO_SET_INTERFACE,
/*    69 */    AUDIO_SET_STREAMING_INTERFACE,
/*    70 */    AUDIO_SET_CUR1,
/*    71 */    AUDIO_GET_MIN,
/*    72 */    AUDIO_GET_MAX,
/*    73 */    AUDIO_GET_RES,
/*    74 */    AUDIO_GET_CUR1,
/*    75 */    AUDIO_SET_CUR2,
/*    76 */    AUDIO_GET_CUR2,
/*    77 */    AUDIO_SET_CUR3,
/*    78 */    AUDIO_SET_INTERFACE0,
/*    79 */    AUDIO_SET_INTERFACE1,
/*    80 */    AUDIO_SET_INTERFACE2,
/*    81 */    AUDIO_ISOC_OUT,
/*    82 */    AUDIO_ISOC_IN,
/*    83 */    AUDIO_ISOC_POLL,
/*    84 */    AUDIO_ERROR,
/*    85 */ }
/*    86 */ AUDIO_StateTypeDef;
/*    88 */ typedef enum
/*    89 */ {
/*    90 */    AUDIO_REQ_INIT = 1,
/*    91 */    AUDIO_REQ_IDLE,
/*    92 */    AUDIO_REQ_SET_DEFAULT_IN_INTERFACE,
/*    93 */    AUDIO_REQ_SET_DEFAULT_OUT_INTERFACE,
/*    94 */    AUDIO_REQ_SET_IN_INTERFACE,
/*    95 */    AUDIO_REQ_SET_OUT_INTERFACE,
/*    96 */    AUDIO_REQ_CS_REQUESTS,
/*    97 */ }
/*    98 */ AUDIO_ReqStateTypeDef;
/*   100 */ typedef enum
/*   101 */ {
/*   102 */    AUDIO_REQ_SET_VOLUME = 1,
/*   103 */    AUDIO_REQ_SET_MUTE,
/*   104 */    AUDIO_REQ_GET_CURR_VOLUME,
/*   105 */    AUDIO_REQ_GET_MIN_VOLUME,
/*   106 */    AUDIO_REQ_GET_MAX_VOLUME,
/*   107 */    AUDIO_REQ_GET_VOLUME,
/*   108 */    AUDIO_REQ_GET_RESOLUTION,
/*   109 */    AUDIO_REQ_CS_IDLE,
/*   110 */ }
/*   111 */ AUDIO_CSReqStateTypeDef;
/*   113 */ typedef enum
/*   114 */ {
/*   115 */    AUDIO_PLAYBACK_INIT = 1,
/*   116 */    AUDIO_PLAYBACK_SET_EP,
/*   117 */    AUDIO_PLAYBACK_SET_EP_FREQ,
/*   118 */    AUDIO_PLAYBACK_PLAY,
/*   119 */    AUDIO_PLAYBACK_IDLE,
/*   120 */ }
/*   121 */ AUDIO_PlayStateTypeDef;
/*   123 */ typedef enum
/*   124 */ {
/*   125 */    VOLUME_UP = 1,
/*   126 */    VOLUME_DOWN = 2,
/*   127 */ }
/*   128 */ AUDIO_VolumeCtrlTypeDef;
/*   130 */ typedef enum
/*   131 */ {
/*   132 */    AUDIO_CONTROL_INIT = 1,
/*   133 */    AUDIO_CONTROL_CHANGE,
/*   134 */    AUDIO_CONTROL_IDLE,
/*   135 */    AUDIO_CONTROL_VOLUME_UP,
/*   136 */    AUDIO_CONTROL_VOLUME_DOWN,
/*   137 */ }
/*   138 */ AUDIO_ControlStateTypeDef;
/*   141 */ typedef enum
/*   142 */ {
/*   143 */    AUDIO_DATA_START_OUT = 1,
/*   144 */    AUDIO_DATA_OUT,
/*   145 */ }
/*   146 */ AUDIO_ProcessingTypeDef;
/*   149 */ typedef struct
/*   150 */ {
/*   151 */    unsigned char Channels;
/*   152 */    unsigned char Bits;
/*   153 */    uint32_t SampleRate;
/*   154 */ }
/*   155 */ AUDIO_FormatTypeDef;
/*   157 */ typedef struct
/*   158 */ {
/*   159 */    unsigned char Ep;
/*   160 */    unsigned short EpSize;
/*   161 */    unsigned char AltSettings;
/*   162 */    unsigned char interface;
/*   163 */    unsigned char valid;
/*   164 */    unsigned short Poll;
/*   165 */ }
/*   166 */ AUDIO_STREAMING_IN_HandleTypeDef;
/*   168 */ typedef struct
/*   169 */ {
/*   170 */    unsigned char Ep;
/*   171 */    unsigned short EpSize;
/*   172 */    unsigned char AltSettings;
/*   173 */    unsigned char interface;
/*   174 */    unsigned char valid;
/*   175 */    unsigned short Poll;
/*   176 */ }
/*   177 */ AUDIO_STREAMING_OUT_HandleTypeDef;
/*   180 */ typedef struct
/*   181 */ {
/*   182 */    unsigned char mute;
/*   183 */    uint32_t volumeMin;
/*   184 */    uint32_t volumeMax;
/*   185 */    uint32_t volume;
/*   186 */    uint32_t resolution;
/*   187 */ }
/*   188 */ AUDIO_ControlAttributeTypeDef;
/*   190 */ typedef struct
/*   191 */ {
/*   193 */    unsigned char Ep;
/*   194 */    unsigned short EpSize;
/*   195 */    unsigned char interface;
/*   196 */    unsigned char AltSettings;
/*   197 */    unsigned char supported;
/*   199 */    unsigned char Pipe;
/*   200 */    unsigned char Poll;
/*   201 */    uint32_t timer ;
/*   203 */    unsigned char asociated_as;
/*   204 */    unsigned char asociated_mixer;
/*   205 */    unsigned char asociated_selector;
/*   206 */    unsigned char asociated_feature;
/*   207 */    unsigned char asociated_terminal;
/*   208 */    unsigned char asociated_channels;
/*   210 */    uint32_t frequency;
/*   211 */    unsigned char *buf;
/*   212 */    unsigned char *cbuf;
/*   213 */    uint32_t partial_ptr;
/*   215 */    uint32_t global_ptr;
/*   216 */    unsigned short frame_length;
/*   217 */    uint32_t total_length;
/*   219 */    AUDIO_ControlAttributeTypeDef attribute;
/*   220 */ }
/*   221 */ AUDIO_InterfaceStreamPropTypeDef;
/*   223 */ typedef struct
/*   224 */ {
/*   226 */    unsigned char Ep;
/*   227 */    unsigned short EpSize;
/*   228 */    unsigned char interface;
/*   229 */    unsigned char supported;
/*   231 */    unsigned char Pipe;
/*   232 */    unsigned char Poll;
/*   233 */    uint32_t timer ;
/*   234 */ }
/*   235 */ AUDIO_InterfaceControlPropTypeDef;
/*   256 */ typedef struct
/*   257 */ {
/*   258 */    unsigned char bLength;
/*   259 */    unsigned char bDescriptorType;
/*   260 */    unsigned char bDescriptorSubtype;
/*   261 */    unsigned char bTerminalLink;
/*   262 */    unsigned char bDelay;
/*   263 */    unsigned char wFormatTag[2];
/*   264 */ }
/*   265 */ AUDIO_ASGeneralDescTypeDef;
/*   268 */ typedef struct
/*   269 */ {
/*   270 */    unsigned char bLength;
/*   271 */    unsigned char bDescriptorType;
/*   272 */    unsigned char bDescriptorSubtype;
/*   273 */    unsigned char bFormatType;
/*   274 */    unsigned char bNrChannels;
/*   275 */    unsigned char bSubframeSize;
/*   276 */    unsigned char bBitResolution;
/*   277 */    unsigned char bSamFreqType;
/*   278 */    unsigned char tSamFreq[5][3];
/*   279 */ }
/*   280 */ AUDIO_ASFormatTypeDescTypeDef;
/*   283 */ typedef struct
/*   284 */ {
/*   285 */    AUDIO_ASGeneralDescTypeDef *GeneralDesc;
/*   286 */    AUDIO_ASFormatTypeDescTypeDef *FormatTypeDesc;
/*   287 */ }
/*   288 */ AUDIO_ASDescTypeDef;
/*   292 */ typedef struct
/*   293 */ {
/*   294 */    unsigned char bLength;
/*   295 */    unsigned char bDescriptorType;
/*   296 */    unsigned char bDescriptorSubtype;
/*   297 */    unsigned char bcdADC[2];
/*   298 */    unsigned char wTotalLength[2];
/*   299 */    unsigned char bInCollection;
/*   300 */    unsigned char baInterfaceNr[5];
/*   301 */ }
/*   302 */ AUDIO_HeaderDescTypeDef;
/*   305 */ typedef struct
/*   306 */ {
/*   307 */    unsigned char bLength;
/*   308 */    unsigned char bDescriptorType;
/*   309 */    unsigned char bDescriptorSubtype;
/*   310 */    unsigned char bTerminalID;
/*   311 */    unsigned char wTerminalType[2];
/*   312 */    unsigned char bAssocTerminal;
/*   313 */    unsigned char bNrChannels;
/*   314 */    unsigned char wChannelConfig[2];
/*   315 */    unsigned char iChannelNames;
/*   316 */    unsigned char iTerminal;
/*   317 */ }
/*   318 */ AUDIO_ITDescTypeDef;
/*   321 */ typedef struct
/*   322 */ {
/*   323 */    unsigned char bLength;
/*   324 */    unsigned char bDescriptorType;
/*   325 */    unsigned char bDescriptorSubtype;
/*   326 */    unsigned char bTerminalID;
/*   327 */    unsigned char wTerminalType[2];
/*   328 */    unsigned char bAssocTerminal;
/*   329 */    unsigned char bSourceID;
/*   330 */    unsigned char iTerminal;
/*   331 */ }
/*   332 */ AUDIO_OTDescTypeDef;
/*   335 */ typedef struct
/*   336 */ {
/*   337 */    unsigned char bLength;
/*   338 */    unsigned char bDescriptorType;
/*   339 */    unsigned char bDescriptorSubtype;
/*   340 */    unsigned char bUnitID;
/*   341 */    unsigned char bSourceID;
/*   342 */    unsigned char bControlSize;
/*   343 */    unsigned char bmaControls[5][2];
/*   344 */ }
/*   345 */ AUDIO_FeatureDescTypeDef;
/*   349 */ typedef struct
/*   350 */ {
/*   351 */    unsigned char bLength;
/*   352 */    unsigned char bDescriptorType;
/*   353 */    unsigned char bDescriptorSubtype;
/*   354 */    unsigned char bUnitID;
/*   355 */    unsigned char bNrInPins;
/*   356 */    unsigned char bSourceID0;
/*   357 */    unsigned char bSourceID1;
/*   358 */    unsigned char bNrChannels;
/*   359 */    unsigned char bmChannelsConfig[2];
/*   360 */    unsigned char iChannelsNames;
/*   361 */    unsigned char bmaControls;
/*   362 */    unsigned char iMixer;
/*   363 */ }
/*   364 */ AUDIO_MixerDescTypeDef;
/*   369 */ typedef struct
/*   370 */ {
/*   371 */    unsigned char bLength;
/*   372 */    unsigned char bDescriptorType;
/*   373 */    unsigned char bDescriptorSubtype;
/*   374 */    unsigned char bUnitID;
/*   375 */    unsigned char bNrInPins;
/*   376 */    unsigned char bSourceID0;
/*   377 */    unsigned char iSelector;
/*   378 */ }
/*   379 */ AUDIO_SelectorDescTypeDef;
/*   382 */ typedef struct
/*   383 */ {
/*   384 */    AUDIO_HeaderDescTypeDef *HeaderDesc;
/*   385 */    AUDIO_ITDescTypeDef *InputTerminalDesc [0x04];
/*   386 */    AUDIO_OTDescTypeDef *OutputTerminalDesc[0x04];
/*   387 */    AUDIO_FeatureDescTypeDef *FeatureUnitDesc [0x04];
/*   388 */    AUDIO_MixerDescTypeDef *MixerUnitDesc [0x04];
/*   389 */    AUDIO_SelectorDescTypeDef *SelectorUnitDesc [0x04];
/*   390 */ }
/*   391 */ AUDIO_ACDescTypeDef;
/*   395 */ typedef struct
/*   396 */ {
/*   397 */    AUDIO_ACDescTypeDef cs_desc;
/*   398 */    AUDIO_ASDescTypeDef as_desc[0x05];
/*   400 */    unsigned short ASNum;
/*   401 */    unsigned short InputTerminalNum;
/*   402 */    unsigned short OutputTerminalNum;
/*   403 */    unsigned short FeatureUnitNum;
/*   404 */    unsigned short SelectorUnitNum;
/*   405 */    unsigned short MixerUnitNum;
/*   406 */ }
/*   407 */ AUDIO_ClassSpecificDescTypedef;
/*   410 */ typedef struct _AUDIO_Process
/*   411 */ {
/*   412 */    AUDIO_ReqStateTypeDef req_state;
/*   413 */    AUDIO_CSReqStateTypeDef cs_req_state;
/*   414 */    AUDIO_PlayStateTypeDef play_state;
/*   415 */    AUDIO_ControlStateTypeDef control_state;
/*   416 */    AUDIO_ProcessingTypeDef processing_state;
/*   418 */    AUDIO_STREAMING_IN_HandleTypeDef stream_in[0x05];
/*   419 */    AUDIO_STREAMING_OUT_HandleTypeDef stream_out[0x05];
/*   420 */    AUDIO_ClassSpecificDescTypedef class_desc;
/*   422 */    AUDIO_InterfaceStreamPropTypeDef headphone;
/*   423 */    AUDIO_InterfaceStreamPropTypeDef microphone;
/*   424 */    AUDIO_InterfaceControlPropTypeDef control;
/*   425 */    unsigned short mem [8];
/*   426 */    unsigned char temp_feature;
/*   427 */    unsigned char temp_channels;
/*   428 */ }
/*   429 */ AUDIO_HandleTypeDef;
/*   542 */ extern USBH_ClassTypeDef AUDIO_Class;
/*   551 */ USBH_StatusTypeDef USBH_AUDIO_SetFrequency (USBH_HandleTypeDef *phost,
/*   552 */     unsigned short sample_rate,
/*   553 */     unsigned char channel_num,
/*   554 */     unsigned char data_width);
/*   556 */ USBH_StatusTypeDef USBH_AUDIO_Play (USBH_HandleTypeDef *phost, unsigned char *buf, uint32_t length);
/*   557 */ USBH_StatusTypeDef USBH_AUDIO_Stop (USBH_HandleTypeDef *phost);
/*   558 */ USBH_StatusTypeDef USBH_AUDIO_Suspend (USBH_HandleTypeDef *phost);
/*   559 */ USBH_StatusTypeDef USBH_AUDIO_Resume (USBH_HandleTypeDef *phost);
/*   560 */ USBH_StatusTypeDef USBH_AUDIO_SetVolume (USBH_HandleTypeDef *phost, AUDIO_VolumeCtrlTypeDef volume_ctl);
/*   561 */ USBH_StatusTypeDef USBH_AUDIO_ChangeOutBuffer (USBH_HandleTypeDef *phost, unsigned char *buf);
/*   562 */ int32_t USBH_AUDIO_GetOutOffset (USBH_HandleTypeDef *phost);
/*   564 */ void USBH_AUDIO_FrequencySet(USBH_HandleTypeDef *phost);
/*   567 */ void USBH_AUDIO_BufferEmptyCallback(USBH_HandleTypeDef *phost);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc/usbh_cdc.h
 */
/*   146 */ typedef enum
/*   147 */ {
/*   148 */    CDC_IDLE= 0,
/*   149 */    CDC_SEND_DATA,
/*   150 */    CDC_SEND_DATA_WAIT,
/*   151 */    CDC_RECEIVE_DATA,
/*   152 */    CDC_RECEIVE_DATA_WAIT,
/*   153 */ }
/*   154 */ CDC_DataStateTypeDef;
/*   156 */ typedef enum
/*   157 */ {
/*   158 */    CDC_IDLE_STATE= 0,
/*   159 */    CDC_SET_LINE_CODING_STATE,
/*   160 */    CDC_GET_LAST_LINE_CODING_STATE,
/*   161 */    CDC_TRANSFER_DATA,
/*   162 */    CDC_ERROR_STATE,
/*   163 */ }
/*   164 */ CDC_StateTypeDef;
/*   168 */ typedef union _CDC_LineCodingStructure
/*   169 */ {
/*   170 */    unsigned char Array[0x07];
/*   172 */    struct
/*   173 */    {
/*   175 */       uint32_t dwDTERate;
/*   176 */       unsigned char bCharFormat;
/*   180 */       unsigned char bParityType;
/*   186 */       unsigned char bDataBits;
/*   187 */    }b;
/*   188 */ }
/*   189 */ CDC_LineCodingTypeDef;
/*   208 */ typedef struct _FunctionalDescriptorHeader
/*   209 */ {
/*   210 */    unsigned char bLength;
/*   211 */    unsigned char bDescriptorType;
/*   212 */    unsigned char bDescriptorSubType;
/*   213 */    unsigned short bcdCDC;
/*   216 */ }
/*   217 */ CDC_HeaderFuncDesc_TypeDef;
/*   249 */ typedef struct _CallMgmtFunctionalDescriptor
/*   250 */ {
/*   251 */    unsigned char bLength;
/*   252 */    unsigned char bDescriptorType;
/*   253 */    unsigned char bDescriptorSubType;
/*   254 */    unsigned char bmCapabilities;
/*   255 */    unsigned char bDataInterface;
/*   256 */ }
/*   257 */ CDC_CallMgmtFuncDesc_TypeDef;
/*   287 */ typedef struct _AbstractCntrlMgmtFunctionalDescriptor
/*   288 */ {
/*   289 */    unsigned char bLength;
/*   290 */    unsigned char bDescriptorType;
/*   291 */    unsigned char bDescriptorSubType;
/*   293 */    unsigned char bmCapabilities;
/*   294 */ }
/*   295 */ CDC_AbstCntrlMgmtFuncDesc_TypeDef;
/*   310 */ typedef struct _UnionFunctionalDescriptor
/*   311 */ {
/*   312 */    unsigned char bLength;
/*   313 */    unsigned char bDescriptorType;
/*   314 */    unsigned char bDescriptorSubType;
/*   315 */    unsigned char bMasterInterface;
/*   317 */    unsigned char bSlaveInterface0;
/*   318 */ }
/*   319 */ CDC_UnionFuncDesc_TypeDef;
/*   321 */ typedef struct _USBH_CDCInterfaceDesc
/*   322 */ {
/*   323 */    CDC_HeaderFuncDesc_TypeDef CDC_HeaderFuncDesc;
/*   324 */    CDC_CallMgmtFuncDesc_TypeDef CDC_CallMgmtFuncDesc;
/*   325 */    CDC_AbstCntrlMgmtFuncDesc_TypeDef CDC_AbstCntrlMgmtFuncDesc;
/*   326 */    CDC_UnionFuncDesc_TypeDef CDC_UnionFuncDesc;
/*   327 */ }
/*   328 */ CDC_InterfaceDesc_Typedef;
/*   332 */ typedef struct
/*   333 */ {
/*   334 */    unsigned char NotifPipe;
/*   335 */    unsigned char NotifEp;
/*   336 */    unsigned char buff[8];
/*   337 */    unsigned short NotifEpSize;
/*   338 */ }
/*   339 */ CDC_CommItfTypedef ;
/*   341 */ typedef struct
/*   342 */ {
/*   343 */    unsigned char InPipe;
/*   344 */    unsigned char OutPipe;
/*   345 */    unsigned char OutEp;
/*   346 */    unsigned char InEp;
/*   347 */    unsigned char buff[8];
/*   348 */    unsigned short OutEpSize;
/*   349 */    unsigned short InEpSize;
/*   350 */ }
/*   351 */ CDC_DataItfTypedef ;
/*   354 */ typedef struct _CDC_Process
/*   355 */ {
/*   356 */    CDC_CommItfTypedef CommItf;
/*   357 */    CDC_DataItfTypedef DataItf;
/*   358 */    unsigned char *pTxData;
/*   359 */    unsigned char *pRxData;
/*   360 */    uint32_t TxDataLength;
/*   361 */    uint32_t RxDataLength;
/*   362 */    CDC_InterfaceDesc_Typedef CDC_Desc;
/*   363 */    CDC_LineCodingTypeDef LineCoding;
/*   364 */    CDC_LineCodingTypeDef *pUserLineCoding;
/*   365 */    CDC_StateTypeDef state;
/*   366 */    CDC_DataStateTypeDef data_tx_state;
/*   367 */    CDC_DataStateTypeDef data_rx_state;
/*   368 */    unsigned char Rx_Poll;
/*   369 */ }
/*   370 */ CDC_HandleTypeDef;
/*   394 */ extern USBH_ClassTypeDef CDC_Class;
/*   405 */ USBH_StatusTypeDef USBH_CDC_SetLineCoding(USBH_HandleTypeDef *phost,
/*   406 */     CDC_LineCodingTypeDef *linecoding);
/*   408 */ USBH_StatusTypeDef USBH_CDC_GetLineCoding(USBH_HandleTypeDef *phost,
/*   409 */     CDC_LineCodingTypeDef *linecoding);
/*   411 */ USBH_StatusTypeDef USBH_CDC_Transmit(USBH_HandleTypeDef *phost,
/*   412 */     unsigned char *pbuff,
/*   413 */     uint32_t length);
/*   415 */ USBH_StatusTypeDef USBH_CDC_Receive(USBH_HandleTypeDef *phost,
/*   416 */     unsigned char *pbuff,
/*   417 */     uint32_t length);
/*   420 */ unsigned short USBH_CDC_GetLastReceivedDataSize(USBH_HandleTypeDef *phost);
/*   422 */ USBH_StatusTypeDef USBH_CDC_Stop(USBH_HandleTypeDef *phost);
/*   424 */ void USBH_CDC_LineCodingChanged(USBH_HandleTypeDef *phost);
/*   426 */ void USBH_CDC_TransmitCallback(USBH_HandleTypeDef *phost);
/*   428 */ void USBH_CDC_ReceiveCallback(USBH_HandleTypeDef *phost);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc/usbh_msc_bot.h
 */
/*    62 */ typedef enum {
/*    63 */    BOT_OK = 0,
/*    64 */    BOT_FAIL = 1,
/*    65 */    BOT_PHASE_ERROR = 2,
/*    66 */    BOT_BUSY = 3
/*    67 */ }
/*    68 */ BOT_StatusTypeDef;
/*    70 */ typedef enum {
/*    71 */    BOT_CMD_IDLE = 0,
/*    72 */    BOT_CMD_SEND,
/*    73 */    BOT_CMD_WAIT,
/*    74 */ }
/*    75 */ BOT_CMDStateTypeDef;
/*    78 */ typedef enum
/*    79 */ {
/*    81 */    BOT_CSW_CMD_PASSED = 0x00,
/*    82 */    BOT_CSW_CMD_FAILED = 0x01,
/*    83 */    BOT_CSW_PHASE_ERROR = 0x02,
/*    84 */ }
/*    85 */ BOT_CSWStatusTypeDef;
/*    87 */ typedef enum {
/*    88 */    BOT_SEND_CBW = 1,
/*    89 */    BOT_SEND_CBW_WAIT,
/*    90 */    BOT_DATA_IN,
/*    91 */    BOT_DATA_IN_WAIT,
/*    92 */    BOT_DATA_OUT,
/*    93 */    BOT_DATA_OUT_WAIT,
/*    94 */    BOT_RECEIVE_CSW,
/*    95 */    BOT_RECEIVE_CSW_WAIT,
/*    96 */    BOT_ERROR_IN,
/*    97 */    BOT_ERROR_OUT,
/*    98 */    BOT_UNRECOVERED_ERROR
/*    99 */ }
/*   100 */ BOT_StateTypeDef;
/*   102 */ typedef union
/*   103 */ {
/*   104 */    struct __CBW
/*   105 */    {
/*   106 */       uint32_t Signature;
/*   107 */       uint32_t Tag;
/*   108 */       uint32_t DataTransferLength;
/*   109 */       unsigned char Flags;
/*   110 */       unsigned char LUN;
/*   111 */       unsigned char CBLength;
/*   112 */       unsigned char CB[16];
/*   113 */    }field;
/*   114 */    unsigned char data[31];
/*   115 */ }
/*   116 */ BOT_CBWTypeDef;
/*   118 */ typedef union
/*   119 */ {
/*   120 */    struct __CSW
/*   121 */    {
/*   122 */       uint32_t Signature;
/*   123 */       uint32_t Tag;
/*   124 */       uint32_t DataResidue;
/*   125 */       unsigned char Status;
/*   126 */    }field;
/*   127 */    unsigned char data[13];
/*   128 */ }
/*   129 */ BOT_CSWTypeDef;
/*   131 */ typedef struct
/*   132 */ {
/*   133 */    uint32_t data[16];
/*   134 */    BOT_StateTypeDef state;
/*   135 */    BOT_StateTypeDef prev_state;
/*   136 */    BOT_CMDStateTypeDef cmd_state;
/*   137 */    BOT_CBWTypeDef cbw;
/*   138 */    unsigned char Reserved1;
/*   139 */    BOT_CSWTypeDef csw;
/*   140 */    unsigned char Reserved2[3];
/*   141 */    unsigned char *pbuf;
/*   142 */ }
/*   143 */ BOT_HandleTypeDef;
/*   205 */ USBH_StatusTypeDef USBH_MSC_BOT_REQ_Reset(USBH_HandleTypeDef *phost);
/*   206 */ USBH_StatusTypeDef USBH_MSC_BOT_REQ_GetMaxLUN(USBH_HandleTypeDef *phost, unsigned char *Maxlun);
/*   208 */ USBH_StatusTypeDef USBH_MSC_BOT_Init(USBH_HandleTypeDef *phost);
/*   209 */ USBH_StatusTypeDef USBH_MSC_BOT_Process (USBH_HandleTypeDef *phost, unsigned char lun);
/*   210 */ USBH_StatusTypeDef USBH_MSC_BOT_Error(USBH_HandleTypeDef *phost, unsigned char lun);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc/usbh_msc_scsi.h
 */
/*    59 */ typedef struct
/*    60 */ {
/*    61 */    uint32_t block_nbr;
/*    62 */    unsigned short block_size;
/*    63 */ } SCSI_CapacityTypeDef;
/*    67 */ typedef struct
/*    68 */ {
/*    69 */    unsigned char key;
/*    70 */    unsigned char asc;
/*    71 */    unsigned char ascq;
/*    72 */ } SCSI_SenseTypeDef;
/*    75 */ typedef struct
/*    76 */ {
/*    77 */    unsigned char PeripheralQualifier;
/*    78 */    unsigned char DeviceType;
/*    79 */    unsigned char RemovableMedia;
/*    80 */    unsigned char vendor_id[9];
/*    81 */    unsigned char product_id[17];
/*    82 */    unsigned char revision_id[5];
/*    83 */ }SCSI_StdInquiryDataTypeDef;
/*   170 */ USBH_StatusTypeDef USBH_MSC_SCSI_TestUnitReady (USBH_HandleTypeDef *phost,
/*   171 */     unsigned char lun);
/*   173 */ USBH_StatusTypeDef USBH_MSC_SCSI_ReadCapacity (USBH_HandleTypeDef *phost,
/*   174 */     unsigned char lun,
/*   175 */     SCSI_CapacityTypeDef *capacity);
/*   177 */ USBH_StatusTypeDef USBH_MSC_SCSI_Inquiry (USBH_HandleTypeDef *phost,
/*   178 */     unsigned char lun,
/*   179 */     SCSI_StdInquiryDataTypeDef *inquiry);
/*   181 */ USBH_StatusTypeDef USBH_MSC_SCSI_RequestSense (USBH_HandleTypeDef *phost,
/*   182 */     unsigned char lun,
/*   183 */     SCSI_SenseTypeDef *sense_data);
/*   185 */ USBH_StatusTypeDef USBH_MSC_SCSI_Write(USBH_HandleTypeDef *phost,
/*   186 */     unsigned char lun,
/*   187 */     uint32_t address,
/*   188 */     unsigned char *pbuf,
/*   189 */     uint32_t length);
/*   191 */ USBH_StatusTypeDef USBH_MSC_SCSI_Read(USBH_HandleTypeDef *phost,
/*   192 */     unsigned char lun,
/*   193 */     uint32_t address,
/*   194 */     unsigned char *pbuf,
/*   195 */     uint32_t length);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc/usbh_msc.h
 */
/*    63 */ typedef enum
/*    64 */ {
/*    65 */    MSC_INIT = 0,
/*    66 */    MSC_IDLE,
/*    67 */    MSC_TEST_UNIT_READY,
/*    68 */    MSC_READ_CAPACITY10,
/*    69 */    MSC_READ_INQUIRY,
/*    70 */    MSC_REQUEST_SENSE,
/*    71 */    MSC_READ,
/*    72 */    MSC_WRITE,
/*    73 */    MSC_UNRECOVERED_ERROR,
/*    74 */    MSC_PERIODIC_CHECK,
/*    75 */ }
/*    76 */ MSC_StateTypeDef;
/*    78 */ typedef enum
/*    79 */ {
/*    80 */    MSC_OK,
/*    81 */    MSC_NOT_READY,
/*    82 */    MSC_ERROR,
/*    84 */ }
/*    85 */ MSC_ErrorTypeDef;
/*    87 */ typedef enum
/*    88 */ {
/*    89 */    MSC_REQ_IDLE = 0,
/*    90 */    MSC_REQ_RESET,
/*    91 */    MSC_REQ_GET_MAX_LUN,
/*    92 */    MSC_REQ_ERROR,
/*    93 */ }
/*    94 */ MSC_ReqStateTypeDef;
/*   102 */ typedef struct
/*   103 */ {
/*   104 */    MSC_StateTypeDef state;
/*   105 */    MSC_ErrorTypeDef error;
/*   106 */    USBH_StatusTypeDef prev_ready_state;
/*   107 */    SCSI_CapacityTypeDef capacity;
/*   108 */    SCSI_SenseTypeDef sense;
/*   109 */    SCSI_StdInquiryDataTypeDef inquiry;
/*   110 */    unsigned char state_changed;
/*   112 */ }
/*   113 */ MSC_LUNTypeDef;
/*   116 */ typedef struct _MSC_Process
/*   117 */ {
/*   118 */    uint32_t max_lun;
/*   119 */    unsigned char InPipe;
/*   120 */    unsigned char OutPipe;
/*   121 */    unsigned char OutEp;
/*   122 */    unsigned char InEp;
/*   123 */    unsigned short OutEpSize;
/*   124 */    unsigned short InEpSize;
/*   125 */    MSC_StateTypeDef state;
/*   126 */    MSC_ErrorTypeDef error;
/*   127 */    MSC_ReqStateTypeDef req_state;
/*   128 */    MSC_ReqStateTypeDef prev_req_state;
/*   129 */    BOT_HandleTypeDef hbot;
/*   130 */    MSC_LUNTypeDef unit[2];
/*   131 */    unsigned short current_lun;
/*   132 */    unsigned short rw_lun;
/*   133 */    uint32_t timer;
/*   134 */ }
/*   135 */ MSC_HandleTypeDef;
/*   172 */ extern USBH_ClassTypeDef USBH_msc;
/*   184 */ unsigned char USBH_MSC_IsReady (USBH_HandleTypeDef *phost);
/*   187 */ int8_t USBH_MSC_GetMaxLUN (USBH_HandleTypeDef *phost);
/*   189 */ unsigned char USBH_MSC_UnitIsReady (USBH_HandleTypeDef *phost, unsigned char lun);
/*   191 */ USBH_StatusTypeDef USBH_MSC_GetLUNInfo(USBH_HandleTypeDef *phost, unsigned char lun, MSC_LUNTypeDef *info);
/*   193 */ USBH_StatusTypeDef USBH_MSC_Read(USBH_HandleTypeDef *phost,
/*   194 */     unsigned char lun,
/*   195 */     uint32_t address,
/*   196 */     unsigned char *pbuf,
/*   197 */     uint32_t length);
/*   199 */ USBH_StatusTypeDef USBH_MSC_Write(USBH_HandleTypeDef *phost,
/*   200 */     unsigned char lun,
/*   201 */     uint32_t address,
/*   202 */     unsigned char *pbuf,
/*   203 */     uint32_t length);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc/usbh_hid_mouse.h
 */
/*    61 */ typedef struct _HID_MOUSE_Info
/*    62 */ {
/*    63 */    unsigned char x;
/*    64 */    unsigned char y;
/*    65 */    unsigned char buttons[3];
/*    66 */ }
/*    67 */ HID_MOUSE_Info_TypeDef;
/*    97 */ USBH_StatusTypeDef USBH_HID_MouseInit(USBH_HandleTypeDef *phost);
/*    98 */ HID_MOUSE_Info_TypeDef *USBH_HID_GetMouseInfo(USBH_HandleTypeDef *phost);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc/usbh_hid_keybd.h
 */
/*   281 */ typedef struct
/*   282 */ {
/*   283 */    unsigned char state;
/*   284 */    unsigned char lctrl;
/*   285 */    unsigned char lshift;
/*   286 */    unsigned char lalt;
/*   287 */    unsigned char lgui;
/*   288 */    unsigned char rctrl;
/*   289 */    unsigned char rshift;
/*   290 */    unsigned char ralt;
/*   291 */    unsigned char rgui;
/*   292 */    unsigned char keys[6];
/*   293 */ }
/*   294 */ HID_KEYBD_Info_TypeDef;
/*   296 */ USBH_StatusTypeDef USBH_HID_KeybdInit(USBH_HandleTypeDef *phost);
/*   297 */ HID_KEYBD_Info_TypeDef *USBH_HID_GetKeybdInfo(USBH_HandleTypeDef *phost);
/*   298 */ unsigned char USBH_HID_GetASCIICode(HID_KEYBD_Info_TypeDef *info);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc/usbh_hid.h
 */
/*   111 */ typedef enum
/*   112 */ {
/*   113 */    HID_INIT= 0,
/*   114 */    HID_IDLE,
/*   115 */    HID_SEND_DATA,
/*   116 */    HID_BUSY,
/*   117 */    HID_GET_DATA,
/*   118 */    HID_SYNC,
/*   119 */    HID_POLL,
/*   120 */    HID_ERROR,
/*   121 */ }
/*   122 */ HID_StateTypeDef;
/*   124 */ typedef enum
/*   125 */ {
/*   126 */    HID_REQ_INIT = 0,
/*   127 */    HID_REQ_IDLE,
/*   128 */    HID_REQ_GET_REPORT_DESC,
/*   129 */    HID_REQ_GET_HID_DESC,
/*   130 */    HID_REQ_SET_IDLE,
/*   131 */    HID_REQ_SET_PROTOCOL,
/*   132 */    HID_REQ_SET_REPORT,
/*   134 */ }
/*   135 */ HID_CtlStateTypeDef;
/*   137 */ typedef enum
/*   138 */ {
/*   139 */    HID_MOUSE = 0x01,
/*   140 */    HID_KEYBOARD = 0x02,
/*   141 */    HID_UNKNOWN = 0xFF,
/*   142 */ }
/*   143 */ HID_TypeTypeDef;
/*   146 */ typedef struct _HID_ReportData
/*   147 */ {
/*   148 */    unsigned char ReportID;
/*   149 */    unsigned char ReportType;
/*   150 */    unsigned short UsagePage;
/*   151 */    uint32_t Usage[10];
/*   152 */    uint32_t NbrUsage;
/*   153 */    uint32_t UsageMin;
/*   154 */    uint32_t UsageMax;
/*   155 */    int32_t LogMin;
/*   156 */    int32_t LogMax;
/*   157 */    int32_t PhyMin;
/*   158 */    int32_t PhyMax;
/*   159 */    int32_t UnitExp;
/*   160 */    uint32_t Unit;
/*   161 */    uint32_t ReportSize;
/*   162 */    uint32_t ReportCnt;
/*   163 */    uint32_t Flag;
/*   164 */    uint32_t PhyUsage;
/*   165 */    uint32_t AppUsage;
/*   166 */    uint32_t LogUsage;
/*   167 */ }
/*   168 */ HID_ReportDataTypeDef;
/*   170 */ typedef struct _HID_ReportIDTypeDef {
/*   171 */    unsigned char Size;
/*   172 */    unsigned char ReportID;
/*   173 */    unsigned char Type;
/*   174 */ } HID_ReportIDTypeDef;
/*   176 */ typedef struct _HID_CollectionTypeDef
/*   177 */ {
/*   178 */    uint32_t Usage;
/*   179 */    unsigned char Type;
/*   180 */    struct _HID_CollectionTypeDef *NextPtr;
/*   181 */ } HID_CollectionTypeDef;
/*   184 */ typedef struct _HID_AppCollectionTypeDef {
/*   185 */    uint32_t Usage;
/*   186 */    unsigned char Type;
/*   187 */    unsigned char NbrReportFmt;
/*   188 */    HID_ReportDataTypeDef ReportData[10];
/*   189 */ } HID_AppCollectionTypeDef;
/*   192 */ typedef struct _HIDDescriptor
/*   193 */ {
/*   194 */    unsigned char bLength;
/*   195 */    unsigned char bDescriptorType;
/*   196 */    unsigned short bcdHID;
/*   197 */    unsigned char bCountryCode;
/*   198 */    unsigned char bNumDescriptors;
/*   199 */    unsigned char bReportDescriptorType;
/*   200 */    unsigned short wItemLength;
/*   201 */ }
/*   202 */ HID_DescTypeDef;
/*   205 */ typedef struct
/*   206 */ {
/*   207 */    unsigned char *buf;
/*   208 */    unsigned short head;
/*   209 */    unsigned short tail;
/*   210 */    unsigned short size;
/*   211 */    unsigned char lock;
/*   212 */ } FIFO_TypeDef;
/*   216 */ typedef struct _HID_Process
/*   217 */ {
/*   218 */    unsigned char OutPipe;
/*   219 */    unsigned char InPipe;
/*   220 */    HID_StateTypeDef state;
/*   221 */    unsigned char OutEp;
/*   222 */    unsigned char InEp;
/*   223 */    HID_CtlStateTypeDef ctl_state;
/*   224 */    FIFO_TypeDef fifo;
/*   225 */    unsigned char *pData;
/*   226 */    unsigned short length;
/*   227 */    unsigned char ep_addr;
/*   228 */    unsigned short poll;
/*   229 */    uint32_t timer;
/*   230 */    unsigned char DataReady;
/*   231 */    HID_DescTypeDef HID_Desc;
/*   232 */    USBH_StatusTypeDef ( * Init)(USBH_HandleTypeDef *phost);
/*   233 */ }
/*   234 */ HID_HandleTypeDef;
/*   277 */ extern USBH_ClassTypeDef HID_Class;
/*   287 */ USBH_StatusTypeDef USBH_HID_SetReport (USBH_HandleTypeDef *phost,
/*   288 */     unsigned char reportType,
/*   289 */     unsigned char reportId,
/*   290 */     unsigned char* reportBuff,
/*   291 */     unsigned char reportLen);
/*   293 */ USBH_StatusTypeDef USBH_HID_GetReport (USBH_HandleTypeDef *phost,
/*   294 */     unsigned char reportType,
/*   295 */     unsigned char reportId,
/*   296 */     unsigned char* reportBuff,
/*   297 */     unsigned char reportLen);
/*   299 */ USBH_StatusTypeDef USBH_HID_GetHIDReportDescriptor (USBH_HandleTypeDef *phost,
/*   300 */     unsigned short length);
/*   302 */ USBH_StatusTypeDef USBH_HID_GetHIDDescriptor (USBH_HandleTypeDef *phost,
/*   303 */     unsigned short length);
/*   305 */ USBH_StatusTypeDef USBH_HID_SetIdle (USBH_HandleTypeDef *phost,
/*   306 */     unsigned char duration,
/*   307 */     unsigned char reportId);
/*   309 */ USBH_StatusTypeDef USBH_HID_SetProtocol (USBH_HandleTypeDef *phost,
/*   310 */     unsigned char protocol);
/*   312 */ void USBH_HID_EventCallback(USBH_HandleTypeDef *phost);
/*   314 */ HID_TypeTypeDef USBH_HID_GetDeviceType(USBH_HandleTypeDef *phost);
/*   316 */ unsigned char USBH_HID_GetPollInterval(USBH_HandleTypeDef *phost);
/*   318 */ void fifo_init(FIFO_TypeDef * f, unsigned char * buf, unsigned short size);
/*   320 */ unsigned short fifo_read(FIFO_TypeDef * f, void * buf, unsigned short nbytes);
/*   322 */ unsigned short fifo_write(FIFO_TypeDef * f, const void * buf, unsigned short nbytes);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/MTP/Inc/usbh_mtp_ptp.h
 */
/*   191 */ typedef enum
/*   192 */ {
/*   193 */    PTP_REQ_IDLE = 0,
/*   194 */    PTP_REQ_SEND = 1,
/*   195 */    PTP_REQ_WAIT,
/*   196 */    PTP_REQ_ERROR,
/*   197 */ }
/*   198 */ PTP_RequestStateTypeDef;
/*   200 */ typedef enum
/*   201 */ {
/*   202 */    PTP_IDLE = 0,
/*   203 */    PTP_OP_REQUEST_STATE,
/*   204 */    PTP_OP_REQUEST_WAIT_STATE,
/*   205 */    PTP_DATA_OUT_PHASE_STATE,
/*   206 */    PTP_DATA_OUT_PHASE_WAIT_STATE,
/*   207 */    PTP_DATA_IN_PHASE_STATE,
/*   208 */    PTP_DATA_IN_PHASE_WAIT_STATE,
/*   209 */    PTP_RESPONSE_STATE,
/*   210 */    PTP_RESPONSE_WAIT_STATE,
/*   211 */    PTP_ERROR,
/*   212 */ }
/*   213 */ PTP_ProcessStateTypeDef;
/*   216 */ typedef struct
/*   217 */ {
/*   218 */    unsigned short Code;
/*   219 */    uint32_t SessionID;
/*   220 */    uint32_t Transaction_ID;
/*   222 */    uint32_t Param1;
/*   223 */    uint32_t Param2;
/*   224 */    uint32_t Param3;
/*   226 */    uint32_t Param4;
/*   227 */    uint32_t Param5;
/*   229 */    unsigned char Nparam;
/*   230 */ }
/*   231 */ PTP_ContainerTypedef;
/*   241 */ typedef struct
/*   242 */ {
/*   243 */    uint32_t length;
/*   244 */    unsigned short type;
/*   245 */    unsigned short code;
/*   246 */    uint32_t trans_id;
/*   247 */    uint32_t param1;
/*   248 */    uint32_t param2;
/*   249 */    uint32_t param3;
/*   250 */    uint32_t param4;
/*   251 */    uint32_t param5;
/*   252 */ }
/*   253 */ PTP_RespContainerTypedef;
/*   256 */ typedef struct
/*   257 */ {
/*   258 */    uint32_t length;
/*   259 */    unsigned short type;
/*   260 */    unsigned short code;
/*   261 */    uint32_t trans_id;
/*   262 */    uint32_t param1;
/*   263 */    uint32_t param2;
/*   264 */    uint32_t param3;
/*   265 */    uint32_t param4;
/*   266 */    uint32_t param5;
/*   267 */ }
/*   268 */ PTP_OpContainerTypedef;
/*   270 */ typedef struct
/*   271 */ {
/*   272 */    uint32_t length;
/*   273 */    unsigned short type;
/*   274 */    unsigned short code;
/*   275 */    uint32_t trans_id;
/*   276 */    union {
/*   277 */       struct {
/*   278 */          uint32_t param1;
/*   279 */          uint32_t param2;
/*   280 */          uint32_t param3;
/*   281 */          uint32_t param4;
/*   282 */          uint32_t param5;
/*   283 */       } params;
/*   284 */       unsigned char data[(1024-(2*sizeof(uint32_t)+2*sizeof(unsigned short)))];
/*   285 */    }payload;
/*   286 */ }
/*   287 */ PTP_DataContainerTypedef;
/*   290 */ typedef struct
/*   291 */ {
/*   292 */    uint32_t length;
/*   293 */    unsigned short type;
/*   294 */    unsigned short code;
/*   295 */    uint32_t trans_id;
/*   296 */    uint32_t param1;
/*   297 */    uint32_t param2;
/*   298 */    uint32_t param3;
/*   299 */ }
/*   300 */ PTP_EventContainerTypedef;
/*   303 */ typedef struct
/*   304 */ {
/*   305 */    PTP_ProcessStateTypeDef state;
/*   306 */    PTP_RequestStateTypeDef req_state;
/*   307 */    PTP_OpContainerTypedef op_container;
/*   308 */    PTP_DataContainerTypedef data_container;
/*   309 */    PTP_RespContainerTypedef resp_container;
/*   312 */    uint32_t transaction_id;
/*   315 */    uint32_t session_id;
/*   318 */    uint32_t flags;
/*   323 */    unsigned char *data_ptr;
/*   326 */    int32_t data_length;
/*   329 */    uint32_t data_packet;
/*   332 */    uint32_t iteration;
/*   335 */    uint32_t data_packet_counter;
/*   340 */    unsigned char *object_ptr;
/*   342 */ }
/*   343 */ PTP_HandleTypeDef;
/*   361 */ typedef struct
/*   362 */ {
/*   363 */    unsigned short StandardVersion;
/*   364 */    uint32_t VendorExtensionID;
/*   365 */    unsigned short VendorExtensionVersion;
/*   366 */    unsigned char VendorExtensionDesc[255];
/*   367 */    unsigned short FunctionalMode;
/*   368 */    uint32_t OperationsSupported_len;
/*   369 */    unsigned short OperationsSupported[100];
/*   370 */    uint32_t EventsSupported_len;
/*   371 */    unsigned short EventsSupported[100];
/*   372 */    uint32_t DevicePropertiesSupported_len;
/*   373 */    unsigned short DevicePropertiesSupported[100];
/*   374 */    uint32_t CaptureFormats_len;
/*   375 */    unsigned short CaptureFormats[100];
/*   376 */    uint32_t ImageFormats_len;
/*   377 */    unsigned short ImageFormats[100];
/*   378 */    unsigned char Manufacturer[255];
/*   379 */    unsigned char Model[255];
/*   380 */    unsigned char DeviceVersion[255];
/*   381 */    unsigned char SerialNumber[255];
/*   382 */ }
/*   383 */ PTP_DeviceInfoTypedef;
/*   387 */ typedef struct
/*   388 */ {
/*   389 */    uint32_t n;
/*   390 */    uint32_t Storage [5];
/*   391 */ }
/*   392 */ PTP_StorageIDsTypedef;
/*   426 */ typedef struct
/*   427 */ {
/*   428 */    unsigned short StorageType;
/*   429 */    unsigned short FilesystemType;
/*   430 */    unsigned short AccessCapability;
/*   431 */    uint64_t MaxCapability;
/*   432 */    uint64_t FreeSpaceInBytes;
/*   433 */    uint32_t FreeSpaceInImages;
/*   434 */    unsigned char StorageDescription[255];
/*   435 */    unsigned char VolumeLabel[255];
/*   436 */ }
/*   437 */ PTP_StorageInfoTypedef;
/*   720 */ typedef struct
/*   721 */ {
/*   722 */    uint32_t n;
/*   723 */    uint32_t Handler[0x255];
/*   724 */ }
/*   725 */ PTP_ObjectHandlesTypedef;
/*   746 */ typedef struct
/*   747 */ {
/*   748 */    uint32_t StorageID;
/*   749 */    unsigned short ObjectFormat;
/*   750 */    unsigned short ProtectionStatus;
/*   753 */    uint64_t ObjectCompressedSize;
/*   754 */    unsigned short ThumbFormat;
/*   755 */    uint32_t ThumbCompressedSize;
/*   756 */    uint32_t ThumbPixWidth;
/*   757 */    uint32_t ThumbPixHeight;
/*   758 */    uint32_t ImagePixWidth;
/*   759 */    uint32_t ImagePixHeight;
/*   760 */    uint32_t ImageBitDepth;
/*   761 */    uint32_t ParentObject;
/*   762 */    unsigned short AssociationType;
/*   763 */    uint32_t AssociationDesc;
/*   764 */    uint32_t SequenceNumber;
/*   765 */    unsigned char Filename[255];
/*   766 */    uint32_t CaptureDate;
/*   767 */    uint32_t ModificationDate;
/*   768 */    unsigned char Keywords[255];
/*   769 */ }
/*   770 */ PTP_ObjectInfoTypedef;
/*   774 */ typedef union _PTP_PropertyValueTypedef
/*   775 */ {
/*   776 */    char str[255];
/*   777 */    unsigned char u8;
/*   778 */    int8_t i8;
/*   779 */    unsigned short u16;
/*   780 */    int16_t i16;
/*   781 */    uint32_t u32;
/*   782 */    int32_t i32;
/*   783 */    uint64_t u64;
/*   784 */    int64_t i64;
/*   785 */    struct array {
/*   786 */       uint32_t count;
/*   787 */       union _PTP_PropertyValueTypedef *v;
/*   788 */    }a;
/*   789 */ }PTP_PropertyValueTypedef;
/*   791 */ typedef struct
/*   792 */ {
/*   793 */    PTP_PropertyValueTypedef MinimumValue;
/*   794 */    PTP_PropertyValueTypedef MaximumValue;
/*   795 */    PTP_PropertyValueTypedef StepSize;
/*   796 */ }
/*   797 */ PTP_PropDescRangeFormTypedef;
/*   801 */ typedef struct
/*   802 */ {
/*   803 */    unsigned short NumberOfValues;
/*   804 */    PTP_PropertyValueTypedef SupportedValue[100];
/*   805 */ }
/*   806 */ PTP_PropDescEnumFormTypedef;
/*   814 */ typedef struct
/*   815 */ {
/*   816 */    unsigned short ObjectPropertyCode;
/*   817 */    unsigned short DataType;
/*   818 */    unsigned char GetSet;
/*   819 */    PTP_PropertyValueTypedef FactoryDefaultValue;
/*   820 */    uint32_t GroupCode;
/*   821 */    unsigned char FormFlag;
/*   822 */    union {
/*   823 */       PTP_PropDescEnumFormTypedef Enum;
/*   824 */       PTP_PropDescRangeFormTypedef Range;
/*   825 */    } FORM;
/*   826 */ }
/*   827 */ PTP_ObjectPropDescTypeDef;
/*   830 */ typedef struct
/*   831 */ {
/*   832 */    unsigned short property;
/*   833 */    unsigned short datatype;
/*   834 */    uint32_t ObjectHandle;
/*   835 */    PTP_PropertyValueTypedef propval;
/*   836 */ }
/*   837 */ MTP_PropertiesTypedef;
/*   865 */ typedef struct
/*   866 */ {
/*   867 */    unsigned short DevicePropertyCode;
/*   868 */    unsigned short DataType;
/*   869 */    unsigned char GetSet;
/*   870 */    PTP_PropertyValueTypedef FactoryDefaultValue;
/*   871 */    PTP_PropertyValueTypedef CurrentValue;
/*   872 */    unsigned char FormFlag;
/*   873 */    union {
/*   874 */       PTP_PropDescEnumFormTypedef Enum;
/*   875 */       PTP_PropDescRangeFormTypedef Range;
/*   876 */    } FORM;
/*   877 */ }
/*   878 */ PTP_DevicePropDescTypdef;
/*   950 */ USBH_StatusTypeDef USBH_PTP_Init(USBH_HandleTypeDef *phost);
/*   951 */ USBH_StatusTypeDef USBH_PTP_Process (USBH_HandleTypeDef *phost);
/*   953 */ USBH_StatusTypeDef USBH_PTP_SendRequest (USBH_HandleTypeDef *phost, PTP_ContainerTypedef *req);
/*   954 */ USBH_StatusTypeDef USBH_PTP_GetResponse (USBH_HandleTypeDef *phost, PTP_ContainerTypedef *req);
/*   956 */ USBH_StatusTypeDef USBH_PTP_OpenSession (USBH_HandleTypeDef *phost, uint32_t session);
/*   957 */ USBH_StatusTypeDef USBH_PTP_GetDeviceInfo (USBH_HandleTypeDef *phost, PTP_DeviceInfoTypedef *dev_info);
/*   958 */ USBH_StatusTypeDef USBH_PTP_GetStorageIds (USBH_HandleTypeDef *phost, PTP_StorageIDsTypedef *storage_ids);
/*   960 */ USBH_StatusTypeDef USBH_PTP_GetStorageInfo (USBH_HandleTypeDef *phost,
/*   961 */     uint32_t storage_id,
/*   962 */     PTP_StorageInfoTypedef *storage_info);
/*   964 */ USBH_StatusTypeDef USBH_PTP_GetNumObjects (USBH_HandleTypeDef *phost,
/*   965 */     uint32_t storage_id,
/*   966 */     uint32_t objectformatcode,
/*   967 */     uint32_t associationOH,
/*   968 */     uint32_t* numobs);
/*   970 */ USBH_StatusTypeDef USBH_PTP_GetObjectHandles (USBH_HandleTypeDef *phost,
/*   971 */     uint32_t storage_id,
/*   972 */     uint32_t objectformatcode,
/*   973 */     uint32_t associationOH,
/*   974 */     PTP_ObjectHandlesTypedef* objecthandles);
/*   976 */ USBH_StatusTypeDef USBH_PTP_GetObjectInfo (USBH_HandleTypeDef *phost,
/*   977 */     uint32_t handle,
/*   978 */     PTP_ObjectInfoTypedef* objectinfo);
/*   980 */ USBH_StatusTypeDef USBH_PTP_DeleteObject (USBH_HandleTypeDef *phost,
/*   981 */     uint32_t handle,
/*   982 */     uint32_t objectformatcode);
/*   984 */ USBH_StatusTypeDef USBH_PTP_GetObject (USBH_HandleTypeDef *phost,
/*   985 */     uint32_t handle,
/*   986 */     unsigned char *object);
/*   988 */ USBH_StatusTypeDef USBH_PTP_GetPartialObject(USBH_HandleTypeDef *phost,
/*   989 */     uint32_t handle,
/*   990 */     uint32_t offset,
/*   991 */     uint32_t maxbytes, unsigned char *object,
/*   992 */     uint32_t *len);
/*   994 */ USBH_StatusTypeDef USBH_PTP_GetObjectPropsSupported (USBH_HandleTypeDef *phost,
/*   995 */     unsigned short ofc,
/*   996 */     uint32_t *propnum,
/*   997 */     unsigned short *props);
/*   999 */ USBH_StatusTypeDef USBH_PTP_GetObjectPropDesc (USBH_HandleTypeDef *phost,
/*  1000 */     unsigned short opc,
/*  1001 */     unsigned short ofc,
/*  1002 */     PTP_ObjectPropDescTypeDef *opd);
/*  1004 */ USBH_StatusTypeDef USBH_PTP_GetObjectPropList (USBH_HandleTypeDef *phost,
/*  1005 */     uint32_t handle,
/*  1006 */     MTP_PropertiesTypedef *pprops,
/*  1007 */     uint32_t *nrofprops);
/*  1009 */ USBH_StatusTypeDef USBH_PTP_SendObject (USBH_HandleTypeDef *phost,
/*  1010 */     uint32_t handle,
/*  1011 */     unsigned char *object,
/*  1012 */     uint32_t size);
/*  1014 */ USBH_StatusTypeDef USBH_PTP_GetDevicePropDesc (USBH_HandleTypeDef *phost,
/*  1015 */     unsigned short propcode,
/*  1016 */     PTP_DevicePropDescTypdef* devicepropertydesc);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STM32_USB_Host_Library/Class/MTP/Inc/usbh_mtp.h
 */
/*    72 */ typedef enum
/*    73 */ {
/*    74 */    MTP_IDLE = 0,
/*    75 */    MTP_GETDEVICEINFO ,
/*    76 */    MTP_OPENSESSION ,
/*    77 */    MTP_CLOSESESSION ,
/*    78 */    MTP_GETSTORAGEIDS ,
/*    79 */    MTP_GETSTORAGEINFO ,
/*    80 */ }
/*    81 */ MTP_StateTypeDef;
/*    84 */ typedef enum
/*    85 */ {
/*    86 */    MTP_EVENTS_INIT = 0,
/*    87 */    MTP_EVENTS_GETDATA ,
/*    88 */ }
/*    89 */ MTP_EventsStateTypeDef;
/*    92 */ typedef struct
/*    93 */ {
/*    94 */    MTP_EventsStateTypeDef state;
/*    95 */    uint32_t timer;
/*    96 */    unsigned short poll;
/*    97 */    PTP_EventContainerTypedef container;
/*    98 */ }
/*    99 */ MTP_EventHandleTypedef;
/*   101 */ typedef struct
/*   102 */ {
/*   104 */    uint32_t CurrentStorageId;
/*   105 */    uint32_t ObjectFormatCode;
/*   106 */    uint32_t CurrentObjectHandler;
/*   107 */    unsigned char ObjectHandlerNbr;
/*   108 */    uint32_t Objdepth;
/*   109 */ }
/*   110 */ MTP_ParamsTypedef;
/*   113 */ typedef struct
/*   114 */ {
/*   115 */    PTP_DeviceInfoTypedef devinfo;
/*   116 */    PTP_StorageIDsTypedef storids;
/*   117 */    PTP_StorageInfoTypedef storinfo[5];
/*   118 */    PTP_ObjectHandlesTypedef Handles;
/*   119 */ }
/*   120 */ MTP_InfoTypedef;
/*   123 */ typedef struct _MTP_Process
/*   124 */ {
/*   125 */    MTP_InfoTypedef info;
/*   126 */    MTP_ParamsTypedef params;
/*   128 */    unsigned char DataInPipe;
/*   129 */    unsigned char DataOutPipe;
/*   130 */    unsigned char NotificationPipe;
/*   132 */    unsigned char DataOutEp;
/*   133 */    unsigned char DataInEp;
/*   134 */    unsigned char NotificationEp;
/*   136 */    unsigned short DataOutEpSize;
/*   137 */    unsigned short DataInEpSize;
/*   138 */    unsigned short NotificationEpSize;
/*   139 */    MTP_StateTypeDef state;
/*   140 */    MTP_EventHandleTypedef events;
/*   141 */    PTP_HandleTypeDef ptp;
/*   142 */    uint32_t current_storage_unit;
/*   143 */    uint32_t is_ready;
/*   144 */ }
/*   145 */ MTP_HandleTypeDef;
/*   172 */ extern USBH_ClassTypeDef MTP_Class;
/*   182 */ unsigned char USBH_MTP_IsReady (USBH_HandleTypeDef *phost);
/*   183 */ USBH_StatusTypeDef USBH_MTP_SelectStorage (USBH_HandleTypeDef *phost, unsigned char storage_idx);
/*   184 */ USBH_StatusTypeDef USBH_MTP_GetNumStorage (USBH_HandleTypeDef *phost, unsigned char *storage_num);
/*   185 */ USBH_StatusTypeDef USBH_MTP_GetNumObjects (USBH_HandleTypeDef *phost,
/*   186 */     uint32_t storage_id,
/*   187 */     uint32_t objectformatcode,
/*   188 */     uint32_t associationOH,
/*   189 */     uint32_t* numobs);
/*   190 */ USBH_StatusTypeDef USBH_MTP_GetStorageInfo (USBH_HandleTypeDef *phost,
/*   191 */     unsigned char storage_idx,
/*   192 */     PTP_StorageInfoTypedef *info);
/*   194 */ USBH_StatusTypeDef USBH_MTP_GetObjectHandles (USBH_HandleTypeDef *phost,
/*   195 */     uint32_t storage_id,
/*   196 */     uint32_t objectformatcode,
/*   197 */     uint32_t associationOH,
/*   198 */     PTP_ObjectHandlesTypedef* objecthandles);
/*   200 */ USBH_StatusTypeDef USBH_MTP_GetObjectInfo (USBH_HandleTypeDef *phost,
/*   201 */     uint32_t handle,
/*   202 */     PTP_ObjectInfoTypedef* objectinfo);
/*   204 */ USBH_StatusTypeDef USBH_MTP_DeleteObject (USBH_HandleTypeDef *phost,
/*   205 */     uint32_t handle,
/*   206 */     uint32_t objectformatcode);
/*   208 */ USBH_StatusTypeDef USBH_MTP_GetObject (USBH_HandleTypeDef *phost,
/*   209 */     uint32_t handle,
/*   210 */     unsigned char *object);
/*   212 */ USBH_StatusTypeDef USBH_MTP_GetPartialObject(USBH_HandleTypeDef *phost,
/*   213 */     uint32_t handle,
/*   214 */     uint32_t offset,
/*   215 */     uint32_t maxbytes,
/*   216 */     unsigned char *object,
/*   217 */     uint32_t *len);
/*   219 */ USBH_StatusTypeDef USBH_MTP_GetObjectPropsSupported (USBH_HandleTypeDef *phost,
/*   220 */     unsigned short ofc,
/*   221 */     uint32_t *propnum,
/*   222 */     unsigned short *props);
/*   224 */ USBH_StatusTypeDef USBH_MTP_GetObjectPropDesc (USBH_HandleTypeDef *phost,
/*   225 */     unsigned short opc,
/*   226 */     unsigned short ofc,
/*   227 */     PTP_ObjectPropDescTypeDef *opd);
/*   229 */ USBH_StatusTypeDef USBH_MTP_GetObjectPropList (USBH_HandleTypeDef *phost,
/*   230 */     uint32_t handle,
/*   231 */     MTP_PropertiesTypedef *pprops,
/*   232 */     uint32_t *nrofprops);
/*   234 */ USBH_StatusTypeDef USBH_MTP_SendObject (USBH_HandleTypeDef *phost,
/*   235 */     uint32_t handle,
/*   236 */     unsigned char *object,
/*   237 */     uint32_t size);
/*   239 */ USBH_StatusTypeDef USBH_MTP_GetDevicePropDesc (USBH_HandleTypeDef *phost,
/*   240 */     unsigned short propcode,
/*   241 */     PTP_DevicePropDescTypdef* devicepropertydesc);
/*   243 */ void USBH_MTP_EventsCallback(USBH_HandleTypeDef *phost, uint32_t event, uint32_t param);
/*
 * C:/CodeInspection/DisplayUnit/Src/usb_host.c
 */
/*    61 */ USBH_HandleTypeDef hUsbHostHS;
/*    62 */ ApplicationTypeDef Appli_state = APPLICATION_IDLE;
/*    74 */ static void USBH_UserProcess (USBH_HandleTypeDef *phost, unsigned char id);
/*    84 */ void MX_USB_HOST_Init(void)
/*    85 */ {
/*    91 */    USBH_Init(&hUsbHostHS, USBH_UserProcess, 0);
/*    93 */    USBH_RegisterClass(&hUsbHostHS, &AUDIO_Class);
/*    95 */    USBH_RegisterClass(&hUsbHostHS, &CDC_Class);
/*    97 */    USBH_RegisterClass(&hUsbHostHS, &USBH_msc);
/*    99 */    USBH_RegisterClass(&hUsbHostHS, &HID_Class);
/*   101 */    USBH_RegisterClass(&hUsbHostHS, &MTP_Class);
/*   103 */    USBH_Start(&hUsbHostHS);
/*   108 */ }
/*   113 */ void MX_USB_HOST_Process(void)
/*   114 */ {
/*   116 */    USBH_Process(&hUsbHostHS);
/*   117 */ }
/*   121 */ static void USBH_UserProcess (USBH_HandleTypeDef *phost, unsigned char id)
/*   122 */ {
/*   125 */    switch(id)
/*   126 */    {
/*   127 */    case 1:
/*   128 */       break;
/*   130 */    case 5:
/*   131 */       Appli_state = APPLICATION_DISCONNECT;
/*   132 */       break;
/*   134 */    case 2:
/*   140 */       Appli_state = APPLICATION_READY;
/*   141 */       break;
/*   143 */    case 4:
/*   144 */       Appli_state = APPLICATION_START;
/*   145 */       break;
/*   147 */    default:
/*   148 */       break;
/*   149 */    }
/*   151 */ }
/*   162 */ 
