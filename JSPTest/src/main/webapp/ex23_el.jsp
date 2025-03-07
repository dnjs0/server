<%@page import="com.test.java.Student"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	   body{padding-bottom : 1000px}
	</style>
</head>
<body>
	<!-- ex23_el.jsp -->
	<h1>EL</h1>
	
	<!-- 
	
	   <%-- <%= %>, 표현식 언어의 주석 --%>
	   EL, 표현식 언어(같은 표현식 언어지만 EL이라고 부름)
	   - 평범한 출력문이 아니라(아무값이나 출력하는 용도가 아니다.)
	     내장 객체의 컬렉션 값을 출력하는 전용 출력문이다.
	     EL은 (pageContext, request, session, application)을 위해 만든 문법(일반 변수 a는 출력안해줌)
	   
	   1. 코드 가독성 향상
	   - Java 코드와 HTML 코드를 완전 분리하자
	   
	   2. 간편한 문법
	   
	   3. 보안 강화
	   - null 처리 등
	   
	   4. 코드 재사용성 향상
	   
	
	 -->
	<%
	   //자바 변수(데이터) > 화면 출력!!
	   int a= 10;
	   
	   //내장 객체 (변수를 만들었다고 생각해)
	   //-EL은 키가 종료되면 영역이 작은 객체부터 우선한다.
	   pageContext.setAttribute("b",20);
	   request.setAttribute("c",30);
	   session.setAttribute("d",40);
	   session.setAttribute("b", 200);
	
	%>
	
	<h2>표현식</h2>
	<div>a : <%=a %></div>
	<div>b : <%=pageContext.getAttribute("b") %></div><!-- 생명주기 젤 짧음 -->
	<div>b : <%=session.getAttribute("b") %></div>
	<div>c : <%=request.getAttribute("c") %></div>
	<div>d : <%=session.getAttribute("d") %></div>
	
	
	
	<h2>EL</h2>
	<div>a : ${a}</div>
	<%-- <div>b : ${pageContext.getAttribute("b") }</div> 오류아닌데 오류라뜸--%>
	<div>b : ${b}</div><!-- 다 생략하고 키 값만 받음 -->
	<div>b : ${sessionScope.b}</div><!-- b찾을때 영역 작은쪽부터 안뒤지고 세션부터 뒤짐 -->
	<div>c : ${c}</div>
	<div>d : ${d}</div>
	
	<%-- <div>c : ${request.getAttribute("c") }</div>
	<div>d : ${session.getAttribute("d") }</div> --%>
	
	
	
	
	<%
	   pageContext.setAttribute("n1",10);
	   pageContext.setAttribute("n2",3);
	   
	%>
    <h2>EL 기능</h2>
    
    <h3>EL 연산 기능</h3>
    
    <div>n1 + 10 = <%=(int)pageContext.getAttribute("n1")+10 %></div>
    <div>n1 + 10 = ${n1} + 10</div><!-- 10+10 이라고 찍힘 -->
    <div>n1 + 10 = ${n1+10}</div>
    
    <div>n1 + n2 = <%= (int)pageContext.getAttribute("n1") + (int)pageContext.getAttribute("n2") %></div>
    <div>n1 + n2 = ${n1+n2}</div>
	
	
	<hr>
    <div>n1 + n2 = ${n1+n2}</div>
    <div>n1 - n2 = ${n1-n2}</div>
    <div>n1 * n2 = ${n1*n2}</div>
    <div>n1 / n2 = ${n1/n2}</div>
    <div>n1 % n2 = ${n1%n2}</div>
    <div>n1 mod n2 = ${n1 mod n2}</div>
	
	<hr>
	
	<div>n1 > n2 = ${n1>n2}</div>
	<div>n1 &gt; n2 = ${n1 gt n2}</div>
	
	 <div>n1 < n2 = ${n1 < n2}</div>
    <div>n1 &lt; n2 = ${n1 lt n2}</div>
	
	<div>n1 >= n2 = ${n1>=n2}</div>
    <div>n1 &ge; n2 = ${n1 ge n2}</div>
    
    <div>n1 <= n2 = ${n1 <= n2}</div>
    <div>n1 &le; n2 = ${n1 le n2}</div>
    
    <div>n1 == n2 = ${n1 == n2}</div>
    <div>n1 == n2 = ${n1 eq n2}</div>
    
    <div>n1 != n2 = ${n1 != n2}</div>
    <div>n1 != n2 = ${n1 ne n2}</div>
	
	<hr>
	
	<div>${true && true}</div>
	<div>${true || false} > short-circuit 여서 데드코드</div>
	<div>${!true}</div>
	
	<div>${true and true}</div>
    <div>${true or false} > short-circuit</div>
    <div>${not true}</div>
	
	<hr>
	
	<div>${n1 > 0 ? "양수" : "음수" }</div>
	
	<hr>
	
	<%-- <div>${"홍길동".equals("홍길동")}</div> --%>
	<div>${"홍길동"=="홍길동"}</div>
	
	<hr>
	
	
	<%
	   HashMap<String, String> map = new HashMap<>();
	   map.put("name", "홍길동");
	   map.put("age", "20");
	   map.put("address", "서울시");
	   
	   pageContext.setAttribute("map", map);
	   
	%>
	<h3>객체 멤버 접근</h3>
	
	<div>이름 : <%=map.get("name") %></div>
	<div>나이 : <%=map.get("age") %></div>
	<div>주소 : <%=map.get("address") %></div>
	
	<div>${map}</div>
	<div>이름 : ${map.get("name")}</div>
	<div>이름 : ${map["name"]} **</div>
	<div>이름 : ${map.name} ****</div>

    <div>나이 : ${map.age -1}</div>
    <div>주소 : ${map.address}</div>
    <hr>

    <%
        Student s1 = new Student();
    
        s1.setName("아무개");
        s1.setAge(20);
        s1.setAddress("서울시");
        
        pageContext.setAttribute("s1",s1);
    %>

    <div>이름 : <%=s1.getName() %></div>
    <div>나이 : <%=s1.getAge() %></div>
    <div>주소 : <%=s1.getTest() %></div>
    
    <div>이름 : ${s1.getName()}</div>
    <div>나이 : ${s1["age"]}</div>
    <div>주소 : ${s1.test}</div>
    <!-- javax.el.PropertyNotFoundException: [addresss] 특성이 [com.test.java.Student] 유형에 없습니다. -->
    <hr>
    
    <%
        
        Student s2 = null;
        pageContext.setAttribute("s2",s2);
        
        String s3="";
        pageContext.setAttribute("s3",s3);
    
    %>
    
    <div>${s2==null}</div>
    <div>${s3==null}</div><!-- 빈문자열은 null이 아님 ! -->
    <div>${s3==""}</div>
    
    <div>${empty s2}</div>
    <div>${empty s3}</div>
    
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	   /* let str=`${num}`; */
	</script>
</body>
</html>

















