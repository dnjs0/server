<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%
       // 자바 영역 > 스크립틀릿
       int dan = 5;
    %>
	<style type="text/css">
	   div {
	       font-size: <%=dan%>rem;
	   }<%=dan %>
	</style>
</head>
<body>
	<!-- ex04.jsp -->
	<%
       // 자바 영역 > 스크립틀릿
       //int dan = 5;
    %>
	
	<%
	   for(int i=1; i<= 9; i++){
	%>
	       <div><%= dan %> x <%= i %> = <%= dan*i %></div>
	       <div><%= dan + " x " + i +" = "+dan*i %></div>
	<%
	   }
	%>
	
	<hr>
	
	<div>단 : <%= dan %></div>
	
	
</body>
</html>