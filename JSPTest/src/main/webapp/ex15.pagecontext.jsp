<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //pageContext, request, response 객체들을 누가 만들까?
    // > 톰캣이 만듦
    // > 언제 만드는디??(****) + 객체들의 생명주기 차이
    
    pageContext.setAttribute("num",100);
    request.setAttribute("num",200);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	
	</style>
</head>
<body>
	<!-- ex15.pagecontext.jsp -->
	<div>pageContext.num : <%=pageContext.getAttribute("num") %></div>
	<div>request.num : <%=request.getAttribute("num") %></div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>