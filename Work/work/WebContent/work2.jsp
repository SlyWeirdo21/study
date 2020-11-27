<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<table border="1">
    <tr>
    	<td>순위</td>
        <td>학생 ID</td>
        <td>총 점수</td>
        <td>평균 점수</td>

    </tr>
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_7", "1234");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(" SELECT " +
    	    							" student_id, " +
	    	    						" SUM(point), " +
    								    " AVG(point) " +
    									" FROM " +
    	    							" point " +
    									" GROUP BY " +
    	    							" student_id " +
    									" ORDER BY " +
    	    							" round(AVG(point)) DESC ");
    	    						    
    int rank = 0;
    while (rs.next()) {
        rank += 1;
        %>
            <tr>
            	<td><%=rank %></td>
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