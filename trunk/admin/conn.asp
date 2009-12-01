<%
set db=server.createobject("adodb.connection")
db.open "DBQ="&server.mappath("../date/iseg.mdb")&";driver={microsoft access driver (*.mdb)}"
%>