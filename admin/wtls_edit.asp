<!--#include file="wtls_conn.asp"-->
<%id=request.querystring("id")
set rs=server.createobject("adodb.recordset")
editsql="select * from erennew where id="&id
rs.open editsql,db,1,3
%>
<%
if request.form("active")="" then
else
rs("title")=trim(request.form("title"))
rs("content")=server.htmlencode(request.form("content"))
rs("name")=trim(request.form("name"))
rs.update
response.redirect "wtls_add.asp"
end if

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻编辑页面</title>
<style type="text/css">
<!--
table {
	font-size: 9pt;
	text-decoration: none;
	border: 1px solid #000000;
}
body {
	background-color: #0099CC;
}
-->
</style>
</head>

<body>
<form name="form1" method="post" action="">
  <table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
    <tr align="center" bgcolor="#006699"> 
      <td colspan="2"><font color="#FFFFFF">新 闻 修 改 编 辑</font></td>
    </tr>
    <tr align="center" bgcolor="#FFFFFF"> 
      <td align="right" bgcolor="#0099CC">新闻标题:</td>
      <td align="left" bgcolor="#0099CC"><input name="title" type="text" id="title2" value=<%=rs("title")%> size="38"></td>
    </tr>
    <tr> 
      <td width="104" align="right">新闻内容:</td>
      <td width="374" rowspan="2"><textarea name="content" cols="50" rows="8" id="content"><%=rs("content")%></textarea></td>
    </tr>
    <tr> 
      <td align="right">&nbsp;</td>
    </tr>
    <tr> 
      <td align="right">录入者:</td>
      <td><input name="name" type="text" value=<%=rs("name")%> id="name"></td>
    </tr>
    <tr align="center" valign="top"> 
      <td colspan="2"><input name="active" type="hidden" id="active" value="yes">
        <input type="submit" name="Submit" value="确定提交"> &nbsp;&nbsp;&nbsp; 
        <input type="submit" name="Submit2" value="重新输入"></td>
    </tr>
  </table>
</form>
<br>
<center><!--#include file="../xwwb.asp"--></center>
</body>
</html>