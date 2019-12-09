<br>
<%
    String thongBao = (String) (request.getAttribute("thongBao"));
    if (thongBao != null) {
%>
<div>
    <h3><font color="red"><%= thongBao%></font></h3>
    <br>
</div>
<%}%>