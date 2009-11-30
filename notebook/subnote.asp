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
set rs=server.createobject("adodb.recordset")
rs.open "select * from notebook",conn,1,3
rs.addnew
rs("notetitle")=htmlencode2(Trim(request.form("subject")))
rs("notetime")=NOW
rs("notenew")=NOW
rs("noteparents")=0
rs("notevisit")=0
rs("notefloor")=0
rs("notewriter")=session("curruser")
rs("notememo")=request.form("signpage")
rs("notetext")=Trim(request.form("message"))
rs("noteimg")=CLng(request.form("face"))
rs("notelen")=len(Trim(request.form("message")))
rs.update
rs("noteroot")=rs("noteid")
rs.Update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.redirect("list.asp")
response.end
%>
