<!--#include file="wtls_conn.asp"-->
<%
id=request.querystring("id")
delsql="delete * from erennew where id="&id
db.execute(delsql)
response.redirect "wtls_add.asp"
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
</head>

<body>
</body>
</html>
