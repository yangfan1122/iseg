
<%
if not session("curruser")="admin" then
  response.redirect "errdata.htm"
  response.end
end if
%>
<!--#include file="dbpath.asp" -->
<%
set rs=createobject("adodb.recordset")
rs.open "select * from notebook where noteid="&Clng(request.querystring("delid")),conn,1,3
if rs.eof and rs.bof then
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  response.redirect "errdata.htm"
  response.end
end if

Deleteall(rs("noteid"))

rs.delete
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing

response.write("ɾ���ɹ������<a href=list.asp>����</a>�ص����԰�")
response.end
%>

<%

Sub Deleteall(parNbr)

set rs1=createobject("adodb.recordset")
rs1.open "select * from notebook where noteparents="&parNbr,Conn,1,3

for i=1 to rs1.recordcount
Deleteall(rs1("noteid"))
rs1.delete
rs1.update
rs1.movenext
next
rs1.close
End Sub
%>