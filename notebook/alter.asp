<%
if session("curruser")="" then
response.redirect("noaccess.htm")
response.end
end if
if session("curruser")="guest" then
response.redirect("noaccess.htm")
response.end
end if
%>

<!--#include file="dbpath.asp" -->
<%
set rs=createobject("adodb.recordset")
rs.open "select * from userdata where noteuser='"&Trim(session("curruser"))&"'", conn, 1, 3
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
<title>修改资料</title>
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
<script language="JavaScript"> 
<!--
function check1() 
{ 
var len1=altform.mypwd.value.length; 
var len2=altform.mypwd2.value.length;


if (altform.mypwd.value!=altform.mypwd2.value)
{
  alert("请确认您两次输入的密码相同!");
  altform.mypwd2.focus();
  return false;
}
else 
if (len2==0|len1==0)
 {
  alert("密码不能为空!");
  altform.mypwd.focus();
  return false;
 }
else 
if (altform.mypwd.value.indexOf(" ")!=-1) 
 {
  alert("密码中不能含有空格!");
  altform.mypwd.focus();
  return false;
 }

else return true; 
} 
// --> 
</script>
</head>



<body bgcolor="#FFFFFF" topmargin="0" background="img/dotbg.gif">
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td  background="img/top1.gif" height="24" class="text1" width="247"> <font color="6633ff">留言(修改资料)</font></td>
    <td  background="img/top1.gif" height="24" width="227"> 
      <div align="right" class="text1">当前用户：<span class="text2"><%=session("curruser")%></span></div>
    </td>
    <td  background="img/top1.gif" height="24" width="169"> 
      <div align="left" ><span class="text3"> </span></div>
    </td>
    <td  background="img/top1.gif" height="24" width="117"> 
      <div align="right" class="text1">斑竹：admin<span class="text3"> </span></div>
    </td>
  </tr>
</table>
<div align="center"> <br>
  <table width="343" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="4" height="308"  >
    <tr> 
      <td height="172"> 
        <div align="left"> 

          <form method="post" action="alteruser.asp" name="altform" onSubmit="return(check1());">
            <div align="center"></div>
            <div align="center">
              <p><font color="#222222">用户&nbsp<%=session("curruser")%>&nbsp资料</font></p>
            </div>
            <table width="266" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="0"  >
              <tr valign="middle"> 
                <td height="2"> 
                  <div align="center"></div>
                  <div align="center"></div>
                  <div align="center"><font color="#222222">密&nbsp&nbsp码：</font> 
                    <input type="password" name="mypwd" maxlength="50" value=<%=rs("pswd")%>>
                  </div>
                </td>
              </tr>
              <tr> 
                <td> 
                  <div align="center"><font color="#222222">(确认)：</font> 
                    <input type="password" name="mypwd2" maxlength="50" value=<%=rs("pswd")%>>
                  </div>
                </td>
              </tr>
              <tr> 
                <td height="39"> 
                  <div align="center">&nbspEmail:&nbsp&nbsp 
                    <input type="text" name="myemail" value=<%=rs("mailbox")%>>
                  </div>
                </td>
              </tr>
              <tr> 
                <td height="39"> 
                  <div align="center">&nbsp相关链接： 
                    <input type="text" name="homepage" value=<%=rs("usersite")%>>
                  </div>
                </td>
              </tr>
              <tr> 
                <td height="113"> 
                  <div align="center"> 
                    <p>个人签名档：</p>
                    <p> 
                      <textarea name="memory" cols="30" rows="5" value=<%=rs("memory")%>></textarea>
                    </p>
                  </div>
                </td>
              </tr>
              <tr> 
                <td height="39"> 
                  <div align="center"> 
                    <input type="submit" name="Submit" value=" 修 改 "  >
                    <input type="reset" name="Submit2" value=" 重 置 ">
                  </div>
                </td>
              </tr>
            </table>
          </form>
          <p align="center">&nbsp;</p>
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
</body>
</html>
<%
rs.close
set rs=nothing
Conn.close
set Conn=nothing
%>
