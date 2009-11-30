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
sql="select * from erennew where id="&id
rs.open sql,db,1,3
rs("xwcount")=rs("xwcount")+1
rs.update
%>
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
.style1 {color: #003399}
.style3 {color: #003399; font-weight: bold; }
.style4 {
	color: #FFFFFF;
	font-weight: bold;
}
.style5 {color: #FFFFFF}
.style6 {
	font-size: 12;
	font-weight: bold;
}
.style7 {font-size: 18px}
-->
</style>
<title>国米新闻</title>
<table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr align="center" bgcolor="#0099CC"> 
    <td colspan="3"><span class="style6"><span class="style7"><font color="#FFFFFF"><%=rs("title")%></font><font color="#FFFFFF"></font></span></span></td>
  </tr>
  <tr align="center"> 
    <td colspan="3"><span class="style3"><span class="style5"><%=rs("xwtime")%>发表 已浏览<%=rs("xwcount")%>次</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style5">&nbsp;作者:<%=rs("name")%></span></span><br> 
    <hr width="88%" size="1"></td>
  </tr>
  <tr> 
    <td colspan="3"><table width="88%" border="0" align="center" cellspacing="8" style="word-break:break-all">
        <tr>
          <td><span class="style4"><%=xhhtml(rs("content"))%></span></td>
        </tr>
      </table>
      <div align="center"><br>
        <input type="button" name="Submit" value="关闭窗口" onClick="javascritp:window.close()">
      </div></td>
  </tr>
</table>
    
<div align="center"><br>
  <!--#include file="xwwb.asp"-->
</div>