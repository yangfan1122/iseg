<!--#include file="conn.asp"-->
<%
sql="select * from erennew order by id desc"
set rs=db.execute(sql)
%>
<html>
<head>
<body>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>** �����������Ծ��ֲ� **</title>
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
	background-image: url(images/background.gif);
}
.style5 {
	color: #FFFFFF;
	font-weight: bold;
}
.style7 {
	font-size: 36px;
	font-weight: bold;
	color: #FFFF00;
}
.style11 {
	font-size: 14;
	color: #FFFFFF;
	font-weight: bold;
}
.style14 {color: #FFFF00; font-size: 12pt; font-weight: bold; }
-->
</style>
</head>

<body>
<img src="images/10223.jpg" width="190" height="200"><img src="images/Inter-1.jpg" width="600" height="200"><span class="style11"> <%=date%></span>
<center class="style7">
  
  <p><td height="30" valign="top" bgcolor="#0099FF"><blink>
			<font size="3"><b>
			<marquee behavior=alternate>
			</marquee></b>
			<marquee behavior=alternate>
			<span class="style4">�����ǹ�������&nbsp; ���ǲ�͵���κιھ�</span>
			</marquee>
			<b>
			<marquee behavior=alternate>
			</marquee>
			</b></font></blink></td>
  </p>
</center>
</p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="gmls.htm" target="_blank" class="style14"><strong>�����ʷ</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="qsgm.htm" target="_blank" class="style14">ڹ�͹���</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="gmjx.htm" target="_blank" class="style14"><strong>���׾���</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="baggio.htm" target="_blank" class="style14">����ר��</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="notebook/index.htm"class="style14">������̳</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="images/qtc.swf" target="_blank" class="style14">�ҵ�FLASH </a>  
  <hr></p>
<table width="598" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr align="center" bgcolor="#000099"> 
    <td><strong><font color="#FFFFFF">��������</font></strong></td>
  </tr>
  <%do while not rs.eof%>
  <tr> 
    <td height="28" align="left">&nbsp;&nbsp;<img src="images/page11.gif" width="12" height="12"><span class="style5">&nbsp;<a href=wtls_look.asp?id=<%=rs("id")%> target="_blank"><%=rs("title")%></a></span><span class="style16"></span><span class="style5">&nbsp;&nbsp;(<%=rs("xwtime")%>����) &nbsp;�����<%=rs("xwcount")%>��</span></td>
  </tr>
  <%
  rs.movenext
  loop
  %>
</table>
<div align="center"><br>
  <a href="admin/wtls_login.asp"><em>�������</em></a><br>
  <span class="style5">
  <br><%
Set fs=CreateObject("Scripting.FileSystemObject")
Set a=fs.openTextFile(server.mappath("count.txt"))
count=a.readline
response.write "������:" & count
count=count+1
Set fs = CreateObject("Scripting.FileSystemObject")
Set a=fs.createTextfile(server.mappath("count.txt"))
a.writeline (count)
%> 
 &nbsp; ���IP:<%=request.serverVariables("remote_host")%><br><br>
  </span>
  <!--#include file="xwwb.asp"-->
</div>
</body>
</html>
