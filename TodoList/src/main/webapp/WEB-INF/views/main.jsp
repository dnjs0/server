<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	   #tbl1 td:nth-child(1) {width : 30px; text-align : center; vertical-align : middle; font-size : 0;}
	   #tbl1 td:nth-child(2) { cursor : pointer; }
	   #tbl1 td:nth-child(2) > span { font-size : 12px; color : #999;}
	   
	   #tbl2 td:nth-child(1){width : 363px;}
	   #tbl2 td:nth-child(2){}
	</style>
</head>
<body class="narrow">
	<!-- main.jsp -->
	<h1 class="main" >Todo List</h1>
	<%-- ${list} --%>
	
	<table id="tbl1">
	   <c:forEach items="${list}" var="item">
	   <tr>
	       <td><input type="checkbox" data-seq = "${item.seq}"></td>
	       <td>${item.todo} <span>${item.regdate}</span></td>
	       <!-- ${item.seq} -->
	   </tr>
	   </c:forEach>
	</table>
	
	<hr>
	
	<form method="post" action="/todo/addok.do">
	   <table id="tbl2">
	       <tr>
	           <td><input type = "text" name="todo" required class="long"></td>
	           <td><input type="submit" value="등록하기"></td>
	       </tr>
	   </table>
	</form>
	<form action="/todo/checkok.do" id="form2" method="post">
	   <input type = "hidden" name="seq">
	   <input type="hidden" name="state">
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	   /* 완료 체크 */
	    $('#tbl1 input[type=checkbox]').change(()=>{
	    	//alert(event.target.checked);
	    	//alert(event.target.dataset['seq']);
	    	
	    	
	    	//1. 바로 이동 get으로 이동
	    	//location.href ='/todo/checkok.do?seq='+event.target.dataset['seq']+'&state'+(event.target.checked?'y':'n');
	    	
	    	//2. 히든태그 이용
	    	//언제 ? post로 전송해야할때 쓴다.
	    	//$('#form2 input[name=seq]').val(event.target.dataset['seq']);
	    	//$('#form2 input[name=state]').val(event.target.checked?'y':'n');
	    	
	    	//$('#form2').submit();
	    	
	    });
	   
	   
	</script>
</body>
</html>

















