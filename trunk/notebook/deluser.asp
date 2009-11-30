
<%
if not session("curruser")="admin" then
  response.redirect "errdata.htm"
  response.end
end if
%>
<!--#include file="dbpath.asp" -->
<%
set rs=createobject("adodb.recordset")
rs.open "select * from userdata where noteuser='"&Trim(request.querystring("delid"))&"'",conn,1,3
if rs.eof and rs.bof then
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  response.redirect "errdata.htm"
  response.end
end if
rs.delete
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing

response.write("删除成功，点击<a href=list.asp>这里</a>回到留言板")
response.end
%>
