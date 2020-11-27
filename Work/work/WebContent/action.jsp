<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String student_id = request.getParameter("student_id");
    String subject = request.getParameter("subject");
    String point = request.getParameter("point");

    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost/xe", "smc_user_7", "1234");

        Statement stmt = conn.createStatement();

        String query = "INSERT INTO POINT(ID, STUDENT_ID, SUBJECT, POINT) VALUES(SEQ_POINT.NEXTVAL, %s, '%s', %s)";

        ResultSet insert_rs = stmt.executeQuery(String.format(query, student_id, subject, point));

        conn.commit();
        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
    
    response.sendRedirect("work3");
%>