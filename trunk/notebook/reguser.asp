
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
rs.open "Select * from userdata where noteuser='" & Trim(request.form("myname")) & "'",conn,1,3

if not (rs.bof and rs.eof) then
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  response.redirect "haveuser.htm"
  response.end
end if

rs.addnew
rs("noteuser")=htmlencode2(Trim(request.form("myname")))
rs("pswd")=Trim(request.form("mypwd"))
rs("mailbox")=request.form("myemail")
rs("usersite")=request.form("homepage")
rs("memory")=request.form("memory")
rs.update

rs.close
set rs=nothing

session("curruser")=Trim(request.form("myname"))
response.write("注册成功，点击<a href=list.asp>这里</a>进入留言板")
%>
