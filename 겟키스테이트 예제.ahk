~ctrl::
While (GetKeyState("ctrl")) ; 해당키가 눌려있을경우
{
    sendinput, {a} ; f5
    sleep,1000 ; 1초슬립
}
returnaa