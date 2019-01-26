WB := ComObjCreate( "InternetExplorer.Application" )
tempstr :=
WB.navigate( "https://www.naver.com" )
WB.Visible := true
상태(WB)
WB.navigate( "https://www.coinbit.co.kr/trade/order" )
상태(WB)



상태(WB)
{
    
    while(WB.readyState!=4 || WB.document.readyState != "complete" || WB.busy)
    {
    }
}
