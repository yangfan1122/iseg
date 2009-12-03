<!--#include file="conn.asp"-->
<%
id=request.querystring("id")
delsql="delete * from team where id="&id
db.execute(delsql)
response.redirect "team_add.asp"
%>

