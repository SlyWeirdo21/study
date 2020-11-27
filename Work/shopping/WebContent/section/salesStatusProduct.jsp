<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>상품별 매출 현황</h3>

<table border="1">
<tr>
	<td>상품명</td>
	<td>총 판매 금액</td>
	<td>판매 개수</td>
</tr>
<%
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(
        "jdbc:oracle:thin:@122.128.169.32:1521:xe","smc_user_7","1234");
        Statement stmt=con.createStatement();

        String query = " SELECT " +
                       		" product.name AS 상품명, SUM(sale.sale_price) AS 총판매금액, SUM(sale.amount) AS 판매개수 " +
                       " FROM product, sale " +
                       " WHERE sale.product_id = product.product_id " +
                       " GROUP BY product.name ";

        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
            %>
            	<tr>
            		<td> <%=rs.getString("상품명") %> </td>
            		<td> <%=rs.getInt("총판매금액") %> </td>
            		<td> <%=rs.getInt("판매개수") %> </td>
  
            	</tr>
            <%
        }
        con.close();
    }
    catch(Exception e)
    { 
        System.out.println(e);
    }
%>
</table>