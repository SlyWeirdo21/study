<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 관리 프로그램</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<%@ include file="page/header.jsp" %>
	<%@ include file="page/nav.jsp" %>
	
	<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
	
	switch(section) {
	case "salesRegistration.jsp": %> <%@ include file="section/salesRegistration.jsp" %> <% break;
	case "integratedSalesHistoryInquiry.jsp": %> <%@ include file="section/integratedSalesHistoryInquiry.jsp" %> <% break;
	case "salesStatusProduct.jsp": %> <%@ include file="section/salesStatusProduct.jsp" %> <% break;
	case "salesStatusCategoryGroup.jsp": %> <%@ include file="section/salesStatusCategoryGroup.jsp" %> <% break;
	default: %><pre>이 프로그램은 쇼핑몰 관리해주는 프로그램입니다</pre><% break;
	}
	%>
	
	<%@ include file="page/footer.jsp" %>	
</body>
</html>