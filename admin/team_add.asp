<!--#include file="conn.asp"-->
<%
dim wutianlaoshi
wutianlaoshi=session("wutianlaoshi")
if wutianlaoshi="" then
response.redirect "login.asp"
end if
%>
<%
sql="select * from team order by id desc"
set rs=db.execute(sql)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>球队管理页面</title>
<link rel="stylesheet" rev="stylesheet"  href="../styles/style.css" />
</head>


<body>
<p><a href="game_write.asp">添加球队</a> <a href="loginout.asp">退出管理</a></p>
<table width="666" border="0" cellpadding="5" cellspacing="0">
  <tr bgcolor="#006699"> 
    <td colspan="6">添加球队</td>
  </tr>
  <tr> 
    <td width="80">比赛ID</td>
    <td width="266">年度</td>
    <td width="143">名称</td>
    <td width="143">赛制</td>
    <td width="62">编辑</td>
    <td width="63">删除</td>
  </tr>
  <%do while not rs.eof%>
  <tr> 
    <td><%=rs("id")%></td>
    <td><%=rs("year")%></td>
    <td><a href="../game_look.asp?id=<%=rs("id")%>" target="_blank"><%=rs("name")%></a></td>
    <td><%=rs("competition")%></td>
    <td><a href="wtls_edit.asp?id=<%=rs("id")%>">编辑</a></td>
    <td><a href="wtls_del.asp?id=<%=rs("id")%>">删除</a></td>
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
