<!--#include file="conn.asp"-->
<%
dim wutianlaoshi
wutianlaoshi=session("wutianlaoshi")
if wutianlaoshi="" then
response.redirect "login.asp"
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理入口</title>
<link rel="stylesheet" rev="stylesheet"  href="../styles/style.css" />

</head>

<body>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="5">
  <tr>
    <td align="right"><a href="loginout.asp">退出</a></td>
  </tr>
  <tr>
    <td><a href="game_add.asp">比赛管理</a></td>
  </tr>
  <tr>
    <td><a href="team_add.asp">球队管理</a></td>
  </tr>
</table>



</body>
</html>
