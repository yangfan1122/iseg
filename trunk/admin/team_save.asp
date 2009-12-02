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
sql="select * from team"
rs.open sql,db,1,3
rs.addnew
rs("name")=trim(request.form("name"))
rs("group")=trim(request.form("group"))
rs("no")=trim(request.form("no"))
rs("tournament")=trim(request.form("tournament"))
rs("money")=trim(request.form("money"))
rs.update
rs.close
set rs=nothing
response.redirect "team_add.asp"
%>