<!--#include file="conn.asp"-->
<%
dim wutianlaoshi
wutianlaoshi=session("wutianlaoshi")
if wutianlaoshi="" then
response.redirect "login.asp"
end if
%>
<%
set rs=server.createobject("adodb.recordset")
sql="select * from game"
rs.open sql,db,1,3
rs.addnew
rs("name")=trim(request.form("name"))
rs("year")=trim(request.form("year"))
rs("competition")=trim(request.form("competition"))
rs.update
rs.close
set rs=nothing
response.redirect "game_add.asp"
%>