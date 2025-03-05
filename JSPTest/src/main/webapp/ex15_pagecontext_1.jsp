<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /* 
        * response, pageContext
            둘 다 페이지 이동하는 기술
        
        * 첫번째 페이지 > (이동) > 두번째 페이지
            첫번째 페이지에서 사용하던 자원을 두번째 페이지에 전달해야하는 경우
            **웹은 상태 관리가 안된다.(Stateless) 
                > 한페이지에서 사용한 모든 자원들을 다른 페이지와 공유할수 없다. 
                > 그래서 생겨난 태그가 form 태그 (보내기)
            
        
        
        페이지 가기 비교
        response.sendRedirect VS spageContext.forward
        - 페이지간 이동 시 데이터를 전달해야한다면 무조건 > pageContext.forward
        - 페이지간 이동 시 데이터가 필요없다면 > response.sendRedirect
        
        
        
    */
    //response.sendRedirect("ex15_pagecontext_2.jsp");

    //pageContext.forward("ex15_pagecontext_2.jsp");
    //pageContext.include("ex15_pagecontext_2.jsp");
    
    int num=100;
    pageContext.setAttribute("num", num);
    request.setAttribute("num", num);
    
    pageContext.forward("ex15_pagecontext_2.jsp");

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
	<!-- ex15.pagecontext_1.jsp -->
	<h1>첫번째 페이지</h1>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>