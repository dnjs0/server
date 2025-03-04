<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

    //Oracle > select > 회원 정보
    ArrayList<String> names = new ArrayList<String>();
    
    names.add("홍길동");
    names.add("아무개");
    names.add("강아지");
    names.add("고양이");
    names.add("호랑이");


%>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	   #tbl1{border : 1px solid black; border-collapse:collapse;}
	   #tbl1 th, #tbl1 td{border : 1px solid black; padding: 5px;      }
	</style>
</head>
<body>
	<!-- ex06.jsp -->
	<h1>회원 목록</h1>
	
	<table id="tbl1">
	   <tr>
	       <th>번호</th>
	       <th>이름</th>
	   </tr>
	   <%for(int i=0; i<names.size(); i++){ %>
	   <tr>
           <td><%=i+1 %></td>
           <td onclick="info('<%=names.get(i) %>');"><%=names.get(i) %></td>
       </tr>
       <%} %>
	</table>
	<hr>
	<div id="div1">선택된 회원 : <span></span> </div>
	<script>
		function info(name) {
			document.querySelector('#div1>span').textContent = name;
		}
	</script>
	
	
</body>
</html>








































