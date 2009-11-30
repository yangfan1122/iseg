<%
Dim Conn
Dim dbpath 
Set Conn=Server.CreateObject("ADODB.Connection")
dbpath=Server.MapPath("db/notedb.mdb")
Conn.open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source="&dbpath
%>