<!--#include file="conn.asp"-->
<%
	if not isempty(request.querystring("id")) then
	id=request.querystring("id")
	else
	id=1
	end if
%>
<%
function xhhtml(content)
xhhtml=content
if content<>"" then
xhhtml=replace(xhhtml,chr(13),"<br>")
xhHtml=replace(xhHtml,chr(34),"&quot;")
xhHtml=replace(xhHtml,chr(32),"&nbsp;")
end if
end function
%>
<%
set rs=server.createobject("adodb.recordset")
sql="select * from game where id="&id
rs.open sql,db,1,3
rs.update
%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" rev="stylesheet"  href="styles/style.css" />
<title>比赛浏览</title>
<table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr align="center" bgcolor="#0099CC"> 
    <td colspan="3"><span class="style6"><span class="style7"><font color="#FFFFFF"><%=rs("name")%></font><font color="#FFFFFF"></font></span></span></td>
  </tr>
  <tr align="center"> 
    <td colspan="3">年度:<%=rs("year")%>&nbsp;&nbsp;&nbsp;&nbsp;类型:<%=rs("competition")%><br> 
    <hr width="88%" size="1"></td>
  </tr>
  <tr> 
    <td colspan="3">
      <div align="center"><br>
        <input type="button" name="Submit" value="关闭窗口" onClick="javascritp:window.close()">
      </div></td>
  </tr>
</table>
    
<div align="center"><br>
  <!--#include file="xwwb.asp"-->
</div>