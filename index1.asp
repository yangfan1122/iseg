<!--#include file="conn.asp"-->
<%
sql="select * from iseg order by id desc"
set rs=db.execute(sql)
%>
<html>
<head>
<body>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>iseg</title>
</head>

<body>
<span class="style11"> <%=date%></span>
<table width="598" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr align="center" bgcolor="#000099"> 
    <td><strong><font color="#FFFFFF">新闻</font></strong></td>
  </tr>
  <%do while not rs.eof%>
  <tr> 
    <td height="28" align="left">&nbsp;&nbsp;<img src="images/page11.gif" width="12" height="12"><span class="style5">&nbsp;<a href=wtls_look.asp?id=<%=rs("id")%> target="_blank"><%=rs("title")%></a></span><span class="style16"></span><span class="style5">&nbsp;&nbsp;(<%=rs("xwtime")%>发表) &nbsp;浏览过<%=rs("xwcount")%>次</span></td>
  </tr>
  <%
  rs.movenext
  loop
  %>
</table>
<div align="center"><br>
  <a href="admin/login.asp"><em>管理入口</em></a><br>
  <span class="style5">
  <br><%
Set fs=CreateObject("Scripting.FileSystemObject")
Set a=fs.openTextFile(server.mappath("count.txt"))
count=a.readline
response.write "访问量:" & count
count=count+1
Set fs = CreateObject("Scripting.FileSystemObject")
Set a=fs.createTextfile(server.mappath("count.txt"))
a.writeline (count)
%> 
 &nbsp; 你的IP:<%=request.serverVariables("remote_host")%><br><br>
  </span>
  <!--#include file="xwwb.asp"-->
</div>
</body>
</html>
