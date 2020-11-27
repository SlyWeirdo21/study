<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>카테고리별 매출현황 조회</h3>

<table border="1">
<tr>
	<td>카테고리명</td>
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
                       		" category.name AS 카테고리명, SUM(sale.sale_price) AS 총판매금액, SUM(sale.amount) AS 판매개수 " +
                       " FROM category, product, sale " +
                       " WHERE category.category_id = product.category_id AND product.product_id = sale.product_id " +
                       " GROUP BY category.name ";

        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
            %>
            	<tr>
            		<td> <%=rs.getString("카테고리명") %> </td>
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