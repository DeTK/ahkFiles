search_img(image,hwnd, byref vx, byref vy) {
pToken:=Gdip_Startup() 
pBitmapHayStack:=Gdip_BitmapFromhwnd(hwnd) 
pBitmapNeedle:=Gdip_CreateBitmapFromFile(image) 

Sleep, 1000
if Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,0,0,0,0,10,0x000000,1,1) {  
StringSplit, LISTArray, LIST, `,  
vx:=LISTArray1 
vy:=LISTArray2
Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
Gdip_Shutdown(pToken)
return true
}
else 
{
Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
Gdip_Shutdown(pToken)
return false
}
}

이 행에는 인식 된 작업이 없습니다.