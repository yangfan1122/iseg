<!--#include file="conn.asp"-->
<%
dim wutianlaoshi
wutianlaoshi=session("wutianlaoshi")
if wutianlaoshi="" then
response.redirect "loginout.asp"
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加比赛</title>
</head>
<body>
<form name="form1" method="post" action="game_save.asp">
  <table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
    <tr>
      <td colspan="2"><h2><font color="#FFFFFF">添加比赛</font></h2></td>
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
      <td>年度:</td>
      <td><input name="year" type="text" id="year" size="38"> 09/10</td>
    </tr>
    <tr>
      <td width="104">类型:</td>
      <td width="374"><input name="competition" type="text" id="competition" size="30">
        tournament/cup</td>
    </tr>
    <tr>
      <td>参赛队:</td>
      <td><select name="">
          <option value="1">1</option>
          <option value="2">2</option>
        </select></td>
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
