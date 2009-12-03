<!--#include file="conn.asp"-->
<%id=request.querystring("id")
set rs=server.createobject("adodb.recordset")
editsql="select * from team where id="&id
rs.open editsql,db,1,3
%>
<%
if request.form("active")="" then
else
rs("name")=trim(request.form("name"))
'rs("group")=server.htmlencode(request.form("content"))
rs("group")=trim(request.form("group"))
rs("no")=trim(request.form("no"))
rs("tournament")=trim(request.form("tournament"))
rs("money")=trim(request.form("money"))
rs.update
response.redirect "team_add.asp"
end if

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>球队编辑页面</title>
</head>
<body>
<form name="form1" method="post" action="">
  <table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
    <tr>
      <td colspan="2"><h2><font color="#FFFFFF">编辑球队</font></h2></td>
    </tr>
    <tr>
      <td>名称:</td>
      <td><input name="name" type="text" id="name" value=<%=rs("name")%> size="38"></td>
    </tr>
    <tr>
      <td>所属:</td>
      <td><input name="group" type="text" id="group" value=<%=rs("group")%> size="38"></td>
    </tr>
    <tr>
      <td>球员:</td>
      <td><select name="">
          <option value="1">1</option>
          <option value="2">2</option>
        </select></td>
    </tr>
    <tr>
      <td>赛程序号:</td>
      <td><input name="no" type="text" id="no" value=<%=rs("no")%> size="38"></td>
    </tr>
    <tr>
      <td width="104">参加比赛:</td>
      <td width="374"><input name="tournament" type="text" id="tournament" value=<%=rs("tournament")%> size="30">
      </td>
    </tr>
    <tr>
      <td width="104">资金:</td>
      <td width="374"><input name="money" type="text" id="money" value=<%=rs("money")%> size="30">
      </td>
    </tr>
    <tr valign="top">
      <td colspan="2"><input name="active" type="hidden" id="active" value="yes">
        <input type="submit" name="Submit" value="确定提交">
        &nbsp;&nbsp;&nbsp;
        <input type="submit" name="Submit2" value="重新输入"></td>
    </tr>
  </table>
</form>
<br>
<center>
  <!--#include file="../xwwb.asp"-->
</center>
</body>
</html>
