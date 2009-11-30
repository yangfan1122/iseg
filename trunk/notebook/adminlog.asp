<%
if request.servervariables("REQUEST_METHOD")<>"POST" then
  response.redirect "no.htm"
  response.end
end if
%>
<!--#include file="dbpath.asp" -->
<%
Dim rs
set rs=server.createobject("adodb.recordset")
rs.open "Select * from userdata where noteuser='admin'",conn,1,3


if rs("pswd")<>Trim(request.form("mypwd")) then
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  response.redirect "errpwd.htm"
  response.end
end if

rs.close
set rs=nothing

session("curruser")="admin"
response.redirect "list.asp"
response.end

%>