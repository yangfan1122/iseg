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
<title>�������ҳ��</title>
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
<p align="center"><font color="#FFFFFF"><a href="wtls_write.asp">�������</a> </font><a href="wtls_loginout.asp">�˳�����</a></p>
<table width="666" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr align="center" bgcolor="#006699"> 
    <td colspan="5"><font color="#FFFFFF">�� �� �� �� ҳ ��</font></td>
  </tr>
  <tr align="center"> 
    <td width="80"><strong><font color="#FF0000">����ID</font></strong></td>
    <td width="266"><strong><font color="#FF0000">���ű���</font></strong></td>
    <td width="143"><strong><font color="#FF0000">¼��ʱ��</font></strong></td>
    <td width="62"><strong><font color="#FF0000">�༭</font></strong></td>
    <td width="63"><strong><font color="#FF0000">ɾ��</font></strong></td>
  </tr>
  <%do while not rs.eof%>
  <tr> 
    <td align="center"><%=rs("id")%></td>
    <td><a href=../wtls_look.asp?id=<%=rs("id")%> target="_blank"><%=rs("title")%></a></td>
    <td><%=rs("xwtime")%></td>
    <td align="center"><a href="wtls_edit.asp?id=<%=rs("id")%>">�༭</a></td>
    <td align="center"><a href="wtls_del.asp?id=<%=rs("id")%>">ɾ��</a></td>
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
