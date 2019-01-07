username := "sda2225@gmail.com"
password := "skaltk12"

API_URL := "https://i.instagram.com/api/v1/"
DEVICE_SETTINTS := {manufacturer: "Xiaomi", model: "HM 1SW", android_version: 18, android_release: 4.3}
USER_AGENT := "Instagram 10.26.0 Android (" DEVICE_SETTINTS["android_version"] "/" DEVICE_SETTINTS["android_release"] "; 320dpi; 720x1280; " DEVICE_SETTINTS["manufacturer"] "; " DEVICE_SETTINTS["model"] "; armani; qcom; en_US)"
IG_SIG_KEY := "4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
SIG_KEY_VERSION := 4

device_id := "android-" SubStr(bcrypt_md5(bcrypt_md5(username password) 12345), 1, 16)
uuid := generateUUID(true)
HTTP := ComObjCreate("WinHTTP.WinHTTPRequest.5.1")
HTTP.Open("GET", API_URL "si/fetch_headers/?challenge_type=signup&guid=" generateUUID(False), true)
HTTP.SetRequestHeader("Connection", "close")
HTTP.SetRequestHeader("Accept", "*/*")
HTTP.SetRequestHeader("Cookie2", "$Version=1")
HTTP.SetRequestHeader("Accept-Language", "en-US")
HTTP.SetRequestHeader("User-Agent", USER_AGENT)
HTTP.Send()
HTTP.WaitForResponse()
csrftoken := RegexReplace(HTTP.getAllResponseHeaders, "s)^.*Set-Cookie: csrftoken=(.+?);.*$", "$1")   ; даётся на год
data := "{""phone_id"": """ generateUUID(true) """, ""_csrftoken"": """ csrftoken """, ""username"": """ username """, ""guid"": """ uuid """, ""device_id"": """ device_id """, ""password"": """ password """, ""login_attempt_count"": ""0""}"
Signature := "ig_sig_key_version=" SIG_KEY_VERSION "&signed_body=" HMAC(IG_SIG_KEY, data, "SHA256") "." UriEncode(data)

HTTP.Open("POST", API_URL "accounts/login/", true)
HTTP.SetRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8")
HTTP.SetRequestHeader("Connection", "close")
HTTP.SetRequestHeader("Accept", "*/*")
HTTP.SetRequestHeader("Cookie2", "$Version=1")
HTTP.SetRequestHeader("Accept-Language", "en-US")
HTTP.SetRequestHeader("User-Agent", USER_AGENT)
HTTP.Send(Signature)
HTTP.WaitForResponse()
msgbox % HTTP.responsetext
return



generateUUID(type)
{
   VarSetCapacity(puuid, 16, 0)
   if !(DllCall("rpcrt4.dll\UuidCreate", "ptr", &puuid))
   {
      if !(DllCall("rpcrt4.dll\UuidToString", "ptr", &puuid, "uint*", suuid))
      {
         if type
            return StrGet(suuid), DllCall("rpcrt4.dll\RpcStringFree", "uint*", suuid)
         else
            return StrReplace(StrGet(suuid), "-"), DllCall("rpcrt4.dll\RpcStringFree", "uint*", suuid)
      }
   }
   return ""
}



UriEncode(Uri, RE="[0-9A-Za-z]")
{
   VarSetCapacity(Var, StrPut(Uri, "UTF-8"), 0), StrPut(Uri, &Var, "UTF-8")
   While Code := NumGet(Var, A_Index - 1, "UChar")
      Res .= (Chr:=Chr(Code)) ~= RE ? Chr : Format("%{:02X}", Code)
   Return, Res
}



bcrypt_md5(string)
{
    static BCRYPT_MD5_ALGORITHM := "MD5"
    static BCRYPT_OBJECT_LENGTH := "ObjectLength"
    static BCRYPT_HASH_LENGTH   := "HashDigestLength"

    if !(hBCRYPT := DllCall("LoadLibrary", "str", "bcrypt.dll", "ptr"))
        throw Exception("Failed to load bcrypt.dll", -1)

    if (NT_STATUS := DllCall("bcrypt\BCryptOpenAlgorithmProvider", "ptr*", hAlgo, "ptr", &BCRYPT_MD5_ALGORITHM, "ptr", 0, "uint", 0) != 0)
        throw Exception("BCryptOpenAlgorithmProvider: " NT_STATUS, -1)

    if (NT_STATUS := DllCall("bcrypt\BCryptGetProperty", "ptr", hAlgo, "ptr", &BCRYPT_OBJECT_LENGTH, "uint*", cbHashObject, "uint", 4, "uint*", cbResult, "uint", 0) != 0)
        throw Exception("BCryptGetProperty: " NT_STATUS, -1)

    if (NT_STATUS := DllCall("bcrypt\BCryptGetProperty", "ptr", hAlgo, "ptr", &BCRYPT_HASH_LENGTH, "uint*", cbHash, "uint", 4, "uint*", cbResult, "uint", 0) != 0)
        throw Exception("BCryptGetProperty: " NT_STATUS, -1)

    VarSetCapacity(pbHashObject, cbHashObject, 0)
    if (NT_STATUS := DllCall("bcrypt\BCryptCreateHash", "ptr", hAlgo, "ptr*", hHash, "ptr", &pbHashObject, "uint", cbHashObject, "ptr", 0, "uint", 0, "uint", 0) != 0)
        throw Exception("BCryptCreateHash: " NT_STATUS, -1)

    VarSetCapacity(pbInput, StrPut(string, "UTF-8"), 0) && cbInput := StrPut(string, &pbInput, "UTF-8") - 1
    if (NT_STATUS := DllCall("bcrypt\BCryptHashData", "ptr", hHash, "ptr", &pbInput, "uint", cbInput, "uint", 0) != 0)
        throw Exception("BCryptHashData: " NT_STATUS, -1)

    VarSetCapacity(pbHash, cbHash, 0)
    if (NT_STATUS := DllCall("bcrypt\BCryptFinishHash", "ptr", hHash, "ptr", &pbHash, "uint", cbHash, "uint", 0) != 0)
        throw Exception("BCryptFinishHash: " NT_STATUS, -1)

    loop % cbHash
        hash .= Format("{:02x}", NumGet(pbHash, A_Index - 1, "uchar"))

    DllCall("bcrypt\BCryptDestroyHash", "ptr", hHash)
    DllCall("bcrypt\BCryptCloseAlgorithmProvider", "ptr", hAlgo, "uint", 0)
    DllCall("FreeLibrary", "ptr", hBCRYPT)

    return hash
}




HMAC(Key, Message, Algo := "MD5")
{
   static Algorithms := {MD2:    {ID: 0x8001, Size:  64}
                                   , MD4:    {ID: 0x8002, Size:  64}
                                   , MD5:    {ID: 0x8003, Size:  64}
                                   , SHA:    {ID: 0x8004, Size:  64}
                                   , SHA256: {ID: 0x800C, Size:  64}
                                   , SHA384: {ID: 0x800D, Size: 128}
                                   , SHA512: {ID: 0x800E, Size: 128}}
   static iconst := 0x36
   static oconst := 0x5C
   if (!(Algorithms.HasKey(Algo)))
   {
      return ""
   }
   Hash := KeyHashLen := InnerHashLen := ""
   HashLen := 0
   AlgID := Algorithms[Algo].ID
   BlockSize := Algorithms[Algo].Size
   MsgLen := StrPut(Message, "UTF-8") - 1
   KeyLen := StrPut(Key, "UTF-8") - 1
   VarSetCapacity(K, KeyLen + 1, 0)
   StrPut(Key, &K, KeyLen, "UTF-8")
   if (KeyLen > BlockSize)
   {
      LC_CalcAddrHash(&K, KeyLen, AlgID, KeyHash, KeyHashLen)
   }

   VarSetCapacity(ipad, BlockSize + MsgLen, iconst)
   Addr := KeyLen > BlockSize ? &KeyHash : &K
   Length := KeyLen > BlockSize ? KeyHashLen : KeyLen
   i := 0
   while (i < Length)
   {
      NumPut(NumGet(Addr + 0, i, "UChar") ^ iconst, ipad, i, "UChar")
      i++
   }
   if (MsgLen)
   {
      StrPut(Message, &ipad + BlockSize, MsgLen, "UTF-8")
   }
   LC_CalcAddrHash(&ipad, BlockSize + MsgLen, AlgID, InnerHash, InnerHashLen)

   VarSetCapacity(opad, BlockSize + InnerHashLen, oconst)
   Addr := KeyLen > BlockSize ? &KeyHash : &K
   Length := KeyLen > BlockSize ? KeyHashLen : KeyLen
   i := 0
   while (i < Length)
   {
      NumPut(NumGet(Addr + 0, i, "UChar") ^ oconst, opad, i, "UChar")
      i++
   }
   Addr := &opad + BlockSize
   i := 0
   while (i < InnerHashLen)
   {
      NumPut(NumGet(InnerHash, i, "UChar"), Addr + i, 0, "UChar")
      i++
   }
   return LC_CalcAddrHash(&opad, BlockSize + InnerHashLen, AlgID)
}



LC_CalcAddrHash(addr, length, algid, byref hash = 0, byref hashlength = 0)
{
   static h := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "a", "b", "c", "d", "e", "f"]
   static b := h.minIndex()
   hProv := hHash := o := ""
   if (DllCall("advapi32\CryptAcquireContext", "Ptr*", hProv, "Ptr", 0, "Ptr", 0, "UInt", 24, "UInt", 0xf0000000))
   {
      if (DllCall("advapi32\CryptCreateHash", "Ptr", hProv, "UInt", algid, "UInt", 0, "UInt", 0, "Ptr*", hHash))
      {
         if (DllCall("advapi32\CryptHashData", "Ptr", hHash, "Ptr", addr, "UInt", length, "UInt", 0))
         {
            if (DllCall("advapi32\CryptGetHashParam", "Ptr", hHash, "UInt", 2, "Ptr", 0, "UInt*", hashlength, "UInt", 0))
            {
               VarSetCapacity(hash, hashlength, 0)
               if (DllCall("advapi32\CryptGetHashParam", "Ptr", hHash, "UInt", 2, "Ptr", &hash, "UInt*", hashlength, "UInt", 0))
               {
                  loop % hashlength
                  {
                     v := NumGet(hash, A_Index - 1, "UChar")
                     o .= h[(v >> 4) + b] h[(v & 0xf) + b]
                  }
               }
            }
         }
         DllCall("advapi32\CryptDestroyHash", "Ptr", hHash)
      }
      DllCall("advapi32\CryptReleaseContext", "Ptr", hProv, "UInt", 0)
   }
   return o
}