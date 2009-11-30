<% 
if session("curruser")="" then
session("curruser")="guest"
end if

if request.servervariables("REQUEST_METHOD")<>"POST" then
  response.redirect "no.htm"
  response.end
end if
%>
<!--#include file="dbpath.asp" -->
<!--#include file="char.inc" -->
<%
timestr="#"&NOW&"#"

set rsa=server.createobject("adodb.recordset")
rsa.open "select * from notebook where noteid="&request.querystring("reid"),Conn,1,3
rootnbr=cstr(rsa("noteroot"))
set rs=server.createobject("adodb.recordset")
rs.open "select * from notebook",conn,1,3
rs.addnew
rs("notetitle")=htmlencode2(Trim(request.form("subject")))
rs("notetime")=NOW
rs("notenew")=NOW
rs("noteparents")=rsa("noteid")
rs("noteroot")=rsa("noteroot")
rs("notevisit")=0
rs("notefloor")=rsa("notefloor")+1
rs("notewriter")=session("curruser")
rs("notememo")=htmlencode2(Trim(request.form("signpage")))
rs("notetext")=Trim(request.form("message"))
rs("noteimg")=CLng(request.form("face"))
rs("notelen")=len(Trim(request.form("message")))
rs.update

rs.close
set rs=nothing
rsa.close
set rsa=nothing
Conn.execute "update notebook set notenew="&timestr&" where noteid="&rootnbr
Conn.close
set conn=nothing
response.redirect("list.asp")
response.end
%>

