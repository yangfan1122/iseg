<%
set db=server.createobject("adodb.connection")
db.open "DBQ="&server.mappath("../date/xw.mdb")&";driver={microsoft access driver (*.mdb)}"
%>