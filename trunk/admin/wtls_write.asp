<!--#include file="wtls_conn.asp"-->
<%
dim wutianlaoshi
wutianlaoshi=session("wutianlaoshi")
if wutianlaoshi="" then
response.redirect "wtls_login.asp"
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>¼������</title>
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
<form name="form1" method="post" action="wtls_save.asp">
  <table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
    <tr align="center" bgcolor="#0000FF"> 
      <td colspan="2"><h2><font color="#FFFFFF">����¼��</font></h2></td>
    </tr>
    <tr align="center" bgcolor="#FFFFFF"> 
      <td align="right" bgcolor="#0099CC">���ű���:</td>
      <td align="left" bgcolor="#0099CC"><input name="title" type="text" id="title" size="38"></td>
    </tr>
    <tr align="center" bgcolor="#FFFFFF">
      <td align="right" bgcolor="#0099CC">¼��ʱ��:</td>
      <td align="left" bgcolor="#0099CC"><%=now()%></td>
    </tr>
    <tr> 
      <td width="104" align="right">��������:</td>
      <td width="374" rowspan="2"><textarea name="content" cols="50" rows="8" id="content"></textarea></td>
    </tr>
    <tr> 
      <td align="right">&nbsp;</td>
    </tr>
    <tr> 
      <td align="right">��дԱ:</td>
      <td><input name="name" type="text" id="name"></td>
    </tr>
    <tr align="center" valign="top"> 
      <td colspan="2"><input type="submit" name="Submit" value="�ύ"> 
      &nbsp;&nbsp;&nbsp; 
        <input type="reset" name="Submit2" value="��������"></td>
    </tr>
  </table>
</form>
<center><!--#include file="../xwwb.asp"--></center>
</body>
</html>
