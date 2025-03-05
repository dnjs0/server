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
	<!-- ex10_form.jsp *!*!!*!중요!!*!*!*!* -->
	<h1>폼 입력 태그</h1>
    
    <!-- 무조건 method=POST -->
    <form action="ex10_ok.jsp" method="POST">
    <table class="vertical">
        <tr>
            <th>텍스트 박스</th>
            <td><input type="text" name="txt1"> </td>
        </tr>
        <tr>
            <th>암호상자</th>
            <td><input type="password" name="txt2"></td>
        </tr> 
        <tr>
            <th>멀티 텍스트</th>
            <td><textarea name="txt3" class="full"></textarea></td>
        </tr>
        <tr>
            <th>체크 박스</th>
            <td><input type="checkbox" name="cb1" value="자바"></td>
        </tr>
        <tr>
            <th>체크 박스들</th>
            <td>
                <h3>취미를 선택하시오(복수 선택 가능)</h3>
                <label><input type="checkbox" name="cb2" value="독서">독서</label>
                <label><input type="checkbox" name="cb3" value="운동">운동</label>
                <label><input type="checkbox" name="cb4" value="코딩">코딩</label>
            </td>
        </tr>
        <tr>
            <th>체크 박스들2</th>
            <td>
                <h3>취미를 선택하시오(복수 선택 가능)</h3>
                <label><input type="checkbox" name="cb5" value="독서">독서</label>
                <label><input type="checkbox" name="cb5" value="운동">운동</label>
                <label><input type="checkbox" name="cb5" value="코딩">코딩</label>
            </td>
        </tr>
        <tr>
            <th>라디오 박스</th>
            <td>
                <h4>성별을 선택하세요.</h4>
                <label><input type = "radio" name="rb" value = "male" checked>남자</label>
                <label><input type = "radio" name="rb" value = "female">여자</label>
            </td>
        </tr>
        <tr>
            <th>셀렉트 박스</th>
            <td>
                <select name="sel1">
                    <option value="1">사과</option>
                    <option value="2">바나나</option>
                    <option value="3">귤</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>셀렉트 박스(다중선택)</th>
            <td>
                <!-- sel2=1&sel2=2&sel2=3 -->
                <select name="sel2" multiple>
                    <option value="1">사과</option>
                    <option value="2">바나나</option>
                    <option value="3">귤</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>히든 태그</th>
            <td><input type="hidden" name="id" value="hong"></td>
        </tr>
        <tr>
            <th>날짜</th>
            <td>
                <input type="date" name="date1">
            </td>
        </tr>
        <tr>
            <th>색상</th>
            <td>
                <input type="color" name="color1" style="height:35px" onchange = "//alert(this.value);">
            </td>
        </tr>
        <tr>
            <th>사용자 정의 컨트롤</th>
            <td>
                <img src="images/catty01.png" id="cat1">
            </td>
        </tr>
    </table>
    <div>
        <button>보내기</button> 
    </div>
    
    <!-- 이미지의 좌표값 보내기 -->
    <!-- 히든태그는 눈에 안보이니 개발자도구>요소 로 확인하기 -->
    <input type="hidden" name="left">
    <input type="hidden" name="top">
    </form>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	   $('#cat1').draggable({
		   stop : function(event, ui){
			   //alert(ui.position.left);
			   //alert(ui.position.top);
			   $('input[name=left]').val(ui.position.left);
			   $('input[name=top]').val(ui.position.top);
		   }
	   });
	</script>
</body>
</html>