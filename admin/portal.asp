<!--#include file="conn.asp"-->
<%
dim wutianlaoshi
wutianlaoshi=session("wutianlaoshi")
if wutianlaoshi="" then
response.redirect "login.asp"
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理入口</title>
<link rel="stylesheet" rev="stylesheet"  href="../styles/style.css" />

</head>

<body>
<a href="loginout.asp">退出管理</a><br>
<a href="game_add.asp">比赛管理</a><br>
 球队管理

</body>
</html>
