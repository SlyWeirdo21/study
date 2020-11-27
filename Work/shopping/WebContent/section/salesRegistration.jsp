<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>판매 등록</h3>
<form action="action/sales_insert.jsp" name="sales_insert">
	<table border="1">
		<tr>
			<td>판매한 상품</td>
			<td>
				<select name="product_id">
				<%
					try
					{  
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection(  
						"jdbc:oracle:thin:@122.128.169.32:1521:xe","smc_user_7","1234");
						Statement stmt=con.createStatement();  
				
						String query = " SELECT product_id, name FROM product ";
					
						ResultSet rs=stmt.executeQuery(query);  
						while(rs.next()) {
							%><option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option><%
						}
						con.close();  
					}
					catch(Exception e)
					{ 
						System.out.println(e);
					}  
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>수량</td>
			<td><input type="text" name="amount"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="text" name="purchase_date"></td>
		</tr>
		<tr>
			<td><input type="button" value="등록하기" onclick="form_submit()"></td>
			<td><input type="button" value="다시쓰기" onclick="form_reset()"></td>
		</tr>
	</table>
</form>

<script>
function form_submit() {
	document.sales_insert.submit();

}

function form_reset() {
	document.sales_insert.reset();
}
</script>