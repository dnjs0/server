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
            - 데이터 노출
            - URL 길이 제한
            - 간단한 데이터 전송 > 아이디 or 숫자 or 키워드
            
        2. POST
            - 패킷 본문 안에 넣어서 전송
            - 표준 방식
            - ex09_ok.jsp
            - 자바를 사용해서 데이터 전송 > ISO-8859-1
            - 데이터 은닉
            - 길이 제한 없음
        
    */
    //수신할 데이터의 인코딩 처리
    //ISO-8859-1 > UTF-8
    //- 반드시 getParameter 사용 전에
    request.setCharacterEncoding("UTF-8");
    
    
    //데이터 수신하기
    //String request.getParameter(String key);
    String txt = request.getParameter("txt");
    String num = request.getParameter("num");
    String txt2 = request.getParameter("txt2");
    

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
    <div>txt2: <%= txt2.length() %></div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script>
    
    </script>
</body>
</html>