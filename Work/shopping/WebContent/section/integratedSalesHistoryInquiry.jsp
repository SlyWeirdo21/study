<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>통합 매출 내역 조회</h3>

<table border="1">
<tr>
	<td>판매 ID</td>
	<td>상품명</td>
	<td>구매 일자</td>
	<td>총 구매 금액</td>
	<td>구매 개수</td>
</tr>
<%
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(
        "jdbc:oracle:thin:@122.128.169.32:1521:xe","smc_user_7","1234");
        Statement stmt=con.createStatement();

        String query = " SELECT " +
                       		" sale.sale_id AS 판매ID , product.name AS 상품명, sale.purchase_date AS 구매일자, sale.sale_price AS 총구매금액, sale.amount AS 구매개수 " +
                       " FROM " +
                       " product, sale " +
                       " WHERE " +
                       " sale.product_id = product.product_id ";

        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
            %>
            	<tr>
            		<td> <%=rs.getInt("판매ID") %> </td>
            		<td> <%=rs.getString("상품명") %> </td>
            		<td> <%=rs.getString("구매일자") %> </td>
            		<td> <%=rs.getInt("총구매금액") %> </td>
            		<td> <%=rs.getInt("구매개수") %> </td>
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