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
	<!-- http://192.168.10.30:8090/jsp/ex12_form.jsp -->
	<h1>버튼 만들기</h1>
    
    <form action="ex12_ok.jsp" method="POST">
    <table class="vertical">
        <tr>
            <th>너비(px)</th>
            <td><input type="number" min="20" max="300" step="10" name="width" value="120" size="10"></td>
        </tr>
        <tr>
            <th>높이(px)</th>
            <td><input type="number" min="10" max="200" step="10" name="height" value="30"></td>
        </tr>
        <tr>
            <th>텍스트</th>
            <td><input type ="text" name="txt" value="Button"></td>
        </tr>
        <tr>
            <th>배경색</th>
            <td><input type ="color" name="bgcolor" value="#FFFFFF" style="height:35px;"></td>
        </tr>
        <tr>
            <th>글자색</th>
            <td><input type ="color" name="color"  style="height:35px;"></td>
        </tr>
        <tr>
            <th>글자 크기(px)</th>
            <td><input type="number" min="10" max="100" name="size" value="16"></td>
        </tr>
        <tr>
            <th>버튼 개수(ea)</th>
            <td><input type = "number" name="count" min="1" max="30" value = "1"></td>
        </tr>
        <tr>
            <th>버튼 간격</th>
            <td>좌우 간격 : <input type = "range" name="right" min="1" max="50" value = "1"><br>
            상하 간격 : <input type = "range" name="top" min="1" max="50" value = "1"></td>
        </tr>
        <tr>
            <th>아이콘</th>
            <td><label><input type = "radio" name="rb" value = "none" checked>없음</label>
            <label><input type = "radio" name="rb" value = "home"> 집</label>
            <label><input type = "radio" name="rb" value = "img"> 이미지</label>
            <label><input type = "radio" name="rb" value = "loc"> 위치</label>
            <label><input type = "radio" name="rb" value = "git"> 깃허브</label>
            <label><input type = "radio" name="rb" value = "file"  >파일</label></td>
        </tr>
        <tr>
            <th rowspan="5">테두리</th>
            <td>
                <select name="sel1">
                    <option value="0" selected>감추기</option>
                    <option value="1">보이기</option>
                </select>
            </td>
        </tr>
        <tr>
            <td  style="border-top:none hidden">
                두께(px):
                <input type="number" min="1" max="10" name="size2" value="1">
            </td>
        </tr>
        <tr>
            <td>색상 : <input type="color" name="color2" style="height:35px;"><br></td>
        </tr>
        <tr>
            <td>스타일 : 
                <select name="sel2">
                    <option value="0" selected>실선</option>
                    <option value="1">쇄선</option>
                    <option value="2">점선</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>모서리(px) : <input type="number" min="0" max="50" name="size3" value="0"><br></td>
        </tr>
    </table>
    <div>
        <button>만들기</button> 
    </div>
    </form>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	   var sel1 = document.all.sel1;
	   if (sel1.options[1].selected){
		   alert(sel1.options[1].value);
	   }
	</script>
</body>
</html>