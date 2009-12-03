<!--#include file="conn.asp"-->
<%
dim wutianlaoshi
wutianlaoshi=session("wutianlaoshi")
if wutianlaoshi="" then
response.redirect "loginout.asp"
end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加比赛</title>
</head>
<body>
<form name="form1" method="post" action="team_save.asp">
  <table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
    <tr>
      <td colspan="2"><h2><font color="#FFFFFF">添加球队</font></h2></td>
    </tr>
    <tr>
      <td>名称:</td>
      <td><input name="name" type="text" id="name" size="38"></td>
    </tr>
    <tr>
      <td>录入时间:</td>
      <td><%=now()%></td>
    </tr>
    <tr>
      <td>所属:</td>
      <td><input name="group" type="text" id="group" size="38"></td>
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
      <td><input name="no" type="text" id="no" size="38"></td>
    </tr>
    <tr>
      <td width="104">参加比赛:</td>
      <td width="374"><input name="tournament" type="text" id="tournament" size="30">
        tournament/cup</td>
    </tr>
    <tr>
      <td width="104">资金:</td>
      <td width="374"><input name="money" type="text" id="money" size="30">
        tournament/cup</td>
    </tr>
    <tr valign="top">
      <td colspan="2"><input type="submit" name="Submit" value="确定">
        &nbsp;&nbsp;&nbsp;
        <input type="reset" name="reset" value="重置"></td>
    </tr>
  </table>
</form>
<center>
  <!--#include file="../xwwb.asp"-->
</center>
</body>
</html>
