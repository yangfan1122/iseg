<%
name=trim(request.Form("username"))
pass=trim(request.Form("password")) 
if name="" or pass="" then
response.write "<script language=javascript>alert('�Բ�����û�������û��������룡');history.back(-1)</script>" 
end if
if name="admin" and pass="admin" then
session("wutianlaoshi")="yes"
response.redirect "portal.asp"
else
response.write "<script language=javascript>alert('�Բ����û����������������');history.back(-1)</script>"
end if
%>