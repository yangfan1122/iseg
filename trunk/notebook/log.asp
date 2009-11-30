<!--#include file="dbpath.asp" -->
<%
Dim rs
set rs=server.createobject("adodb.recordset")
rs.open "Select * from userdata where noteuser='" & Trim(request.form("username")) & "'",conn,1,3

if (rs.bof and rs.eof) then
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  response.redirect "erruser.htm"
  response.end
end if

if rs("pswd")<>Trim(request.form("pwd")) then
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  response.redirect "errpwd.htm"
  response.end
end if

rs.close
set rs=nothing

session("curruser")=Trim(request.form("username"))
response.redirect "list.asp"
response.end

%>