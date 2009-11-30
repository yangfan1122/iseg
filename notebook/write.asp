<!--#include file="dbpath.asp" -->
<%
if session("curruser")="" then
session("curruser")="guest"
end if

Dim rs
set rs=server.createobject("adodb.recordset")
rs.open "Select * from userdata where noteuser='"&session("curruser")&"'",Conn,1,3
if (rs.bof and rs.eof) then
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  response.redirect "errdata.htm"
  response.end
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>发新帖</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>A:active {
	COLOR: #ff3333; TEXT-DECORATION: none
}
A:hover {
	COLOR: #ff0000; TEXT-DECORATION: underline
}
A:link {
	COLOR: #6633ff; TEXT-DECORATION: none
}
A:visited {
	COLOR: #6633ff; TEXT-DECORATION: none
}
.text1 {
	FONT-SIZE: 9pt; COLOR: #666666; LINE-HEIGHT: 16pt
}
</STYLE>

<SCRIPT language=JavaScript>
<!--

function ResetSign() {
  document.signform.reset();
}

function Post() {
	if (document.signform.subject.value==""){
		alert("请填写您的标题。");
		document.signform.subject.focus();
		return false;
	}
	if (document.signform.subject.value.length>40)
	{
		alert("文章主题的字数太多了\n\n请精简主题内容：）");
		document.signform.subject.focus();
		return false;
	}
}
-->
</SCRIPT>

<META content="MSHTML 6.00.2716.2200" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff background=img/dotbg.gif>
<BR>
<TABLE cellSpacing=0 cellPadding=0 width=760 align=center border=0 height="350">
  <FORM name=signform onsubmit="return Post()" action=subnote.asp  method=post>
  <TBODY> 
  <TR> 
    <TD vAlign=top width=352 height=324> 
      <TABLE cellSpacing=0 cellPadding=0 width=308 align=center border=0>
        <TR> 
          <TD height=36 colspan="2"> 
            <IMG height=20 src="img/title.gif" width=29>
			<FONT color=#ff0000>*</FONT>标题： 
            <INPUT name=subject>
          </TD>
        </TR>
        <TR vAlign=top> 
          <TD height=137 colSpan=2> 
              <table cellspacing=1 cellpadding=1 width=319>
                <tbody> 
                <tr> 
                <td class=text1 noWrap height=33> 
                    <input type=radio CHECKED 
                  value=1 name=face>
                    <img height=20 
                  src="img/biaoqing/1.gif" width=15>随便说说啦</td>
                <td class=text1 noWrap height=33> 
                    <input type=radio value=2 
                  name=face>
                    <img height=15 
                  src="img/biaoqing/2.gif" width=15>我来回答你</td>
                <td class=text1 noWrap height=33> 
                    <input type=radio value=3 
                  name=face>
                    <img height=15 src="img/biaoqing/3.gif" 
                  width=15>号外！号外！</td>
              </tr>
              <tr> 
                <td class=text1 noWrap height=33> 
                    <input type=radio value=4 
                  name=face>
                  <img height=15 
                  src="img/biaoqing/4.gif" width=15>好奇怪哟！</td>
                <td class=text1 noWrap height=33> 
                    <input type=radio value=5 
                  name=face>
                  <img height=15 src="img/biaoqing/5.gif" 
                  width=15>大家过来..</td>
                <td class=text1 noWrap height=33> 
                    <input type=radio value=6 
                  name=face>
                  <img height=15 
                  src="img/biaoqing/6.gif" width=15>大家小心！</td>
              </tr>
              <tr> 
                <td class=text1 noWrap height=29> 
                    <input type=radio value=7 
                  name=face>
                  <img height=15 src="img/biaoqing/7.gif" 
                  width=15>我得意的笑</td>
                <td class=text1 noWrap height=29> 
                    <input type=radio value=8 
                  name=face>
                  <img height=15 src="img/biaoqing/8.gif" 
                  width=15>没劲！</td>
                <td class=text1 noWrap height=29> 
                    <input type=radio value=9 
                  name=face>
                  <img height=15 src="img/biaoqing/9.gif" 
                  width=15>气死我了！</td>
              </tr>
              <tr> 
                <td class=text1 noWrap height=32> 
                    <input type=radio value=10
                  name=face>
                  <img height=15 src="img/biaoqing/10.gif" 
                  width=15>坚决同意！</td>
                <td class=text1 noWrap height=32> 
                    <input type=radio value=11 
                  name=face>
                  <img height=15 
                  src="img/biaoqing/11.gif" width=15>反对反对！</td>
                <td class=text1 noWrap height=32> 
                    <input type=radio value=12 
                  name=face>
                  <img height=15 src="img/biaoqing/12.gif" 
                  width=15>管它呢:--{</td>
              </tr>
              </tbody> 
            </table>
          </TD>
        </TR>
        <TR vAlign=top> 
          <TD class=text1 height=26 width="161"><img 
            src="img/qianming.gif" width=32 height="28">个人签名档：</TD>
          <TD  class=text1 height=26 width="161" >&nbsp;</TD>
        </TR>

        

          <INPUT type=hidden value=-100 name=nowno >
          <TR vAlign=top> 
            <TD height=92 colSpan=2> 
              <textarea class=text1 name=signpage rows=6 cols=50><%=rs("memory")%></textarea>
            </TD>
          </TR>
        
      </TABLE>
    </TD>
    <TD vAlign=top width=408 height=324> 
      <TABLE cellSpacing=0 cellPadding=0 width=360 align=center border=0>
        <TBODY> 
        <TR> 
          <TD width=25> 
            <DIV align=center><IMG height=19 
            src="img/liuyan.gif" width=22></DIV>
          </TD>
          <TD class=text1 width=335>留言内容：</TD>
        </TR>
        <TR vAlign=top> 
          <TD colSpan=2> 
            <DIV align=left> 
              <TEXTAREA name=message rows=15 cols=54></TEXTAREA>
            </DIV>
          </TD>
        </TR>
        <TR> 
          <TD colspan="2" height="41"> 
            <P>&nbsp;</P>
            <P>&nbsp;</P>
            <DIV align=left></DIV>
            <DIV align=right><BR>
              <BR>
              &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type=image height=21 width=57 src="img/fabiao.gif" border=0 name=sign>
              <a href="javascript:ResetSign();">
			  <img  height=21 src="img/qingchu.gif" width=57  border=0>
			  </a>
			  <a href="javascript:window.close()">
			  <img height=21   src="img/tuichu.gif" width=57   border=0>
			  </a></DIV>
          </TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD>
  </TR>
  </TBODY> 
  </form>
</TABLE>
</BODY></HTML>
<%
rs.close
set rs=nothing
Conn.close
set Conn=nothing
%>
