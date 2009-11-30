<!--#include file="dbpath.asp" -->
<%
Dim rs
set rs=server.createobject("adodb.recordset")
rs.open "Select * from notebook where noteid="&request.querystring("listid"),conn,1,3

if (rs.bof and rs.eof) then
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  response.redirect "errdata.htm"
  response.end
end if
visit=rs("notevisit")
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>查看留言</TITLE>
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
<META content="MSHTML 6.00.2716.2200" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff background=img/dotbg.gif>
<TABLE cellSpacing=0 cellPadding=0 width=760 align=center border=0>
  <TBODY>
  <TR>
    <TD class=text1 height=31>用户 <A 
      href=""><%=rs("notewriter")%></A>于<FONT color=#0099ff> 
      <%=rs("notetime")%></FONT>留下：</TD></TR>
  <TR vAlign=top>
    <TD height=81>
	<%=rs("notetext")%><br>
	--------------------------<br>
	<%=rs("notememo")%>
	  </TD></TR>
  <TR>
    <TD>
      <DIV align=center> 
        <%response.write ("<a href='reply.asp?reid="&rs("noteid")&"'><IMG eight=21 src='img/hybt.gif' width=87 border=0></a>")%>
	 	&nbsp;&nbsp; 
    	<A href="write.asp"><IMG height=21 src="img/fxt.gif" width=57 border=0></A>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <%response.write ("<a href='read.asp?listid="&rs("noteid")+1&"'><IMG eight=21 src='img/nextpage2.gif' width=87 border=0></a>")%>
        &nbsp;&nbsp;
    	<%response.write ("<a href='read.asp?listid="&rs("noteid")-1&"'><IMG eight=21 src='img/upage2.gif' width=87 border=0></a>")%>
    	&nbsp;&nbsp; 
    	<A  href="list.asp"><IMG height=21 src="img/hlyb.gif" width=87  border=0></A>
		</DIV>
		<p>
<%
if session("curruser")="admin" then
response.write("(<a href='delnote.asp?delid="&rs("noteid")&"' >删除该贴</a>)")
end if
%>
	   </p>
    </TD></TR></TBODY></TABLE><BR><BR></BODY></HTML>
<%
rs.close
set rs=nothing
Conn.execute "update notebook set notevisit="&visit+1&" where noteid="&request.querystring("listid")
Conn.close
set Conn=nothing
%>