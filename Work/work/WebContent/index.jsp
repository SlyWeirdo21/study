<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<table border="1">
    <tr>
        <td>학생 ID</td>
        <td>성별</td>
        <td>좋아하는 과목</td>
    </tr>
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "system", "1234");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT ID, GENDER, FAVORIT FROM STUDENT");

    while (rs.next()) {
        %>
            <tr>
                <td><%=rs.getInt(1) %></td>
                <td><%=rs.getInt(2) %></td>
                <td><%=rs.getInt(3) %></td>
            </tr>
        <%
    }

    stmt.close();
    conn.close();
}
catch (Exception e) {
    e.printStackTrace();
}
%>

</table>