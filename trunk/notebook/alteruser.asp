<%
if request.servervariables("REQUEST_METHOD")<>"POST" then
  response.redirect "no.htm"
  response.end
end if
%>

<!--#include file="dbpath.asp" -->
<!--#include file="char.inc" -->

<%
Dim rs
set rs=server.createobject("adodb.recordset")
rs.open "select * from userdata where noteuser='"&session("curruser")&"'",Conn,1,3
rs("pswd")=Trim(request.form("mypwd"))
rs("mailbox")=request.form("myemail")
rs("usersite")=request.form("homepage")
rs("memory")=request.form("memory")
rs.update
rs.close
set rs=nothing
Conn.close
set Conn=nothing
response.write("�޸ĳɹ������<a href=list.asp>����</a>�������԰�")
%>