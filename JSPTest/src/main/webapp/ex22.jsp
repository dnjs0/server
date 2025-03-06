<%@page import="java.util.Calendar"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//디렉토리 탐색
	String path = application.getRealPath("/files");
	
	File dir = new File(path);
	File[] list = dir.listFiles();
	//System.out.println(path);
	//System.out.println(list);
	
	//시간 순서대로 정렬
	//System.out.println(list[0].lastModified());//1741244890154
	/* Arrays.sort(list, new Comparator<File>() {
	    public int compare(File o1, File o2){
	        return Long.compare(o1.lastModified(), o2.lastModified());
	    }
	}); */


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
	<!-- ex22.jsp -->
	<!-- http://192.168.10.30:8090/jsp/ex22.jsp  -->
	<h1>자료실(탐색기) webapp > files</h1>
	
	<form action="ex22_ok.jsp" method="POST" enctype="multipart/form-data">
	<table class = "vertical">
	   <tr>
	       <th style = "width:300px">파일명</th>
	       <th style = "width:60px">크기</th>
	       <th>수정된 날짜</th>
	   </tr>
	   <%for(File file : list){ %>
		   <tr>
		       <td><%= file.getName()%></td>
		       <td style="text-align: right"><%= String.format("%,d", file.length()) %>B</td>
		       <td style="text-align: center"><%
                        Calendar time = Calendar.getInstance();
                        time.setTimeInMillis(file.lastModified());
                        out.println(String.format("%tF %tT", time, time));
                    %></td>
		   </tr>
		<%} %>
	</table>
	
	

	<hr>
	<div>파일 : <input type="file" name="attach" required></div>
	<!-- <div style="margin:15px 0px"><input type ="button" value="업로드" > </div> -->
	<button style="padding:10px">업로드</button>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>