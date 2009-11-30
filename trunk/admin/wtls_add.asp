<!--#include file="wtls_conn.asp"-->
<%
dim wutianlaoshi
wutianlaoshi=session("wutianlaoshi")
if wutianlaoshi="" then
response.redirect "wtls_login.asp"
end if
%>
<%
sql="select * from erennew order by id desc"
set rs=db.execute(sql)
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>网络管理页面</title>
<style type="text/css">
<!--
table {
	font-size: 9pt;
	text-decoration: none;
	border: 1px solid #000000;
}
-->
</style>
<style type="text/css">
<!--
a {
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}
body {
	background-color: #0099CC;
}
.style1 {font-weight: bold}
-->
</style>
</head>

<body>
<p align="center"><font color="#FFFFFF"><a href="wtls_write.asp">添加新闻</a> </font><a href="wtls_loginout.asp">退出管理</a></p>
<table width="666" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr align="center" bgcolor="#006699"> 
    <td colspan="5"><font color="#FFFFFF">新 闻 管 理 页 面</font></td>
  </tr>
  <tr align="center"> 
    <td width="80"><strong><font color="#FF0000">新闻ID</font></strong></td>
    <td width="266"><strong><font color="#FF0000">新闻标题</font></strong></td>
    <td width="143"><strong><font color="#FF0000">录入时间</font></strong></td>
    <td width="62"><strong><font color="#FF0000">编辑</font></strong></td>
    <td width="63"><strong><font color="#FF0000">删除</font></strong></td>
  </tr>
  <%do while not rs.eof%>
  <tr> 
    <td align="center"><%=rs("id")%></td>
    <td><a href=../wtls_look.asp?id=<%=rs("id")%> target="_blank"><%=rs("title")%></a></td>
    <td><%=rs("xwtime")%></td>
    <td align="center"><a href="wtls_edit.asp?id=<%=rs("id")%>">编辑</a></td>
    <td align="center"><a href="wtls_del.asp?id=<%=rs("id")%>">删除</a></td>
  </tr>
  <%
  rs.movenext
  loop
  %>
</table>
<br>
<center><!--#include file="../xwwb.asp"--></center>
</body>
</html>
