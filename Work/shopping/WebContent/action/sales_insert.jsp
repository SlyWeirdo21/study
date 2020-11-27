<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String product_id = request.getParameter("product_id");
String purchase_date = request.getParameter("purchase_date");
int amount = Integer.parseInt(request.getParameter("amount"));

	try
	{  
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:oracle:thin:@122.128.169.32:1521:xe","smc_user_7","1234");  
		Statement stmt=con.createStatement();  
	
	    ResultSet rs = stmt.executeQuery("SELECT price FROM product WHERE product_id =  " + product_id);
	    rs.next();
	    int sale_price = rs.getInt(1);
	    rs.close();
	    System.out.println(sale_price);
		
		String query = "INSERT INTO sale(sale_id, product_id, purchase_date, sale_price, amount) " +
				       "VALUES(seq_sale.NEXTVAL, %s, '%s', %d, %d)";
		
		stmt.executeQuery(String.format(query, product_id, purchase_date, sale_price*amount, amount));
	
		con.close();
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}  
	
	response.sendRedirect("../index.jsp");
%>
