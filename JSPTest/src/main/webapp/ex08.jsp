<%@page import="com.test.java.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //지비 양약
    // service 메서드의 내뷰ㅜ  영역
    int num = 10;//무슨 변수?(멤버변수 or 지역변수) > 지약변수
     
    MyUtil util = new MyUtil();
   %>
<%
    //선언부(멤버현수)

    //이 영역은 클래스 내부 영역
    /* public int sum(int a, int b){
        retrun a+b;
    } */

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- ex08.jsp-->
	<%=num %>
	<div> 10 + 20 = <%= util.sum(10, 20)%></div>
	<div>50 + 60 = <%= util.sum(50, 60)%></div>
	
</body>
</html>