<!--#include file="wtls_conn.asp"-->
<%
dim wutianlaoshi
wutianlaoshi=session("wutianlaoshi")
if wutianlaoshi="" then
response.redirect "wtls_login.asp"
end if
%>
<%
set rs=server.createobject("adodb.recordset")
sql="select * from erennew"
rs.open sql,db,1,3
rs.addnew
rs("title")=trim(request.form("title"))
rs("name")=trim(request.form("name"))
rs("content")=server.htmlencode(request.form("content"))
rs("xwcount")=0
rs("xwtime")=now()
rs.update
rs.close
set rs=nothing
response.redirect "wtls_add.asp"
%>