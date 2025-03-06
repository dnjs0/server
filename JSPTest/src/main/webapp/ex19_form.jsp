<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<!-- ex19_form.jsp -->
	<h1>파일 업로드</h1>
	
	<!-- 
	    파일 업로드 설정
	    1. 서버측
	       - 파일 업로드 라이브러리 사용
	       - cos.jar : WEB-INF > lib 폴더에 복사
	    
	    2. 클라이언트측
	       a. <form method="POST">
	       b. <form enctype="">
	           1. application/x-www-form-urlencoded
	               - 전송값들을 문자열로 전송하겠다.
	           2. multipart/form-data
	               - 문자열 + 비문자열 동시 전송
	       c. <input type="file">
	    
	
	 -->
	
	
	
	<form action="ex19_ok.jsp" method="POST" enctype="multipart/form-data">
	<table class="vertical">
	   <tr>
	       <th>문자열</th>
	       <td><input type="text" name="txt"></td>
	   </tr>
	   <tr>
           <th>첨부파일</th>
           <td><input type="file" name="attach"></td>
       </tr>
	</table>
	<div>
	    <button>보내기</button>
	</div>
	</form>
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>