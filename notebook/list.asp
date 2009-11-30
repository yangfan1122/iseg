<!--#include file="dbpath.asp" -->
<%

const MaxPrePage=10  '每页显示记录数
Dim intPage
Dim TotalPage

if session("curruser")="" then
session("curruser")="guest"
end if

if (request.querystring("page")<>"") and (IsNumeric(request.querystring("page"))) then  '检查页号
  intPage=CLng(request.querystring("page"))
else
  intPage=1
end if

set rs=createobject("adodb.recordset")
rs.open "select * from notebook",Conn,1,3

if not (rs.eof and rs.bof) then          '判断是否有留言，防止留言板在没有留言时出错

set rsa=createobject("adodb.recordset")
rsa.open "select * from notebook where noteparents=0 order by notenew desc", Conn, 1, 3
rsa.pagesize=MaxPrePage
if intPage>rsa.pagecount then 
  intPage=rsa.pagecount
end if 
rsa.absolutepage=intpage
pgcount=rsa.pagecount
rsa.close
recount=rs.recordcount

else

pgcount=0
recount=0
intpage=0

end if

rs.close
%>


<html>
<head>
<title>球迷论坛</title>
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
-->
</style>
</head>


<body bgcolor="#FFFFFF" topmargin="0" background="img/dotbg.gif">
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td  background="img/top1.gif" height="24" class="text1" width="247"> <font color="6633ff">留言</font></td>
    <td  background="img/top1.gif" height="24" width="227"> 
      <div align="right" class="text1">当前用户：<span class="text2"><%=session("curruser")%></span></div>
    </td>
    <td  background="img/top1.gif" height="24" width="169"> 
      <div align="left" >
	  <span class="text3">
	  <%  if session("curruser")="guest" then	  %>
	   (<a href="index.htm">重新登录</a>/<a href="reg.htm">注册用户</a>)	   
	  <%  else    %> 
	   (<a href="index.htm">重新登录</a>/<a href="alter.asp">修改资料</a>)
	  <%  end if   %>
	   </span>
	   </div>
    </td>
    <td  background="img/top1.gif" height="24" width="117">
<div align="right" class="text1">斑竹：admin<span class="text3"> </span></div></td>
  </tr>
</table>
<br>
<br>

<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td width="256" height="25" class="text1">共计<span class="text2"><%=recount%></span> 
        条，<span class="text2"> <%=pgcount%></span> 页；目前为：<span class="text2"><%=intpage%>/<%=pgcount%> 
        </span>页 </td>
      <td width="78" height="25"> <img src="img/xsgt.gif" width="67" height="20" border="0"> 
      </td>
      <td width="30" height="25">&nbsp; </td>
      <td width="396" height="25"> 
        <table width="360" border="0" cellspacing="0" cellpadding="0" align="right">
          <tr> 
            <td width="131"> 
              <div align="center"> <a href="write.asp" target="_blank"><img src="img/new.gif" width="58" height="15" border="0"></a> 
              </div>
            </td>
            <td width="99"> 
              <div align="center"> <input type=image onClick="location.href='list.asp'" src="img/refresh.gif" width="60" height="15" border="0" ></div>
            </td>
            <td width="115"> 
              <div align="center"><a href="admin.htm" target="_blank"><img src="img/master.gif" width="75" border=0 height="15"></a> </div>
            </td>
            <td width="80">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>

</table>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center" background="img/bg2.gif">
  <tr>
    <td width="8"><img src="img/left.gif" width="8" height="21"></td>
    <td width="52"> 
      <div align="center"><img src="img/xuhao.gif" width="42" height="16"></div>
    </td>
    <td width="18"><img src="img/middle.gif" width="16" height="21"></td>
    <td width="335"> 
      <div align="center"><img src="img/zhuti.gif" width="42" height="17"></div>
    </td>
    <td width="14"><img src="img/middle.gif" width="16" height="21"></td>
    <td width="77"> 
      <div align="center"><img src="img/dijishu.gif" width="55" height="17"></div>
    </td>
    <td width="19"><img src="img/middle.gif" width="16" height="21"></td>
    <td width="90"> 
      <div align="center"><img src="img/zuozhe.gif" width="51" height="17"></div>
    </td>
    <td width="28"><img src="img/middle.gif" width="16" height="21"></td>
    <td width="103"> 
      <div align="center"><img src="img/time.gif" width="51" height="17"></div>
    </td>
    <td width="16"> 
      <div align="right"><img src="img/right.gif" width="9" height="21"></div>
    </td>
  </tr>
</table>
<br>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center" background="/img/dotbg.gif">
<%
rs.open "select * from notebook where noteparents=0 order by notenew desc",Conn,1,3

if not (rs.eof and rs.bof) then          '判断是否有留言，防止留言板在没有留言时出错

rs.absolutepage=intpage
for k=1 to rs.pagesize
if not rs.eof then
%>
<tr> 
    <td width="71" height="16" class="text1"> 
      <div align="center"> <%=rs("noteid")%></a> 
      </div>
    </td>
    <td width="361" height="16" class="text1">
      <% response.write ("<img src='img/biaoqing/"&rs("noteimg")&".gif' width=15 hight=20>")%> 
     <%response.write ("<a href='read.asp?listid="&rs("noteid")&"'>"&rs("notetitle")&" ("&rs("notelen")&"字节)</a>")%></td>    <td width="70" height="16" class="text1"> 
      <div align="center"><%=rs("notevisit")%></div>
    </td>
    <td width="115" height="16" class="text1"> 
      <div align="center"><a href="user.asp?user=<%=rs("notewriter")%>" target=user><%=rs("notewriter")%></a></div>
    </td>
    <td width="143" height="16" class="text1"> 
      <div align="center"><%=rs("notetime")%></div>
    </td>
  </tr>
<%
DisplayText rs("noteid")
rs.movenext
end if
next

else

response.write("没有留言")

end if
rs.close
%>
</table>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td colspan="2" valign="top"> 
      <div align="right">&nbsp;&nbsp;&nbsp;&nbsp;</div>
	  <%
if  intPage>1 then
    response.write "<a href="""&request.ServerVariables("SCRIPT_NAME")&"?page="&intPage-1&"""><img src=img/upage.gif width=56 height=21 border=0></a> "    
end if

if intPage < pgcount then
    response.write "<a href="""&request.ServerVariables("SCRIPT_NAME")&"?page="&intPage+1&"""><img src=img/nextpage.gif width=56 height=21 border=0></a> "
end if
%>

      <div align="right"> &nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
</table>


<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
      <td width="380"> 
        <div align="right"></div>
    </td>
      <td width="380">&nbsp; </td>
  </tr>
</table>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td>&nbsp;</td>
  </tr>
</table>

</body>
</html>

<%
conn.close
set conn=nothing
%>


<%

Sub DisplayText(parNbr)

set rs1=createobject("adodb.recordset")
rs1.open "select * from notebook where noteparents="&parNbr,Conn,1,3

for i=1 to rs1.recordcount
%>
<tr> 
    <td width="71" height="16" class="text1"> 
      <div align="center"> <%=rs1("noteid")%></a> 
      </div>
    </td>
    <td width="361" height="16" class="text1">
<%
if rs1("notefloor")>0 then
for x=2 to rs1("notefloor")
response.write("<img src='img/biaoqing/blank.gif' width=15 hight=20>")
next
response.write ("<img src='img/biaoqing/line.gif' width=15 hight=20>")
end if
response.write ("<img src='img/biaoqing/"&rs1("noteimg")&".gif' width=15 hight=20>")
%> 
     <%response.write ("<a href='read.asp?listid="&rs1("noteid")&"'>"&rs1("notetitle")&" ("&rs1("notelen")&"字节)</a>")%></td>
    <td width="70" height="16" class="text1"> 
      <div align="center"><%=rs1("notevisit")%></div>
    </td>
    <td width="115" height="16" class="text1"> 
      <div align="center"><a href="user.asp?user=<%=rs1("notewriter")%>" target='user'><%=rs1("notewriter")%></a></div>
    </td>
    <td width="143" height="16" class="text1"> 
      <div align="center"><%=rs1("notetime")%></div>
    </td>
  </tr>
<%
DisplayText rs1("noteid")
rs1.movenext
next
rs1.close
End Sub
%>



