<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<form name="student_insert" action="action.jsp">
	<table border="1">
    	<tr>
	    	<td>학생</td>
	    	<td>
	    		<select name="student_id">
	    			<%
						try {
						    Class.forName("oracle.jdbc.OracleDriver");
						    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_7", "1234");
						
						    Statement stmt = conn.createStatement();
						    ResultSet rs = stmt.executeQuery("SELECT ID FROM STUDENT");
						    
						    while (rs.next()) {
						        %>
									<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1) %></option>
						        <%
						    }
						    stmt.close();
						    conn.close();
						}
						catch (Exception e) {
						    e.printStackTrace();
						}
						%>
	    		</select>
	    	</td>
 	   </tr>
 	   <tr>
 	   		<td>과목</td>
 	   		<td><input type="text" name="subject"></td>
 	   </tr>
 	   <tr>
 	   		<td>점수</td>
 	   		<td><input type="text" name="point"></td>
 	   </tr>
 	   <tr>
 	   		<td colspan="2">
 	   			<input type="button" value="입력" onclick="form_submit()"> 
 	   			<input type="button" value="다시쓰기" onclick="form_reset()">
 	   		</td>
 	   </tr>
</table>
</form>

<script>
function form_submit() {
	alert("submit");
	document.student_insert.submit();

}

function form_reset() {
	alert("reset");
	document.student_insert.reset();
}
</script>