<!--#include file="dbpath.asp" -->
<%
set rs=createobject("adodb.recordset")
rs.open "select * from userdata where noteuser='"&Trim(request.querystring("user"))&"'", conn, 1, 3
if (rs.eof and rs.bof) then
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  response.redirect "errdata.htm"
  response.end
end if
%>
<html>
<head>
<title>查看用户</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.text1 {  font-size: 9pt; line-height: 16pt}
.text2 {  font-size: 9pt; line-height: 16pt; color: ff0000}
a:active {  color: #FF3333; text-decoration: none}
a:hover {  color: #FF0000; text-decoration: underline}
a:link {  color: #6633FF; text-decoration: none}
a:visited {  color: 6633ff; text-decoration: none}
.text3 {  font-size: 9pt; line-height: 16pt; color: #006600}
.text4 {  font-size: 9pt; line-height: 16pt; color: 6633ff}
.text5 {  font-size: 12pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000" background="img/dotbg.gif">
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td  background="page1/img/top1.gif" height="23" class="text1" width="296"> 
      <font color="6633ff">留言(查看用户)</font></td>
    <td  background="page1/img/top1.gif" height="23" width="464"> 
      <div align="right" class="text1">斑竹：admin<span class="text3"> 
            </span></div>
    </td>
  </tr>
</table>
<div align="center"></div>
<p>&nbsp;</p>
<table width="250" border="0" align="center">
  <tr>
    <td height="41">用户名 &nbsp:&nbsp<%=rs("noteuser")%></td>
  </tr>
  <tr>
    <td height="35">Email &nbsp  :&nbsp<% response.write("<a href='mailto:"&rs("mailbox")&"'>"&rs("mailbox")&"</a>")%></td>
  </tr>
  <tr>
    <td height="48">相关链接:&nbsp<% response.write("<a href='http://"&rs("usersite")&"'>"&rs("usersite")&"</a>")%></td>
  </tr>
<tr>
    <td height="48">签名档:</br></br><%=rs("memory")%></td>
  </tr>
    <tr>
    <td height="48">
<%
if session("curruser")="admin" then
response.write("(<a href='deluser.asp?delid="&rs("noteuser")&"' >删除该用户</a>)")
end if
%>
	</td>
  </tr>
</table>
</body>
</html>
<%
rs.close
set rs=nothing
Conn.close
set Conn=nothing
%>
