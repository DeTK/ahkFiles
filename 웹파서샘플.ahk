Browser_Forward::Reload
Browser_Back::
;***********resources******************* 
;~ http://the-automator.com/web-scraping-intro-with-autohotkey/ ;video series & AutoHotkey syntax writer
;~ https://www.w3.org/TR/css3-selectors/#negation
;~ http://www.w3schools.com/cssref/trysel.asp ;this is a great tool for testing how it works!
;~ http://help.dottoro.com/lcoeqcte.php
;~ http://www.cheetyr.com/css-selectors ;cheat sheet
;~ http://code.tutsplus.com/tutorials/the-30-css-selectors-you-must-memorize--net-16048
;~ http://www.w3schools.com/cssref/css_selectors.asp
;~ https://www.w3.org/TR/css3-selectors/#selectors
;****************************** 
gosub Start_Page ;make sure on 1st AutoHotkey start page
gosub High_Level
;~ gosub Radio_And_Checkboxes
;~ gosub Elements
;~ gosub Class_and_Attributes
;~ gosub ID_And_Attributes
;~ gosub Attribs_And_Elements
;~ gosub Nesting
;~ gosub Advanced
;~ gosub Negation
return
 
High_Level:
;~ SciTE_Output(Pwb.document.documentElement.OuterHTML) ;typical way to get all html
;~ SciTE_Output(Pwb.document.querySelectorAll("html")[0].OuterHTML) ;get entire html of page
 
;~ SciTE_Output(Pwb.document.querySelectorAll("body")[0].OuterHTML) ;Get html body of page
;~ MsgBox % Pwb.document.querySelectorAll("img")[0].OuterHTML ;Gets 1st image
;~ len:=Pwb.document.querySelectorAll("img").length
;~ loop % Pwb.document.querySelectorAll("img").length  
    ;~ imag.= a_index a_tab Pwb.document.querySelectorAll("img")[a_index-1].href "`r`n"
;~ SciTE_Output(imag)
return
 
;***********check box / radio buttons******************* 
Radio_And_Checkboxes:
;~ MsgBox % pwb.document.querySelectorAll("option")[2].innerTEXT ; 1st one Not selected
;~ MsgBox % pwb.document.querySelectorAll("option:not([checked])")[3].outerHTML ; 1st one Not selected
;~ MsgBox % pwb.document.querySelectorAll("option:checked")[0].outerHTML ; gets the 1st div where id is parent element
    ;~ MsgBox % pwb.document.querySelectorAll("option:disabled")[0].outerHTML ; NEED TO TEST
;~ MsgBox % pwb.document.querySelectorAll("option:enabled")[0].outerHTML ; finds first enabled
 
 
;***********Elements******************* 
Elements:
;~ MsgBox % pwb.document.querySelectorAll("input")[0].outerHTML ; gets the 1st input tagname
;~ MsgBox % pwb.document.queryselectorAll("p")[0].outerHTML ; gets the 1st div where id is a sibling
;~ MsgBox % pwb.document.querySelectorAll("#header-container")[0].outerHTML ; gets the 1st div where id is parent element
;~ MsgBox % pwb.document.querySelectorAll(".socialicons")[0].outerHTML ; gets the 1st class having entry-title
return
 
;***********Classname and Attributes ***********************
Class_and_Attributes:                     ;    . finds class
;~ MsgBox % pwb.document.querySelectorAll(".socialicons[title='LinkedIn']")[0].outerHTML ; gets the 1st class having entry-title
;~ MsgBox % pwb.document.querySelectorAll("div.hfeed, div.a2a_button_twitter")[0].outerHTML ; gets works as Or
return
 
;***********IDs and Attributes******************* 
ID_And_Attributes:         ;   # finds ID   
;~ Matching Substring at Beginning ^=     or     $= for at the End  use *= for matching pattern
;~ MsgBox % pwb.document.querySelectorAll("[id='header-container']")[0].OuterHTML ; gets the 1st id=header-container
;~ MsgBox % pwb.document.querySelectorAll("[id^='header-con']")[0].OuterHTML ; gets the 1st id starting with "header-con"
;~ MsgBox % pwb.document.querySelectorAll("[id|='secondary']")[0].OuterHTML ; gets the 1st id where values are hyphen-seperated-values
;~ MsgBox % pwb.document.querySelectorAll("[id$='container']")[0].outerHTML ; gets the 1st id ending with "container"
;~ MsgBox % pwb.document.querySelectorAll("[id*='cont']")[0].outerHTML ; gets the 1st id having "cont" somewhere in it
;~ MsgBox % pwb.document.querySelectorAll("[id~='sheader']")[0].OuterHTML ; gets the contains sheader
;~ MsgBox % pwb.document.querySelectorAll("#header,#prime_nav")[0].OuterHTML ; gets id header or id prime_nav
return
 
;***********Attributes with Element / Attribute ******************* 
Attribs_And_Elements:
;~ MsgBox % pwb.document.querySelectorAll("input[placeholder]")[0].outerHTML ; gets the 1st input element having an attribute of "placeholder"
;~ MsgBox % pwb.document.querySelectorAll("script[type='text/javascript']")[0].outerHTML ; gets 1st script with type ="text/javascript"
;~ MsgBox % pwb.document.querySelectorAll("[id='tag_cloud-3'] [title='18 topics']")[0].outerHTML ;gets 1st title "18 topics" title INSIDE tag_cloud-3 ID
;~ MsgBox % pwb.document.querySelectorAll("[id='tag_cloud-3'] [href*='humor'] ")[0].outerHTML ;gets 1st "humor" href INSIDE tag_cloud-3 ID
return
 
;***********Nesting******************* 
Nesting:
;~ MsgBox % pwb.document.queryselector("[id] > div").outerHTML ; gets the 1st div where id is THE parent element (meanind direct child)
;~ MsgBox % pwb.document.queryselector("[id] ~ div").outerHTML ; gets the 1st div where id is a sibling
;~ MsgBox % pwb.document.queryselector("[id='topbar'] > div").outerHTML ; gets the 1st div where id is parent element
;~ MsgBox % pwb.document.queryselectorAll("h1,h3,span")[0].outerHTML ; gets the 1st h1, h3 or span element
;~ MsgBox % pwb.document.queryselectorAll("a[href*='glines']")[0].outerHTML ; gets the 1st div where id is parent element
return
 
;***********advanced web scraping with AutoHotkey******************* 
Advanced:
;~ MsgBox % pwb.document.queryselectorAll("li:nth-child(2)")[0].outerHTML ; Instead of incrementing index, 
;~ MsgBox % pwb.document.queryselectorAll("li:nth-last-child(2)")[0].outerHTML ; Starts at bottom and works backward
;~ MsgBox % pwb.document.queryselectorAll("li:nth-of-type(3)")[0].outerHTML ; Finds nth type of li
;~ MsgBox % pwb.document.queryselectorAll("li:nth-last-of-type(1)")[0].outerHTML ; Finds last nth type of li-then works backward
;~ MsgBox % pwb.document.queryselectorAll("li:first-child")[0].outerHTML ; Finds 1st child of first li
;~ MsgBox % pwb.document.queryselectorAll("li:last-child")[0].outerHTML ; Finds Last child of first li
;~ MsgBox % pwb.document.queryselectorAll("span:only-child")[0].outerHTML ; Finds cases that only have one child
 
;  find first ul on page- then find immediat children, then filter that to only 3rd item in set
;~ MsgBox % pwb.document.queryselectorAll("ul:first-of-type > li:nth-child(3)")[0].outerHTML 
 
;~ MsgBox % pwb.document.querySelectorAll("span:empty")[0].outerHTML ; find span with no children
;~ MsgBox % pwb.document.querySelectorAll("p::first-letter")[0].outerHTML ; find span 
 
;~ MsgBox % pwb.document.queryselectorAll("input:valid")[0].outerHTML 
;~ MsgBox % pwb.document.queryselectorAll("input:optional")[0].outerHTML 
;~ MsgBox % pwb.document.queryselectorAll("input:required")[0].outerHTML 
 
;~ MsgBox % pwb.document.querySelectorAll("div>p>img")[0].outerHTML ; img is child of p which is child of div
;~ MsgBox % pwb.document.querySelectorAll("div * p")[0].outerHTML ; p element that is grandchild or later descendant of div
;~ MsgBox % pwb.document.querySelectorAll("div p [href]")[0].outerHTML ; p element that is grandchild or later descendant of div
return
 
;***********negation******************* 
Negation:
;~ MsgBox % pwb.document.querySelectorAll("a:not([href*='http'])")[0].href ;first link that doesn't have http in it
  
 ;~ loop % pwb.document.querySelectorAll("meta").length
    ;~ li.=A_Index a_tab pwb.document.querySelectorAll("meta")[A_Index-1].name "`r`n"
;~ SciTE_Output(li)
MsgBox pause
 ;~ loop % pwb.document.querySelectorAll("meta:not([name*='twitter'])").length
    ;~ li.=A_Index a_tab pwb.document.querySelectorAll("meta:not([name*='twitter'])")[A_Index-1].name "`r`n"
;~ SciTE_Output(li)
 
MsgBox pause
 
 
Loop % pwb.document.querySelectorAll("a:not([href*='facebook'])").length
    lnk.=A_index a_tab pwb.document.querySelectorAll("a:not([href*='facebook'])")[A_Index-1].href "`r`n"
SciTE_Output(lnk)    
return
 
;*****web scraping with AutoHotkey************************* 
;***********Make sure on right page******************* 
Start_Page:
URL:="http://the-automator.com/contact-the-automator-2/"
pwb := WBGet()
Page:=PWB.LocationURL ;get current URL
    if (Page != URL) ;If not on the right page, navigate to it
        pwb.Navigate(URL) ; Navigate webpage
while, pwb.ReadyState != 4 ;wait for page to load
   Sleep, 100   
return
 
;***********SciTE output window function******************* 
SciTE_Output(Text="",Clear="1",LineBreak="1",Pause="0"){
oSciTE := ComObjActive("SciTE4AHK.Application") ;get pointer to active SciTE window
If (Clear=1)
    oSciTE.Message(0x111,420)  ;Clear output
if (LineBreak=1)
    Text:="`r`n" Text ;prepend newline to text
 
oSciTE.Output(Text) ;send text to output pane
if Pause
    MsgBox, 36, Continue?, Continue?
IfMsgBox No
    ExitApp
}
 