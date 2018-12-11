
driver := ComObjCreate("Selenium.WebDriver")  ; 크롬 드라이버
driver.Start("chrome", "/")
F1::
driver.Get("http://the-automator.com/")
s := driver.FindElementsByXPath("//*[@id='post-2705']/div/ul[1]/li[4]")
MsgBox, %s%
Return