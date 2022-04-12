<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<%
	String res = CmmUtil.nvl((String)request.getAttribute("res"),"0");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
서울강서캠퍼스 식단 홈페이지에서 5<%=res %>개의 월요일부터 금요일까지의 식단정보가 수집되었습니다.
</body>
</html>