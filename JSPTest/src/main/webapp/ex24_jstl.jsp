<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	   body { padding-bottom : 1000px}
	   
	</style>
</head>
<body>
	<!-- ex24_jstl.jsp -->
	<!-- 
	   JSTL
	   -프로그래밍 기능이 구현된 태그
	   - 자바의 제어 대신하기 위한 역할
	   - 변수, 조건문, 반복문 등..
	   - 문자열 처리, ...
	   
	 -->
	 
	<h1>JSTL</h1>
	 
	 
	<h2>변수 선언</h2>
	<%
	   int a = 10; //지역 변수
	   pageContext.setAttribute("b",20); //pageContext 변수
	   
	%>
	
	<!-- 
	   마크업 언어
	   - <태그명></태그명>
	   -<네임스페이스:태그명></네임스페이스:태그명>
	
	   JSTL 변수 
	   - pageContext 안에잇는 변수
	   pageContext.setAttribute("b",20);
	   <c:set var="c" value="30" />
	   위의 두개가 같은 표현!
	   
	-->
	
	<!-- 단독태그여서 <%--<c:set />이나 <c:set></c:set>--%>로 적어야한다. -->
	<c:set var="c" value="30" />
	
	<div>a : <%= a %></div>
	<div>a : ${a}</div>
	
	<div>b : <%=pageContext.getAttribute("b") %></div>
	<div>b : ${b}</div>
	
	<%-- <div>c: <%=c %><div> --%>
	<div>c : ${pageScope.c}</div>
	<div>c : ${requestScope.c}</div>
	<div>c : ${sessionScope.c}</div>
	<div>c : ${applicationScope.c}</div>
	
	
	
	
	<h2>변수 수정하기</h2>
	<c:set var="c" value="50" />
	<div>c : ${c}</div>
	
	
	<h2>변수 삭제하기</h2>
	<c:remove var="c" />
	<div>c : ${c}</div>
	
	
	<h2>변수 상태</h2>
	<c:set var="c" /><!-- null -->
	<c:set var="c" value=""/>
	<c:set var="c" value="null"/><!-- null 이라는 문자열 -->
	<div>c : ${empty c}</div>
	<div>d : ${empty d}</div> <!-- 없는 변수도 null로 찾아냄 -->





    <h2>조건문</h2>
    <c:set var="num" value="-10" />
    <!-- 내장객체는 무조건 EL로 꺼내기!!! -->
    
    <c:if test="${num>0}">
        <div>${num}은 양수입니다.</div>
    </c:if>
    
    <!-- 공식적으로는 else 절이 없다.  -->
    <c:if test="${num<0}">
        <div>${num}은 음수입니다.</div>
    </c:if>
    
    
    
    <h2>조건문</h2>
    <c:choose>
        <c:when test="${num>0}">양수</c:when>
        <c:when test="${num>0}">음수</c:when>
        <c:otherwise>영</c:otherwise>
    </c:choose>
    
    

    <h2>반복문(일반 for + 향상된 for)</h2>
    <% for(int i=1; i<=10; i++){ %>
        <div>숫자 : <%=i %></div>
    <%} %>
    
    <br>
    
    <!-- step은 양수만 가능 -->
    <c:forEach var="i" begin="1" end="9" step="3">
        <div>숫자 : ${i}</div>
    </c:forEach>
    
    <br>
	
	<%
	   String[] names ={"홍길동","아무개","강아지","고양이","병아리"};
	   pageContext.setAttribute("names",names);
	%>
	
	<br>
	
	<!-- for(String name : names) -->
	<c:forEach var="name" items="${names}">
	   <div>${name}</div>
	</c:forEach>
	<br>
	<table>
	   <tr>
	       <th>이름</th>
	       <th>인덱스</th>
	       <th>카운트</th>
	       <th>current</th>
	       <th>first</th>
	       <th>last</th>
	   </tr>
	   <c:forEach items="${names}" var="name" varStatus="status">
	   
	   <c:if test="${status.index mod 2 == 0}">
	   <tr style="background-color:gold; text-align:center;">
	   </c:if>
	   
	   <c:if test="${status.index mod 2 == 1}">
       <tr style="text-align:center;">
       </c:if>
	   
	   
	       <td>${name}</td>
	       <td style="text-align:right">${status.index} - ${j}</td>
	       <td style="text-align:right">${status.count}</td>
	       <td>${status.current}</td>
	       <td>${status.first}</td>
	       <td>${status.last}</td>
	   </tr>
	   <c:set var="j" value="${j+1}" />
	   </c:forEach>
	</table>
	
	<hr>
	
	<c:forTokens var="city" items="서울,인천,대구,부산,제주" delims=",">
	   <div>${city}</div>
	</c:forTokens>
	
	
	
	<h2>출력문</h2>
	<c:set var="txt" value="안녕하세요. <b>홍길동<b>입니다."/>
	<div>txt : ${txt}</div>
	<div style="padding: .3rem 1rem;">txt : <c:out value="${txt}"/></div>
	<!-- out : <, >, b 모두 escape시킴 -->
	<div style="padding: .3rem 1rem;">txt : <c:out value="${txt}" escapeXml="false" /></div>
	
	
	<hr>
	
	<div>http://localhost:8090/jsp/ex20.jsp?name=hong&age=20&gender=m</div>
	
	<c:url var="url1" value="http://localhost:8090/jsp/ex20.jsp" >
	   <c:param name="name" value="hong"></c:param>
	   <c:param name="age" value="20"></c:param>
	   <c:param name="gender" value="m"></c:param>
	</c:url>
	<div><a href="${url1}">페이지 이동하기</a></div>
	
	<hr>
	
	<!-- 바로가기 -->
	<%-- <c:redirect url="ex21.jsp"></c:redirect> --%>
	
	
	
	<c:set var="price" value="1234567" />
	<div>가격 : ${price}원</div>
	<!-- 세자리 마다 , 찍기 -->
	<div>가격 : <fmt:formatNumber value="${price }"/>원</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>


















