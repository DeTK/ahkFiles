FileSelectFile, p

Wait_img(p, true) ;이미지 찾을시 해당 이미지를 클릭하게한다

ClickFunc(vX, vY) ; 좌표 1000, 500 클릭



Wait_img(img, Click := false){
 while !ErrorLevel = 0 ; 이미지를 찾을 때까지
  ImageSearch, vX, vY, 0, 0, A_ScreenWidth, A_ScreenHeight, img
  global vXx := vX
  global vYy := vY
 return ((Click == true) ? ClickFunc(vXx, vYy) : 0)
}



ClickFunc(X, Y){
 MouseMove, %X%, %Y%
 MsgBox %X% %Y%
}