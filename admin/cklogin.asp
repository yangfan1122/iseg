<%
name=trim(request.Form("username"))
pass=trim(request.Form("password")) 
if name="" or pass="" then
response.write "<script language=javascript>alert('û�������û��������룡');history.back(-1)</script>" 
end if
if name="1" and pass="1" then
session("wutianlaoshi")="yes"
response.redirect "portal.asp"
else
response.write "<script language=javascript>alert('�û����������������');history.back(-1)</script>"
end if
%>