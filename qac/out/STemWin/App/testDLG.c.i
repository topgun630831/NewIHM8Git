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
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/WM_GUI.h
 */
/*    60 */ int WM__InitIVRSearch(const GUI_RECT* pMaxRect);
/*    61 */ int WM__GetNextIVR (void);
/*    62 */ int WM__GetOrgX_AA(void);
/*    63 */ int WM__GetOrgY_AA(void);
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
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/WM.h
 */
/*   136 */ typedef struct WM_WINDOW_INFO WM_WINDOW_INFO;
/*   138 */ struct WM_WINDOW_INFO {
/*   139 */    signed long hWin;
/*   140 */    signed long hParent;
/*   141 */    signed long hFirstChild;
/*   142 */    signed long hNext;
/*   143 */    GUI_RECT Rect;
/*   144 */    unsigned long Status;
/*   145 */    unsigned long DebugId;
/*   146 */    WM_WINDOW_INFO * pNext;
/*   147 */ };
/*   149 */ typedef struct {
/*   150 */    int Key, PressedCnt;
/*   151 */ } WM_KEY_INFO;
/*   153 */ typedef struct {
/*   154 */    int NumItems, v, PageSize;
/*   155 */ } WM_SCROLL_STATE;
/*   157 */ typedef struct {
/*   158 */    int Done;
/*   159 */    int ReturnValue;
/*   160 */ } WM_DIALOG_STATUS;
/*   162 */ typedef struct {
/*   163 */    int x,y;
/*   164 */    unsigned char State;
/*   165 */    unsigned char StatePrev;
/*   166 */ } WM_PID_STATE_CHANGED_INFO;
/*   168 */ typedef struct {
/*   169 */    unsigned char Cmd;
/*   170 */    unsigned char FinalMove;
/*   171 */    unsigned char StopMotion;
/*   172 */    unsigned char IsDragging;
/*   173 */    int dx, dy, da;
/*   174 */    int xPos, yPos;
/*   175 */    int Period;
/*   176 */    int SnapX;
/*   177 */    int SnapY;
/*   178 */    unsigned char IsOutside;
/*   179 */    unsigned Overlap;
/*   180 */    unsigned long Flags;
/*   181 */    GUI_PID_STATE * pState;
/*   182 */    signed long hContext;
/*   183 */ } WM_MOTION_INFO;
/*   185 */ typedef struct {
/*   186 */    signed long FactorMin;
/*   187 */    signed long FactorMax;
/*   188 */    unsigned long xSize;
/*   189 */    unsigned long ySize;
/*   190 */    unsigned long xSizeParent;
/*   191 */    unsigned long ySizeParent;
/*   192 */    signed long Factor0;
/*   193 */    int xPos0;
/*   194 */    int yPos0;
/*   195 */    GUI_POINT Center0;
/*   196 */ } WM_ZOOM_INFO;
/*   198 */ typedef struct {
/*   199 */    int Flags;
/*   200 */    GUI_POINT Point;
/*   201 */    GUI_POINT Center;
/*   202 */    signed long Angle;
/*   203 */    signed long Factor;
/*   204 */    WM_ZOOM_INFO * pZoomInfo;
/*   205 */ } WM_GESTURE_INFO;
/*   207 */ typedef struct {
/*   208 */    int dx, dy;
/*   209 */ } WM_MOVE_INFO;
/*   401 */ typedef struct WM_Obj WM_Obj;
/*   402 */ typedef struct WM_MESSAGE WM_MESSAGE;
/*   404 */ typedef void WM_CALLBACK( WM_MESSAGE * pMsg);
/*   406 */ struct WM_MESSAGE {
/*   407 */    int MsgId;
/*   408 */    GUI_HWIN hWin;
/*   409 */    GUI_HWIN hWinSrc;
/*   410 */    union {
/*   411 */       const void * p;
/*   412 */       int v;
/*   413 */       GUI_COLOR Color;
/*   414 */    } Data;
/*   415 */ };
/*   417 */ struct WM_Obj {
/*   418 */    GUI_RECT Rect;
/*   419 */    GUI_RECT InvalidRect;
/*   420 */    WM_CALLBACK* cb;
/*   421 */    GUI_HWIN hNextLin;
/*   422 */    GUI_HWIN hParent;
/*   423 */    GUI_HWIN hFirstChild;
/*   424 */    GUI_HWIN hNext;
/*   426 */    GUI_MEMDEV_Handle hMem;
/*   428 */    unsigned long Status;
/*   432 */ };
/*   434 */ typedef void WM_tfPollPID(void);
/*   435 */ typedef void WM_tfForEach(GUI_HWIN hWin, void * pData);
/*   437 */ typedef void (* WM_tfInvalidateParent) (const GUI_RECT * pInvalidRect, GUI_HWIN hParent, GUI_HWIN hStop);
/*   438 */ typedef void (* WM_tfInvalidateDrawFunc)(GUI_HWIN hWin);
/*   439 */ typedef void (* WM_tfPaint1Func) (GUI_HWIN hWin);
/*   441 */ typedef struct {
/*   442 */    signed long hTimer;
/*   443 */    GUI_HWIN hWin;
/*   444 */    int UserId;
/*   445 */ } WM_TIMER_OBJ;
/*   451 */ void WM_Activate (void);
/*   452 */ void WM_Deactivate(void);
/*   453 */ void WM_Init (void);
/*   454 */ int WM_Exec (void);
/*   455 */ int WM_Exec1 (void);
/*   456 */ unsigned long WM_SetCreateFlags(unsigned long Flags);
/*   457 */ WM_tfPollPID * WM_SetpfPollPID(WM_tfPollPID * pf);
/*   463 */ void WM_AttachWindow (GUI_HWIN hWin, GUI_HWIN hParent);
/*   464 */ void WM_AttachWindowAt (GUI_HWIN hWin, GUI_HWIN hParent, int x, int y);
/*   465 */ int WM_CheckScrollPos (WM_SCROLL_STATE * pScrollState, int Pos, int LowerDist, int UpperDist);
/*   466 */ void WM_ClrHasTrans (GUI_HWIN hWin);
/*   467 */ GUI_HWIN WM_CreateWindow (int x0, int y0, int xSize, int ySize, unsigned long Style, WM_CALLBACK * cb, int NumExtraBytes);
/*   468 */ GUI_HWIN WM_CreateWindowAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hWinParent, unsigned long Style, WM_CALLBACK* cb, int NumExtraBytes);
/*   469 */ void WM_DeleteWindow (GUI_HWIN hWin);
/*   470 */ void WM_DetachWindow (GUI_HWIN hWin);
/*   471 */ void WM_EnableGestures (GUI_HWIN hWin, int OnOff);
/*   472 */ int WM_GetHasTrans (GUI_HWIN hWin);
/*   473 */ GUI_HWIN WM_GetFocusedWindow (void);
/*   474 */ int WM_GetInvalidRect (GUI_HWIN hWin, GUI_RECT * pRect);
/*   475 */ int WM_GetStayOnTop (GUI_HWIN hWin);
/*   476 */ void WM_HideWindow (GUI_HWIN hWin);
/*   477 */ void WM_InvalidateArea (const GUI_RECT * pRect);
/*   478 */ void WM_InvalidateRect (GUI_HWIN hWin, const GUI_RECT * pRect);
/*   479 */ void WM_InvalidateWindow (GUI_HWIN hWin);
/*   480 */ void WM_InvalidateWindowAndDescsEx(GUI_HWIN hWin, const GUI_RECT * pInvalidRect, unsigned short Flags);
/*   481 */ void WM_InvalidateWindowAndDescs (GUI_HWIN hWin);
/*   482 */ int WM_IsEnabled (GUI_HWIN hObj);
/*   483 */ char WM_IsCompletelyCovered (GUI_HWIN hWin);
/*   484 */ char WM_IsCompletelyVisible (GUI_HWIN hWin);
/*   485 */ int WM_IsFocusable (GUI_HWIN hWin);
/*   486 */ int WM_IsVisible (GUI_HWIN hWin);
/*   487 */ int WM_IsWindow (GUI_HWIN hWin);
/*   488 */ void WM_SetAnchor (GUI_HWIN hWin, unsigned short AnchorFlags);
/*   489 */ void WM_SetHasTrans (GUI_HWIN hWin);
/*   490 */ void WM_SetId (GUI_HWIN hObj, int Id);
/*   491 */ void WM_SetStayOnTop (GUI_HWIN hWin, int OnOff);
/*   492 */ void WM_SetTransState (GUI_HWIN hWin, unsigned State);
/*   493 */ void WM_ShowWindow (GUI_HWIN hWin);
/*   494 */ void WM_ValidateRect (GUI_HWIN hWin, const GUI_RECT * pRect);
/*   495 */ void WM_ValidateWindow (GUI_HWIN hWin);
/*   501 */ void WM_GESTURE_Enable (int OnOff);
/*   502 */ int WM_GESTURE_EnableEx(int OnOff, int MaxFactor);
/*   503 */ void WM_GESTURE_Exec (void);
/*   504 */ signed long WM_GESTURE_SetThresholdAngle(signed long ThresholdAngle);
/*   505 */ signed long WM_GESTURE_SetThresholdDist (signed long ThresholdDist);
/*   508 */ void WM_MOTION_Enable (int OnOff);
/*   509 */ void WM_MOTION_SetMovement (GUI_HWIN hWin, int Axis, signed long Speed, signed long Dist);
/*   510 */ void WM_MOTION_SetMotion (GUI_HWIN hWin, int Axis, signed long Speed, signed long Deceleration);
/*   511 */ void WM_MOTION_SetMoveable (GUI_HWIN hWin, unsigned long Flags, int OnOff);
/*   512 */ void WM_MOTION_SetDeceleration (GUI_HWIN hWin, int Axis, signed long Deceleration);
/*   513 */ unsigned WM_MOTION_SetDefaultPeriod(unsigned Period);
/*   514 */ void WM_MOTION_SetSpeed (GUI_HWIN hWin, int Axis, signed long Velocity);
/*   515 */ void WM_MOTION_SetMinMotion (unsigned MinMotion);
/*   516 */ void WM_MOTION_SetThreshold (unsigned Threshold);
/*   519 */ signed long WM_MOTION__CreateContext(void);
/*   520 */ void WM_MOTION__DeleteContext(signed long hContext);
/*   523 */ void WM__SetMotionCallback (void(* cbMotion) (GUI_PID_STATE * pState, void * p));
/*   532 */ int GUI_MEMDEV_BlendWinBk (GUI_HWIN hWin, int Period, unsigned long BlendColor, unsigned char BlendIntens);
/*   533 */ int GUI_MEMDEV_BlurAndBlendWinBk(GUI_HWIN hWin, int Period, unsigned char BlurDepth, unsigned long BlendColor, unsigned char BlendIntens);
/*   534 */ int GUI_MEMDEV_BlurWinBk (GUI_HWIN hWin, int Period, unsigned char BlurDepth);
/*   535 */ void GUI_MEMDEV_CreateStatic (GUI_HWIN hWin);
/*   536 */ GUI_MEMDEV_Handle GUI_MEMDEV_CreateWindowDevice(GUI_HWIN hWin);
/*   537 */ int GUI_MEMDEV_FadeInWindow (GUI_HWIN hWin, int Period);
/*   538 */ int GUI_MEMDEV_FadeOutWindow (GUI_HWIN hWin, int Period);
/*   539 */ GUI_MEMDEV_Handle GUI_MEMDEV_GetStaticDevice (GUI_HWIN hWin);
/*   540 */ GUI_MEMDEV_Handle GUI_MEMDEV_GetWindowDevice (GUI_HWIN hWin);
/*   541 */ int GUI_MEMDEV_MoveInWindow (GUI_HWIN hWin, int x, int y, int a180, int Period);
/*   542 */ int GUI_MEMDEV_MoveOutWindow (GUI_HWIN hWin, int x, int y, int a180, int Period);
/*   543 */ void GUI_MEMDEV_Paint1Static (GUI_HWIN hWin);
/*   544 */ int GUI_MEMDEV_ShiftInWindow (GUI_HWIN hWin, int Period, int Direction);
/*   545 */ int GUI_MEMDEV_ShiftOutWindow (GUI_HWIN hWin, int Period, int Direction);
/*   546 */ int GUI_MEMDEV_SwapWindow (GUI_HWIN hWin, int Period, int Edge);
/*   548 */ void GUI_MEMDEV__CreateStatic (GUI_HWIN hWin);
/*   552 */ void WM_MoveWindow (GUI_HWIN hWin, int dx, int dy);
/*   553 */ void WM_ResizeWindow (GUI_HWIN hWin, int dx, int dy);
/*   554 */ void WM_MoveTo (GUI_HWIN hWin, int x, int y);
/*   555 */ void WM_MoveChildTo (GUI_HWIN hWin, int x, int y);
/*   556 */ void WM_SetSize (GUI_HWIN hWin, int XSize, int YSize);
/*   557 */ void WM_SetWindowPos (GUI_HWIN hWin, int xPos, int yPos, int xSize, int ySize);
/*   558 */ int WM_SetXSize (GUI_HWIN hWin, int xSize);
/*   559 */ int WM_SetYSize (GUI_HWIN hWin, int ySize);
/*   560 */ int WM_SetScrollbarH (GUI_HWIN hWin, int OnOff);
/*   561 */ int WM_SetScrollbarV (GUI_HWIN hWin, int OnOff);
/*   572 */ typedef signed long WM_TOOLTIP_HANDLE;
/*   574 */ typedef struct {
/*   575 */    int Id;
/*   576 */    const char * pText;
/*   577 */ } TOOLTIP_INFO;
/*   579 */ int WM_TOOLTIP_AddTool (WM_TOOLTIP_HANDLE hToolTip, GUI_HWIN hTool, const char * pText);
/*   580 */ WM_TOOLTIP_HANDLE WM_TOOLTIP_Create (GUI_HWIN hDlg, const TOOLTIP_INFO * pInfo, unsigned NumItems);
/*   581 */ void WM_TOOLTIP_Delete (WM_TOOLTIP_HANDLE hToolTip);
/*   582 */ GUI_COLOR WM_TOOLTIP_SetDefaultColor (unsigned Index, GUI_COLOR Color);
/*   583 */ const GUI_FONT * WM_TOOLTIP_SetDefaultFont (const GUI_FONT * pFont);
/*   584 */ unsigned WM_TOOLTIP_SetDefaultPeriod(unsigned Index, unsigned Period);
/*   587 */ void WM__SetToolTipCallback(void(* cbToolTip)(GUI_PID_STATE * pState, GUI_HWIN));
/*   594 */ signed long WM_CreateTimer (GUI_HWIN hWin, int UserID, int Period, int Mode);
/*   595 */ void WM_DeleteTimer (signed long hTimer);
/*   596 */ void WM_RestartTimer(signed long hTimer, int Period);
/*   598 */ int WM_GetTimerId(signed long hTimer);
/*   601 */ int WM_GetNumWindows(void);
/*   602 */ int WM_GetNumInvalidWindows(void);
/*   605 */ void WM_CheckScrollBounds(WM_SCROLL_STATE * pScrollState);
/*   606 */ int WM_GetScrollPosH (GUI_HWIN hWin);
/*   607 */ int WM_GetScrollPosV (GUI_HWIN hWin);
/*   608 */ void WM_SetScrollPosH (GUI_HWIN hWin, unsigned ScrollPos);
/*   609 */ void WM_SetScrollPosV (GUI_HWIN hWin, unsigned ScrollPos);
/*   610 */ int WM_SetScrollValue (WM_SCROLL_STATE * pScrollState, int v);
/*   613 */ WM_CALLBACK * WM_SetCallback(GUI_HWIN hWin, WM_CALLBACK * cb);
/*   614 */ WM_CALLBACK * WM_GetCallback(GUI_HWIN hWin);
/*   617 */ void WM_GetClientRect (GUI_RECT * pRect);
/*   618 */ void WM_GetClientRectEx (GUI_HWIN hWin, GUI_RECT * pRect);
/*   619 */ void WM_GetInsideRect (GUI_RECT * pRect);
/*   620 */ void WM_GetInsideRectEx (GUI_HWIN hWin, GUI_RECT * pRect);
/*   621 */ void WM_GetInsideRectExScrollbar(GUI_HWIN hWin, GUI_RECT * pRect);
/*   622 */ void WM_GetWindowRect (GUI_RECT * pRect);
/*   623 */ void WM_GetWindowRectEx (GUI_HWIN hWin, GUI_RECT * pRect);
/*   624 */ int WM_GetOrgX (void);
/*   625 */ int WM_GetOrgY (void);
/*   626 */ int WM_GetWindowOrgX (GUI_HWIN hWin);
/*   627 */ int WM_GetWindowOrgY (GUI_HWIN hWin);
/*   628 */ int WM_GetWindowSizeX (GUI_HWIN hWin);
/*   629 */ int WM_GetWindowSizeY (GUI_HWIN hWin);
/*   630 */ GUI_HWIN WM_GetFirstChild (GUI_HWIN hWin);
/*   631 */ GUI_HWIN WM_GetNextSibling (GUI_HWIN hWin);
/*   632 */ GUI_HWIN WM_GetParent (GUI_HWIN hWin);
/*   633 */ GUI_HWIN WM_GetPrevSibling (GUI_HWIN hWin);
/*   634 */ int WM_GetId (GUI_HWIN hWin);
/*   635 */ GUI_HWIN WM_GetScrollbarV (GUI_HWIN hWin);
/*   636 */ GUI_HWIN WM_GetScrollbarH (GUI_HWIN hWin);
/*   637 */ GUI_HWIN WM_GetScrollPartner (GUI_HWIN hWin);
/*   638 */ GUI_HWIN WM_GetClientWindow (GUI_HWIN hObj);
/*   639 */ GUI_COLOR WM_GetBkColor (GUI_HWIN hObj);
/*   642 */ void WM_BringToBottom(GUI_HWIN hWin);
/*   643 */ void WM_BringToTop(GUI_HWIN hWin);
/*   645 */ GUI_COLOR WM_SetDesktopColor (GUI_COLOR Color);
/*   646 */ GUI_COLOR WM_SetDesktopColorEx(GUI_COLOR Color, unsigned int LayerIndex);
/*   647 */ void WM_SetDesktopColors (GUI_COLOR Color);
/*   650 */ GUI_HWIN WM_SelectWindow (GUI_HWIN hWin);
/*   651 */ GUI_HWIN WM_GetActiveWindow (void);
/*   652 */ void WM_Paint (GUI_HWIN hObj);
/*   653 */ void WM_Update (GUI_HWIN hWin);
/*   654 */ void WM_PaintWindowAndDescs (GUI_HWIN hWin);
/*   655 */ void WM_UpdateWindowAndDescs (GUI_HWIN hWin);
/*   658 */ GUI_HWIN WM_GetDesktopWindow (void);
/*   659 */ GUI_HWIN WM_GetDesktopWindowEx(unsigned int LayerIndex);
/*   662 */ const GUI_RECT * WM_SetUserClipRect(const GUI_RECT * pRect);
/*   663 */ void WM_SetDefault (void);
/*   666 */ void WM_EnableMemdev (GUI_HWIN hWin);
/*   667 */ void WM_DisableMemdev (GUI_HWIN hWin);
/*   670 */ int WM_MULTIBUF_Enable (int OnOff);
/*   671 */ int WM_MULTIBUF_EnableEx(int OnOff, unsigned long LayerMask);
/*   673 */ extern const GUI_MULTIBUF_API * WM_MULTIBUF__pAPI;
/*   675 */ typedef void (* T_WM_EXEC_GESTURE)(void);
/*   677 */ extern T_WM_EXEC_GESTURE WM__pExecGestures;
/*   680 */ int WM_OnKey(int Key, int Pressed);
/*   681 */ void WM_MakeModal(GUI_HWIN hWin);
/*   682 */ int WM_SetModalLayer(int LayerIndex);
/*   683 */ int WM_GetModalLayer(void);
/*   692 */ void WM_NotifyParent (GUI_HWIN hWin, int Notification);
/*   693 */ void WM_SendMessage (GUI_HWIN hWin, WM_MESSAGE * p);
/*   694 */ void WM_SendMessageNoPara (GUI_HWIN hWin, int MsgId);
/*   695 */ void WM_DefaultProc (WM_MESSAGE * pMsg);
/*   696 */ int WM_BroadcastMessage (WM_MESSAGE * pMsg);
/*   697 */ void WM_SetScrollState (GUI_HWIN hWin, const WM_SCROLL_STATE * pState);
/*   698 */ void WM_SetEnableState (GUI_HWIN hItem, int State);
/*   699 */ void WM_SendToParent (GUI_HWIN hWin, WM_MESSAGE * pMsg);
/*   700 */ int WM_HasFocus (GUI_HWIN hWin);
/*   701 */ int WM_SetFocus (GUI_HWIN hWin);
/*   702 */ GUI_HWIN WM_SetFocusOnNextChild (GUI_HWIN hParent);
/*   703 */ GUI_HWIN WM_SetFocusOnPrevChild (GUI_HWIN hParent);
/*   704 */ GUI_HWIN WM_GetDialogItem (GUI_HWIN hWin, int Id);
/*   705 */ void WM_EnableWindow (GUI_HWIN hWin);
/*   706 */ void WM_DisableWindow (GUI_HWIN hWin);
/*   707 */ void WM_GetScrollState (GUI_HWIN hObj, WM_SCROLL_STATE * pScrollState);
/*   713 */ int WM_GetUserData (GUI_HWIN hWin, void * pDest, int SizeOfBuffer);
/*   714 */ int WM_SetUserData (GUI_HWIN hWin, const void * pSrc, int SizeOfBuffer);
/*   715 */ int WM__GetUserDataEx(GUI_HWIN hWin, void * pDest, int NumBytes, int SizeOfObject);
/*   716 */ int WM__SetUserDataEx(GUI_HWIN hWin, const void * pSrc, int NumBytes, int SizeOfObject);
/*   722 */ int WM_HasCaptured (GUI_HWIN hWin);
/*   723 */ void WM_SetCapture (GUI_HWIN hObj, int AutoRelease);
/*   724 */ void WM_SetCaptureMove(GUI_HWIN hWin, const GUI_PID_STATE * pState, int MinVisibility, int LimitTop);
/*   725 */ void WM_ReleaseCapture(void);
/*   731 */ int WM_HandlePID (void);
/*   732 */ GUI_HWIN WM_Screen2hWin (int x, int y);
/*   733 */ GUI_HWIN WM_Screen2hWinEx (GUI_HWIN hStop, int x, int y);
/*   734 */ void WM_ForEachDesc (GUI_HWIN hWin, WM_tfForEach * pcb, void * pData);
/*   735 */ void WM_SetScreenSize (int xSize, int ySize);
/*   736 */ int WM_PollSimMsg (void);
/*   737 */ int WM_GetWindowInfo (WM_WINDOW_INFO * pInfo, int FirstWindow);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/DIALOG_Intern.h
 */
/*    70 */ typedef struct GUI_WIDGET_CREATE_INFO_struct GUI_WIDGET_CREATE_INFO;
/*    71 */ typedef GUI_HWIN GUI_WIDGET_CREATE_FUNC (const GUI_WIDGET_CREATE_INFO * pCreate, GUI_HWIN hWin, int x0, int y0, WM_CALLBACK * cb);
/*    79 */ struct GUI_WIDGET_CREATE_INFO_struct {
/*    80 */    GUI_WIDGET_CREATE_FUNC * pfCreateIndirect;
/*    81 */    const char * pName;
/*    82 */    signed short Id;
/*    83 */    signed short x0;
/*    84 */    signed short y0;
/*    85 */    signed short xSize;
/*    86 */    signed short ySize;
/*    87 */    unsigned short Flags;
/*    88 */    signed long Para;
/*    89 */    unsigned long NumExtraBytes;
/*    90 */ };
/*    98 */ GUI_HWIN GUI_CreateDialogBox (const GUI_WIDGET_CREATE_INFO * paWidget, int NumWidgets, WM_CALLBACK * cb, GUI_HWIN hParent, int x0, int y0);
/*    99 */ void GUI_EndDialog (GUI_HWIN hWin, int r);
/*   100 */ int GUI_ExecDialogBox (const GUI_WIDGET_CREATE_INFO * paWidget, int NumWidgets, WM_CALLBACK * cb, GUI_HWIN hParent, int x0, int y0);
/*   101 */ int GUI_ExecCreatedDialog (GUI_HWIN hDialog);
/*   102 */ WM_DIALOG_STATUS * GUI_GetDialogStatusPtr(GUI_HWIN hDialog);
/*   103 */ void GUI_SetDialogStatusPtr(GUI_HWIN hDialog, WM_DIALOG_STATUS * pDialogStatus);
/*   109 */ LCD_COLOR DIALOG_GetBkColor(void);
/*   110 */ LCD_COLOR DIALOG_SetBkColor(LCD_COLOR BkColor);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/LCD_Protected.h
 */
/*    66 */ typedef struct {
/*    67 */    LCD_COLOR * paColor;
/*    68 */    signed short NumEntries;
/*    69 */ } LCD_LUT_INFO;
/*    71 */ typedef struct {
/*    72 */    tLCDDEV_DrawPixel * pfDrawPixel;
/*    73 */    tLCDDEV_DrawHLine * pfDrawHLine;
/*    74 */    tLCDDEV_DrawVLine * pfDrawVLine;
/*    75 */    tLCDDEV_FillRect * pfFillRect;
/*    76 */    tLCDDEV_DrawBitmap * pfDrawBitmap;
/*    77 */ } LCD_API_LIST;
/*    83 */ extern const unsigned char LCD_aMirror[256];
/*    84 */ extern unsigned long * LCD__aConvTable;
/*    90 */ void LCD_UpdateColorIndices (void);
/*    91 */ int LCD_PassingBitmapsAllowed(void);
/*    92 */ void LCD_EnableCursor (int OnOff);
/*    93 */ void LCD_SelectLCD (void);
/*    95 */ void LCD_DrawBitmap(int x0, int y0,
/*    96 */     int xsize, int ysize,
/*    97 */     int xMul, int yMul,
/*    98 */     int BitsPerPixel,
/*    99 */     int BytesPerLine,
/*   100 */     const unsigned char * pPixel,
/*   101 */     const unsigned long * pTrans);
/*   103 */ void LCD__DrawBitmap_1bpp(int x0, int y0,
/*   104 */     int xsize, int ysize,
/*   105 */     int xMul, int yMul,
/*   106 */     int BitsPerPixel,
/*   107 */     int BytesPerLine,
/*   108 */     const unsigned char * pPixel,
/*   109 */     const unsigned long * pTrans,
/*   110 */     int OffData);
/*   116 */ tLCDDEV_Index2Color LCD_Index2Color_444_12;
/*   117 */ tLCDDEV_Index2Color LCD_Index2Color_M444_12;
/*   118 */ tLCDDEV_Index2Color LCD_Index2Color_444_12_1;
/*   119 */ tLCDDEV_Index2Color LCD_Index2Color_M444_12_1;
/*   120 */ tLCDDEV_Index2Color LCD_Index2Color_444_16;
/*   121 */ tLCDDEV_Index2Color LCD_Index2Color_M444_16;
/*   122 */ tLCDDEV_Index2Color LCD_Index2Color_555;
/*   123 */ tLCDDEV_Index2Color LCD_Index2Color_565;
/*   124 */ tLCDDEV_Index2Color LCD_Index2Color_8666;
/*   125 */ tLCDDEV_Index2Color LCD_Index2Color_888;
/*   126 */ tLCDDEV_Index2Color LCD_Index2Color_8888;
/*   127 */ tLCDDEV_Index2Color LCD_Index2Color_M8888I;
/*   128 */ tLCDDEV_Index2Color LCD_Index2Color_M555;
/*   129 */ tLCDDEV_Index2Color LCD_Index2Color_M565;
/*   130 */ tLCDDEV_Index2Color LCD_Index2Color_M888;
/*   132 */ tLCDDEV_Color2Index LCD_Color2Index_8666;
/*
 * C:/PRQA/QAC-8.1.2-R/include/ansi/stddef.h
 */
/*     5 */ typedef long ptrdiff_t;
/*     9 */ typedef unsigned int size_t;
/*    14 */ typedef unsigned char wchar_t;
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/GUI_Private.h
 */
/*   138 */ extern const unsigned char GUI__aConvert_15_255[(1 << 4)];
/*   139 */ extern const unsigned char GUI__aConvert_31_255[(1 << 5)];
/*   140 */ extern const unsigned char GUI__aConvert_63_255[(1 << 6)];
/*   141 */ extern const unsigned char GUI__aConvert_255_15[(1 << 8)];
/*   142 */ extern const unsigned char GUI__aConvert_255_31[(1 << 8)];
/*   143 */ extern const unsigned char GUI__aConvert_255_63[(1 << 8)];
/*   151 */ typedef signed long GUI_USAGE_Handle;
/*   152 */ typedef struct tsUSAGE_APIList tUSAGE_APIList;
/*   153 */ typedef struct GUI_Usage GUI_USAGE;
/*   156 */ typedef GUI_USAGE_Handle tUSAGE_CreateCompatible(GUI_USAGE * p);
/*   157 */ typedef void tUSAGE_AddPixel (GUI_USAGE * p, int x, int y);
/*   158 */ typedef void tUSAGE_AddHLine (GUI_USAGE * p, int x0, int y0, int len);
/*   159 */ typedef void tUSAGE_Clear (GUI_USAGE * p);
/*   160 */ typedef void tUSAGE_Delete (GUI_USAGE_Handle h);
/*   161 */ typedef int tUSAGE_GetNextDirty (GUI_USAGE * p, int * pxOff, int yOff);
/*   164 */ void GUI_USAGE_DecUseCnt(GUI_USAGE_Handle hUsage);
/*   166 */ GUI_USAGE_Handle GUI_USAGE_BM_Create(int x0, int y0, int xsize, int ysize, int Flags);
/*   167 */ void GUI_USAGE_Select(GUI_USAGE_Handle hUsage);
/*   168 */ void GUI_USAGE_AddRect(GUI_USAGE * pUsage, int x0, int y0, int xSize, int ySize);
/*   175 */ struct tsUSAGE_APIList {
/*   176 */    tUSAGE_AddPixel * pfAddPixel;
/*   177 */    tUSAGE_AddHLine * pfAddHLine;
/*   178 */    tUSAGE_Clear * pfClear;
/*   179 */    tUSAGE_CreateCompatible * pfCreateCompatible;
/*   180 */    tUSAGE_Delete * pfDelete;
/*   181 */    tUSAGE_GetNextDirty * pfGetNextDirty;
/*   182 */ } ;
/*   184 */ struct GUI_Usage {
/*   185 */    signed short x0, y0, XSize, YSize;
/*   186 */    const tUSAGE_APIList * pAPI;
/*   187 */    signed short UseCnt;
/*   188 */ };
/*   198 */ typedef struct {
/*   199 */    GUI_DEVICE * pDevice;
/*   200 */    signed short x0, y0, XSize, YSize;
/*   201 */    unsigned BytesPerLine;
/*   202 */    unsigned BitsPerPixel;
/*   203 */    signed long hUsage;
/*   204 */ } GUI_MEMDEV;
/*   208 */ void GUI_MEMDEV__CopyFromLCD (GUI_MEMDEV_Handle hMem);
/*   209 */ void GUI_MEMDEV__GetRect (GUI_RECT * pRect);
/*   210 */ unsigned GUI_MEMDEV__Color2Index (LCD_COLOR Color);
/*   211 */ LCD_COLOR GUI_MEMDEV__Index2Color (int Index);
/*   212 */ unsigned int GUI_MEMDEV__GetIndexMask(void);
/*   213 */ void GUI_MEMDEV__SetAlphaCallback(unsigned(* pcbSetAlpha)(unsigned char));
/*   215 */ GUI_MEMDEV_Handle GUI_MEMDEV__CreateFixed(int x0, int y0, int xSize, int ySize, int Flags,
/*   216 */     const GUI_DEVICE_API * pDeviceAPI,
/*   217 */     const LCD_API_COLOR_CONV * pColorConvAPI);
/*   219 */ void GUI_MEMDEV__DrawSizedAt (GUI_MEMDEV_Handle hMem, int xPos, int yPos, int xSize, int ySize);
/*   220 */ GUI_MEMDEV_Handle GUI_MEMDEV__GetEmptyCopy32 (GUI_MEMDEV_Handle hMem, int * pxSize, int * pySize, int * pxPos, int * pyPos);
/*   221 */ void GUI_MEMDEV__ReadLine (int x0, int y, int x1, unsigned long * pBuffer);
/*   222 */ void GUI_MEMDEV__WriteToActiveAlpha (GUI_MEMDEV_Handle hMem,int x, int y);
/*   223 */ void GUI_MEMDEV__WriteToActiveAt (GUI_MEMDEV_Handle hMem,int x, int y);
/*   224 */ void GUI_MEMDEV__WriteToActiveOpaque(GUI_MEMDEV_Handle hMem,int x, int y);
/*   225 */ void * GUI_MEMDEV__XY2PTR (int x,int y);
/*   226 */ void * GUI_MEMDEV__XY2PTREx (GUI_MEMDEV * pDev, int x,int y);
/*   227 */ void GUI_MEMDEV__BlendColor32 (GUI_MEMDEV_Handle hMem, unsigned long BlendColor, unsigned char BlendIntens);
/*   229 */ unsigned GUI__AlphaPreserveTrans(int OnOff);
/*   231 */ extern unsigned GUI_MEMDEV__TimePerFrame;
/*   255 */ int GUI_cos(int angle);
/*   256 */ int GUI_sin(int angle);
/*   257 */ extern const unsigned long GUI_Pow10[10];
/*   260 */ void GUI_MTOUCH__ManagePID(int OnOff);
/*   263 */ int GUI_AA_Init (int x0, int x1);
/*   264 */ int GUI_AA_Init_HiRes (int x0, int x1);
/*   265 */ void GUI_AA_Exit (void);
/*   266 */ signed short GUI_AA_HiRes2Pixel(int HiRes);
/*   268 */ void GL_FillCircleAA_HiRes (int x0, int y0, int r);
/*   269 */ void GL_FillEllipseAA_HiRes(int x0, int y0, int rx, int ry);
/*   271 */ void GUI_AA__DrawCharAA2(int x0, int y0, int XSize, int YSize, int BytesPerLine, const unsigned char * pData);
/*   272 */ void GUI_AA__DrawCharAA4(int x0, int y0, int XSize, int YSize, int BytesPerLine, const unsigned char * pData);
/*   273 */ void GUI_AA__DrawCharAA8(int x0, int y0, int XSize, int YSize, int BytesPerLine, const unsigned char * pData);
/*   278 */ int GUI__GetAlphaBuffer (unsigned long ** ppCurrent, unsigned long ** ppConvert, unsigned long ** ppData, int * pVXSizeMax);
/*   279 */ int GUI__AllocAlphaBuffer (int AllocDataBuffer);
/*   280 */ unsigned long * GUI__DoAlphaBlending (int x, int y, unsigned long * pData, int xSize, tLCDDEV_Index2Color * pfIndex2Color_DEV, int * pDone);
/*   281 */ unsigned GUI__SetAlphaBufferSize(int xSize);
/*   284 */ int GUI_SIF__GetCharDistX (unsigned short c, int * pSizeX);
/*   285 */ void GUI_SIF__GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi);
/*   286 */ char GUI_SIF__IsInFont (const GUI_FONT * pFont, unsigned short c);
/*   287 */ const unsigned char * GUI_SIF__GetpCharInfo (const GUI_FONT * pFont, unsigned short c, unsigned SizeOfCharInfo);
/*   288 */ int GUI_SIF__GetNumCharAreas (const GUI_FONT * pFont);
/*   289 */ int GUI_SIF__GetCharDistX_ExtFrm(unsigned short c, int * pSizeX);
/*   290 */ void GUI_SIF__GetFontInfo_ExtFrm (const GUI_FONT * pFont, GUI_FONTINFO * pfi);
/*   291 */ char GUI_SIF__IsInFont_ExtFrm (const GUI_FONT * pFont, unsigned short c);
/*   292 */ int GUI_SIF__GetCharInfo_ExtFrm (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   293 */ void GUI_SIF__ClearLine_ExtFrm (const char * s, int Len);
/*   296 */ int GUI_XBF__GetOff (const GUI_XBF_DATA * pXBF_Data, unsigned c, unsigned long * pOff);
/*   297 */ int GUI_XBF__GetOffAndSize(const GUI_XBF_DATA * pXBF_Data, unsigned c, unsigned long * pOff, unsigned short * pSize);
/*   298 */ int GUI_XBF__GetCharDistX (unsigned short c, int * pSizeX);
/*   299 */ void GUI_XBF__GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pInfo);
/*   300 */ char GUI_XBF__IsInFont (const GUI_FONT * pFont, unsigned short c);
/*   301 */ int GUI_XBF__GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
/*   302 */ void GUI_XBF__ClearLine (const char * s, int Len);
/*   305 */ void GUI_AddHex (unsigned long v, unsigned char Len, char ** ps);
/*   306 */ void GUI_AddBin (unsigned long v, unsigned char Len, char ** ps);
/*   307 */ void GUI_AddDecMin (signed long v, char ** ps);
/*   308 */ void GUI_AddDecShift(signed long v, unsigned char Len, unsigned char Shift, char ** ps);
/*   309 */ long GUI_AddSign (long v, char ** ps);
/*   310 */ int GUI_Long2Len (signed long v);
/*   315 */ int GUI_UC__CalcSizeOfChar (unsigned short Char);
/*   316 */ unsigned short GUI_UC__GetCharCodeInc (const char ** ps);
/*   317 */ int GUI_UC__NumChars2NumBytes(const char * s, int NumChars);
/*   318 */ int GUI_UC__NumBytes2NumChars(const char * s, int NumBytes);
/*   320 */ int GUI__GetLineNumChars (const char * s, int MaxNumChars);
/*   321 */ int GUI__GetNumChars (const char * s);
/*   322 */ int GUI__GetOverlap (unsigned short Char);
/*   323 */ int GUI__GetLineDistX (const char * s, int Len);
/*   324 */ int GUI__GetFontSizeY (void);
/*   325 */ int GUI__HandleEOLine (const char ** ps);
/*   326 */ void GUI__InvertRectColors (int x0, int y0, int x1, int y1);
/*   327 */ void GUI__DispLine (const char * s, int Len, const GUI_RECT * pr);
/*   328 */ void GUI__AddSpaceHex (unsigned long v, unsigned char Len, char ** ps);
/*   329 */ void GUI__CalcTextRect (const char * pText, const GUI_RECT * pTextRectIn, GUI_RECT * pTextRectOut, int TextAlign);
/*   331 */ void GUI__ClearTextBackground(int xDist, int yDist);
/*   333 */ int GUI__WrapGetNumCharsDisp (const char * pText, int xSize, GUI_WRAPMODE WrapMode);
/*   334 */ int GUI__WrapGetNumCharsToNextLine (const char * pText, int xSize, GUI_WRAPMODE WrapMode);
/*   335 */ int GUI__WrapGetNumBytesToNextLine (const char * pText, int xSize, GUI_WRAPMODE WrapMode);
/*   337 */ void GUI__memset16 (unsigned short * p, unsigned short Fill, int NumWords);
/*   338 */ int GUI__strlen (const char * s);
/*   339 */ int GUI__strcmp (const char * s0, const char * s1);
/*   340 */ int GUI__strcmp_hp (signed long hs0, const char * s1);
/*   343 */ int GUI__GetCursorPosX (const char * s, int Index, int MaxNumChars);
/*   344 */ int GUI__GetCursorPosChar (const char * s, int x, int NumCharsToNextLine);
/*   345 */ unsigned short GUI__GetCursorCharacter(const char * s, int Index, int MaxNumChars, int * pIsRTL);
/*   348 */ unsigned short GUI__GetPresentationForm (unsigned short Char, unsigned short Next, unsigned short Prev, int * pIgnoreNext, const char * s);
/*   349 */ int GUI__IsArabicCharacter (unsigned short c);
/*   352 */ int GUI__BIDI_Log2Vis (const char * s, int NumChars, char * pBuffer, int BufferSize);
/*   353 */ int GUI__BIDI_GetCursorPosX (const char * s, int NumChars, int Index);
/*   354 */ int GUI__BIDI_GetCursorPosChar (const char * s, int NumChars, int x);
/*   355 */ unsigned short GUI__BIDI_GetLogChar (const char * s, int NumChars, int Index);
/*   356 */ int GUI__BIDI_GetCharDir (const char * s, int NumChars, int Index);
/*   357 */ int GUI__BIDI_IsNSM (unsigned short Char);
/*   358 */ unsigned short GUI__BIDI_GetCursorCharacter(const char * s, int Index, int MaxNumChars, int * pIsRTL);
/*   359 */ int GUI__BIDI_GetWordWrap (const char * s, int xSize, int * pxDist);
/*   360 */ int GUI__BIDI_GetCharWrap (const char * s, int xSize);
/*   376 */ int GUI__BIDI2_Log2Vis (const char * s, int NumChars, char * pBuffer, int BufferSize);
/*   377 */ int GUI__BIDI2_GetCursorPosX (const char * s, int NumChars, int Index);
/*   378 */ int GUI__BIDI2_GetCursorPosChar (const char * s, int NumChars, int x);
/*   379 */ unsigned short GUI__BIDI2_GetLogChar (const char * s, int NumChars, int Index);
/*   380 */ int GUI__BIDI2_GetCharDir (const char * s, int NumChars, int Index);
/*   381 */ int GUI__BIDI2_IsNSM (unsigned short Char);
/*   382 */ unsigned short GUI__BIDI2_GetCursorCharacter(const char * s, int Index, int MaxNumChars, int * pIsRTL);
/*   383 */ int GUI__BIDI2_GetWordWrap (const char * s, int xSize, int * pxDist);
/*   384 */ int GUI__BIDI2_GetCharWrap (const char * s, int xSize);
/*   385 */ void GUI__BIDI2_SetBaseDir (int Dir);
/*   386 */ int GUI__BIDI2_GetBaseDir (void);
/*   395 */ const char * GUI__BIDI_Log2VisBuffered(const char * s, int * pMaxNumChars);
/*   397 */ extern int GUI__BIDI_Enabled;
/*   399 */ extern int (* _pfGUI__BIDI_Log2Vis )(const char * s, int NumChars, char * pBuffer, int BufferSize);
/*   400 */ extern int (* _pfGUI__BIDI_GetCursorPosX )(const char * s, int NumChars, int Index);
/*   401 */ extern int (* _pfGUI__BIDI_GetCursorPosChar)(const char * s, int NumChars, int x);
/*   402 */ extern unsigned short (* _pfGUI__BIDI_GetLogChar )(const char * s, int NumChars, int Index);
/*   403 */ extern int (* _pfGUI__BIDI_GetCharDir )(const char * s, int NumChars, int Index);
/*   404 */ extern int (* _pfGUI__BIDI_IsNSM )(unsigned short Char);
/*   407 */ extern const char * (* GUI_CharLine_pfLog2Vis)(const char * s, int * pMaxNumChars);
/*   409 */ extern int (* GUI__GetCursorPos_pfGetPosX) (const char * s, int MaxNumChars, int Index);
/*   410 */ extern int (* GUI__GetCursorPos_pfGetPosChar) (const char * s, int MaxNumChars, int x);
/*   411 */ extern unsigned short (* GUI__GetCursorPos_pfGetCharacter)(const char * s, int MaxNumChars, int Index, int * pIsRTL);
/*   413 */ extern int (* GUI__Wrap_pfGetWordWrap)(const char * s, int xSize, int * pxDist);
/*   414 */ extern int (* GUI__Wrap_pfGetCharWrap)(const char * s, int xSize);
/*   417 */ const GUI_FONT_PROP * GUIPROP__FindChar(const GUI_FONT_PROP * pProp, unsigned short c);
/*   420 */ const GUI_FONT_PROP_EXT * GUIPROP_EXT__FindChar(const GUI_FONT_PROP_EXT * pPropExt, unsigned short c);
/*   421 */ void GUIPROP_EXT__DispLine (const char * s, int Len);
/*   422 */ void GUIPROP_EXT__ClearLine (const char * s, int Len);
/*   423 */ void GUIPROP_EXT__SetfpClearLine(void (* fpClearLine)(const char * s, int Len));
/*   426 */ unsigned short GUI__Read16(const unsigned char ** ppData);
/*   427 */ unsigned long GUI__Read32(const unsigned char ** ppData);
/*   430 */ void GUI__GetOrg(int * px, int * py);
/*   431 */ void GUI__SetOrgHook(void(* pfHook)(int x, int y));
/*   434 */ int GUI_TIMER__IsActive (void);
/*   435 */ int GUI_TIMER__GetPeriod (void);
/*   436 */ GUI_TIMER_HANDLE GUI_TIMER__GetNextTimer (GUI_TIMER_HANDLE hTimer, unsigned long * pContext);
/*   437 */ GUI_TIMER_HANDLE GUI_TIMER__GetFirstTimer (unsigned long * pContext);
/*   438 */ GUI_TIMER_HANDLE GUI_TIMER__GetNextTimerLin(GUI_TIMER_HANDLE hTimer, unsigned long * pContext);
/*   441 */ tLCDDEV_Index2Color * GUI_GetpfIndex2ColorEx(int LayerIndex);
/*   442 */ tLCDDEV_Color2Index * GUI_GetpfColor2IndexEx(int LayerIndex);
/*   444 */ int GUI_GetBitsPerPixelEx(int LayerIndex);
/*   446 */ unsigned long * LCD_GetpPalConvTable (const LCD_LOGPALETTE * pLogPal);
/*   447 */ unsigned long * LCD_GetpPalConvTableUncached(const LCD_LOGPALETTE * pLogPal);
/*   448 */ unsigned long * LCD_GetpPalConvTableBM (const LCD_LOGPALETTE * pLogPal, const GUI_BITMAP * pBitmap, int LayerIndex);
/*   451 */ void GUI_SetFuncGetpPalConvTable(unsigned long * (* pFunc)(const LCD_LOGPALETTE * pLogPal, const GUI_BITMAP * pBitmap, int LayerIndex));
/*   485 */ void GUI__ReadHeaderFromStream (GUI_BITMAP_STREAM * pBitmapHeader, const unsigned char * pData);
/*   486 */ void GUI__CreateBitmapFromStream(const GUI_BITMAP_STREAM * pBitmapHeader, const void * pData, GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const GUI_BITMAP_METHODS * pMethods);
/*   489 */ int GUI__ManageCache (int Cmd);
/*   490 */ int GUI__ManageCacheEx(int LayerIndex, int Cmd);
/*   498 */ void GL_DispChar (unsigned short c);
/*   499 */ void GL_DrawArc (int x0, int y0, int rx, int ry, int a0, int a1);
/*   500 */ void GL_DrawBitmap (const GUI_BITMAP * pBM, int x0, int y0);
/*   501 */ void GL_DrawCircle (int x0, int y0, int r);
/*   502 */ void GL_DrawEllipse (int x0, int y0, int rx, int ry, int w);
/*   503 */ void GL_DrawHLine (int y0, int x0, int x1);
/*   504 */ void GL_DrawPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
/*   505 */ void GL_DrawPoint (int x, int y);
/*   506 */ void GL_DrawLine1 (int x0, int y0, int x1, int y1);
/*   507 */ void GL_DrawLine1Ex (int x0, int y0, int x1, int y1, unsigned * pPixelCnt);
/*   508 */ void GL_DrawLineRel (int dx, int dy);
/*   509 */ void GL_DrawLineTo (int x, int y);
/*   510 */ void GL_DrawLineToEx (int x, int y, unsigned * pPixelCnt);
/*   511 */ void GL_DrawLine (int x0, int y0, int x1, int y1);
/*   512 */ void GL_DrawLineEx (int x0, int y0, int x1, int y1, unsigned * pPixelCnt);
/*   513 */ void GL_MoveTo (int x, int y);
/*   514 */ void GL_FillCircle (int x0, int y0, int r);
/*   515 */ void GL_FillCircleAA (int x0, int y0, int r);
/*   516 */ void GL_FillEllipse (int x0, int y0, int rx, int ry);
/*   517 */ void GL_FillPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
/*   518 */ void GL_SetDefault (void);
/*   529 */ extern void * (* GUI__pfMemset)(void * pDest, int Fill, unsigned Cnt);
/*   530 */ extern void * (* GUI__pfMemcpy)(void * pDest, const void * pSrc, unsigned Cnt);
/*   544 */ typedef int GUI_tfTimer(void);
/*   545 */ typedef int WM_tfHandlePID(void);
/*   553 */ extern GUI_RECT GUI_RectDispString;
/*   561 */ extern unsigned char GUI__CharHasTrans;
/*   569 */ extern int GUITASK__EntranceCnt;
/*   578 */ int GUI_GetBitmapPixelIndex(const GUI_BITMAP * pBMP, unsigned x, unsigned y);
/*   579 */ GUI_COLOR GUI_GetBitmapPixelColor(const GUI_BITMAP * pBMP, unsigned x, unsigned y);
/*   580 */ int GUI_GetBitmapPixelIndexEx(int BitsPerPixel, int BytesPerLine, const unsigned char * pData, unsigned x, unsigned y);
/*   582 */ void GUI__DrawBitmap16bpp (int x0, int y0, int xsize, int ysize, const unsigned char * pPixel, const LCD_LOGPALETTE * pLogPal, int xMag, int yMag, tLCDDEV_Index2Color * pfIndex2Color, const LCD_API_COLOR_CONV * pColorConvAPI);
/*   583 */ void GUI__DrawBitmapA16bpp(int x0, int y0, int xSize, int ySize, const unsigned char * pPixel, const LCD_LOGPALETTE * pLogPal, int xMag, int yMag, tLCDDEV_Index2Color * pfIndex2Color);
/*   584 */ void GUI__SetPixelAlpha (int x, int y, unsigned char Alpha, LCD_COLOR Color);
/*   585 */ LCD_COLOR GUI__MixColors (LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
/*   586 */ void GUI__MixColorsBulk (unsigned long * pFG, unsigned long * pBG, unsigned long * pDst, unsigned OffFG, unsigned OffBG, unsigned OffDest, unsigned xSize, unsigned ySize, unsigned char Intens);
/*   588 */ extern const GUI_UC_ENC_APILIST GUI_UC_None;
/*   611 */ void LCD_ReadRect (int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);
/*   612 */ void GUI_ReadRect (int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);
/*   613 */ void GUI_ReadRectEx(int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);
/*   615 */ void LCD_ReadRectNoClip(int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);
/*   623 */ typedef struct {
/*   624 */    void (* pfSetColor) (LCD_COLOR Index);
/*   625 */    void (* pfSetBkColor) (LCD_COLOR Index);
/*   626 */    LCD_DRAWMODE (* pfSetDrawMode)(LCD_DRAWMODE dm);
/*   627 */ } LCD_SET_COLOR_API;
/*   629 */ extern const LCD_SET_COLOR_API * LCD__pSetColorAPI;
/*   646 */ extern const GUI_FONT * GUI__pFontDefault;
/*   647 */ extern GUI_COLOR GUI__ColorDefault;
/*   648 */ extern GUI_COLOR GUI__BkColorDefault;
/*   650 */ extern GUI_CONTEXT * GUI_pContext;
/*   652 */ extern GUI_DEVICE * GUI__apDevice[2];
/*   657 */ extern unsigned long * (* GUI_pfGetpPalConvTable)(const LCD_LOGPALETTE * pLogPal, const GUI_BITMAP * pBitmap, int LayerIndex);
/*   662 */ extern LCD_COLOR (* GUI__pfMixColors)(LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
/*   667 */ extern void (* GUI__pfMixColorsBulk)(unsigned long * pFG, unsigned long * pBG, unsigned long * pDst, unsigned OffFG, unsigned OffBG, unsigned OffDest, unsigned xSize, unsigned ySize, unsigned char Intens);
/*   672 */ extern LCD_COLOR (* LCD_AA_pfMixColors16)(LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
/*   677 */ extern GUI_DRAWMEMDEV_16BPP_FUNC * GUI__pfDrawAlphaMemdevFunc;
/*   678 */ extern GUI_DRAWMEMDEV_16BPP_FUNC * GUI__pfDrawM565MemdevFunc;
/*   683 */ extern GUI_DRAWBITMAP_FUNC * GUI__pfDrawAlphaBitmapFunc;
/*   684 */ extern GUI_DRAWBITMAP_FUNC * GUI__pfDrawM565BitmapFunc;
/*   689 */ extern const GUI_MULTIBUF_API GUI_MULTIBUF_APIList;
/*   690 */ extern const GUI_MULTIBUF_API GUI_MULTIBUF_APIListMasked;
/*   691 */ extern const GUI_MULTIBUF_API_EX GUI_MULTIBUF_APIListEx;
/*   699 */ extern void (* GUI_pfExecAnimations)(void);
/*   700 */ extern int (* GUI_pfUpdateSoftLayer)(void);
/*   702 */ extern void (* GUI_pfAfterInitHook)(void);
/*   708 */ extern void (* GUI_pfHookMTOUCH)(const GUI_MTOUCH_STATE * pState);
/*   710 */ extern const GUI_UC_ENC_APILIST * GUI_pUC_API;
/*   712 */ extern char GUI_DecChar;
/*   713 */ extern GUI_tfTimer * GUI_pfTimerExec;
/*   714 */ extern WM_tfHandlePID * WM_pfHandlePID;
/*   715 */ extern void (* GUI_pfDispCharStyle)(unsigned short Char);
/*   716 */ extern void (* GUI_pfDispCharLine)(int x0);
/*   718 */ extern int GUI__BufferSize;
/*   719 */ extern int GUI_AA__ClipX0;
/*   721 */ extern signed char GUI__aNumBuffers[2];
/*   722 */ extern unsigned char GUI__PreserveTrans;
/*   723 */ extern unsigned char GUI__IsInitialized;
/*   725 */ extern unsigned char GUI__NumLayersInUse;
/*   726 */ extern unsigned long GUI__LayerMask;
/*   729 */ extern const tLCD_APIList * GUI_pLCD_APIList;
/*   732 */ extern signed short GUI_OrgX, GUI_OrgY;
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/WM_Intern.h
 */
/*   113 */ typedef struct {
/*   114 */    GUI_HWIN hOld;
/*   115 */    GUI_HWIN hNew;
/*   116 */ } WM_NOTIFY_CHILD_HAS_FOCUS_INFO;
/*   118 */ typedef struct WM_CRITICAL_HANDLE {
/*   119 */    struct WM_CRITICAL_HANDLE * pNext;
/*   120 */    volatile GUI_HWIN hWin;
/*   121 */ } WM_CRITICAL_HANDLE;
/*   129 */ extern unsigned long WM__CreateFlags;
/*   130 */ extern GUI_HWIN WM__ahCapture[2];
/*   131 */ extern GUI_HWIN WM__ahWinFocus[2];
/*   132 */ extern char WM__CaptureReleaseAuto;
/*   133 */ extern WM_tfPollPID * WM_pfPollPID;
/*   134 */ extern unsigned char WM__PaintCallbackCnt;
/*   135 */ extern GUI_HWIN WM__hCreateStatic;
/*   138 */ extern int WM__TransWindowCnt;
/*   139 */ extern GUI_HWIN WM__hATransWindow;
/*   146 */ extern WM_CRITICAL_HANDLE WM__aCHWinModal[2];
/*   147 */ extern WM_CRITICAL_HANDLE WM__aCHWinLast[2];
/*   148 */ extern int WM__ModalLayer;
/*   151 */ extern WM_CRITICAL_HANDLE WM__aCHWinMouseOver[2];
/*   161 */ extern unsigned long WM__InvalidLayerMask;
/*   162 */ extern unsigned WM__TouchedLayer;
/*   168 */ extern unsigned short WM__NumWindows;
/*   169 */ extern unsigned short WM__NumInvalidWindows;
/*   170 */ extern GUI_HWIN WM__FirstWin;
/*   171 */ extern WM_CRITICAL_HANDLE * WM__pFirstCriticalHandle;
/*   173 */ extern GUI_HWIN WM__ahDesktopWin[2];
/*   174 */ extern GUI_COLOR WM__aBkColor[2];
/*   184 */ void WM__ActivateClipRect (void);
/*   185 */ int WM__ClipAtParentBorders (GUI_RECT * pRect, GUI_HWIN hWin);
/*   186 */ void WM__Client2Screen (const WM_Obj * pWin, GUI_RECT * pRect);
/*   187 */ void WM__DeleteAssocTimer (GUI_HWIN hWin);
/*   188 */ void WM__DeleteSecure (GUI_HWIN hWin);
/*   189 */ void WM__DetachWindow (GUI_HWIN hChild);
/*   190 */ void WM__ForEachDesc (GUI_HWIN hWin, WM_tfForEach * pcb, void * pData);
/*   191 */ void WM__GetClientRectWin (const WM_Obj * pWin, GUI_RECT * pRect);
/*   192 */ void WM__GetClientRectEx (GUI_HWIN hWin, GUI_RECT * pRect);
/*   193 */ GUI_HWIN WM__GetFirstSibling (GUI_HWIN hWin);
/*   194 */ GUI_HWIN WM__GetFocusedChild (GUI_HWIN hWin);
/*   195 */ int WM__GetHasFocus (GUI_HWIN hWin);
/*   196 */ GUI_HWIN WM__GetLastSibling (GUI_HWIN hWin);
/*   197 */ GUI_HWIN WM__GetPrevSibling (GUI_HWIN hWin);
/*   198 */ int WM__GetTopLevelLayer (GUI_HWIN hWin);
/*   199 */ int WM__GetWindowSizeX (const WM_Obj * pWin);
/*   200 */ int WM__GetWindowSizeY (const WM_Obj * pWin);
/*   201 */ void WM__InsertWindowIntoList (GUI_HWIN hWin, GUI_HWIN hParent);
/*   202 */ void WM__Invalidate1Abs (GUI_HWIN hWin, const GUI_RECT * pRect);
/*   203 */ void WM__InvalidateAreaBelow (const GUI_RECT * pRect, GUI_HWIN StopWin);
/*   204 */ void WM__InvalidateRectEx (const GUI_RECT * pInvalidRect, GUI_HWIN hParent, GUI_HWIN hStop);
/*   205 */ void WM__InvalidateTransAreaAbove(const GUI_RECT * pRect, GUI_HWIN StopWin);
/*   206 */ int WM__IntersectRect (GUI_RECT * pDest, const GUI_RECT * pr0, const GUI_RECT * pr1);
/*   207 */ int WM__IsAncestor (GUI_HWIN hChild, GUI_HWIN hParent);
/*   208 */ int WM__IsAncestorOrSelf (GUI_HWIN hChild, GUI_HWIN hParent);
/*   209 */ int WM__IsChild (GUI_HWIN hWin, GUI_HWIN hParent);
/*   210 */ int WM__IsEnabled (GUI_HWIN hWin);
/*   211 */ int WM__IsInModalArea (GUI_HWIN hWin);
/*   212 */ int WM__IsInWindow (WM_Obj * pWin, int x, int y);
/*   213 */ int WM__IsWindow (GUI_HWIN hWin);
/*   214 */ void WM__LeaveIVRSearch (void);
/*   215 */ void WM__MoveTo (GUI_HWIN hWin, int x, int y);
/*   216 */ void WM__MoveWindow (GUI_HWIN hWin, int dx, int dy);
/*   217 */ void WM__NotifyVisChanged (GUI_HWIN hWin, GUI_RECT * pRect);
/*   218 */ int WM__RectIsNZ (const GUI_RECT * pr);
/*   219 */ void WM__RemoveWindowFromList (GUI_HWIN hWin);
/*   220 */ void WM__Screen2Client (const WM_Obj * pWin, GUI_RECT * pRect);
/*   221 */ void WM__SelectTopLevelLayer (GUI_HWIN hWin);
/*   222 */ void WM__SendMsgNoData (GUI_HWIN hWin, unsigned char MsgId);
/*   223 */ void WM__SendMessage (GUI_HWIN hWin, WM_MESSAGE * pm);
/*   224 */ void WM__SendMessageIfEnabled (GUI_HWIN hWin, WM_MESSAGE * pm);
/*   225 */ void WM__SendMessageNoPara (GUI_HWIN hWin, int MsgId);
/*   226 */ void WM__SendPIDMessage (GUI_HWIN hWin, WM_MESSAGE * pMsg);
/*   227 */ int WM__SetScrollbarH (GUI_HWIN hWin, int OnOff);
/*   228 */ int WM__SetScrollbarV (GUI_HWIN hWin, int OnOff);
/*   229 */ void WM__UpdateChildPositions (WM_Obj * pObj, int dx0, int dy0, int dx1, int dy1);
/*   230 */ void WM_PID__GetPrevState (GUI_PID_STATE * pPrevState, int Layer);
/*   231 */ void WM_PID__SetPrevState (GUI_PID_STATE * pPrevState, int Layer);
/*   232 */ void WM__SendTouchMessage (GUI_HWIN hWin, WM_MESSAGE * pMsg);
/*   234 */ unsigned short WM_GetFlags (GUI_HWIN hWin);
/*   235 */ int WM__Paint (GUI_HWIN hWin);
/*   236 */ void WM__Paint1 (GUI_HWIN hWin);
/*   237 */ void WM__AddCriticalHandle (WM_CRITICAL_HANDLE * pCH);
/*   238 */ void WM__RemoveCriticalHandle (WM_CRITICAL_HANDLE * pCH);
/*   239 */ void WM__SetLastTouched (GUI_HWIN hWin);
/*   242 */ void WM__InvalidateDrawAndDescs(GUI_HWIN hWin);
/*   249 */ typedef struct {
/*   250 */    int xSize, ySize;
/*   251 */ } EFFECT_CONTEXT;
/*   253 */ int GUI_MEMDEV__CalcParaFadeIn (int Period, int TimeUsed);
/*   254 */ void GUI_MEMDEV__ClipBK (EFFECT_CONTEXT * pContext);
/*   255 */ void GUI_MEMDEV__RemoveStaticDevice(GUI_HWIN hWin);
/*   256 */ void GUI_MEMDEV__UndoClipBK (EFFECT_CONTEXT * pContext);
/*   259 */ void WM__InvalidateParent(const GUI_RECT * pInvalidRect, GUI_HWIN hParent, GUI_HWIN hStop);
/*   260 */ void WM__InvalidateRect (const GUI_RECT * pInvalidRect, GUI_HWIN hParent, GUI_HWIN hStop, unsigned short Flags);
/*   262 */ WM_tfInvalidateParent WM__SetInvalidateParentFunc(WM_tfInvalidateParent pfInvalidateParentFunc);
/*   263 */ WM_tfInvalidateDrawFunc WM__SetInvalidateDrawFunc (WM_tfInvalidateDrawFunc pfInvalidateDrawFunc);
/*   264 */ WM_tfPaint1Func WM__SetPaint1Func (WM_tfPaint1Func pfPaint1Func);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/WIDGET.h
 */
/*    70 */ typedef struct {
/*    71 */    GUI_HWIN hWin;
/*    72 */    int Cmd;
/*    73 */    int ItemIndex;
/*    74 */    int Col;
/*    75 */    int x0, y0, x1, y1;
/*    76 */    void * p;
/*    77 */ } WIDGET_ITEM_DRAW_INFO;
/*    79 */ typedef int WIDGET_DRAW_ITEM_FUNC(const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*    80 */ typedef void WIDGET_PAINT (GUI_HWIN hObj);
/*    81 */ typedef void WIDGET_CREATE (GUI_HWIN hObj);
/*    83 */ typedef struct {
/*    84 */    WIDGET_PAINT * pfPaint;
/*    85 */    WIDGET_CREATE * pfCreate;
/*    86 */    void * pSkinPrivate;
/*    87 */ } WIDGET_SKIN;
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/SCROLLBAR.h
 */
/*   104 */ typedef signed long SCROLLBAR_Handle;
/*   106 */ typedef struct {
/*   107 */    GUI_COLOR aColorFrame[3];
/*   108 */    GUI_COLOR aColorUpper[2];
/*   109 */    GUI_COLOR aColorLower[2];
/*   110 */    GUI_COLOR aColorShaft[2];
/*   111 */    GUI_COLOR ColorArrow;
/*   112 */    GUI_COLOR ColorGrasp;
/*   113 */ } SCROLLBAR_SKINFLEX_PROPS;
/*   115 */ typedef struct {
/*   116 */    int IsVertical;
/*   117 */    int State;
/*   118 */ } SCROLLBAR_SKINFLEX_INFO;
/*   126 */ SCROLLBAR_Handle SCROLLBAR_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int WinFlags, int SpecialFlags);
/*   127 */ SCROLLBAR_Handle SCROLLBAR_CreateAttached(GUI_HWIN hParent, int SpecialFlags);
/*   128 */ SCROLLBAR_Handle SCROLLBAR_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   129 */ SCROLLBAR_Handle SCROLLBAR_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   130 */ SCROLLBAR_Handle SCROLLBAR_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   139 */ void SCROLLBAR_Callback(WM_MESSAGE * pMsg);
/*   150 */ void SCROLLBAR_AddValue (SCROLLBAR_Handle hObj, int Add);
/*   151 */ void SCROLLBAR_Dec (SCROLLBAR_Handle hObj);
/*   152 */ void SCROLLBAR_Inc (SCROLLBAR_Handle hObj);
/*   153 */ int SCROLLBAR_GetUserData(SCROLLBAR_Handle hObj, void * pDest, int NumBytes);
/*   154 */ GUI_COLOR SCROLLBAR_SetColor (SCROLLBAR_Handle hObj, int Index, GUI_COLOR Color);
/*   155 */ void SCROLLBAR_SetNumItems(SCROLLBAR_Handle hObj, int NumItems);
/*   156 */ void SCROLLBAR_SetPageSize(SCROLLBAR_Handle hObj, int PageSize);
/*   157 */ void SCROLLBAR_SetValue (SCROLLBAR_Handle hObj, int v);
/*   158 */ int SCROLLBAR_SetWidth (SCROLLBAR_Handle hObj, int Width);
/*   159 */ void SCROLLBAR_SetState (SCROLLBAR_Handle hObj, const WM_SCROLL_STATE* pState);
/*   160 */ int SCROLLBAR_SetUserData(SCROLLBAR_Handle hObj, const void * pSrc, int NumBytes);
/*   168 */ void SCROLLBAR_GetSkinFlexProps (SCROLLBAR_SKINFLEX_PROPS * pProps, int Index);
/*   169 */ void SCROLLBAR_SetSkinClassic (SCROLLBAR_Handle hObj);
/*   170 */ void SCROLLBAR_SetSkin (SCROLLBAR_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   171 */ int SCROLLBAR_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   172 */ void SCROLLBAR_SetSkinFlexProps (const SCROLLBAR_SKINFLEX_PROPS * pProps, int Index);
/*   173 */ void SCROLLBAR_SetDefaultSkinClassic(void);
/*   174 */ WIDGET_DRAW_ITEM_FUNC * SCROLLBAR_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   184 */ int SCROLLBAR_GetDefaultWidth(void);
/*   185 */ GUI_COLOR SCROLLBAR_SetDefaultColor(GUI_COLOR Color, unsigned int Index);
/*   186 */ int SCROLLBAR_SetDefaultWidth(int DefaultWidth);
/*   194 */ int SCROLLBAR_GetThumbSizeMin(void);
/*   195 */ int SCROLLBAR_SetThumbSizeMin(int ThumbSizeMin);
/*   203 */ int SCROLLBAR_GetNumItems(SCROLLBAR_Handle hObj);
/*   204 */ int SCROLLBAR_GetPageSize(SCROLLBAR_Handle hObj);
/*   205 */ int SCROLLBAR_GetValue (SCROLLBAR_Handle hObj);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/WIDGET.h
 */
/*   241 */ typedef struct {
/*   242 */    int EffectSize;
/*   243 */    void (* pfDrawUp) (void);
/*   244 */    void (* pfDrawUpRect) (const GUI_RECT * pRect);
/*   245 */    void (* pfDrawDown) (void);
/*   246 */    void (* pfDrawDownRect)(const GUI_RECT * pRect);
/*   247 */    void (* pfDrawFlat) (void);
/*   248 */    void (* pfDrawFlatRect)(const GUI_RECT * pRect);
/*   249 */ } WIDGET_EFFECT;
/*   251 */ typedef struct {
/*   252 */    WM_Obj Win;
/*   253 */    const WIDGET_EFFECT* pEffect;
/*   254 */    signed short Id;
/*   255 */    unsigned short State;
/*   259 */ } WIDGET;
/*   271 */ typedef struct GUI_DRAW GUI_DRAW;
/*   272 */ typedef void GUI_DRAW_SELF_CB (GUI_HWIN hWin);
/*   273 */ typedef signed long GUI_DRAW_HANDLE;
/*   276 */ typedef struct {
/*   277 */    void (* pfDraw) (GUI_DRAW_HANDLE hDrawObj, GUI_HWIN hObj, int x, int y);
/*   278 */    int (* pfGetXSize)(GUI_DRAW_HANDLE hDrawObj);
/*   279 */    int (* pfGetYSize)(GUI_DRAW_HANDLE hDrawObj);
/*   280 */ } GUI_DRAW_CONSTS;
/*   283 */ struct GUI_DRAW {
/*   284 */    const GUI_DRAW_CONSTS* pConsts;
/*   285 */    union {
/*   286 */       const void * pData;
/*   287 */       GUI_DRAW_SELF_CB* pfDraw;
/*   288 */    } Data;
/*   289 */    signed short xOff, yOff;
/*   290 */ };
/*   293 */ void GUI_DRAW__Draw (GUI_DRAW_HANDLE hDrawObj, GUI_HWIN hObj, int x, int y);
/*   294 */ int GUI_DRAW__GetXSize(GUI_DRAW_HANDLE hDrawObj);
/*   295 */ int GUI_DRAW__GetYSize(GUI_DRAW_HANDLE hDrawObj);
/*   297 */ void GUI_DrawStreamedEnableAuto(void);
/*   300 */ signed long GUI_DRAW_BITMAP_Create (const GUI_BITMAP* pBitmap, int x, int y);
/*   301 */ signed long GUI_DRAW_BMP_Create (const void* pBMP, int x, int y);
/*   302 */ signed long GUI_DRAW_STREAMED_Create(const GUI_BITMAP_STREAM * pBitmap, int x, int y);
/*   303 */ signed long GUI_DRAW_SELF_Create(GUI_DRAW_SELF_CB* pfDraw, int x, int y);
/*   312 */ extern const WIDGET_EFFECT WIDGET_Effect_3D;
/*   313 */ extern const WIDGET_EFFECT WIDGET_Effect_3D1L;
/*   314 */ extern const WIDGET_EFFECT WIDGET_Effect_3D2L;
/*   315 */ extern const WIDGET_EFFECT WIDGET_Effect_None;
/*   316 */ extern const WIDGET_EFFECT WIDGET_Effect_Simple;
/*   325 */ void WIDGET__DrawFocusRect (WIDGET * pWidget, const GUI_RECT * pRect, int Dist);
/*   326 */ void WIDGET__DrawHLine (WIDGET * pWidget, int y, int x0, int x1);
/*   327 */ void WIDGET__DrawTriangle (WIDGET * pWidget, int x, int y, int Size, int Inc);
/*   328 */ void WIDGET__DrawVLine (WIDGET * pWidget, int x, int y0, int y1);
/*   329 */ void WIDGET__EFFECT_DrawDownRect(WIDGET * pWidget, GUI_RECT * pRect);
/*   330 */ void WIDGET__EFFECT_DrawDown (WIDGET * pWidget);
/*   331 */ void WIDGET__EFFECT_DrawUpRect (WIDGET * pWidget, GUI_RECT * pRect);
/*   332 */ void WIDGET__FillRectEx (WIDGET * pWidget, const GUI_RECT * pRect);
/*   333 */ int WIDGET__GetWindowSizeX (GUI_HWIN hWin);
/*   334 */ GUI_COLOR WIDGET__GetBkColor (GUI_HWIN hObj);
/*   335 */ int WIDGET__GetXSize (const WIDGET * pWidget);
/*   336 */ int WIDGET__GetYSize (const WIDGET * pWidget);
/*   337 */ void WIDGET__GetClientRect (WIDGET * pWidget, GUI_RECT * pRect);
/*   338 */ void WIDGET__GetInsideRect (WIDGET * pWidget, GUI_RECT * pRect);
/*   339 */ void WIDGET__Init (WIDGET * pWidget, int Id, unsigned short State);
/*   340 */ void WIDGET__RotateRect90 (WIDGET * pWidget, GUI_RECT * pDest, const GUI_RECT * pRect);
/*   341 */ void WIDGET__SetScrollState (GUI_HWIN hWin, const WM_SCROLL_STATE * pVState, const WM_SCROLL_STATE * pState);
/*   342 */ void WIDGET__FillStringInRect (const char * pText, const GUI_RECT * pFillRect, const GUI_RECT * pTextRectMax, const GUI_RECT * pTextRectAct);
/*   347 */ extern void (* GUI__pfDrawStreamedBitmap) (const void * p, int x, int y);
/*   348 */ extern int (* GUI__pfDrawStreamedBitmapEx)(GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
/*   356 */ void WIDGET_SetState (GUI_HWIN hObj, int State);
/*   357 */ void WIDGET_AndState (GUI_HWIN hObj, int State);
/*   358 */ void WIDGET_OrState (GUI_HWIN hObj, int State);
/*   359 */ int WIDGET_HandleActive (GUI_HWIN hObj, WM_MESSAGE* pMsg);
/*   360 */ int WIDGET_GetState (GUI_HWIN hObj);
/*   361 */ int WIDGET_SetWidth (GUI_HWIN hObj, int Width);
/*   362 */ void WIDGET_SetFocusable (GUI_HWIN hObj, int State);
/*   364 */ void WIDGET_EFFECT_3D_DrawUp(void);
/*   366 */ const WIDGET_EFFECT* WIDGET_SetDefaultEffect(const WIDGET_EFFECT* pEffect);
/*   368 */ void WIDGET_SetEffect (GUI_HWIN hObj, const WIDGET_EFFECT* pEffect);
/*   370 */ const WIDGET_EFFECT* WIDGET_GetDefaultEffect(void);
/*   372 */ void WIDGET_EFFECT_3D_SetColor (unsigned Index, GUI_COLOR Color);
/*   373 */ void WIDGET_EFFECT_3D1L_SetColor (unsigned Index, GUI_COLOR Color);
/*   374 */ void WIDGET_EFFECT_3D2L_SetColor (unsigned Index, GUI_COLOR Color);
/*   375 */ void WIDGET_EFFECT_Simple_SetColor(unsigned Index, GUI_COLOR Color);
/*   377 */ GUI_COLOR WIDGET_EFFECT_3D_GetColor (unsigned Index);
/*   378 */ GUI_COLOR WIDGET_EFFECT_3D1L_GetColor (unsigned Index);
/*   379 */ GUI_COLOR WIDGET_EFFECT_3D2L_GetColor (unsigned Index);
/*   380 */ GUI_COLOR WIDGET_EFFECT_Simple_GetColor(unsigned Index);
/*   382 */ int WIDGET_EFFECT_3D_GetNumColors(void);
/*   383 */ int WIDGET_EFFECT_3D1L_GetNumColors(void);
/*   384 */ int WIDGET_EFFECT_3D2L_GetNumColors(void);
/*   385 */ int WIDGET_EFFECT_Simple_GetNumColors(void);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/BUTTON.h
 */
/*   115 */ typedef signed long BUTTON_Handle;
/*   117 */ typedef struct {
/*   118 */    GUI_COLOR aColorFrame[3];
/*   119 */    GUI_COLOR aColorUpper[2];
/*   120 */    GUI_COLOR aColorLower[2];
/*   121 */    int Radius;
/*   122 */ } BUTTON_SKINFLEX_PROPS;
/*   132 */ BUTTON_Handle BUTTON_Create (int x0, int y0, int xSize, int ySize, int ID, int Flags);
/*   133 */ BUTTON_Handle BUTTON_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags);
/*   134 */ BUTTON_Handle BUTTON_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   135 */ BUTTON_Handle BUTTON_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   136 */ BUTTON_Handle BUTTON_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   144 */ GUI_COLOR BUTTON_GetDefaultBkColor (unsigned Index);
/*   145 */ const GUI_FONT * BUTTON_GetDefaultFont (void);
/*   146 */ int BUTTON_GetDefaultTextAlign (void);
/*   147 */ GUI_COLOR BUTTON_GetDefaultTextColor (unsigned Index);
/*   148 */ void BUTTON_SetDefaultBkColor (GUI_COLOR Color, unsigned Index);
/*   149 */ GUI_COLOR BUTTON_SetDefaultFocusColor(GUI_COLOR Color);
/*   150 */ void BUTTON_SetDefaultFont (const GUI_FONT * pFont);
/*   151 */ void BUTTON_SetDefaultTextAlign (int Align);
/*   152 */ void BUTTON_SetDefaultTextColor (GUI_COLOR Color, unsigned Index);
/*   161 */ void BUTTON_Callback(WM_MESSAGE *pMsg);
/*   169 */ GUI_COLOR BUTTON_GetBkColor (BUTTON_Handle hObj, unsigned int Index);
/*   170 */ const GUI_BITMAP * BUTTON_GetBitmap(BUTTON_Handle hObj,unsigned int Index);
/*   171 */ const GUI_FONT * BUTTON_GetFont (BUTTON_Handle hObj);
/*   172 */ GUI_COLOR BUTTON_GetFrameColor (BUTTON_Handle hObj);
/*   173 */ WIDGET * BUTTON_GetpWidget (BUTTON_Handle hObj);
/*   174 */ void BUTTON_GetText (BUTTON_Handle hObj, char * pBuffer, int MaxLen);
/*   175 */ GUI_COLOR BUTTON_GetTextColor (BUTTON_Handle hObj, unsigned int Index);
/*   176 */ int BUTTON_GetTextAlign (BUTTON_Handle hObj);
/*   177 */ int BUTTON_GetUserData (BUTTON_Handle hObj, void * pDest, int NumBytes);
/*   178 */ unsigned BUTTON_IsPressed (BUTTON_Handle hObj);
/*   179 */ void BUTTON_SetBitmap (BUTTON_Handle hObj, unsigned int Index, const GUI_BITMAP * pBitmap);
/*   180 */ void BUTTON_SetBitmapEx (BUTTON_Handle hObj, unsigned int Index, const GUI_BITMAP * pBitmap, int x, int y);
/*   181 */ void BUTTON_SetBkColor (BUTTON_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   182 */ void BUTTON_SetBMP (BUTTON_Handle hObj, unsigned int Index, const void * pBitmap);
/*   183 */ void BUTTON_SetBMPEx (BUTTON_Handle hObj, unsigned int Index, const void * pBitmap, int x, int y);
/*   184 */ void BUTTON_SetFont (BUTTON_Handle hObj, const GUI_FONT * pfont);
/*   185 */ void BUTTON_SetFrameColor (BUTTON_Handle hObj, GUI_COLOR Color);
/*   186 */ void BUTTON_SetState (BUTTON_Handle hObj, int State);
/*   187 */ void BUTTON_SetPressed (BUTTON_Handle hObj, int State);
/*   188 */ GUI_COLOR BUTTON_SetFocusColor (BUTTON_Handle hObj, GUI_COLOR Color);
/*   189 */ void BUTTON_SetStreamedBitmap (BUTTON_Handle hObj, unsigned int Index, const GUI_BITMAP_STREAM * pBitmap);
/*   190 */ void BUTTON_SetStreamedBitmapEx(BUTTON_Handle hObj, unsigned int Index, const GUI_BITMAP_STREAM * pBitmap, int x, int y);
/*   191 */ int BUTTON_SetText (BUTTON_Handle hObj, const char* s);
/*   192 */ void BUTTON_SetTextAlign (BUTTON_Handle hObj, int Align);
/*   193 */ void BUTTON_SetTextColor (BUTTON_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   194 */ void BUTTON_SetTextOffset (BUTTON_Handle hObj, int xPos, int yPos);
/*   195 */ void BUTTON_SetSelfDrawEx (BUTTON_Handle hObj, unsigned int Index, GUI_DRAW_SELF_CB * pDraw, int x, int y);
/*   196 */ void BUTTON_SetSelfDraw (BUTTON_Handle hObj, unsigned int Index, GUI_DRAW_SELF_CB * pDraw);
/*   197 */ void BUTTON_SetReactOnLevel (void);
/*   198 */ void BUTTON_SetReactOnTouch (void);
/*   199 */ int BUTTON_SetUserData (BUTTON_Handle hObj, const void * pSrc, int NumBytes);
/*   210 */ void BUTTON_GetSkinFlexProps (BUTTON_SKINFLEX_PROPS * pProps, int Index);
/*   211 */ void BUTTON_SetSkinClassic (BUTTON_Handle hObj);
/*   212 */ void BUTTON_SetSkin (BUTTON_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   213 */ int BUTTON_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   214 */ void BUTTON_SetSkinFlexProps (const BUTTON_SKINFLEX_PROPS * pProps, int Index);
/*   215 */ void BUTTON_SetDefaultSkinClassic(void);
/*   216 */ WIDGET_DRAW_ITEM_FUNC * BUTTON_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/CALENDAR.h
 */
/*   106 */ typedef struct {
/*   107 */    int Year;
/*   108 */    int Month;
/*   109 */    int Day;
/*   110 */ } CALENDAR_DATE;
/*   116 */ typedef struct {
/*   117 */    GUI_COLOR aColorFrame[3];
/*   118 */    GUI_COLOR aColorUpper[2];
/*   119 */    GUI_COLOR aColorLower[2];
/*   120 */    GUI_COLOR ColorArrow;
/*   121 */ } CALENDAR_SKINFLEX_PROPS;
/*   129 */ GUI_HWIN CALENDAR_Create (GUI_HWIN hParent, int xPos, int yPos, unsigned Year, unsigned Month, unsigned Day, unsigned FirstDayOfWeek, int Id, int Flags);
/*   130 */ void CALENDAR_GetDate (GUI_HWIN hWin, CALENDAR_DATE * pDate);
/*   131 */ void CALENDAR_GetSel (GUI_HWIN hWin, CALENDAR_DATE * pDate);
/*   132 */ void CALENDAR_SetDate (GUI_HWIN hWin, CALENDAR_DATE * pDate);
/*   133 */ void CALENDAR_SetSel (GUI_HWIN hWin, CALENDAR_DATE * pDate);
/*   134 */ void CALENDAR_ShowDate (GUI_HWIN hWin, CALENDAR_DATE * pDate);
/*   140 */ void CALENDAR_SetDefaultBkColor(unsigned Index, GUI_COLOR Color);
/*   141 */ void CALENDAR_SetDefaultColor (unsigned Index, GUI_COLOR Color);
/*   142 */ void CALENDAR_SetDefaultDays (const char ** apDays);
/*   143 */ void CALENDAR_SetDefaultFont (unsigned Index, const GUI_FONT * pFont);
/*   144 */ void CALENDAR_SetDefaultMonths (const char ** apMonths);
/*   145 */ void CALENDAR_SetDefaultSize (unsigned Index, unsigned Size);
/*   151 */ void CALENDAR_GetSkinFlexProps (CALENDAR_SKINFLEX_PROPS * pProps, int Index);
/*   152 */ void CALENDAR_SetSkinFlexProps (const CALENDAR_SKINFLEX_PROPS * pProps, int Index);
/*   161 */ void CALENDAR_Callback(WM_MESSAGE * pMsg);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/CHECKBOX.h
 */
/*   104 */ typedef signed long CHECKBOX_Handle;
/*   106 */ typedef struct {
/*   107 */    GUI_COLOR aColorFrame[3];
/*   108 */    GUI_COLOR aColorInner[2];
/*   109 */    GUI_COLOR ColorCheck;
/*   110 */    int ButtonSize;
/*   111 */ } CHECKBOX_SKINFLEX_PROPS;
/*   119 */ CHECKBOX_Handle CHECKBOX_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags);
/*   120 */ CHECKBOX_Handle CHECKBOX_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   121 */ CHECKBOX_Handle CHECKBOX_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   122 */ CHECKBOX_Handle CHECKBOX_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   131 */ void CHECKBOX_Callback(WM_MESSAGE * pMsg);
/*   140 */ int CHECKBOX_GetDefaultAlign (void);
/*   141 */ GUI_COLOR CHECKBOX_GetDefaultBkColor (void);
/*   142 */ const GUI_FONT * CHECKBOX_GetDefaultFont (void);
/*   143 */ int CHECKBOX_GetDefaultSpacing (void);
/*   144 */ int CHECKBOX_GetDefaultTextAlign (void);
/*   145 */ GUI_COLOR CHECKBOX_GetDefaultTextColor (void);
/*   146 */ int CHECKBOX_GetUserData (CHECKBOX_Handle hObj, void * pDest, int NumBytes);
/*   147 */ void CHECKBOX_SetDefaultAlign (int Align);
/*   148 */ void CHECKBOX_SetDefaultBkColor (GUI_COLOR Color);
/*   149 */ GUI_COLOR CHECKBOX_SetDefaultFocusColor(GUI_COLOR Color);
/*   150 */ void CHECKBOX_SetDefaultFont (const GUI_FONT * pFont);
/*   151 */ void CHECKBOX_SetDefaultImage (const GUI_BITMAP * pBitmap, unsigned int Index);
/*   152 */ void CHECKBOX_SetDefaultSpacing (int Spacing);
/*   153 */ void CHECKBOX_SetDefaultTextAlign (int Align);
/*   154 */ void CHECKBOX_SetDefaultTextColor (GUI_COLOR Color);
/*   163 */ int CHECKBOX_GetState (CHECKBOX_Handle hObj);
/*   164 */ int CHECKBOX_GetText (CHECKBOX_Handle hObj, char * pBuffer, int MaxLen);
/*   165 */ int CHECKBOX_IsChecked (CHECKBOX_Handle hObj);
/*   166 */ void CHECKBOX_SetBkColor (CHECKBOX_Handle hObj, GUI_COLOR Color);
/*   167 */ GUI_COLOR CHECKBOX_SetBoxBkColor(CHECKBOX_Handle hObj, GUI_COLOR Color, int Index);
/*   168 */ GUI_COLOR CHECKBOX_SetFocusColor(CHECKBOX_Handle hObj, GUI_COLOR Color);
/*   169 */ void CHECKBOX_SetFont (CHECKBOX_Handle hObj, const GUI_FONT * pFont);
/*   170 */ void CHECKBOX_SetImage (CHECKBOX_Handle hObj, const GUI_BITMAP * pBitmap, unsigned int Index);
/*   171 */ void CHECKBOX_SetNumStates (CHECKBOX_Handle hObj, unsigned NumStates);
/*   172 */ void CHECKBOX_SetSpacing (CHECKBOX_Handle hObj, unsigned Spacing);
/*   173 */ void CHECKBOX_SetState (CHECKBOX_Handle hObj, unsigned State);
/*   174 */ void CHECKBOX_SetText (CHECKBOX_Handle hObj, const char * pText);
/*   175 */ void CHECKBOX_SetTextAlign (CHECKBOX_Handle hObj, int Align);
/*   176 */ void CHECKBOX_SetTextColor (CHECKBOX_Handle hObj, GUI_COLOR Color);
/*   177 */ int CHECKBOX_SetUserData (CHECKBOX_Handle hObj, const void * pSrc, int NumBytes);
/*   185 */ void CHECKBOX_GetSkinFlexProps (CHECKBOX_SKINFLEX_PROPS * pProps, int Index);
/*   186 */ void CHECKBOX_SetSkinClassic (CHECKBOX_Handle hObj);
/*   187 */ void CHECKBOX_SetSkin (CHECKBOX_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   188 */ int CHECKBOX_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   189 */ void CHECKBOX_SetSkinFlexProps (const CHECKBOX_SKINFLEX_PROPS * pProps, int Index);
/*   190 */ void CHECKBOX_SetDefaultSkinClassic (void);
/*   191 */ int CHECKBOX_GetSkinFlexButtonSize (CHECKBOX_Handle hObj);
/*   192 */ void CHECKBOX_SetSkinFlexButtonSize (CHECKBOX_Handle hObj, int ButtonSize);
/*   193 */ WIDGET_DRAW_ITEM_FUNC * CHECKBOX_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/CHOOSECOLOR.h
 */
/*    85 */ typedef struct {
/*    86 */    unsigned aBorder[2];
/*    87 */    unsigned aSpace[2];
/*    88 */    unsigned aButtonSize[2];
/*    89 */    GUI_COLOR aColor[2];
/*    90 */ } CHOOSECOLOR_PROPS;
/*    96 */ typedef struct {
/*    97 */    unsigned long LastColor;
/*    98 */    const GUI_COLOR * pColor;
/*    99 */    unsigned NumColors;
/*   100 */    unsigned NumColorsPerLine;
/*   101 */    int SelOld;
/*   102 */    int Sel;
/*   103 */    GUI_HWIN hParent;
/*   104 */    CHOOSECOLOR_PROPS Props;
/*   105 */ } CHOOSECOLOR_CONTEXT;
/*   113 */ GUI_HWIN CHOOSECOLOR_Create(GUI_HWIN hParent,
/*   114 */     int xPos,
/*   115 */     int yPos,
/*   116 */     int xSize,
/*   117 */     int ySize,
/*   118 */     const GUI_COLOR * pColor,
/*   119 */     unsigned NumColors,
/*   120 */     unsigned NumColorsPerLine,
/*   121 */     int Sel,
/*   122 */     const char * sCaption,
/*   123 */     int Flags);
/*   125 */ int CHOOSECOLOR_GetSel(GUI_HWIN hObj);
/*   126 */ void CHOOSECOLOR_SetSel(GUI_HWIN hObj, int Sel);
/*   128 */ void CHOOSECOLOR_SetDefaultColor (unsigned Index, GUI_COLOR Color);
/*   129 */ void CHOOSECOLOR_SetDefaultSpace (unsigned Index, unsigned Space);
/*   130 */ void CHOOSECOLOR_SetDefaultBorder (unsigned Index, unsigned Border);
/*   131 */ void CHOOSECOLOR_SetDefaultButtonSize(unsigned Index, unsigned ButtonSize);
/*   140 */ void CHOOSECOLOR_Callback(WM_MESSAGE * pMsg);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/CHOOSEFILE.h
 */
/*    93 */ typedef struct CHOOSEFILE_INFO CHOOSEFILE_INFO;
/*    95 */ struct CHOOSEFILE_INFO {
/*    96 */    int Cmd;
/*    97 */    int Id;
/*    98 */    const char * pMask;
/*    99 */    char * pName;
/*   100 */    char * pExt;
/*   101 */    char * pAttrib;
/*   102 */    WM_TOOLTIP_HANDLE hToolTip;
/*   103 */    unsigned long SizeL;
/*   104 */    unsigned long SizeH;
/*   105 */    unsigned long Flags;
/*   106 */    char pRoot[256];
/*   107 */    int (* pfGetData)(CHOOSEFILE_INFO * pInfo);
/*   108 */ };
/*   116 */ GUI_HWIN CHOOSEFILE_Create(GUI_HWIN hParent,
/*   117 */     int xPos,
/*   118 */     int yPos,
/*   119 */     int xSize,
/*   120 */     int ySize,
/*   121 */     const char * apRoot[],
/*   122 */     int NumRoot,
/*   123 */     int SelRoot,
/*   124 */     const char * sCaption,
/*   125 */     int Flags,
/*   126 */     CHOOSEFILE_INFO * pInfo
/*   127 */ );
/*   129 */ void CHOOSEFILE_Callback (WM_MESSAGE * pMsg);
/*   130 */ void CHOOSEFILE_EnableToolTips (void);
/*   131 */ void CHOOSEFILE_SetButtonText (GUI_HWIN hWin, unsigned ButtonIndex, const char * pText);
/*   132 */ void CHOOSEFILE_SetDefaultButtonText(unsigned ButtonIndex, const char * pText);
/*   133 */ void CHOOSEFILE_SetDelim (char Delim);
/*   134 */ void CHOOSEFILE_SetToolTips (const TOOLTIP_INFO * pInfo, int NumItems);
/*   135 */ void CHOOSEFILE_SetTopMode (unsigned OnOff);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/LISTBOX.h
 */
/*    88 */ typedef signed long LISTBOX_Handle;
/*   127 */ LISTBOX_Handle LISTBOX_Create (const GUI_ConstString * ppText, int x0, int y0, int xSize, int ySize, int Flags);
/*   128 */ LISTBOX_Handle LISTBOX_CreateAsChild (const GUI_ConstString * ppText, GUI_HWIN hWinParent, int x0, int y0, int xSize, int ySize, int Flags);
/*   129 */ LISTBOX_Handle LISTBOX_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const GUI_ConstString * ppText);
/*   130 */ LISTBOX_Handle LISTBOX_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const GUI_ConstString * ppText, int NumExtraBytes);
/*   131 */ LISTBOX_Handle LISTBOX_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   140 */ void LISTBOX_Callback(WM_MESSAGE * pMsg);
/*   149 */ int LISTBOX_AddKey (LISTBOX_Handle hObj, int Key);
/*   150 */ void LISTBOX_AddString (LISTBOX_Handle hObj, const char * s);
/*   151 */ void LISTBOX_AddStringH (LISTBOX_Handle hObj, signed long hString);
/*   152 */ void LISTBOX_DecSel (LISTBOX_Handle hObj);
/*   153 */ void LISTBOX_DeleteItem (LISTBOX_Handle hObj, unsigned int Index);
/*   154 */ void LISTBOX_EnableFixedScrollMode(LISTBOX_Handle hObj, unsigned int OnOff, unsigned char FixedPos);
/*   155 */ void LISTBOX_EnableWrapMode (LISTBOX_Handle hObj, int OnOff);
/*   156 */ unsigned LISTBOX_GetItemSpacing (LISTBOX_Handle hObj);
/*   157 */ unsigned LISTBOX_GetNumItems (LISTBOX_Handle hObj);
/*   158 */ int LISTBOX_GetSel (LISTBOX_Handle hObj);
/*   159 */ const GUI_FONT * LISTBOX_GetFont (LISTBOX_Handle hObj);
/*   160 */ int LISTBOX_GetItemDisabled (LISTBOX_Handle hObj, unsigned Index);
/*   161 */ int LISTBOX_GetItemSel (LISTBOX_Handle hObj, unsigned Index);
/*   162 */ void LISTBOX_GetItemText (LISTBOX_Handle hObj, unsigned Index, char * pBuffer, int MaxSize);
/*   163 */ int LISTBOX_GetMulti (LISTBOX_Handle hObj);
/*   164 */ GUI_HWIN LISTBOX_GetOwner (LISTBOX_Handle hObj);
/*   165 */ int LISTBOX_GetScrollStepH (LISTBOX_Handle hObj);
/*   166 */ int LISTBOX_GetTextAlign (LISTBOX_Handle hObj);
/*   167 */ int LISTBOX_GetUserData (LISTBOX_Handle hObj, void * pDest, int NumBytes);
/*   168 */ void LISTBOX_IncSel (LISTBOX_Handle hObj);
/*   169 */ void LISTBOX_InsertString (LISTBOX_Handle hObj, const char * s, unsigned int Index);
/*   170 */ void LISTBOX_InvalidateItem (LISTBOX_Handle hObj, int Index);
/*   171 */ int LISTBOX_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   172 */ void LISTBOX_SetAutoScrollH (LISTBOX_Handle hObj, int OnOff);
/*   173 */ void LISTBOX_SetAutoScrollV (LISTBOX_Handle hObj, int OnOff);
/*   174 */ void LISTBOX_SetBkColor (LISTBOX_Handle hObj, unsigned int Index, GUI_COLOR color);
/*   175 */ void LISTBOX_SetFont (LISTBOX_Handle hObj, const GUI_FONT * pFont);
/*   176 */ void LISTBOX_SetItemDisabled (LISTBOX_Handle hObj, unsigned Index, int OnOff);
/*   177 */ void LISTBOX_SetItemSel (LISTBOX_Handle hObj, unsigned Index, int OnOff);
/*   178 */ void LISTBOX_SetItemSpacing (LISTBOX_Handle hObj, unsigned Value);
/*   179 */ void LISTBOX_SetMulti (LISTBOX_Handle hObj, int Mode);
/*   180 */ void LISTBOX_SetOwner (LISTBOX_Handle hObj, GUI_HWIN hOwner);
/*   181 */ void LISTBOX_SetOwnerDraw (LISTBOX_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
/*   182 */ void LISTBOX_SetScrollStepH (LISTBOX_Handle hObj, int Value);
/*   183 */ void LISTBOX_SetSel (LISTBOX_Handle hObj, int Sel);
/*   184 */ void LISTBOX_SetScrollbarColor(LISTBOX_Handle hObj, unsigned Index, GUI_COLOR Color);
/*   185 */ void LISTBOX_SetScrollbarWidth(LISTBOX_Handle hObj, unsigned Width);
/*   186 */ void LISTBOX_SetString (LISTBOX_Handle hObj, const char * s, unsigned int Index);
/*   187 */ void LISTBOX_SetText (LISTBOX_Handle hObj, const GUI_ConstString * ppText);
/*   188 */ void LISTBOX_SetTextAlign (LISTBOX_Handle hObj, int Align);
/*   189 */ GUI_COLOR LISTBOX_SetTextColor (LISTBOX_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   190 */ int LISTBOX_SetUserData (LISTBOX_Handle hObj, const void * pSrc, int NumBytes);
/*   191 */ int LISTBOX_UpdateScrollers (LISTBOX_Handle hObj);
/*   200 */ const GUI_FONT * LISTBOX_GetDefaultFont(void);
/*   201 */ int LISTBOX_GetDefaultScrollStepH (void);
/*   202 */ GUI_COLOR LISTBOX_GetDefaultBkColor (unsigned Index);
/*   203 */ int LISTBOX_GetDefaultTextAlign (void);
/*   204 */ GUI_COLOR LISTBOX_GetDefaultTextColor (unsigned Index);
/*   205 */ int LISTBOX_GetDefaultScrollMode (void);
/*   206 */ void LISTBOX_SetDefaultFont (const GUI_FONT * pFont);
/*   207 */ void LISTBOX_SetDefaultScrollStepH (int Value);
/*   208 */ void LISTBOX_SetDefaultBkColor (unsigned Index, GUI_COLOR Color);
/*   209 */ void LISTBOX_SetDefaultTextAlign (int Align);
/*   210 */ void LISTBOX_SetDefaultTextColor (unsigned Index, GUI_COLOR Color);
/*   211 */ void LISTBOX_SetDefaultScrollMode (unsigned char ScrollMode);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/DROPDOWN.h
 */
/*    99 */ typedef signed long DROPDOWN_Handle;
/*   101 */ typedef struct {
/*   102 */    GUI_COLOR aColorFrame[3];
/*   103 */    GUI_COLOR aColorUpper[2];
/*   104 */    GUI_COLOR aColorLower[2];
/*   105 */    GUI_COLOR ColorArrow;
/*   106 */    GUI_COLOR ColorText;
/*   107 */    GUI_COLOR ColorSep;
/*   108 */    int Radius;
/*   109 */ } DROPDOWN_SKINFLEX_PROPS;
/*   117 */ DROPDOWN_Handle DROPDOWN_Create (GUI_HWIN hWinParent, int x0, int y0, int xSize, int ySize, int Flags);
/*   118 */ DROPDOWN_Handle DROPDOWN_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   119 */ DROPDOWN_Handle DROPDOWN_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   120 */ DROPDOWN_Handle DROPDOWN_CreateIndirect(const GUI_WIDGET_CREATE_INFO* pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
/*   129 */ void DROPDOWN_Callback(WM_MESSAGE * pMsg);
/*   137 */ void DROPDOWN_AddKey (DROPDOWN_Handle hObj, int Key);
/*   138 */ void DROPDOWN_AddString (DROPDOWN_Handle hObj, const char* s);
/*   139 */ void DROPDOWN_Collapse (DROPDOWN_Handle hObj);
/*   140 */ void DROPDOWN_DecSel (DROPDOWN_Handle hObj);
/*   141 */ void DROPDOWN_DecSelExp (DROPDOWN_Handle hObj);
/*   142 */ void DROPDOWN_DeleteItem (DROPDOWN_Handle hObj, unsigned int Index);
/*   143 */ void DROPDOWN_Expand (DROPDOWN_Handle hObj);
/*   144 */ unsigned DROPDOWN_GetItemDisabled (DROPDOWN_Handle hObj, unsigned Index);
/*   145 */ unsigned DROPDOWN_GetItemSpacing (DROPDOWN_Handle hObj);
/*   146 */ int DROPDOWN_GetItemText (DROPDOWN_Handle hObj, unsigned Index, char * pBuffer, int MaxSize);
/*   147 */ LISTBOX_Handle DROPDOWN_GetListbox (DROPDOWN_Handle hObj);
/*   148 */ int DROPDOWN_GetNumItems (DROPDOWN_Handle hObj);
/*   149 */ int DROPDOWN_GetSel (DROPDOWN_Handle hObj);
/*   150 */ int DROPDOWN_GetSelExp (DROPDOWN_Handle hObj);
/*   151 */ int DROPDOWN_GetUserData (DROPDOWN_Handle hObj, void * pDest, int NumBytes);
/*   152 */ void DROPDOWN_IncSel (DROPDOWN_Handle hObj);
/*   153 */ void DROPDOWN_IncSelExp (DROPDOWN_Handle hObj);
/*   154 */ void DROPDOWN_InsertString (DROPDOWN_Handle hObj, const char* s, unsigned int Index);
/*   155 */ void DROPDOWN_SetAutoScroll (DROPDOWN_Handle hObj, int OnOff);
/*   156 */ void DROPDOWN_SetBkColor (DROPDOWN_Handle hObj, unsigned int Index, GUI_COLOR color);
/*   157 */ void DROPDOWN_SetColor (DROPDOWN_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   158 */ void DROPDOWN_SetFont (DROPDOWN_Handle hObj, const GUI_FONT * pfont);
/*   159 */ void DROPDOWN_SetItemDisabled (DROPDOWN_Handle hObj, unsigned Index, int OnOff);
/*   160 */ void DROPDOWN_SetItemSpacing (DROPDOWN_Handle hObj, unsigned Value);
/*   161 */ int DROPDOWN_SetListHeight (DROPDOWN_Handle hObj, unsigned Height);
/*   162 */ void DROPDOWN_SetScrollbarColor(DROPDOWN_Handle hObj, unsigned Index, GUI_COLOR Color);
/*   163 */ void DROPDOWN_SetScrollbarWidth(DROPDOWN_Handle hObj, unsigned Width);
/*   164 */ void DROPDOWN_SetSel (DROPDOWN_Handle hObj, int Sel);
/*   165 */ void DROPDOWN_SetSelExp (DROPDOWN_Handle hObj, int Sel);
/*   166 */ void DROPDOWN_SetTextAlign (DROPDOWN_Handle hObj, int Align);
/*   167 */ void DROPDOWN_SetTextColor (DROPDOWN_Handle hObj, unsigned int index, GUI_COLOR color);
/*   168 */ void DROPDOWN_SetTextHeight (DROPDOWN_Handle hObj, unsigned TextHeight);
/*   169 */ int DROPDOWN_SetUpMode (DROPDOWN_Handle hObj, int OnOff);
/*   170 */ int DROPDOWN_SetUserData (DROPDOWN_Handle hObj, const void * pSrc, int NumBytes);
/*   178 */ void DROPDOWN_GetSkinFlexProps (DROPDOWN_SKINFLEX_PROPS * pProps, int Index);
/*   179 */ void DROPDOWN_SetSkinClassic (DROPDOWN_Handle hObj);
/*   180 */ void DROPDOWN_SetSkin (DROPDOWN_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   181 */ int DROPDOWN_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   182 */ void DROPDOWN_SetSkinFlexProps (const DROPDOWN_SKINFLEX_PROPS * pProps, int Index);
/*   183 */ void DROPDOWN_SetDefaultSkinClassic(void);
/*   184 */ WIDGET_DRAW_ITEM_FUNC * DROPDOWN_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   194 */ GUI_COLOR DROPDOWN_GetDefaultBkColor (int Index);
/*   195 */ GUI_COLOR DROPDOWN_GetDefaultColor (int Index);
/*   196 */ const GUI_FONT * DROPDOWN_GetDefaultFont (void);
/*   197 */ GUI_COLOR DROPDOWN_GetDefaultScrollbarColor(int Index);
/*   198 */ void DROPDOWN_SetDefaultFont (const GUI_FONT * pFont);
/*   199 */ GUI_COLOR DROPDOWN_SetDefaultBkColor (int Index, GUI_COLOR Color);
/*   200 */ GUI_COLOR DROPDOWN_SetDefaultColor (int Index, GUI_COLOR Color);
/*   201 */ GUI_COLOR DROPDOWN_SetDefaultScrollbarColor(int Index, GUI_COLOR Color);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/EDIT.h
 */
/*   128 */ typedef signed long EDIT_Handle;
/*   129 */ typedef void tEDIT_AddKeyEx (EDIT_Handle hObj, int Key);
/*   130 */ typedef void tEDIT_UpdateBuffer(EDIT_Handle hObj);
/*   136 */ EDIT_Handle EDIT_Create (int x0, int y0, int xSize, int ySize, int Id, int MaxLen, int Flags);
/*   137 */ EDIT_Handle EDIT_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int MaxLen);
/*   138 */ EDIT_Handle EDIT_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int MaxLen);
/*   139 */ EDIT_Handle EDIT_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int MaxLen, int NumExtraBytes);
/*   140 */ EDIT_Handle EDIT_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   149 */ void EDIT_Callback(WM_MESSAGE * pMsg);
/*   157 */ void EDIT_SetDefaultBkColor (unsigned int Index, GUI_COLOR Color);
/*   158 */ void EDIT_SetDefaultFont (const GUI_FONT * pFont);
/*   159 */ void EDIT_SetDefaultTextAlign(int Align);
/*   160 */ void EDIT_SetDefaultTextColor(unsigned int Index, GUI_COLOR Color);
/*   169 */ GUI_COLOR EDIT_GetDefaultBkColor(unsigned int Index);
/*   170 */ const GUI_FONT * EDIT_GetDefaultFont(void);
/*   171 */ int EDIT_GetDefaultTextAlign(void);
/*   172 */ GUI_COLOR EDIT_GetDefaultTextColor(unsigned int Index);
/*   176 */ void EDIT_AddKey (EDIT_Handle hObj, int Key);
/*   177 */ void EDIT_EnableBlink (EDIT_Handle hObj, int Period, int OnOff);
/*   178 */ GUI_COLOR EDIT_GetBkColor (EDIT_Handle hObj, unsigned int Index);
/*   179 */ void EDIT_SetBkColor (EDIT_Handle hObj, unsigned int Index, GUI_COLOR color);
/*   180 */ void EDIT_SetCursorAtChar (EDIT_Handle hObj, int Pos);
/*   181 */ void EDIT_SetCursorAtPixel (EDIT_Handle hObj, int xPos);
/*   182 */ void EDIT_SetFont (EDIT_Handle hObj, const GUI_FONT * pFont);
/*   183 */ int EDIT_SetInsertMode (EDIT_Handle hObj, int OnOff);
/*   184 */ void EDIT_SetMaxLen (EDIT_Handle hObj, int MaxLen);
/*   185 */ void EDIT_SetpfAddKeyEx (EDIT_Handle hObj, tEDIT_AddKeyEx * pfAddKeyEx);
/*   186 */ void EDIT_SetpfUpdateBuffer(EDIT_Handle hObj, tEDIT_UpdateBuffer * pfUpdateBuffer);
/*   187 */ void EDIT_SetText (EDIT_Handle hObj, const char * s);
/*   188 */ void EDIT_SetTextAlign (EDIT_Handle hObj, int Align);
/*   189 */ GUI_COLOR EDIT_GetTextColor(EDIT_Handle hObj, unsigned int Index);
/*   190 */ void EDIT_SetTextColor (EDIT_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   191 */ void EDIT_SetSel (EDIT_Handle hObj, int FirstChar, int LastChar);
/*   192 */ int EDIT_SetUserData (EDIT_Handle hObj, const void * pSrc, int NumBytes);
/*   193 */ int EDIT_EnableInversion (EDIT_Handle hObj, int OnOff);
/*   197 */ int EDIT_GetCursorCharPos (EDIT_Handle hObj);
/*   198 */ void EDIT_GetCursorPixelPos (EDIT_Handle hObj, int * pxPos, int * pyPos);
/*   199 */ float EDIT_GetFloatValue (EDIT_Handle hObj);
/*   200 */ const GUI_FONT * EDIT_GetFont(EDIT_Handle hObj);
/*   201 */ int EDIT_GetNumChars (EDIT_Handle hObj);
/*   202 */ void EDIT_GetText (EDIT_Handle hObj, char * sDest, int MaxLen);
/*   203 */ signed long EDIT_GetValue (EDIT_Handle hObj);
/*   204 */ void EDIT_SetFloatValue (EDIT_Handle hObj, float Value);
/*   205 */ int EDIT_GetUserData (EDIT_Handle hObj, void * pDest, int NumBytes);
/*   206 */ void EDIT_SetValue (EDIT_Handle hObj, signed long Value);
/*   217 */ void EDIT_SetHexMode (EDIT_Handle hEdit, unsigned long Value, unsigned long Min, unsigned long Max);
/*   218 */ void EDIT_SetBinMode (EDIT_Handle hEdit, unsigned long Value, unsigned long Min, unsigned long Max);
/*   219 */ void EDIT_SetDecMode (EDIT_Handle hEdit, signed long Value, signed long Min, signed long Max, int Shift, unsigned char Flags);
/*   220 */ void EDIT_SetFloatMode(EDIT_Handle hEdit, float Value, float Min, float Max, int Shift, unsigned char Flags);
/*   221 */ void EDIT_SetTextMode (EDIT_Handle hEdit);
/*   222 */ void EDIT_SetUlongMode(EDIT_Handle hEdit, unsigned long Value, unsigned long Min, unsigned long Max);
/*   224 */ unsigned long GUI_EditHex (unsigned long Value, unsigned long Min, unsigned long Max, int Len, int xSize);
/*   225 */ unsigned long GUI_EditBin (unsigned long Value, unsigned long Min, unsigned long Max, int Len, int xSize);
/*   226 */ signed long GUI_EditDec (signed long Value, signed long Min, signed long Max, int Len, int xSize, int Shift, unsigned char Flags);
/*   227 */ float GUI_EditFloat (float Value, float Min, float Max, int Len, int xSize, int Shift, unsigned char Flags);
/*   228 */ void GUI_EditString (char * pString, int Len, int xSize);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/FRAMEWIN.h
 */
/*   133 */ typedef signed long FRAMEWIN_Handle;
/*   135 */ typedef struct {
/*   136 */    GUI_COLOR aColorFrame[3];
/*   137 */    GUI_COLOR aColorTitle[2];
/*   138 */    int Radius;
/*   139 */    int SpaceX;
/*   140 */    int BorderSizeL;
/*   141 */    int BorderSizeR;
/*   142 */    int BorderSizeT;
/*   143 */    int BorderSizeB;
/*   144 */ } FRAMEWIN_SKINFLEX_PROPS;
/*   152 */ FRAMEWIN_Handle FRAMEWIN_Create (const char * pTitle, WM_CALLBACK * cb, int Flags, int x0, int y0, int xSize, int ySize);
/*   153 */ FRAMEWIN_Handle FRAMEWIN_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, const char * pText, WM_CALLBACK * cb, int Flags);
/*   154 */ FRAMEWIN_Handle FRAMEWIN_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const char * pTitle, WM_CALLBACK * cb);
/*   155 */ FRAMEWIN_Handle FRAMEWIN_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const char * pTitle, WM_CALLBACK * cb, int NumExtraBytes);
/*   156 */ FRAMEWIN_Handle FRAMEWIN_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   165 */ void FRAMEWIN_Callback(WM_MESSAGE * pMsg);
/*   173 */ GUI_HWIN FRAMEWIN_AddButton (FRAMEWIN_Handle hObj, int Flags, int Off, int Id);
/*   174 */ GUI_HWIN FRAMEWIN_AddCloseButton(FRAMEWIN_Handle hObj, int Flags, int Off);
/*   175 */ GUI_HWIN FRAMEWIN_AddMaxButton (FRAMEWIN_Handle hObj, int Flags, int Off);
/*   176 */ void FRAMEWIN_AddMenu (FRAMEWIN_Handle hObj, GUI_HWIN hMenu);
/*   177 */ GUI_HWIN FRAMEWIN_AddMinButton (FRAMEWIN_Handle hObj, int Flags, int Off);
/*   178 */ void FRAMEWIN_Minimize (FRAMEWIN_Handle hObj);
/*   179 */ void FRAMEWIN_Maximize (FRAMEWIN_Handle hObj);
/*   180 */ void FRAMEWIN_Restore (FRAMEWIN_Handle hObj);
/*   181 */ void FRAMEWIN_SetActive (FRAMEWIN_Handle hObj, int State);
/*   182 */ void FRAMEWIN_SetBarColor (FRAMEWIN_Handle hObj, unsigned Index, GUI_COLOR Color);
/*   183 */ void FRAMEWIN_SetBorderSize (FRAMEWIN_Handle hObj, unsigned Size);
/*   184 */ void FRAMEWIN_SetClientColor(FRAMEWIN_Handle hObj, GUI_COLOR Color);
/*   185 */ void FRAMEWIN_SetFont (FRAMEWIN_Handle hObj, const GUI_FONT * pFont);
/*   186 */ void FRAMEWIN_SetMoveable (FRAMEWIN_Handle hObj, int State);
/*   187 */ void FRAMEWIN_SetOwnerDraw (FRAMEWIN_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
/*   188 */ void FRAMEWIN_SetResizeable (FRAMEWIN_Handle hObj, int State);
/*   189 */ void FRAMEWIN_SetText (FRAMEWIN_Handle hObj, const char* s);
/*   190 */ void FRAMEWIN_SetTextAlign (FRAMEWIN_Handle hObj, int Align);
/*   191 */ void FRAMEWIN_SetTextColor (FRAMEWIN_Handle hObj, GUI_COLOR Color);
/*   192 */ void FRAMEWIN_SetTextColorEx(FRAMEWIN_Handle hObj, unsigned Index, GUI_COLOR Color);
/*   193 */ void FRAMEWIN_SetTitleVis (FRAMEWIN_Handle hObj, int Show);
/*   194 */ int FRAMEWIN_SetTitleHeight(FRAMEWIN_Handle hObj, int Height);
/*   195 */ int FRAMEWIN_SetUserData (FRAMEWIN_Handle hObj, const void * pSrc, int NumBytes);
/*   203 */ void FRAMEWIN_GetSkinFlexProps (FRAMEWIN_SKINFLEX_PROPS * pProps, int Index);
/*   204 */ void FRAMEWIN_SetSkinClassic (FRAMEWIN_Handle hObj);
/*   205 */ void FRAMEWIN_SetSkin (FRAMEWIN_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   206 */ int FRAMEWIN_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   207 */ void FRAMEWIN_SetSkinFlexProps (const FRAMEWIN_SKINFLEX_PROPS * pProps, int Index);
/*   208 */ void FRAMEWIN_SetDefaultSkinClassic(void);
/*   209 */ WIDGET_DRAW_ITEM_FUNC * FRAMEWIN_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   219 */ const GUI_FONT * FRAMEWIN_GetFont(FRAMEWIN_Handle hObj);
/*   221 */ int FRAMEWIN_GetActive (FRAMEWIN_Handle hObj);
/*   222 */ int FRAMEWIN_GetTitleHeight (FRAMEWIN_Handle hObj);
/*   223 */ GUI_COLOR FRAMEWIN_GetBarColor (FRAMEWIN_Handle hObj, unsigned Index);
/*   224 */ int FRAMEWIN_GetBorderSize (FRAMEWIN_Handle hObj);
/*   225 */ int FRAMEWIN_GetBorderSizeEx(FRAMEWIN_Handle hObj, unsigned Edge);
/*   226 */ void FRAMEWIN_GetText (FRAMEWIN_Handle hObj, char * pBuffer, int MaxLen);
/*   227 */ int FRAMEWIN_GetTextAlign (FRAMEWIN_Handle hObj);
/*   228 */ int FRAMEWIN_GetUserData (FRAMEWIN_Handle hObj, void * pDest, int NumBytes);
/*   229 */ int FRAMEWIN_IsMinimized (FRAMEWIN_Handle hObj);
/*   230 */ int FRAMEWIN_IsMaximized (FRAMEWIN_Handle hObj);
/*   238 */ GUI_COLOR FRAMEWIN_GetDefaultBarColor (unsigned Index);
/*   239 */ int FRAMEWIN_GetDefaultBorderSize (void);
/*   240 */ int FRAMEWIN_GetDefaultTitleHeight(void);
/*   241 */ GUI_COLOR FRAMEWIN_GetDefaultClientColor(void);
/*   242 */ const GUI_FONT * FRAMEWIN_GetDefaultFont (void);
/*   243 */ GUI_COLOR FRAMEWIN_GetDefaultTextColor (unsigned Index);
/*   244 */ int FRAMEWIN_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   245 */ void FRAMEWIN_SetDefaultBarColor (unsigned Index, GUI_COLOR Color);
/*   246 */ void FRAMEWIN_SetDefaultBorderSize (int DefaultBorderSize);
/*   247 */ void FRAMEWIN_SetDefaultTitleHeight(int DefaultTitleHeight);
/*   248 */ void FRAMEWIN_SetDefaultClientColor(GUI_COLOR Color);
/*   249 */ void FRAMEWIN_SetDefaultFont (const GUI_FONT * pFont);
/*   250 */ int FRAMEWIN_SetDefaultTextAlign (int TextAlign);
/*   251 */ void FRAMEWIN_SetDefaultTextColor (unsigned Index, GUI_COLOR Color);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/GRAPH.h
 */
/*   109 */ typedef signed long GRAPH_Handle;
/*   110 */ typedef signed long GRAPH_DATA_Handle;
/*   111 */ typedef signed long GRAPH_SCALE_Handle;
/*   120 */ GRAPH_Handle GRAPH_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   121 */ GRAPH_Handle GRAPH_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   122 */ GRAPH_Handle GRAPH_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   124 */ GRAPH_DATA_Handle GRAPH_DATA_XY_Create(GUI_COLOR Color, unsigned MaxNumItems, const GUI_POINT * pData, unsigned NumItems);
/*   125 */ GRAPH_DATA_Handle GRAPH_DATA_YT_Create(GUI_COLOR Color, unsigned MaxNumItems, const signed short * pData, unsigned NumItems);
/*   126 */ GRAPH_SCALE_Handle GRAPH_SCALE_Create (int Pos, int TextAlign, unsigned Flags, unsigned TickDist);
/*   135 */ void GRAPH_Callback(WM_MESSAGE * pMsg);
/*   143 */ void GRAPH_AttachData (GRAPH_Handle hObj, GRAPH_DATA_Handle hData);
/*   144 */ void GRAPH_AttachScale (GRAPH_Handle hObj, GRAPH_SCALE_Handle hScale);
/*   145 */ void GRAPH_DetachData (GRAPH_Handle hObj, GRAPH_DATA_Handle hData);
/*   146 */ void GRAPH_DetachScale (GRAPH_Handle hObj, GRAPH_SCALE_Handle hScale);
/*   147 */ signed long GRAPH_GetScrollValue (GRAPH_Handle hObj, unsigned char Coord);
/*   148 */ int GRAPH_GetUserData (GRAPH_Handle hObj, void * pDest, int NumBytes);
/*   149 */ void GRAPH_SetAutoScrollbar (GRAPH_Handle hObj, unsigned char Coord, unsigned char OnOff);
/*   150 */ void GRAPH_SetBorder (GRAPH_Handle hObj, unsigned BorderL, unsigned BorderT, unsigned BorderR, unsigned BorderB);
/*   151 */ GUI_COLOR GRAPH_SetColor (GRAPH_Handle hObj, GUI_COLOR Color, unsigned Index);
/*   152 */ unsigned GRAPH_SetGridFixedX (GRAPH_Handle hObj, unsigned OnOff);
/*   153 */ unsigned GRAPH_SetGridOffY (GRAPH_Handle hObj, unsigned Value);
/*   154 */ unsigned GRAPH_SetGridVis (GRAPH_Handle hObj, unsigned OnOff);
/*   155 */ unsigned GRAPH_SetGridDistX (GRAPH_Handle hObj, unsigned Value);
/*   156 */ unsigned GRAPH_SetGridDistY (GRAPH_Handle hObj, unsigned Value);
/*   157 */ unsigned char GRAPH_SetLineStyleH (GRAPH_Handle hObj, unsigned char Value);
/*   158 */ unsigned char GRAPH_SetLineStyleV (GRAPH_Handle hObj, unsigned char Value);
/*   159 */ void GRAPH_SetLineStyle (GRAPH_Handle hObj, unsigned char Value);
/*   160 */ void GRAPH_SetScrollValue (GRAPH_Handle hObj, unsigned char Coord, unsigned long Value);
/*   161 */ unsigned GRAPH_SetVSizeX (GRAPH_Handle hObj, unsigned Value);
/*   162 */ unsigned GRAPH_SetVSizeY (GRAPH_Handle hObj, unsigned Value);
/*   163 */ int GRAPH_SetUserData (GRAPH_Handle hObj, const void * pSrc, int NumBytes);
/*   164 */ void GRAPH_SetUserDraw (GRAPH_Handle hObj, void (* pOwnerDraw)(GUI_HWIN, int));
/*   166 */ void GRAPH_DATA_YT_AddValue (GRAPH_DATA_Handle hDataObj, signed short Value);
/*   167 */ void GRAPH_DATA_YT_Clear (GRAPH_DATA_Handle hDataObj);
/*   168 */ void GRAPH_DATA_YT_Delete (GRAPH_DATA_Handle hDataObj);
/*   169 */ int GRAPH_DATA_YT_GetValue (GRAPH_DATA_Handle hDataObj, signed short * pValue, unsigned long Index);
/*   171 */ void GRAPH_DATA_YT_SetAlign (GRAPH_DATA_Handle hDataObj, int Align);
/*   172 */ void GRAPH_DATA_YT_SetOffY (GRAPH_DATA_Handle hDataObj, int Off);
/*   173 */ void GRAPH_DATA_YT_MirrorX (GRAPH_DATA_Handle hDataObj, int OnOff);
/*   175 */ void GRAPH_DATA_XY_AddPoint (GRAPH_DATA_Handle hDataObj, GUI_POINT * pPoint);
/*   176 */ void GRAPH_DATA_XY_Clear (GRAPH_DATA_Handle hDataObj);
/*   177 */ void GRAPH_DATA_XY_Delete (GRAPH_DATA_Handle hDataObj);
/*   178 */ unsigned GRAPH_DATA_XY_GetLineVis (GRAPH_DATA_Handle hDataObj);
/*   179 */ int GRAPH_DATA_XY_GetPoint (GRAPH_DATA_Handle hDataObj, GUI_POINT * pPoint, unsigned long Index);
/*   180 */ unsigned GRAPH_DATA_XY_GetPointVis (GRAPH_DATA_Handle hDataObj);
/*   181 */ void GRAPH_DATA_XY_SetLineStyle (GRAPH_DATA_Handle hDataObj, unsigned char LineStyle);
/*   182 */ unsigned GRAPH_DATA_XY_SetLineVis (GRAPH_DATA_Handle hDataObj, unsigned OnOff);
/*   183 */ void GRAPH_DATA_XY_SetOffX (GRAPH_DATA_Handle hDataObj, int Off);
/*   184 */ void GRAPH_DATA_XY_SetOffY (GRAPH_DATA_Handle hDataObj, int Off);
/*   185 */ void GRAPH_DATA_XY_SetPenSize (GRAPH_DATA_Handle hDataObj, unsigned char PenSize);
/*   186 */ void GRAPH_DATA_XY_SetPointSize (GRAPH_DATA_Handle hDataObj, unsigned PointSize);
/*   187 */ unsigned GRAPH_DATA_XY_SetPointVis (GRAPH_DATA_Handle hDataObj, unsigned OnOff);
/*   188 */ void GRAPH_DATA_XY_SetOwnerDraw (GRAPH_DATA_Handle hDataObj, WIDGET_DRAW_ITEM_FUNC * pOwnerDraw);
/*   190 */ void GRAPH_SCALE_Delete (GRAPH_SCALE_Handle hScaleObj);
/*   191 */ float GRAPH_SCALE_SetFactor (GRAPH_SCALE_Handle hScaleObj, float Factor);
/*   192 */ const GUI_FONT * GRAPH_SCALE_SetFont (GRAPH_SCALE_Handle hScaleObj, const GUI_FONT * pFont);
/*   193 */ int GRAPH_SCALE_SetNumDecs (GRAPH_SCALE_Handle hScaleObj, int NumDecs);
/*   194 */ int GRAPH_SCALE_SetOff (GRAPH_SCALE_Handle hScaleObj, int Off);
/*   195 */ int GRAPH_SCALE_SetPos (GRAPH_SCALE_Handle hScaleObj, int Pos);
/*   196 */ GUI_COLOR GRAPH_SCALE_SetTextColor(GRAPH_SCALE_Handle hScaleObj, GUI_COLOR Color);
/*   197 */ unsigned GRAPH_SCALE_SetTickDist (GRAPH_SCALE_Handle hScaleObj, unsigned Value);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/HEADER.h
 */
/*    73 */ typedef signed long HEADER_Handle;
/*    75 */ typedef struct {
/*    76 */    GUI_COLOR aColorFrame[2];
/*    77 */    GUI_COLOR aColorUpper[2];
/*    78 */    GUI_COLOR aColorLower[2];
/*    79 */    GUI_COLOR ColorArrow;
/*    80 */ } HEADER_SKINFLEX_PROPS;
/*    89 */ HEADER_Handle HEADER_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int SpecialFlags);
/*    90 */ HEADER_Handle HEADER_CreateAttached(GUI_HWIN hParent, int Id, int SpecialFlags);
/*    91 */ HEADER_Handle HEADER_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*    92 */ HEADER_Handle HEADER_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*    93 */ HEADER_Handle HEADER_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   102 */ void HEADER_Callback(WM_MESSAGE * pMsg);
/*   111 */ GUI_COLOR HEADER_SetDefaultArrowColor(GUI_COLOR Color);
/*   112 */ GUI_COLOR HEADER_SetDefaultBkColor (GUI_COLOR Color);
/*   113 */ const GUI_CURSOR * HEADER_SetDefaultCursor (const GUI_CURSOR * pCursor);
/*   114 */ const GUI_FONT * HEADER_SetDefaultFont (const GUI_FONT * pFont);
/*   115 */ int HEADER_SetDefaultBorderH (int Spacing);
/*   116 */ int HEADER_SetDefaultBorderV (int Spacing);
/*   117 */ GUI_COLOR HEADER_SetDefaultTextColor (GUI_COLOR Color);
/*   120 */ GUI_COLOR HEADER_GetDefaultArrowColor(void);
/*   121 */ GUI_COLOR HEADER_GetDefaultBkColor (void);
/*   122 */ const GUI_CURSOR * HEADER_GetDefaultCursor (void);
/*   123 */ const GUI_FONT * HEADER_GetDefaultFont (void);
/*   124 */ int HEADER_GetDefaultBorderH (void);
/*   125 */ int HEADER_GetDefaultBorderV (void);
/*   126 */ GUI_COLOR HEADER_GetDefaultTextColor (void);
/*   134 */ void HEADER_AddItem (HEADER_Handle hObj, int Width, const char * s, int Align);
/*   135 */ void HEADER_DeleteItem (HEADER_Handle hObj, unsigned Index);
/*   136 */ GUI_COLOR HEADER_GetArrowColor (HEADER_Handle hObj);
/*   137 */ GUI_COLOR HEADER_GetBkColor (HEADER_Handle hObj);
/*   138 */ int HEADER_GetHeight (HEADER_Handle hObj);
/*   139 */ int HEADER_GetItemWidth (HEADER_Handle hObj, unsigned int Index);
/*   140 */ int HEADER_GetNumItems (HEADER_Handle hObj);
/*   141 */ int HEADER_GetSel (HEADER_Handle hObj);
/*   142 */ GUI_COLOR HEADER_GetTextColor (HEADER_Handle hObj);
/*   143 */ int HEADER_GetUserData (HEADER_Handle hObj, void * pDest, int NumBytes);
/*   144 */ void HEADER_SetArrowColor (HEADER_Handle hObj, GUI_COLOR Color);
/*   145 */ void HEADER_SetBitmap (HEADER_Handle hObj, unsigned int Index, const GUI_BITMAP * pBitmap);
/*   146 */ void HEADER_SetBitmapEx (HEADER_Handle hObj, unsigned int Index, const GUI_BITMAP * pBitmap, int x, int y);
/*   147 */ void HEADER_SetBkColor (HEADER_Handle hObj, GUI_COLOR Color);
/*   148 */ void HEADER_SetBMP (HEADER_Handle hObj, unsigned int Index, const void * pBitmap);
/*   149 */ void HEADER_SetBMPEx (HEADER_Handle hObj, unsigned int Index, const void * pBitmap, int x, int y);
/*   150 */ void HEADER_SetDirIndicator (HEADER_Handle hObj, int Column, int Reverse);
/*   151 */ void HEADER_SetDragLimit (HEADER_Handle hObj, unsigned DragLimit);
/*   152 */ unsigned HEADER_SetFixed (HEADER_Handle hObj, unsigned Fixed);
/*   153 */ void HEADER_SetFont (HEADER_Handle hObj, const GUI_FONT * pFont);
/*   154 */ void HEADER_SetHeight (HEADER_Handle hObj, int Height);
/*   155 */ void HEADER_SetTextAlign (HEADER_Handle hObj, unsigned int Index, int Align);
/*   156 */ void HEADER_SetItemText (HEADER_Handle hObj, unsigned int Index, const char * s);
/*   157 */ void HEADER_SetItemWidth (HEADER_Handle hObj, unsigned int Index, int Width);
/*   158 */ void HEADER_SetScrollPos (HEADER_Handle hObj, int ScrollPos);
/*   159 */ void HEADER_SetStreamedBitmap (HEADER_Handle hObj, unsigned int Index, const GUI_BITMAP_STREAM * pBitmap);
/*   160 */ void HEADER_SetStreamedBitmapEx(HEADER_Handle hObj, unsigned int Index, const GUI_BITMAP_STREAM * pBitmap, int x, int y);
/*   161 */ void HEADER_SetTextColor (HEADER_Handle hObj, GUI_COLOR Color);
/*   162 */ int HEADER_SetUserData (HEADER_Handle hObj, const void * pSrc, int NumBytes);
/*   170 */ void HEADER_GetSkinFlexProps (HEADER_SKINFLEX_PROPS * pProps, int Index);
/*   171 */ void HEADER_SetSkinClassic (HEADER_Handle hObj);
/*   172 */ void HEADER_SetSkin (HEADER_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   173 */ int HEADER_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   174 */ void HEADER_SetSkinFlexProps (const HEADER_SKINFLEX_PROPS * pProps, int Index);
/*   175 */ void HEADER_SetDefaultSkinClassic(void);
/*   176 */ WIDGET_DRAW_ITEM_FUNC * HEADER_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/ICONVIEW.h
 */
/*   106 */ typedef signed long ICONVIEW_Handle;
/*   114 */ ICONVIEW_Handle ICONVIEW_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int xSizeItems, int ySizeItems);
/*   115 */ ICONVIEW_Handle ICONVIEW_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int xSizeItems, int ySizeItems, int NumExtraBytes);
/*   116 */ ICONVIEW_Handle ICONVIEW_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   118 */ int ICONVIEW_AddBitmapItem (ICONVIEW_Handle hObj, const GUI_BITMAP * pBitmap, const char * pText);
/*   119 */ int ICONVIEW_AddBMPItem (ICONVIEW_Handle hObj, const unsigned char * pBMP, const char * pText);
/*   120 */ int ICONVIEW_AddBMPItemEx (ICONVIEW_Handle hObj, const void * pBMP, GUI_GET_DATA_FUNC * pfGetData, const char * pText);
/*   121 */ int ICONVIEW_AddStreamedBitmapItem (ICONVIEW_Handle hObj, const void * pStreamedBitmap, const char * pText);
/*   122 */ void ICONVIEW_DeleteItem (ICONVIEW_Handle hObj, unsigned Index);
/*   124 */ unsigned long ICONVIEW_GetItemUserData (ICONVIEW_Handle hObj, int Index);
/*   125 */ int ICONVIEW_GetNumItems (ICONVIEW_Handle hObj);
/*   126 */ int ICONVIEW_GetItemText (ICONVIEW_Handle hObj, int Index, char * pBuffer, int MaxSize);
/*   127 */ int ICONVIEW_GetSel (ICONVIEW_Handle hObj);
/*   128 */ int ICONVIEW_GetUserData (ICONVIEW_Handle hObj, void * pDest, int NumBytes);
/*   129 */ GUI_BITMAP * ICONVIEW_GetItemBitmap (ICONVIEW_Handle hObj, int ItemIndex);
/*   130 */ int ICONVIEW_InsertBitmapItem (ICONVIEW_Handle hObj, const GUI_BITMAP * pBitmap, const char * pText, int Index);
/*   131 */ int ICONVIEW_InsertBMPItem (ICONVIEW_Handle hObj, const unsigned char * pBMP, const char * pText, int Index);
/*   132 */ int ICONVIEW_InsertBMPItemEx (ICONVIEW_Handle hObj, const void * pBMP, GUI_GET_DATA_FUNC * pfGetData, const char * pText, int Index);
/*   133 */ int ICONVIEW_InsertStreamedBitmapItem(ICONVIEW_Handle hObj, const void * pStreamedBitmap, const char * pText, int Index);
/*   134 */ int ICONVIEW_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   135 */ int ICONVIEW_SetBitmapItem (ICONVIEW_Handle hObj, int Index, const GUI_BITMAP * pBitmap);
/*   136 */ void ICONVIEW_SetBkColor (ICONVIEW_Handle hObj, int Index, GUI_COLOR Color);
/*   137 */ int ICONVIEW_SetBMPItem (ICONVIEW_Handle hObj, const unsigned char * pBMP, int Index);
/*   138 */ int ICONVIEW_SetBMPItemEx (ICONVIEW_Handle hObj, const void * pBMP, GUI_GET_DATA_FUNC * pfGetData, int Index);
/*   139 */ void ICONVIEW_SetFont (ICONVIEW_Handle hObj, const GUI_FONT * pFont);
/*   140 */ void ICONVIEW_SetFrame (ICONVIEW_Handle hObj, int Coord, int Value);
/*   141 */ void ICONVIEW_SetItemText (ICONVIEW_Handle hObj, int Index, const char * pText);
/*   142 */ void ICONVIEW_SetItemUserData (ICONVIEW_Handle hObj, int Index, unsigned long UserData);
/*   143 */ void ICONVIEW_SetOwnerDraw (ICONVIEW_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
/*   144 */ void ICONVIEW_SetSel (ICONVIEW_Handle hObj, int Sel);
/*   145 */ void ICONVIEW_SetSpace (ICONVIEW_Handle hObj, int Coord, int Value);
/*   146 */ int ICONVIEW_SetStreamedBitmapItem (ICONVIEW_Handle hObj, int Index, const void * pStreamedBitmap);
/*   147 */ void ICONVIEW_SetIconAlign (ICONVIEW_Handle hObj, int IconAlign);
/*   148 */ void ICONVIEW_SetTextAlign (ICONVIEW_Handle hObj, int TextAlign);
/*   149 */ void ICONVIEW_SetTextColor (ICONVIEW_Handle hObj, int Index, GUI_COLOR Color);
/*   150 */ int ICONVIEW_SetUserData (ICONVIEW_Handle hObj, const void * pSrc, int NumBytes);
/*   151 */ void ICONVIEW_SetWrapMode (ICONVIEW_Handle hObj, GUI_WRAPMODE WrapMode);
/*   153 */ void ICONVIEW_Callback (WM_MESSAGE * pMsg);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/IMAGE.h
 */
/*    84 */ typedef signed long IMAGE_Handle;
/*    92 */ IMAGE_Handle IMAGE_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*    93 */ IMAGE_Handle IMAGE_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*    94 */ IMAGE_Handle IMAGE_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*    96 */ void IMAGE_Callback(WM_MESSAGE * pMsg);
/*   104 */ int IMAGE_GetUserData(IMAGE_Handle hObj, void * pDest, int NumBytes);
/*   105 */ void IMAGE_SetBitmap (IMAGE_Handle hWin, const GUI_BITMAP * pBitmap);
/*   106 */ void IMAGE_SetBMP (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
/*   107 */ void IMAGE_SetBMPEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
/*   108 */ void IMAGE_SetDTA (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
/*   109 */ void IMAGE_SetDTAEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
/*   110 */ void IMAGE_SetGIF (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
/*   111 */ void IMAGE_SetGIFEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
/*   112 */ void IMAGE_SetJPEG (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
/*   113 */ void IMAGE_SetJPEGEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
/*   114 */ void IMAGE_SetPNG (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
/*   115 */ void IMAGE_SetPNGEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
/*   116 */ int IMAGE_SetUserData(IMAGE_Handle hObj, const void * pSrc, int NumBytes);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/LISTVIEW.h
 */
/*    98 */ typedef signed long LISTVIEW_Handle;
/*   106 */ LISTVIEW_Handle LISTVIEW_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int SpecialFlags);
/*   107 */ LISTVIEW_Handle LISTVIEW_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   108 */ LISTVIEW_Handle LISTVIEW_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   109 */ LISTVIEW_Handle LISTVIEW_CreateAttached(GUI_HWIN hParent, int Id, int SpecialFlags);
/*   110 */ LISTVIEW_Handle LISTVIEW_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   119 */ void LISTVIEW_Callback(WM_MESSAGE * pMsg);
/*   127 */ int LISTVIEW_AddColumn (LISTVIEW_Handle hObj, int Width, const char * s, int Align);
/*   128 */ int LISTVIEW_AddRow (LISTVIEW_Handle hObj, const GUI_ConstString * ppText);
/*   129 */ int LISTVIEW_CompareText (const void * p0, const void * p1);
/*   130 */ int LISTVIEW_CompareDec (const void * p0, const void * p1);
/*   131 */ void LISTVIEW_DecSel (LISTVIEW_Handle hObj);
/*   132 */ void LISTVIEW_DeleteAllRows (LISTVIEW_Handle hObj);
/*   133 */ void LISTVIEW_DeleteColumn (LISTVIEW_Handle hObj, unsigned Index);
/*   134 */ void LISTVIEW_DeleteRow (LISTVIEW_Handle hObj, unsigned Index);
/*   135 */ void LISTVIEW_DeleteRowSorted (LISTVIEW_Handle hObj, int Row);
/*   136 */ void LISTVIEW_DisableRow (LISTVIEW_Handle hObj, unsigned Row);
/*   137 */ void LISTVIEW_DisableSort (LISTVIEW_Handle hObj);
/*   138 */ void LISTVIEW_EnableCellSelect (LISTVIEW_Handle hObj, unsigned OnOff);
/*   139 */ void LISTVIEW_EnableRow (LISTVIEW_Handle hObj, unsigned Row);
/*   140 */ void LISTVIEW_EnableSort (LISTVIEW_Handle hObj);
/*   141 */ GUI_COLOR LISTVIEW_GetBkColor (LISTVIEW_Handle hObj, unsigned Index);
/*   142 */ const GUI_FONT * LISTVIEW_GetFont (LISTVIEW_Handle hObj);
/*   143 */ HEADER_Handle LISTVIEW_GetHeader (LISTVIEW_Handle hObj);
/*   144 */ void LISTVIEW_GetItemRect (LISTVIEW_Handle hObj, unsigned long Col, unsigned long Row, GUI_RECT * pRect);
/*   145 */ void LISTVIEW_GetItemText (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, char * pBuffer, unsigned MaxSize);
/*   146 */ unsigned LISTVIEW_GetItemTextLen (LISTVIEW_Handle hObj, unsigned Column, unsigned Row);
/*   147 */ void LISTVIEW_GetItemTextSorted (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, char * pBuffer, unsigned MaxSize);
/*   148 */ unsigned LISTVIEW_GetLBorder (LISTVIEW_Handle hObj);
/*   149 */ unsigned LISTVIEW_GetNumColumns (LISTVIEW_Handle hObj);
/*   150 */ unsigned LISTVIEW_GetNumRows (LISTVIEW_Handle hObj);
/*   151 */ unsigned LISTVIEW_GetRBorder (LISTVIEW_Handle hObj);
/*   152 */ int LISTVIEW_GetSel (LISTVIEW_Handle hObj);
/*   153 */ int LISTVIEW_GetSelCol (LISTVIEW_Handle hObj);
/*   154 */ int LISTVIEW_GetSelUnsorted (LISTVIEW_Handle hObj);
/*   155 */ int LISTVIEW_GetTextAlign (LISTVIEW_Handle hObj, unsigned ColIndex);
/*   156 */ GUI_COLOR LISTVIEW_GetTextColor (LISTVIEW_Handle hObj, unsigned Index);
/*   157 */ int LISTVIEW_GetUserData (LISTVIEW_Handle hObj, void * pDest, int NumBytes);
/*   158 */ unsigned long LISTVIEW_GetUserDataRow (LISTVIEW_Handle hObj, unsigned Row);
/*   159 */ GUI_WRAPMODE LISTVIEW_GetWrapMode (LISTVIEW_Handle hObj);
/*   160 */ void LISTVIEW_IncSel (LISTVIEW_Handle hObj);
/*   161 */ int LISTVIEW_InsertRow (LISTVIEW_Handle hObj, unsigned Index, const GUI_ConstString * ppText);
/*   162 */ int LISTVIEW_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   163 */ unsigned LISTVIEW_RowIsDisabled (LISTVIEW_Handle hObj, unsigned Row);
/*   164 */ void LISTVIEW_SetAutoScrollH (LISTVIEW_Handle hObj, int OnOff);
/*   165 */ void LISTVIEW_SetAutoScrollV (LISTVIEW_Handle hObj, int OnOff);
/*   166 */ void LISTVIEW_SetItemBitmap (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, int xOff, int yOff, const GUI_BITMAP * pBitmap);
/*   167 */ void LISTVIEW_SetBkColor (LISTVIEW_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   168 */ void LISTVIEW_SetColumnWidth (LISTVIEW_Handle hObj, unsigned int Index, int Width);
/*   169 */ void LISTVIEW_SetCompareFunc (LISTVIEW_Handle hObj, unsigned Column, int (* fpCompare)(const void * p0, const void * p1));
/*   170 */ unsigned LISTVIEW_SetFixed (LISTVIEW_Handle hObj, unsigned Fixed);
/*   171 */ void LISTVIEW_SetFont (LISTVIEW_Handle hObj, const GUI_FONT * pFont);
/*   172 */ int LISTVIEW_SetGridVis (LISTVIEW_Handle hObj, int Show);
/*   173 */ void LISTVIEW_SetHeaderHeight (LISTVIEW_Handle hObj, unsigned HeaderHeight);
/*   174 */ void LISTVIEW_SetItemBkColor (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, unsigned int Index, GUI_COLOR Color);
/*   175 */ void LISTVIEW_SetItemText (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, const char * s);
/*   176 */ void LISTVIEW_SetItemTextColor (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, unsigned int Index, GUI_COLOR Color);
/*   177 */ void LISTVIEW_SetItemTextSorted (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, const char * pText);
/*   178 */ void LISTVIEW_SetLBorder (LISTVIEW_Handle hObj, unsigned BorderSize);
/*   179 */ void LISTVIEW_SetOwnerDraw (LISTVIEW_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
/*   180 */ void LISTVIEW_SetRBorder (LISTVIEW_Handle hObj, unsigned BorderSize);
/*   181 */ unsigned LISTVIEW_SetRowHeight (LISTVIEW_Handle hObj, unsigned RowHeight);
/*   182 */ void LISTVIEW_SetSel (LISTVIEW_Handle hObj, int Sel);
/*   183 */ void LISTVIEW_SetSelCol (LISTVIEW_Handle hObj, int NewCol);
/*   184 */ void LISTVIEW_SetSelUnsorted (LISTVIEW_Handle hObj, int Sel);
/*   185 */ unsigned LISTVIEW_SetSort (LISTVIEW_Handle hObj, unsigned Column, unsigned Reverse);
/*   186 */ void LISTVIEW_SetTextAlign (LISTVIEW_Handle hObj, unsigned int Index, int Align);
/*   187 */ void LISTVIEW_SetTextColor (LISTVIEW_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   188 */ int LISTVIEW_SetUserData (LISTVIEW_Handle hObj, const void * pSrc, int NumBytes);
/*   189 */ void LISTVIEW_SetUserDataRow (LISTVIEW_Handle hObj, unsigned Row, unsigned long UserData);
/*   190 */ void LISTVIEW_SetWrapMode (LISTVIEW_Handle hObj, GUI_WRAPMODE WrapMode);
/*   199 */ GUI_COLOR LISTVIEW_SetDefaultBkColor (unsigned Index, GUI_COLOR Color);
/*   200 */ const GUI_FONT * LISTVIEW_SetDefaultFont (const GUI_FONT * pFont);
/*   201 */ GUI_COLOR LISTVIEW_SetDefaultGridColor(GUI_COLOR Color);
/*   202 */ GUI_COLOR LISTVIEW_SetDefaultTextColor(unsigned Index, GUI_COLOR Color);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/LISTWHEEL.h
 */
/*    81 */ typedef signed long LISTWHEEL_Handle;
/*    95 */ LISTWHEEL_Handle LISTWHEEL_Create (const GUI_ConstString * ppText, int x0, int y0, int xSize, int ySize, int Flags);
/*    96 */ LISTWHEEL_Handle LISTWHEEL_CreateAsChild (const GUI_ConstString * ppText, GUI_HWIN hWinParent, int x0, int y0, int xSize, int ySize, int Flags);
/*    97 */ LISTWHEEL_Handle LISTWHEEL_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*    98 */ LISTWHEEL_Handle LISTWHEEL_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent,
/*    99 */     int WinFlags, int ExFlags, int Id, const GUI_ConstString * ppText);
/*   100 */ LISTWHEEL_Handle LISTWHEEL_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent,
/*   101 */     int WinFlags, int ExFlags, int Id, const GUI_ConstString * ppText, int NumExtraBytes);
/*   110 */ void LISTWHEEL_Callback(WM_MESSAGE * pMsg);
/*   118 */ void LISTWHEEL_AddString (LISTWHEEL_Handle hObj, const char * s);
/*   119 */ void * LISTWHEEL_GetItemData (LISTWHEEL_Handle hObj, unsigned Index);
/*   120 */ void LISTWHEEL_GetItemText (LISTWHEEL_Handle hObj, unsigned Index, char * pBuffer, int MaxSize);
/*   121 */ int LISTWHEEL_GetItemFromPos (LISTWHEEL_Handle hObj, int yPos);
/*   122 */ int LISTWHEEL_GetLBorder (LISTWHEEL_Handle hObj);
/*   123 */ unsigned LISTWHEEL_GetLineHeight (LISTWHEEL_Handle hObj);
/*   124 */ int LISTWHEEL_GetNumItems (LISTWHEEL_Handle hObj);
/*   125 */ int LISTWHEEL_GetPos (LISTWHEEL_Handle hObj);
/*   126 */ int LISTWHEEL_GetRBorder (LISTWHEEL_Handle hObj);
/*   127 */ int LISTWHEEL_GetSel (LISTWHEEL_Handle hObj);
/*   128 */ int LISTWHEEL_GetSnapPosition(LISTWHEEL_Handle hObj);
/*   129 */ int LISTWHEEL_GetTextAlign (LISTWHEEL_Handle hObj);
/*   130 */ int LISTWHEEL_GetUserData (LISTWHEEL_Handle hObj, void * pDest, int NumBytes);
/*   131 */ int LISTWHEEL_IsMoving (LISTWHEEL_Handle hObj);
/*   132 */ void LISTWHEEL_MoveToPos (LISTWHEEL_Handle hObj, unsigned int Index);
/*   133 */ int LISTWHEEL_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   134 */ void LISTWHEEL_SetBkColor (LISTWHEEL_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   135 */ void LISTWHEEL_SetDeceleration(LISTWHEEL_Handle hObj, unsigned Deceleration);
/*   136 */ void LISTWHEEL_SetFont (LISTWHEEL_Handle hObj, const GUI_FONT * pFont);
/*   137 */ void LISTWHEEL_SetItemData (LISTWHEEL_Handle hObj, unsigned Index, void * pData);
/*   138 */ void LISTWHEEL_SetLBorder (LISTWHEEL_Handle hObj, unsigned BorderSize);
/*   139 */ void LISTWHEEL_SetLineHeight (LISTWHEEL_Handle hObj, unsigned LineHeight);
/*   140 */ void LISTWHEEL_SetOwnerDraw (LISTWHEEL_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfOwnerDraw);
/*   141 */ void LISTWHEEL_SetPos (LISTWHEEL_Handle hObj, unsigned int Index);
/*   142 */ void LISTWHEEL_SetRBorder (LISTWHEEL_Handle hObj, unsigned BorderSize);
/*   143 */ void LISTWHEEL_SetSel (LISTWHEEL_Handle hObj, int Sel);
/*   144 */ void LISTWHEEL_SetSnapPosition(LISTWHEEL_Handle hObj, int SnapPosition);
/*   145 */ void LISTWHEEL_SetText (LISTWHEEL_Handle hObj, const GUI_ConstString * ppText);
/*   146 */ void LISTWHEEL_SetTextAlign (LISTWHEEL_Handle hObj, int Align);
/*   147 */ void LISTWHEEL_SetTextColor (LISTWHEEL_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   148 */ void LISTWHEEL_SetTimerPeriod (LISTWHEEL_Handle hObj, int TimerPeriod);
/*   149 */ int LISTWHEEL_SetUserData (LISTWHEEL_Handle hObj, const void * pSrc, int NumBytes);
/*   150 */ void LISTWHEEL_SetVelocity (LISTWHEEL_Handle hObj, int Velocity);
/*   152 */ const GUI_FONT * LISTWHEEL_GetFont(LISTWHEEL_Handle hObj);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/MENU.h
 */
/*   141 */ typedef signed long MENU_Handle;
/*   143 */ typedef struct {
/*   147 */    GUI_COLOR aBkColorH[2];
/*   148 */    GUI_COLOR BkColorV;
/*   149 */    GUI_COLOR FrameColorH;
/*   150 */    GUI_COLOR FrameColorV;
/*   154 */    GUI_COLOR aSelColorH[2];
/*   155 */    GUI_COLOR aSelColorV[2];
/*   156 */    GUI_COLOR FrameColorSelH;
/*   157 */    GUI_COLOR FrameColorSelV;
/*   161 */    GUI_COLOR aSepColorH[2];
/*   162 */    GUI_COLOR aSepColorV[2];
/*   166 */    GUI_COLOR ArrowColor;
/*   170 */    GUI_COLOR TextColor;
/*   171 */ } MENU_SKINFLEX_PROPS;
/*   177 */ typedef struct {
/*   178 */    unsigned short MsgType;
/*   179 */    unsigned short ItemId;
/*   180 */ } MENU_MSG_DATA;
/*   186 */ typedef struct {
/*   187 */    const char * pText;
/*   188 */    unsigned short Id;
/*   189 */    unsigned short Flags;
/*   190 */    MENU_Handle hSubmenu;
/*   191 */ } MENU_ITEM_DATA;
/*   199 */ MENU_Handle MENU_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   200 */ MENU_Handle MENU_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   201 */ MENU_Handle MENU_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   210 */ void MENU_Callback(WM_MESSAGE * pMsg);
/*   218 */ void MENU_AddItem (MENU_Handle hObj, const MENU_ITEM_DATA * pItemData);
/*   219 */ void MENU_Attach (MENU_Handle hObj, GUI_HWIN hDestWin, int x, int y, int xSize, int ySize, int Flags);
/*   220 */ void MENU_DeleteItem (MENU_Handle hObj, unsigned short ItemId);
/*   221 */ void MENU_DisableItem (MENU_Handle hObj, unsigned short ItemId);
/*   222 */ void MENU_EnableItem (MENU_Handle hObj, unsigned short ItemId);
/*   223 */ void MENU_GetItem (MENU_Handle hObj, unsigned short ItemId, MENU_ITEM_DATA * pItemData);
/*   224 */ void MENU_GetItemText (MENU_Handle hObj, unsigned short ItemId, char * pBuffer, unsigned BufferSize);
/*   225 */ unsigned MENU_GetNumItems (MENU_Handle hObj);
/*   226 */ GUI_HWIN MENU_GetOwner (MENU_Handle hObj);
/*   227 */ int MENU_GetUserData (MENU_Handle hObj, void * pDest, int NumBytes);
/*   228 */ void MENU_InsertItem (MENU_Handle hObj, unsigned short ItemId, const MENU_ITEM_DATA * pItemData);
/*   229 */ void MENU_Popup (MENU_Handle hObj, GUI_HWIN hDestWin, int x, int y, int xSize, int ySize, int Flags);
/*   230 */ void MENU_SetBkColor (MENU_Handle hObj, unsigned ColorIndex, GUI_COLOR Color);
/*   231 */ void MENU_SetBorderSize(MENU_Handle hObj, unsigned BorderIndex, unsigned char BorderSize);
/*   232 */ void MENU_SetFont (MENU_Handle hObj, const GUI_FONT * pFont);
/*   233 */ void MENU_SetItem (MENU_Handle hObj, unsigned short ItemId, const MENU_ITEM_DATA * pItemData);
/*   234 */ void MENU_SetOwner (MENU_Handle hObj, GUI_HWIN hOwner);
/*   235 */ int MENU_SetSel (MENU_Handle hObj, int Sel);
/*   236 */ void MENU_SetTextColor (MENU_Handle hObj, unsigned ColorIndex, GUI_COLOR Color);
/*   237 */ int MENU_SetUserData (MENU_Handle hObj, const void * pSrc, int NumBytes);
/*   245 */ GUI_COLOR MENU_GetDefaultTextColor (unsigned ColorIndex);
/*   246 */ GUI_COLOR MENU_GetDefaultBkColor (unsigned ColorIndex);
/*   247 */ unsigned char MENU_GetDefaultBorderSize (unsigned BorderIndex);
/*   248 */ const WIDGET_EFFECT * MENU_GetDefaultEffect (void);
/*   249 */ const GUI_FONT * MENU_GetDefaultFont (void);
/*   250 */ void MENU_SetDefaultTextColor (unsigned ColorIndex, GUI_COLOR Color);
/*   251 */ void MENU_SetDefaultBkColor (unsigned ColorIndex, GUI_COLOR Color);
/*   252 */ void MENU_SetDefaultBorderSize (unsigned BorderIndex, unsigned char BorderSize);
/*   253 */ void MENU_SetDefaultEffect (const WIDGET_EFFECT * pEffect);
/*   254 */ void MENU_SetDefaultFont (const GUI_FONT * pFont);
/*   262 */ int MENU_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   263 */ void MENU_GetSkinFlexProps (MENU_SKINFLEX_PROPS * pProps, int Index);
/*   264 */ WIDGET_DRAW_ITEM_FUNC * MENU_SetDefaultSkin (WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   265 */ void MENU_SetDefaultSkinClassic(void);
/*   266 */ void MENU_SetSkinClassic (MENU_Handle hObj);
/*   267 */ void MENU_SetSkin (MENU_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   268 */ void MENU_SetSkinFlexProps (const MENU_SKINFLEX_PROPS * pProps, int Index);
/*   269 */ void MENU_SkinEnableArrow (MENU_Handle hObj, int OnOff);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/MULTIEDIT.h
 */
/*    91 */ typedef signed long MULTIEDIT_HANDLE;
/*    99 */ MULTIEDIT_HANDLE MULTIEDIT_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int ExFlags, const char * pText, int MaxLen);
/*   100 */ MULTIEDIT_HANDLE MULTIEDIT_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int BufferSize, const char * pText);
/*   101 */ MULTIEDIT_HANDLE MULTIEDIT_CreateIndirect(const GUI_WIDGET_CREATE_INFO* pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   102 */ MULTIEDIT_HANDLE MULTIEDIT_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int BufferSize, const char * pText, int NumExtraBytes);
/*   111 */ void MULTIEDIT_Callback(WM_MESSAGE * pMsg);
/*   120 */ int MULTIEDIT_AddKey (MULTIEDIT_HANDLE hObj, unsigned short Key);
/*   121 */ int MULTIEDIT_AddText (MULTIEDIT_HANDLE hObj, const char * s);
/*   122 */ void MULTIEDIT_EnableBlink (MULTIEDIT_HANDLE hObj, int Period, int OnOff);
/*   123 */ int MULTIEDIT_GetCursorCharPos (MULTIEDIT_HANDLE hObj);
/*   124 */ void MULTIEDIT_GetCursorPixelPos(MULTIEDIT_HANDLE hObj, int * pxPos, int * pyPos);
/*   125 */ void MULTIEDIT_GetPrompt (MULTIEDIT_HANDLE hObj, char* sDest, int MaxNumChars);
/*   126 */ int MULTIEDIT_GetTextSize (MULTIEDIT_HANDLE hObj);
/*   127 */ void MULTIEDIT_GetText (MULTIEDIT_HANDLE hObj, char* sDest, int MaxNumChars);
/*   128 */ int MULTIEDIT_GetUserData (MULTIEDIT_HANDLE hObj, void * pDest, int NumBytes);
/*   129 */ void MULTIEDIT_SetTextAlign (MULTIEDIT_HANDLE hObj, int Align);
/*   130 */ void MULTIEDIT_SetAutoScrollH (MULTIEDIT_HANDLE hObj, int OnOff);
/*   131 */ void MULTIEDIT_SetAutoScrollV (MULTIEDIT_HANDLE hObj, int OnOff);
/*   132 */ void MULTIEDIT_SetBkColor (MULTIEDIT_HANDLE hObj, unsigned Index, GUI_COLOR color);
/*   133 */ void MULTIEDIT_SetCursorCharPos (MULTIEDIT_HANDLE hObj, int x, int y);
/*   134 */ void MULTIEDIT_SetCursorPixelPos(MULTIEDIT_HANDLE hObj, int x, int y);
/*   135 */ void MULTIEDIT_SetCursorOffset (MULTIEDIT_HANDLE hObj, int Offset);
/*   136 */ void MULTIEDIT_SetHBorder (MULTIEDIT_HANDLE hObj, unsigned HBorder);
/*   137 */ void MULTIEDIT_SetFocusable (MULTIEDIT_HANDLE hObj, int State);
/*   138 */ void MULTIEDIT_SetFont (MULTIEDIT_HANDLE hObj, const GUI_FONT * pFont);
/*   139 */ void MULTIEDIT_SetInsertMode (MULTIEDIT_HANDLE hObj, int OnOff);
/*   140 */ void MULTIEDIT_SetBufferSize (MULTIEDIT_HANDLE hObj, int BufferSize);
/*   141 */ void MULTIEDIT_SetMaxNumChars (MULTIEDIT_HANDLE hObj, unsigned MaxNumChars);
/*   142 */ void MULTIEDIT_SetPrompt (MULTIEDIT_HANDLE hObj, const char* sPrompt);
/*   143 */ void MULTIEDIT_SetReadOnly (MULTIEDIT_HANDLE hObj, int OnOff);
/*   144 */ void MULTIEDIT_SetPasswordMode (MULTIEDIT_HANDLE hObj, int OnOff);
/*   145 */ void MULTIEDIT_SetText (MULTIEDIT_HANDLE hObj, const char* s);
/*   146 */ void MULTIEDIT_SetTextColor (MULTIEDIT_HANDLE hObj, unsigned Index, GUI_COLOR color);
/*   147 */ int MULTIEDIT_SetUserData (MULTIEDIT_HANDLE hObj, const void * pSrc, int NumBytes);
/*   148 */ void MULTIEDIT_SetWrapNone (MULTIEDIT_HANDLE hObj);
/*   149 */ void MULTIEDIT_SetWrapChar (MULTIEDIT_HANDLE hObj);
/*   150 */ void MULTIEDIT_SetWrapWord (MULTIEDIT_HANDLE hObj);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/MULTIPAGE.h
 */
/*   108 */ typedef signed long MULTIPAGE_Handle;
/*   110 */ typedef struct {
/*   111 */    GUI_COLOR BkColor;
/*   112 */    GUI_COLOR aBkUpper[2];
/*   113 */    GUI_COLOR aBkLower[2];
/*   114 */    GUI_COLOR FrameColor;
/*   115 */    GUI_COLOR TextColor;
/*   116 */ } MULTIPAGE_SKINFLEX_PROPS;
/*   118 */ typedef struct {
/*   119 */    unsigned char SelSideBorderInc;
/*   120 */    unsigned char SelTopBorderInc;
/*   121 */ } MULTIPAGE_SKIN_PROPS;
/*   123 */ typedef struct {
/*   125 */    tLCD_APIList * pRotation;
/*   127 */    unsigned Align;
/*   128 */    int Sel;
/*   129 */    unsigned short State;
/*   130 */    unsigned char FrameFlags;
/*   131 */    unsigned char PageStatus;
/*   132 */    GUI_DRAW_HANDLE * pDrawObj;
/*   133 */ } MULTIPAGE_SKIN_INFO;
/*   141 */ MULTIPAGE_Handle MULTIPAGE_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int SpecialFlags);
/*   142 */ MULTIPAGE_Handle MULTIPAGE_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   143 */ MULTIPAGE_Handle MULTIPAGE_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   144 */ MULTIPAGE_Handle MULTIPAGE_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   153 */ void MULTIPAGE_Callback(WM_MESSAGE * pMsg);
/*   161 */ void MULTIPAGE_AddEmptyPage (MULTIPAGE_Handle hObj, GUI_HWIN hWin ,const char * pText);
/*   162 */ void MULTIPAGE_AddPage (MULTIPAGE_Handle hObj, GUI_HWIN hWin ,const char * pText);
/*   163 */ GUI_HWIN MULTIPAGE_AttachWindow (MULTIPAGE_Handle hObj, unsigned Index, GUI_HWIN hWin);
/*   164 */ void MULTIPAGE_DeletePage (MULTIPAGE_Handle hObj, unsigned Index, int Delete);
/*   165 */ void MULTIPAGE_DisablePage (MULTIPAGE_Handle hObj, unsigned Index);
/*   166 */ void MULTIPAGE_EnablePage (MULTIPAGE_Handle hObj, unsigned Index);
/*   167 */ void MULTIPAGE_EnableScrollbar(MULTIPAGE_Handle hObj, unsigned OnOff);
/*   168 */ const GUI_FONT * MULTIPAGE_GetFont (MULTIPAGE_Handle hObj);
/*   169 */ int MULTIPAGE_GetSelection (MULTIPAGE_Handle hObj);
/*   170 */ int MULTIPAGE_GetPageText (MULTIPAGE_Handle hObj, unsigned Index, char * pBuffer, int MaxLen);
/*   171 */ int MULTIPAGE_GetUserData (MULTIPAGE_Handle hObj, void * pDest, int NumBytes);
/*   172 */ GUI_HWIN MULTIPAGE_GetWindow (MULTIPAGE_Handle hObj, unsigned Index);
/*   173 */ int MULTIPAGE_IsPageEnabled (MULTIPAGE_Handle hObj, unsigned Index);
/*   174 */ void MULTIPAGE_SelectPage (MULTIPAGE_Handle hObj, unsigned Index);
/*   175 */ void MULTIPAGE_SetAlign (MULTIPAGE_Handle hObj, unsigned Align);
/*   176 */ int MULTIPAGE_SetBitmapEx (MULTIPAGE_Handle hObj, const GUI_BITMAP * pBitmap, int x, int y, int Index, int State);
/*   177 */ int MULTIPAGE_SetBitmap (MULTIPAGE_Handle hObj, const GUI_BITMAP * pBitmap, int Index, int State);
/*   178 */ void MULTIPAGE_SetBkColor (MULTIPAGE_Handle hObj, GUI_COLOR Color, unsigned Index);
/*   179 */ void MULTIPAGE_SetFont (MULTIPAGE_Handle hObj, const GUI_FONT * pFont);
/*   180 */ void MULTIPAGE_SetRotation (MULTIPAGE_Handle hObj, unsigned Rotation);
/*   181 */ void MULTIPAGE_SetTabWidth (MULTIPAGE_Handle hObj, int Width, int Index);
/*   182 */ void MULTIPAGE_SetTabHeight (MULTIPAGE_Handle hObj, int Height);
/*   183 */ void MULTIPAGE_SetTextAlign (MULTIPAGE_Handle hObj, unsigned Align);
/*   184 */ void MULTIPAGE_SetText (MULTIPAGE_Handle hObj, const char * pText, unsigned Index);
/*   185 */ void MULTIPAGE_SetTextColor (MULTIPAGE_Handle hObj, GUI_COLOR Color, unsigned Index);
/*   186 */ int MULTIPAGE_SetUserData (MULTIPAGE_Handle hObj, const void * pSrc, int NumBytes);
/*   194 */ unsigned MULTIPAGE_GetDefaultAlign (void);
/*   195 */ GUI_COLOR MULTIPAGE_GetDefaultBkColor (unsigned Index);
/*   196 */ const GUI_FONT * MULTIPAGE_GetDefaultFont (void);
/*   197 */ GUI_COLOR MULTIPAGE_GetDefaultTextColor (unsigned Index);
/*   199 */ void MULTIPAGE_SetDefaultAlign (unsigned Align);
/*   200 */ void MULTIPAGE_SetDefaultBkColor (GUI_COLOR Color, unsigned Index);
/*   201 */ void MULTIPAGE_SetDefaultBorderSizeX(unsigned Size);
/*   202 */ void MULTIPAGE_SetDefaultBorderSizeY(unsigned Size);
/*   203 */ void MULTIPAGE_SetDefaultFont (const GUI_FONT * pFont);
/*   204 */ void MULTIPAGE_SetDefaultTextColor (GUI_COLOR Color, unsigned Index);
/*   206 */ void MULTIPAGE_SetEffectColor (unsigned Index, GUI_COLOR Color);
/*   207 */ GUI_COLOR MULTIPAGE_GetEffectColor (unsigned Index);
/*   208 */ int MULTIPAGE_GetNumEffectColors (void);
/*   216 */ int MULTIPAGE_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   217 */ void MULTIPAGE_GetSkinFlexProps (MULTIPAGE_SKINFLEX_PROPS * pProps, int Index);
/*   218 */ WIDGET_DRAW_ITEM_FUNC * MULTIPAGE_SetDefaultSkin (WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   219 */ void MULTIPAGE_SetDefaultSkinClassic(void);
/*   220 */ void MULTIPAGE_SetSkinClassic (MULTIPAGE_Handle hObj);
/*   221 */ void MULTIPAGE_SetSkin (MULTIPAGE_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   222 */ void MULTIPAGE_SetSkinFlexProps (const MULTIPAGE_SKINFLEX_PROPS * pProps, int Index);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/PROGBAR.h
 */
/*    93 */ typedef signed long PROGBAR_Handle;
/*    95 */ typedef struct {
/*    96 */    GUI_COLOR aColorUpperL[2];
/*    97 */    GUI_COLOR aColorLowerL[2];
/*    98 */    GUI_COLOR aColorUpperR[2];
/*    99 */    GUI_COLOR aColorLowerR[2];
/*   100 */    GUI_COLOR ColorFrame;
/*   101 */    GUI_COLOR ColorText;
/*   102 */ } PROGBAR_SKINFLEX_PROPS;
/*   104 */ typedef struct {
/*   105 */    int IsVertical;
/*   106 */    int Index;
/*   107 */    const char * pText;
/*   108 */ } PROGBAR_SKINFLEX_INFO;
/*   117 */ PROGBAR_Handle PROGBAR_Create (int x0, int y0, int xSize, int ySize, int Flags);
/*   118 */ PROGBAR_Handle PROGBAR_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags);
/*   119 */ PROGBAR_Handle PROGBAR_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   120 */ PROGBAR_Handle PROGBAR_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   121 */ PROGBAR_Handle PROGBAR_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   130 */ void PROGBAR_Callback(WM_MESSAGE * pMsg);
/*   139 */ void PROGBAR_GetMinMax (PROGBAR_Handle hObj, int * pMin, int * pMax);
/*   140 */ int PROGBAR_GetUserData (PROGBAR_Handle hObj, void * pDest, int NumBytes);
/*   141 */ int PROGBAR_GetValue (PROGBAR_Handle hObj);
/*   142 */ void PROGBAR_SetBarColor (PROGBAR_Handle hObj, unsigned int index, GUI_COLOR color);
/*   143 */ void PROGBAR_SetFont (PROGBAR_Handle hObj, const GUI_FONT * pfont);
/*   144 */ void PROGBAR_SetMinMax (PROGBAR_Handle hObj, int Min, int Max);
/*   145 */ void PROGBAR_SetText (PROGBAR_Handle hObj, const char* s);
/*   146 */ void PROGBAR_SetTextAlign(PROGBAR_Handle hObj, int Align);
/*   147 */ void PROGBAR_SetTextColor(PROGBAR_Handle hObj, unsigned int index, GUI_COLOR color);
/*   148 */ void PROGBAR_SetTextPos (PROGBAR_Handle hObj, int XOff, int YOff);
/*   149 */ void PROGBAR_SetValue (PROGBAR_Handle hObj, int v);
/*   150 */ int PROGBAR_SetUserData (PROGBAR_Handle hObj, const void * pSrc, int NumBytes);
/*   158 */ void PROGBAR_GetSkinFlexProps (PROGBAR_SKINFLEX_PROPS * pProps, int Index);
/*   159 */ void PROGBAR_SetSkinClassic (PROGBAR_Handle hObj);
/*   160 */ void PROGBAR_SetSkin (PROGBAR_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   161 */ int PROGBAR_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   162 */ void PROGBAR_SetSkinFlexProps (const PROGBAR_SKINFLEX_PROPS * pProps, int Index);
/*   163 */ void PROGBAR_SetDefaultSkinClassic(void);
/*   164 */ WIDGET_DRAW_ITEM_FUNC * PROGBAR_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/RADIO.h
 */
/*   106 */ typedef signed long RADIO_Handle;
/*   108 */ typedef struct {
/*   109 */    GUI_COLOR aColorButton[4];
/*   110 */    int ButtonSize;
/*   111 */ } RADIO_SKINFLEX_PROPS;
/*   120 */ RADIO_Handle RADIO_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, unsigned Para);
/*   121 */ RADIO_Handle RADIO_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumItems, int Spacing);
/*   122 */ RADIO_Handle RADIO_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumItems, int Spacing, int NumExtraBytes);
/*   123 */ RADIO_Handle RADIO_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   132 */ void RADIO_Callback(WM_MESSAGE * pMsg);
/*   141 */ void RADIO_SetDefaultFont (const GUI_FONT * pFont);
/*   142 */ GUI_COLOR RADIO_SetDefaultFocusColor(GUI_COLOR Color);
/*   143 */ void RADIO_SetDefaultImage (const GUI_BITMAP * pBitmap, unsigned int Index);
/*   144 */ void RADIO_SetDefaultTextColor (GUI_COLOR TextColor);
/*   145 */ const GUI_FONT * RADIO_GetDefaultFont (void);
/*   146 */ GUI_COLOR RADIO_GetDefaultTextColor (void);
/*   155 */ void RADIO_AddValue (RADIO_Handle hObj, int Add);
/*   156 */ void RADIO_Dec (RADIO_Handle hObj);
/*   157 */ int RADIO_GetText (RADIO_Handle hObj, unsigned Index, char * pBuffer, int MaxLen);
/*   158 */ int RADIO_GetUserData (RADIO_Handle hObj, void * pDest, int NumBytes);
/*   159 */ void RADIO_Inc (RADIO_Handle hObj);
/*   160 */ void RADIO_SetBkColor (RADIO_Handle hObj, GUI_COLOR Color);
/*   161 */ GUI_COLOR RADIO_SetFocusColor(RADIO_Handle hObj, GUI_COLOR Color);
/*   162 */ void RADIO_SetFont (RADIO_Handle hObj, const GUI_FONT * pFont);
/*   163 */ void RADIO_SetGroupId (RADIO_Handle hObj, unsigned char GroupId);
/*   164 */ void RADIO_SetImage (RADIO_Handle hObj, const GUI_BITMAP * pBitmap, unsigned int Index);
/*   165 */ void RADIO_SetText (RADIO_Handle hObj, const char* pText, unsigned Index);
/*   166 */ void RADIO_SetTextColor (RADIO_Handle hObj, GUI_COLOR Color);
/*   167 */ void RADIO_SetValue (RADIO_Handle hObj, int v);
/*   168 */ int RADIO_SetUserData (RADIO_Handle hObj, const void * pSrc, int NumBytes);
/*   170 */ const GUI_BITMAP * RADIO_GetImage(RADIO_Handle hObj, unsigned int Index);
/*   178 */ void RADIO_GetSkinFlexProps (RADIO_SKINFLEX_PROPS * pProps, int Index);
/*   179 */ void RADIO_SetSkinClassic (RADIO_Handle hObj);
/*   180 */ void RADIO_SetSkin (RADIO_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   181 */ int RADIO_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   182 */ void RADIO_SetSkinFlexProps (const RADIO_SKINFLEX_PROPS * pProps, int Index);
/*   183 */ void RADIO_SetDefaultSkinClassic(void);
/*   184 */ WIDGET_DRAW_ITEM_FUNC * RADIO_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   194 */ int RADIO_GetValue(RADIO_Handle hObj);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/SLIDER.h
 */
/*    98 */ typedef signed long SLIDER_Handle;
/*   100 */ typedef struct {
/*   101 */    GUI_COLOR aColorFrame[2];
/*   102 */    GUI_COLOR aColorInner[2];
/*   103 */    GUI_COLOR aColorShaft[3];
/*   104 */    GUI_COLOR ColorTick;
/*   105 */    GUI_COLOR ColorFocus;
/*   106 */    int TickSize;
/*   107 */    int ShaftSize;
/*   108 */ } SLIDER_SKINFLEX_PROPS;
/*   110 */ typedef struct {
/*   111 */    int Width;
/*   112 */    int NumTicks;
/*   113 */    int Size;
/*   114 */    int IsPressed;
/*   115 */    int IsVertical;
/*   116 */ } SLIDER_SKINFLEX_INFO;
/*   124 */ SLIDER_Handle SLIDER_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int WinFlags, int SpecialFlags);
/*   125 */ SLIDER_Handle SLIDER_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   126 */ SLIDER_Handle SLIDER_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   127 */ SLIDER_Handle SLIDER_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   136 */ void SLIDER_Callback(WM_MESSAGE * pMsg);
/*   144 */ void SLIDER_Dec (SLIDER_Handle hObj);
/*   145 */ void SLIDER_EnableFocusRect(SLIDER_Handle hObj, int OnOff);
/*   146 */ GUI_COLOR SLIDER_GetBarColor (SLIDER_Handle hObj);
/*   147 */ GUI_COLOR SLIDER_GetBkColor (SLIDER_Handle hObj);
/*   148 */ unsigned char SLIDER_GetFlag (SLIDER_Handle hObj, unsigned char Flag);
/*   149 */ GUI_COLOR SLIDER_GetFocusColor (SLIDER_Handle hObj);
/*   150 */ void SLIDER_GetRange (SLIDER_Handle hObj, int * pMin, int * pMax);
/*   151 */ GUI_COLOR SLIDER_GetTickColor (SLIDER_Handle hObj);
/*   152 */ int SLIDER_GetUserData (SLIDER_Handle hObj, void * pDest, int NumBytes);
/*   153 */ int SLIDER_GetValue (SLIDER_Handle hObj);
/*   154 */ void SLIDER_Inc (SLIDER_Handle hObj);
/*   155 */ void SLIDER_SetBarColor (SLIDER_Handle hObj, GUI_COLOR Color);
/*   156 */ void SLIDER_SetBkColor (SLIDER_Handle hObj, GUI_COLOR Color);
/*   157 */ GUI_COLOR SLIDER_SetFocusColor (SLIDER_Handle hObj, GUI_COLOR Color);
/*   158 */ void SLIDER_SetNumTicks (SLIDER_Handle hObj, int NumTicks);
/*   159 */ void SLIDER_SetRange (SLIDER_Handle hObj, int Min, int Max);
/*   160 */ void SLIDER_SetTickColor (SLIDER_Handle hObj, GUI_COLOR Color);
/*   161 */ int SLIDER_SetUserData (SLIDER_Handle hObj, const void * pSrc, int NumBytes);
/*   162 */ void SLIDER_SetValue (SLIDER_Handle hObj, int v);
/*   163 */ void SLIDER_SetWidth (SLIDER_Handle hObj, int Width);
/*   171 */ void SLIDER_GetSkinFlexProps (SLIDER_SKINFLEX_PROPS * pProps, int Index);
/*   172 */ void SLIDER_SetSkinClassic (SLIDER_Handle hObj);
/*   173 */ void SLIDER_SetSkin (SLIDER_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   174 */ int SLIDER_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   175 */ void SLIDER_SetSkinFlexProps (const SLIDER_SKINFLEX_PROPS * pProps, int Index);
/*   176 */ void SLIDER_SetDefaultSkinClassic(void);
/*   177 */ WIDGET_DRAW_ITEM_FUNC * SLIDER_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   187 */ GUI_COLOR SLIDER_GetDefaultBkColor (void);
/*   188 */ GUI_COLOR SLIDER_GetDefaultBarColor (void);
/*   189 */ GUI_COLOR SLIDER_GetDefaultFocusColor(void);
/*   190 */ GUI_COLOR SLIDER_GetDefaultTickColor (void);
/*   191 */ void SLIDER_SetDefaultBkColor (GUI_COLOR Color);
/*   192 */ void SLIDER_SetDefaultBarColor (GUI_COLOR Color);
/*   193 */ GUI_COLOR SLIDER_SetDefaultFocusColor(GUI_COLOR Color);
/*   194 */ void SLIDER_SetDefaultTickColor (GUI_COLOR Color);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/SPINBOX.h
 */
/*   118 */ typedef signed long SPINBOX_Handle;
/*   120 */ typedef struct {
/*   121 */    GUI_COLOR aColorFrame[2];
/*   122 */    GUI_COLOR aColorUpper[2];
/*   123 */    GUI_COLOR aColorLower[2];
/*   124 */    GUI_COLOR ColorArrow;
/*   125 */    GUI_COLOR ColorBk;
/*   126 */    GUI_COLOR ColorText;
/*   127 */    GUI_COLOR ColorButtonFrame;
/*   128 */ } SPINBOX_SKINFLEX_PROPS;
/*   140 */ SPINBOX_Handle SPINBOX_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int Id, int Min, int Max);
/*   141 */ SPINBOX_Handle SPINBOX_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int Id, int Min, int Max, int NumExtraBytes);
/*   142 */ SPINBOX_Handle SPINBOX_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   148 */ void SPINBOX_Callback(WM_MESSAGE * pMsg);
/*   154 */ void SPINBOX_EnableBlink (SPINBOX_Handle hObj, int Period, int OnOff);
/*   155 */ GUI_COLOR SPINBOX_GetBkColor (SPINBOX_Handle hObj, unsigned int Index);
/*   156 */ GUI_COLOR SPINBOX_GetButtonBkColor(SPINBOX_Handle hObj, unsigned int Index);
/*   157 */ EDIT_Handle SPINBOX_GetEditHandle (SPINBOX_Handle hObj);
/*   158 */ int SPINBOX_GetUserData (SPINBOX_Handle hObj, void * pDest, int NumBytes);
/*   159 */ signed long SPINBOX_GetValue (SPINBOX_Handle hObj);
/*   160 */ void SPINBOX_SetBkColor (SPINBOX_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   161 */ void SPINBOX_SetButtonBkColor(SPINBOX_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   162 */ void SPINBOX_SetButtonSize (SPINBOX_Handle hObj, unsigned ButtonSize);
/*   163 */ void SPINBOX_SetEdge (SPINBOX_Handle hObj, unsigned char Edge);
/*   164 */ void SPINBOX_SetEditMode (SPINBOX_Handle hObj, unsigned char EditMode);
/*   165 */ void SPINBOX_SetFont (SPINBOX_Handle hObj, const GUI_FONT * pFont);
/*   166 */ void SPINBOX_SetRange (SPINBOX_Handle hObj, signed long Min, signed long Max);
/*   167 */ unsigned short SPINBOX_SetStep (SPINBOX_Handle hObj, unsigned short Step);
/*   168 */ void SPINBOX_SetTextColor (SPINBOX_Handle hObj, unsigned int Index, GUI_COLOR Color);
/*   169 */ int SPINBOX_SetUserData (SPINBOX_Handle hObj, const void * pSrc, int NumBytes);
/*   170 */ void SPINBOX_SetValue (SPINBOX_Handle hObj, signed long Value);
/*   176 */ unsigned short SPINBOX_GetDefaultButtonSize(void);
/*   177 */ void SPINBOX_SetDefaultButtonSize(unsigned short ButtonSize);
/*   183 */ void SPINBOX_GetSkinFlexProps (SPINBOX_SKINFLEX_PROPS * pProps, int Index);
/*   184 */ void SPINBOX_SetSkinClassic (SPINBOX_Handle hObj);
/*   185 */ void SPINBOX_SetSkin (SPINBOX_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*   186 */ int SPINBOX_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   187 */ void SPINBOX_SetSkinFlexProps (const SPINBOX_SKINFLEX_PROPS * pProps, int Index);
/*   188 */ void SPINBOX_SetDefaultSkinClassic(void);
/*   189 */ WIDGET_DRAW_ITEM_FUNC * SPINBOX_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/SWIPELIST.h
 */
/*   107 */ typedef signed long SWIPELIST_Handle;
/*   115 */ SWIPELIST_Handle SWIPELIST_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags);
/*   116 */ SWIPELIST_Handle SWIPELIST_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   117 */ SWIPELIST_Handle SWIPELIST_CreateIndirect (const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   118 */ SWIPELIST_Handle SWIPELIST_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   127 */ void SWIPELIST_Callback(WM_MESSAGE * pMsg);
/*   137 */ int SWIPELIST_AddItem (SWIPELIST_Handle hObj, const char * sText, int ItemSize);
/*   138 */ int SWIPELIST_AddItemText (SWIPELIST_Handle hObj, unsigned ItemIndex, const char * sText);
/*   139 */ int SWIPELIST_AddSepItem (SWIPELIST_Handle hObj, const char * sText, int ItemSize);
/*   140 */ void SWIPELIST_DeleteItem (SWIPELIST_Handle hObj, unsigned ItemIndex);
/*   142 */ const GUI_BITMAP * SWIPELIST_GetBitmap (SWIPELIST_Handle hObj, unsigned ItemIndex);
/*   143 */ int SWIPELIST_GetBitmapSpace (SWIPELIST_Handle hObj);
/*   144 */ GUI_COLOR SWIPELIST_GetBkColor (SWIPELIST_Handle hObj, unsigned Index);
/*   145 */ int SWIPELIST_GetBorderSize (SWIPELIST_Handle hObj, unsigned Index);
/*   146 */ const GUI_FONT * SWIPELIST_GetFont (SWIPELIST_Handle hObj, unsigned Index);
/*   147 */ int SWIPELIST_GetItemSize (SWIPELIST_Handle hObj, unsigned ItemIndex);
/*   148 */ unsigned long SWIPELIST_GetItemUserData (SWIPELIST_Handle hObj, unsigned ItemIndex);
/*   149 */ int SWIPELIST_GetNumItems (SWIPELIST_Handle hObj);
/*   150 */ int SWIPELIST_GetNumText (SWIPELIST_Handle hObj, unsigned ItemIndex);
/*   151 */ int SWIPELIST_GetReleasedItem (SWIPELIST_Handle hObj);
/*   152 */ int SWIPELIST_GetScrollPos (SWIPELIST_Handle hObj);
/*   153 */ int SWIPELIST_GetSelItem (SWIPELIST_Handle hObj);
/*   154 */ GUI_COLOR SWIPELIST_GetSepColor (SWIPELIST_Handle hObj, unsigned ItemIndex);
/*   155 */ int SWIPELIST_GetSepSize (SWIPELIST_Handle hObj, unsigned ItemIndex);
/*   156 */ void SWIPELIST_GetText (SWIPELIST_Handle hObj, unsigned ItemIndex, unsigned TextIndex, char * pBuffer, int MaxSize);
/*   157 */ int SWIPELIST_GetTextAlign (SWIPELIST_Handle hObj, unsigned ItemIndex);
/*   158 */ GUI_COLOR SWIPELIST_GetTextColor (SWIPELIST_Handle hObj, unsigned Index);
/*   159 */ int SWIPELIST_GetThreshold (SWIPELIST_Handle hObj);
/*   160 */ int SWIPELIST_GetUserData (SWIPELIST_Handle hObj, void * pDest, int NumBytes);
/*   162 */ int SWIPELIST_ItemAttachWindow (SWIPELIST_Handle hObj, unsigned ItemIndex, GUI_HWIN hWin, int x0, int y0);
/*   163 */ void SWIPELIST_ItemDetachWindow (SWIPELIST_Handle hObj, GUI_HWIN hWin);
/*   164 */ int SWIPELIST_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   166 */ void SWIPELIST_SetAttachedWindowPos (SWIPELIST_Handle hObj, GUI_HWIN hWin, int x0, int y0);
/*   167 */ void SWIPELIST_SetBitmap (SWIPELIST_Handle hObj, unsigned ItemIndex, int Align, const GUI_BITMAP * pBitmap);
/*   168 */ void SWIPELIST_SetBitmapEx (SWIPELIST_Handle hObj, unsigned ItemIndex, int Align, const GUI_BITMAP * pBitmap, int x, int y);
/*   169 */ void SWIPELIST_SetBitmapSpace (SWIPELIST_Handle hObj, unsigned Size);
/*   170 */ void SWIPELIST_SetBkColor (SWIPELIST_Handle hObj, unsigned Index, GUI_COLOR Color);
/*   171 */ void SWIPELIST_SetBorderSize (SWIPELIST_Handle hObj, unsigned Index, unsigned Size);
/*   172 */ void SWIPELIST_SetFont (SWIPELIST_Handle hObj, unsigned Index, const GUI_FONT * pFont);
/*   173 */ void SWIPELIST_SetItemSize (SWIPELIST_Handle hObj, unsigned ItemIndex, unsigned Size);
/*   174 */ void SWIPELIST_SetItemUserData (SWIPELIST_Handle hObj, unsigned ItemIndex, unsigned long UserData);
/*   175 */ void SWIPELIST_SetOwnerDraw (SWIPELIST_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
/*   176 */ void SWIPELIST_SetScrollPos (SWIPELIST_Handle hObj, int Pos);
/*   177 */ void SWIPELIST_SetScrollPosItem (SWIPELIST_Handle hObj, unsigned ItemIndex);
/*   178 */ void SWIPELIST_SetSepColor (SWIPELIST_Handle hObj, unsigned ItemIndex, GUI_COLOR Color);
/*   179 */ void SWIPELIST_SetSepSize (SWIPELIST_Handle hObj, unsigned ItemIndex, int Size);
/*   180 */ void SWIPELIST_SetText (SWIPELIST_Handle hObj, unsigned ItemIndex, unsigned TextIndex, char * sText);
/*   181 */ void SWIPELIST_SetTextAlign (SWIPELIST_Handle hObj, unsigned ItemIndex, int Align);
/*   182 */ void SWIPELIST_SetTextColor (SWIPELIST_Handle hObj, unsigned Index, GUI_COLOR Color);
/*   183 */ int SWIPELIST_SetThreshold (SWIPELIST_Handle hObj, int Threshold);
/*   184 */ int SWIPELIST_SetUserData (SWIPELIST_Handle hObj, const void * pSrc, int NumBytes);
/*   192 */ int SWIPELIST_GetDefaultBitmapSpace (void);
/*   193 */ GUI_COLOR SWIPELIST_GetDefaultBkColor (unsigned Index);
/*   194 */ int SWIPELIST_GetDefaultBorderSize (unsigned Index);
/*   195 */ const GUI_FONT * SWIPELIST_GetDefaultFont (unsigned Index);
/*   196 */ GUI_COLOR SWIPELIST_GetDefaultSepColor (void);
/*   197 */ unsigned SWIPELIST_GetDefaultSepSize (void);
/*   198 */ GUI_COLOR SWIPELIST_GetDefaultTextColor (unsigned Index);
/*   199 */ int SWIPELIST_GetDefaultTextAlign (void);
/*   200 */ int SWIPELIST_GetDefaultThreshold (void);
/*   202 */ void SWIPELIST_SetDefaultBitmapSpace (unsigned Size);
/*   203 */ void SWIPELIST_SetDefaultBkColor (unsigned Index, GUI_COLOR Color);
/*   204 */ void SWIPELIST_SetDefaultBorderSize (unsigned Index, unsigned Size);
/*   205 */ void SWIPELIST_SetDefaultFont (unsigned Index, const GUI_FONT * pFont);
/*   206 */ void SWIPELIST_SetDefaultSepColor (GUI_COLOR Color);
/*   207 */ void SWIPELIST_SetDefaultSepSize (unsigned Size);
/*   208 */ void SWIPELIST_SetDefaultTextColor (unsigned Index, GUI_COLOR Color);
/*   209 */ void SWIPELIST_SetDefaultTextAlign (int Align);
/*   210 */ void SWIPELIST_SetDefaultThreshold (int Threshold);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/TEXT.h
 */
/*    94 */ typedef signed long TEXT_Handle;
/*   102 */ TEXT_Handle TEXT_Create (int x0, int y0, int xSize, int ySize, int Id, int Flags, const char * s, int Align);
/*   103 */ TEXT_Handle TEXT_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, const char * s, int Align);
/*   104 */ TEXT_Handle TEXT_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const char * pText);
/*   105 */ TEXT_Handle TEXT_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const char * pText, int NumExtraBytes);
/*   106 */ TEXT_Handle TEXT_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   115 */ void TEXT_Callback(WM_MESSAGE * pMsg);
/*   126 */ GUI_COLOR TEXT_GetBkColor (TEXT_Handle hObj);
/*   127 */ const GUI_FONT * TEXT_GetFont (TEXT_Handle hObj);
/*   128 */ int TEXT_GetNumLines (TEXT_Handle hObj);
/*   129 */ int TEXT_GetText (TEXT_Handle hObj, char * pDest, unsigned long BufferSize);
/*   130 */ int TEXT_GetTextAlign(TEXT_Handle hObj);
/*   131 */ GUI_COLOR TEXT_GetTextColor(TEXT_Handle hObj);
/*   132 */ int TEXT_GetUserData (TEXT_Handle hObj, void * pDest, int NumBytes);
/*   133 */ GUI_WRAPMODE TEXT_GetWrapMode (TEXT_Handle hObj);
/*   134 */ void TEXT_SetBkColor (TEXT_Handle hObj, GUI_COLOR Color);
/*   135 */ void TEXT_SetFont (TEXT_Handle hObj, const GUI_FONT * pFont);
/*   136 */ int TEXT_SetText (TEXT_Handle hObj, const char * s);
/*   137 */ void TEXT_SetTextAlign(TEXT_Handle hObj, int Align);
/*   138 */ void TEXT_SetTextColor(TEXT_Handle hObj, GUI_COLOR Color);
/*   139 */ int TEXT_SetUserData (TEXT_Handle hObj, const void * pSrc, int NumBytes);
/*   140 */ void TEXT_SetWrapMode (TEXT_Handle hObj, GUI_WRAPMODE WrapMode);
/*   149 */ const GUI_FONT * TEXT_GetDefaultFont (void);
/*   150 */ GUI_COLOR TEXT_GetDefaultTextColor(void);
/*   151 */ GUI_WRAPMODE TEXT_GetDefaultWrapMode (void);
/*   152 */ void TEXT_SetDefaultFont (const GUI_FONT * pFont);
/*   153 */ void TEXT_SetDefaultTextColor(GUI_COLOR Color);
/*   154 */ GUI_WRAPMODE TEXT_SetDefaultWrapMode (GUI_WRAPMODE WrapMode);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/TREEVIEW.h
 */
/*   122 */ typedef signed long TREEVIEW_Handle;
/*   123 */ typedef signed long TREEVIEW_ITEM_Handle;
/*   125 */ typedef struct {
/*   126 */    int IsNode;
/*   127 */    int IsExpanded;
/*   128 */    int HasLines;
/*   129 */    int HasRowSelect;
/*   130 */    int Level;
/*   131 */ } TREEVIEW_ITEM_INFO;
/*   133 */ typedef struct {
/*   134 */    GUI_COLOR ColorBk;
/*   135 */    GUI_COLOR ColorText;
/*   136 */    GUI_COLOR ColorTextBk;
/*   137 */    GUI_COLOR ColorLines;
/*   138 */    GUI_RECT rText;
/*   139 */    TREEVIEW_ITEM_Handle hItem;
/*   140 */    const GUI_FONT * pFont;
/*   141 */    char * pText;
/*   142 */    unsigned char NumLines;
/*   143 */    signed short ax0[3];
/*   144 */    signed short ay0[3];
/*   145 */    signed short ax1[3];
/*   146 */    signed short ay1[3];
/*   147 */    unsigned char NumConnectors;
/*   148 */    signed short axc[16];
/*   149 */    const GUI_BITMAP * pBmPM;
/*   150 */    const GUI_BITMAP * pBmOCL;
/*   151 */    signed short xPosPM, xPosOCL;
/*   152 */    unsigned char IndexPM;
/*   153 */    unsigned char IndexOCL;
/*   154 */ } TREEVIEW_ITEM_DRAW_INFO;
/*   162 */ TREEVIEW_Handle TREEVIEW_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
/*   163 */ TREEVIEW_Handle TREEVIEW_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
/*   164 */ TREEVIEW_Handle TREEVIEW_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*   173 */ void TREEVIEW_Callback(WM_MESSAGE * pMsg);
/*   181 */ int TREEVIEW_AttachItem (TREEVIEW_Handle hObj, TREEVIEW_ITEM_Handle hItem, TREEVIEW_ITEM_Handle hItemAt, int Position);
/*   182 */ void TREEVIEW_DecSel (TREEVIEW_Handle hObj);
/*   183 */ TREEVIEW_ITEM_Handle TREEVIEW_GetItem (TREEVIEW_Handle hObj, TREEVIEW_ITEM_Handle hItem, int Flags);
/*   184 */ TREEVIEW_ITEM_Handle TREEVIEW_GetSel (TREEVIEW_Handle hObj);
/*   185 */ int TREEVIEW_GetUserData (TREEVIEW_Handle hObj, void * pDest, int NumBytes);
/*   186 */ void TREEVIEW_IncSel (TREEVIEW_Handle hObj);
/*   187 */ TREEVIEW_ITEM_Handle TREEVIEW_InsertItem (TREEVIEW_Handle hObj, int IsNode, TREEVIEW_ITEM_Handle hItemPrev, int Position, const char * s);
/*   188 */ int TREEVIEW_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
/*   189 */ void TREEVIEW_ScrollToSel (TREEVIEW_Handle hObj);
/*   190 */ void TREEVIEW_SetAutoScrollH (TREEVIEW_Handle hObj, int State);
/*   191 */ void TREEVIEW_SetAutoScrollV (TREEVIEW_Handle hObj, int State);
/*   192 */ void TREEVIEW_SetBitmapOffset(TREEVIEW_Handle hObj, int Index, int xOff, int yOff);
/*   193 */ void TREEVIEW_SetBkColor (TREEVIEW_Handle hObj, int Index, GUI_COLOR Color);
/*   194 */ void TREEVIEW_SetFont (TREEVIEW_Handle hObj, const GUI_FONT * pFont);
/*   195 */ void TREEVIEW_SetHasLines (TREEVIEW_Handle hObj, int State);
/*   196 */ void TREEVIEW_SetImage (TREEVIEW_Handle hObj, int Index, const GUI_BITMAP * pBitmap);
/*   197 */ int TREEVIEW_SetIndent (TREEVIEW_Handle hObj, int Indent);
/*   198 */ void TREEVIEW_SetLineColor (TREEVIEW_Handle hObj, int Index, GUI_COLOR Color);
/*   199 */ void TREEVIEW_SetOwnerDraw (TREEVIEW_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
/*   200 */ void TREEVIEW_SetSel (TREEVIEW_Handle hObj, TREEVIEW_ITEM_Handle hItem);
/*   201 */ void TREEVIEW_SetSelMode (TREEVIEW_Handle hObj, int Mode);
/*   202 */ void TREEVIEW_SetTextColor (TREEVIEW_Handle hObj, int Index, GUI_COLOR Color);
/*   203 */ int TREEVIEW_SetTextIndent (TREEVIEW_Handle hObj, int TextIndent);
/*   204 */ int TREEVIEW_SetUserData (TREEVIEW_Handle hObj, const void * pSrc, int NumBytes);
/*   213 */ void TREEVIEW_ITEM_Collapse (TREEVIEW_ITEM_Handle hItem);
/*   214 */ void TREEVIEW_ITEM_CollapseAll(TREEVIEW_ITEM_Handle hItem);
/*   215 */ TREEVIEW_ITEM_Handle TREEVIEW_ITEM_Create (int IsNode, const char * s, unsigned long UserData);
/*   216 */ void TREEVIEW_ITEM_Delete (TREEVIEW_ITEM_Handle hItem);
/*   217 */ void TREEVIEW_ITEM_Detach (TREEVIEW_ITEM_Handle hItem);
/*   218 */ void TREEVIEW_ITEM_Expand (TREEVIEW_ITEM_Handle hItem);
/*   219 */ void TREEVIEW_ITEM_ExpandAll (TREEVIEW_ITEM_Handle hItem);
/*   220 */ void TREEVIEW_ITEM_GetInfo (TREEVIEW_ITEM_Handle hItem, TREEVIEW_ITEM_INFO * pInfo);
/*   221 */ void TREEVIEW_ITEM_GetText (TREEVIEW_ITEM_Handle hItem, unsigned char * pBuffer, int MaxNumBytes);
/*   222 */ unsigned long TREEVIEW_ITEM_GetUserData(TREEVIEW_ITEM_Handle hItem);
/*   223 */ void TREEVIEW_ITEM_SetImage (TREEVIEW_ITEM_Handle hItem, int Index, const GUI_BITMAP * pBitmap);
/*   224 */ TREEVIEW_ITEM_Handle TREEVIEW_ITEM_SetText (TREEVIEW_ITEM_Handle hItem, const char * s);
/*   225 */ void TREEVIEW_ITEM_SetUserData(TREEVIEW_ITEM_Handle hItem, unsigned long UserData);
/*   233 */ GUI_COLOR TREEVIEW_GetDefaultBkColor (int Index);
/*   234 */ const GUI_FONT * TREEVIEW_GetDefaultFont (void);
/*   235 */ GUI_COLOR TREEVIEW_GetDefaultLineColor(int Index);
/*   236 */ GUI_COLOR TREEVIEW_GetDefaultTextColor(int Index);
/*   237 */ void TREEVIEW_SetDefaultBkColor (int Index, GUI_COLOR Color);
/*   238 */ void TREEVIEW_SetDefaultFont (const GUI_FONT * pFont);
/*   239 */ void TREEVIEW_SetDefaultLineColor(int Index, GUI_COLOR Color);
/*   240 */ void TREEVIEW_SetDefaultTextColor(int Index, GUI_COLOR Color);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/KNOB.h
 */
/*    73 */ typedef signed long KNOB_Handle;
/*    81 */ KNOB_Handle KNOB_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int Id);
/*    82 */ KNOB_Handle KNOB_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int Id, int NumExtraBytes);
/*    83 */ KNOB_Handle KNOB_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*    92 */ void KNOB_Callback(WM_MESSAGE * pMsg);
/*   100 */ void KNOB_AddValue (KNOB_Handle hObj, signed long Value);
/*   101 */ int KNOB_GetUserData(KNOB_Handle hObj, void * pDest, int NumBytes);
/*   102 */ signed long KNOB_GetValue (KNOB_Handle hObj);
/*   103 */ void KNOB_SetBkColor (KNOB_Handle hObj, GUI_COLOR Color);
/*   104 */ void KNOB_SetBkDevice(KNOB_Handle hObj, GUI_MEMDEV_Handle hMemBk);
/*   105 */ void KNOB_SetDevice (KNOB_Handle hObj, GUI_MEMDEV_Handle hMemSrc);
/*   106 */ void KNOB_SetKeyValue(KNOB_Handle hObj, signed long KeyValue);
/*   107 */ void KNOB_SetOffset (KNOB_Handle hObj, signed long Offset);
/*   108 */ void KNOB_SetPeriod (KNOB_Handle hObj, signed long Period);
/*   109 */ void KNOB_SetPos (KNOB_Handle hObj, signed long Pos);
/*   110 */ void KNOB_SetRange (KNOB_Handle hObj, signed long MinRange, signed long MaxRange);
/*   111 */ void KNOB_SetSnap (KNOB_Handle hObj, signed long Snap);
/*   112 */ void KNOB_SetTickSize(KNOB_Handle hObj, signed long TickSize);
/*   113 */ int KNOB_SetUserData(KNOB_Handle hObj, const void * pSrc, int NumBytes);
/*
 * C:/CodeInspection/DisplayUnit/Middlewares/ST/STemWin/inc/DIALOG.h
 */
/*    95 */ GUI_HWIN WINDOW_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, WM_CALLBACK * cb);
/*    96 */ GUI_HWIN WINDOW_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, WM_CALLBACK * cb, int NumExtraBytes);
/*    97 */ GUI_HWIN WINDOW_CreateIndirect (const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
/*    98 */ GUI_COLOR WINDOW_GetDefaultBkColor(void);
/*    99 */ int WINDOW_GetUserData (GUI_HWIN hObj, void * pDest, int NumBytes);
/*   100 */ void WINDOW_SetBkColor (GUI_HWIN hObj, GUI_COLOR Color);
/*   101 */ void WINDOW_SetDefaultBkColor(GUI_COLOR Color);
/*   102 */ int WINDOW_SetUserData (GUI_HWIN hObj, const void * pSrc, int NumBytes);
/*   104 */ void WINDOW_Callback(WM_MESSAGE * pMsg);
/*
 * C:/CodeInspection/DisplayUnit/STemWin/App/testDLG.c
 */
/*    54 */ static const unsigned char _acImage_0[14342] = {
/*    55 */    0x42, 0x4D, 0x06, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*    56 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    57 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    58 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    59 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B,
/*    60 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    61 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    62 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    63 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    64 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    65 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x6C, 0x6A, 0x69, 0x6D, 0x6B, 0x69, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    66 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    67 */    0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    68 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x33, 0x30, 0x2E, 0xE5, 0xE5, 0xE4, 0xE5, 0xE5, 0xE4,
/*    69 */    0x33, 0x30, 0x2E, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    70 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    71 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    72 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x98, 0x97, 0x96, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x98, 0x97, 0x96, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    73 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    74 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    75 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x49, 0x46,
/*    76 */    0x45, 0xF9, 0xF9, 0xF9, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF9, 0xF9, 0xF9, 0x4A, 0x47, 0x45, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    77 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00,
/*    78 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    79 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0xC3, 0xC2, 0xC1, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xC3, 0xC2, 0xC1,
/*    80 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    81 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    82 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    83 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x6D, 0x6B, 0x69, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x6F, 0x6C, 0x6A, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    84 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    85 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    86 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x33, 0x30, 0x2E, 0xE5, 0xE5, 0xE4, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
/*    87 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xE5, 0xE5, 0xE4, 0x33, 0x30, 0x2E, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    88 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    89 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    90 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x99, 0x98, 0x97, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x99, 0x98, 0x97,
/*    91 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*    92 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    93 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x4A, 0x47, 0x45, 0xF9, 0xF9, 0xF9, 0xFF,
/*    94 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF9, 0xF9, 0xF9, 0x4B, 0x48, 0x46, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    95 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*    96 */    0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    97 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0xC3, 0xC2, 0xC1, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
/*    98 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xC3, 0xC2, 0xC1, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*    99 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   100 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   101 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   102 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   103 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   104 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   105 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   106 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28,
/*   107 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   108 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   109 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   110 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   111 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   112 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   113 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   114 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   115 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   116 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   117 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   118 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   119 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   120 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   121 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   122 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   123 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   124 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   125 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   126 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   127 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   128 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   129 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   130 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   131 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   132 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   133 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   134 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   135 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   136 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   137 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   138 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   139 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   140 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   141 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   142 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   143 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   144 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   145 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   146 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   147 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   148 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   149 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   150 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   151 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   152 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   153 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   154 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   155 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   156 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   157 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   158 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   159 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   160 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   161 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   162 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   163 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   164 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   165 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   166 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   167 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   168 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   169 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   170 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   171 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   172 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   173 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   174 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   175 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   176 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   177 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   178 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   179 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   180 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   181 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   182 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   183 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   184 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   185 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   186 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   187 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   188 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   189 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   190 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   191 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   192 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   193 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   194 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   195 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   196 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   197 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   198 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   199 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   200 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   201 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   202 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   203 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   204 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   205 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   206 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   207 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   208 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   209 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   210 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   211 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   212 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   213 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   214 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   215 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   216 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   217 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   218 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   219 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   220 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   221 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   222 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   223 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   224 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   225 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   226 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   227 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   228 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   229 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   230 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   231 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   232 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   233 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   234 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   235 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   236 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   237 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   238 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   239 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   240 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   241 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   242 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   243 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   244 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   245 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   246 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   247 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   248 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   249 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   250 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   251 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   252 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   253 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   254 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   255 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   256 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   257 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   258 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   259 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   260 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   261 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   262 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   263 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   264 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   265 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   266 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   267 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   268 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   269 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   270 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   271 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   272 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   273 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   274 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   275 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   276 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   277 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   278 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   279 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   280 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   281 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   282 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   283 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   284 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   285 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   286 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   287 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   288 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   289 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   290 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   291 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   292 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   293 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   294 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   295 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   296 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   297 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   298 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   299 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   300 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   301 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   302 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   303 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   304 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   305 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   306 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   307 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   308 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   309 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   310 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   311 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   312 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   313 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   314 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   315 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   316 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   317 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   318 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   319 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   320 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   321 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   322 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   323 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   324 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   325 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   326 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   327 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   328 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   329 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   330 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   331 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   332 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   333 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
/*   334 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2B, 0x28,
/*   335 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   336 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   337 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   338 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   339 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   340 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   341 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   342 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   343 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   344 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   345 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   346 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   347 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   348 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   349 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   350 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   351 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   352 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   353 */    0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   354 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0xC3, 0xC2, 0xC1, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
/*   355 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xC3, 0xC2, 0xC1, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   356 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   357 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   358 */    0x26, 0x4A, 0x47, 0x45, 0xF9, 0xF9, 0xF9, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF9, 0xF9, 0xF9, 0x49, 0x46, 0x45, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   359 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   360 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   361 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x99, 0x98, 0x97, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
/*   362 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x98, 0x97, 0x96, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   363 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B,
/*   364 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   365 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x33, 0x30, 0x2E, 0xE5, 0xE5, 0xE4, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xE5, 0xE5, 0xE4, 0x33,
/*   366 */    0x30, 0x2E, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   367 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   368 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   369 */    0x26, 0x6F, 0x6C, 0x6A, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x6D, 0x6B, 0x69, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   370 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   371 */    0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   372 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0xC3, 0xC2, 0xC1, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
/*   373 */    0xFF, 0xFF, 0xFF, 0xC2, 0xC1, 0xC1, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   374 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   375 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   376 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x4A, 0x47, 0x45, 0xF9, 0xF9, 0xF9, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF9, 0xF9, 0xF9, 0x49, 0x46, 0x45, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   377 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   378 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   379 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   380 */    0x26, 0x99, 0x98, 0x97, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x98, 0x96, 0x95, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   381 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00,
/*   382 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   383 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x33, 0x30, 0x2E, 0xE5, 0xE5, 0xE4, 0xE5, 0xE5, 0xE4, 0x33, 0x30, 0x2E, 0x2B, 0x28, 0x26,
/*   384 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   385 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   386 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   387 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x6F, 0x6C, 0x6A, 0x6C, 0x6A, 0x69, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   388 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B,
/*   389 */    0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   390 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   391 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28,
/*   392 */    0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   393 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   394 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   395 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26,
/*   396 */    0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x2B, 0x28, 0x26, 0x00, 0x00,
/*   397 */ };
/*   406 */ static const GUI_WIDGET_CREATE_INFO _aDialogCreate[] = {
/*   407 */    { WINDOW_CreateIndirect, "test", (0x800 + 0x00), 0, 0, 480, 286, 0, 0x0, 0 },
/*   408 */    { LISTWHEEL_CreateIndirect, "Listwheel", (0x800 + 0x02), 64, 30, 204, 78, 0, 0x0, 0 },
/*   409 */    { TEXT_CreateIndirect, "Text", (0x800 + 0x03), 159, 206, 80, 20, 0, 0x0, 0 },
/*   410 */    { TEXT_CreateIndirect, "Text", (0x800 + 0x04), 123, 211, 80, 20, 0, 0x0, 0 },
/*   411 */    { TEXT_CreateIndirect, "Text", (0x800 + 0x05), 370, 136, 80, 20, 0, 0x0, 0 },
/*   412 */    { IMAGE_CreateIndirect, "Image", (0x800 + 0x06), 65, 144, 50, 94, 0, 0, 0 },
/*   415 */ };
/*   427 */ static const void * _GetImageById(unsigned long Id, unsigned long * pSize) {
/*   428 */    switch (Id) {
/*   429 */    case 0x00:
/*   430 */       *pSize = sizeof(_acImage_0);
/*   431 */       return (const void *)_acImage_0;
/*   432 */    }
/*   433 */    return ((void *) 0);
/*   434 */ }
/*   443 */ static void _cbDialog(WM_MESSAGE * pMsg) {
/*   444 */    const void * pData;
/*   445 */    GUI_HWIN hItem;
/*   446 */    unsigned long FileSize;
/*   447 */    int NCode;
/*   448 */    int Id;
/*   452 */    switch (pMsg->MsgId) {
/*   453 */    case 29:
/*   457 */       hItem = pMsg->hWin;
/*   458 */       WINDOW_SetBkColor(hItem, (0x001C1B1A));
/*   462 */       hItem = WM_GetDialogItem(pMsg->hWin, (0x800 + 0x02));
/*   463 */       LISTWHEEL_AddString(hItem, "test1");
/*   464 */       LISTWHEEL_AddString(hItem, "test2");
/*   465 */       LISTWHEEL_AddString(hItem, "test3");
/*   466 */       LISTWHEEL_AddString(hItem, "test4");
/*   470 */       hItem = WM_GetDialogItem(pMsg->hWin, (0x800 + 0x03));
/*   471 */       TEXT_SetFont(hItem, &GUI_Font13_1);
/*   475 */       hItem = WM_GetDialogItem(pMsg->hWin, (0x800 + 0x04));
/*   476 */       TEXT_SetFont(hItem, &GUI_Font13_1);
/*   477 */       TEXT_SetTextAlign(hItem, (2<<0) | (1<<2));
/*   481 */       hItem = WM_GetDialogItem(pMsg->hWin, (0x800 + 0x05));
/*   482 */       TEXT_SetFont(hItem, &GUI_Font13_1);
/*   486 */       hItem = WM_GetDialogItem(pMsg->hWin, (0x800 + 0x06));
/*   487 */       pData = _GetImageById(0x00, &FileSize);
/*   488 */       IMAGE_SetBMP(hItem, pData, FileSize);
/*   491 */       break;
/*   492 */    case 38:
/*   493 */       Id = WM_GetId(pMsg->hWinSrc);
/*   494 */       NCode = pMsg->Data.v;
/*   495 */       switch(Id) {
/*   496 */       case (0x800 + 0x02):
/*   497 */          switch(NCode) {
/*   498 */          case 1:
/*   501 */             break;
/*   502 */          case 2:
/*   505 */             break;
/*   506 */          case 4:
/*   509 */             break;
/*   512 */          }
/*   513 */          break;
/*   516 */       }
/*   517 */       break;
/*   520 */    default:
/*   521 */       WM_DefaultProc(pMsg);
/*   522 */       break;
/*   523 */    }
/*   524 */ }
/*   536 */ GUI_HWIN Createtest(void);
/*   537 */ GUI_HWIN Createtest(void) {
/*   538 */    GUI_HWIN hWin;
/*   540 */    hWin = GUI_CreateDialogBox(_aDialogCreate, (sizeof(_aDialogCreate) / sizeof(_aDialogCreate[0])), _cbDialog, WM_GetDesktopWindow(), 0, 0);
/*   541 */    return hWin;
/*   542 */ }
/*   547 */ 
