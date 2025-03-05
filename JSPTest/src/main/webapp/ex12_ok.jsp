<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");

    String width = request.getParameter("width");
    String height = request.getParameter("height");
    String txt = request.getParameter("txt");
    String bgcolor = request.getParameter("bgcolor");
    String color = request.getParameter("color");
    String size = request.getParameter("size");
    int count = Integer.parseInt(request.getParameter("count"));
    String right = request.getParameter("right");
    String top = request.getParameter("top");
    String rb= request.getParameter("rb");
    String sel1 = request.getParameter("sel1");
    


%>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	.button {
        padding-left: 0px;
    }
    .button::before {
        content: none;
    }
	</style>
</head>
<body>
	<!-- http://192.168.10.30:8090/jsp/ex12_form.jsp -->
	<h1>결과</h1>
	<hr>
	<form action="ex12_form.jsp" method="POST">
    <table class="vertical">
        <tr>
            <th>버튼</th>
        </tr>
        <tr>
            <td><div>
    <%for(int i=0; i<count; i++){  %>
        <div style="width:<%=width%>px; height:<%=height%>px; color:<%=color%>; background-color:<%=bgcolor%>; font-size:<%=size %>px; margin:<%=top %>px <%=right %>px; display: flex; justify-content: center; align-items: center;  float: left;"><%=txt %></div>
    <%} %>
    </div></td>
        </tr>
    </table>
    <div>
        <button>돌아가기</button> 
    </div>
    </form>
    <hr>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>