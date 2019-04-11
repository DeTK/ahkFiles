


Gui, +AlwaysOnTop
Gui, add, Edit, w50 h20 vnum,
Gui, show, w200 h100
return

GuiClose:
ExitApp

F1::
Gui, Submit, NoHide
s1 = 
(
// ==UserScript==
// @name         검색창
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://yeyak.seoul.go.kr/search/totalSearchView.web*
// @grant        none
// ==/UserScript==
const timevalue = ``10시 00분``;
const scriptcontent = ``
let navytime = '';
let navy = window.open('https://time.navyism.com','네이비','width=1,height=1');
window.addEventListener('message', function(e){
   if (e.origin === 'https://time.navyism.com'){
      navytime = e.data;
   } else if (e.data === "ok"){
      console.log("들어옴");
      clearInterval(navys);
   }
});
function navytimeget(){navy.postMessage('get', 'https://time.navyism.com')}
const navys = setInterval(function(){navytimeget();
if (navytime.indexOf('${timevalue}') !== -1){
   document.querySelector('#startbutton').click();
   clearInterval(navys);
}},50);
``
$(document).ready(function(){
    const s = document.createElement("script");
    s.innerText = scriptcontent;
    //document.querySelector("body").appendChild(s);
    var leftNum = 10;
    var list = [["고척스카이돔 야외 축구장", "고척"], ["보라매공원 인조잔디 축구장", "보라"], ["대림운동장인조잔디구장", "대림"]];
    for (var i = 0; i < list.length; i++)
    {
        $('.allSearch').append($('<input/>', {
            type: 'button',
            style: 'position: relative; \
left: ' + (452 + (leftNum * i)) + 'px; \
top: -33px; \
font-size: 18px; \
font-family: -webkit-body;\
display: inline; \
width: 40px; \
height: 34px;',
            onclick: "javascript: document.querySelector('#allSearch').value = '" + list[i][0] +"'; \
doSearch();",
            value: list[i][1]
        }));
    }
    $('.allSearch').append($('<input/>', {
        type: 'button',
        id : "startbutton",
        style: 'position: relative; \
left: ' + (452 + (leftNum * i)) + 'px; \
top: -33px; \
font-size: 18px; \
font-family: -webkit-body;\
display: inline; \
width: 40px; \
height: 34px;',
        onclick: ``javascript:
try{
   winObj.postMessage('ang', 'https://yeyak.seoul.go.kr');
}
catch (e){}
function reservationApp(svcid, v1, v2){
$.ajax({
   type:'GET',
   url:'/reservation/getRsvReqKey.web',
   data:'svcid='+svcid,
   datatype:'JSON',
   success:function(keyInfo){
      var protocol='https';
      if(location.href.indexOf('https://')<0){
         protocol='https';
      }
      var _url=protocol+'://'+location.host+'/request.web?l='+getLangCode()+'&svcId='+svcid+'&rsvreqkey='+keyInfo.rsvReqKey;
      winObj=window.open(_url,'reservationAppPopup','width=900,height=600,resizable=yes,scrollbars=yes,scrollbars=yes');
      var s2 = setInterval(() => {
         try{
            winObj.document.querySelector('#myday').value = v1;
            winObj.document.querySelector('#mytime').value = v2;
            if(winObj.document.querySelector('#myday').value == v1){
               clearInterval(s2);
            }
         }
         catch(e){}
      }, 0);
   },
   complete:function(){}})}
const sid1 = 'S110408171156028331'; // 평일야간 보라매
const sid2 = 'S110408173233983188'; // 토요주간 6 13 20 27 보라매
const sid3 = 'S181228131607891777'; // 대림
reservationApp(sid3,'%num%','20');``,
        value: '%num%일'
    }));
});
)
Clipboard := s1
sendinput, ^a{Del}^v^s
return
F2::
Clipboard := s2
sendinput, ^a{Del}^v
return