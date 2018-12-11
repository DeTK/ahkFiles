#include Gdip.ahk

ImageSearch_Inactive(Title, ImgFileName)
{
	If !pToken := Gdip_Startup()
	{
		MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
		ExitApp
	}
	OnExit, Exit

	pBitmapHayStack := Gdip_BitmapFromHWND(hwnd := WinExist(Title)) 
	pBitmapNeedle := Gdip_CreateBitmapFromFile(ImgFileName)

	Width1 := Gdip_GetImageWidth(pBitmapHayStack), Height1 := Gdip_GetImageHeight(pBitmapHayStack)
	Width2 := Gdip_GetImageWidth(pBitmapNeedle), Height2 := Gdip_GetImageHeight(pBitmapNeedle)
	E1 := Gdip_LockBits(pBitmapHayStack, 0, 0, Width1, Height1, Stride1, Scan01,BitmapData1)
	E2 := Gdip_LockBits(pBitmapNeedle, 0, 0, Width2, Height2, Stride2, Scan02,BitmapData2)

	MCode(Gdip_ImageSearch, "83EC148B4424309983E20303C28BC88B442434995383E2035503C2C1F80256C1F902837C24"
	. "30005789442420C7442410000000000F8EBE0000008B5C24288B7C24388D048D00000000894424188B442430895C241CE"
	. "B098DA424000000008BFFC74424440000000085C07E6D895C24148B6C242CC7442440000000008D6424008B4C24403B4C"
	. "243C0F8D8600000033C985FF7E158BD58BF38B063B02751F4183C20483C6043BCF7CEF8B442420035C2418FF44244003C"
	. "003C003E8EBC38B4C24448B5C24148B4424304183C3043BC8894C2444895C24147C978B4C24108B5C241C035C2418413B"
	. "4C2434894C2410895C241C0F8C68FFFFFF8B5424488B44244C5F5E5DC702FFFFFFFFC700FFFFFFFF5B83C414C38B4C244"
	. "48B5424488B44244C5F495E890A8B4C24085D89085B83C414C3")

	Time1 := A_TickCount
	VarSetCapacity(x, 8, 0), VarSetCapacity(y, 8, 0)
	Loop, 100
		DllCall(&Gdip_ImageSearch, "uint", Scan01, "uint", Scan02, "int", Width1, "int", Height1, "int", Width2, "int", Height2, "int", Stride1, "int", Stride2, "int*", x, "int*", y)
	MsgBox, % "Time for 100 searches: " A_TickCount-Time1 "ms`nx: " x "`ny: " y ;%
	
	Gdip_UnlockBits(pBitmapHayStack,BitmapData1), Gdip_UnlockBits(pBitmapNeedle,BitmapData2)
	Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
	return
}

MCode(ByRef code, hex)
{
	VarSetCapacity(code, StrLen(hex)//2)
	Loop % StrLen(hex)//2 ;%
		NumPut("0x" SubStr(hex, 2*A_Index-1, 2), code, A_Index-1, "char")
}

F9::
	ImageSearch_Inactive("����","Calc.bmp")
	return

Exit:
	Gdip_Shutdown(pToken)
	ExitApp
	return