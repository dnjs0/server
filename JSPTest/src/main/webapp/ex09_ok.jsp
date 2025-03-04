<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //JSP 페이지 코드 분리
    //1. 상단부 스크립틀릿
    //  - 데이터 수신
    //  - 변수/객체 생성하기
    //2. 하단 HTML
    //  - 페이지 내용
    //  - 자바 데이터 활용 > 표현식 > 출력
    
    /* 
        클라이언트 > (전송데이터) > 서버
        
        1. GET
            - URL 뒤에 붙여서 전송
            - 편법
            - ex09_ok.jsp?txt=홍길동&num=100
            - 쿼리스트링(QueryString)*****
            - 톰캣을 사용해서 데이터 전송 > 기본 인코딩 UTF-8
            
        2. POST
            - 패킷 본문 안에 넣어서 전송
            - 표준 방식
            - ex09_ok.jsp
            - 자바를 사용해서 데이터 전송 > ISO-8859-1
        
    */
    //데이터 수신하기
    //String request.getParameter(String key);
    String txt = request.getParameter("txt");
    String num = request.getParameter("num");
    
    

%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
    <style>
    
    </style>
</head>
<body>
    <!--ex09_ok.jsp  -->
    <h1>결과</h1>
    <div>문자 : <%=txt %></div>
    <div>숫자 : <%=num %></div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script>
    
    </script>
</body>
</html>