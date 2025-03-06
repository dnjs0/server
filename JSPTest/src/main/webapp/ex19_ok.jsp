<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

//<form enctype="application\/x-www-form-urlencoded">
//  -request.getParameter("txt"); > 정상 동작
//<form enctype="multipart/form-data">
//-request.getParameter("txt"); > 동작하지 않음!!

//request.getParameter()
// - 기존의 request대신에 cos.jar가 제공하는 request를 사용하면 된당


//MultipartRequest(cos.jar)
//  - 기존 request의 Wrapping 객체(request의 대용품)
//  - 파일 업로드 처리 구현


//준비물 필요
//1. 업로드 파일을 저장할 경로를 지정
// - 로컬 경로로 지정(드라이브명으로 시작)
// - 관리 차원 > 프로젝트 폴더 하위에
// - webapp > "files"
    String path = application.getRealPath("/files");
    System.out.println(path);
    //C:\class\code\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files

    //2. 업로드 파일의 최대 크기 지정
    //- 바이트 단위
    int size = 1024 * 1024 * 100; //100MB
    
    //3. 변수 선언
    String txt ="";         //문자열
    String filename = "";   //첨부파일명
    String orgfilename="";  //첨부파일명
    
    
    //이 객체 생성과 동시에 파일 업로드 완료!!!
    MultipartRequest multi = new MultipartRequest(
                               request, //원래request
                               path,    //업로드 경로
                               size,    //최대크기
                               "UTF-8", //인코딩
                               new DefaultFileRenamePolicy()
            );
    
    txt= multi.getParameter("txt");
    //System.out.println(txt);
    //System.out.println(multi.getParameter("attach")); > null??
    
    
    //<input type="file" name = "attach">
    filename = multi.getFilesystemName("attach");
    System.out.println(filename);
    
    orgfilename = multi.getOriginalFileName("attach");
    System.out.println(orgfilename);
    
    
    
    
    




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
	<!--ex19_ok.jsp  -->
	<h1>결과</h1>
	
	<div> 문자열 : <%=txt %></div>
	<div> 첨부 파일 : <%=filename %></div>
	<div> 첨부 파일: <%=orgfilename %></div>
	
	
	<h2>파일 다운로드</h2>
	<!-- 
	   장점 : 초간단
	   단점 : 파일명이 다를 수 있다.
	           브라우저가 계산 > 뷰어 처리
	           
	
	
	 -->
	<div>
	   <a href="/jsp/files/"<%=filename %>><%=orgfilename %></a>
	</div>
	
	<div>
	   <a href="/jsp/files/"<%=filename %>><%=orgfilename %></a>
    </div>
    
    
    <!-- 초간당 ㄴ-->
    <!-- 
        장점 : 초간단
        단점 : 모든 브라우저 지원 안함
                파일명 보장X
    
     -->
	<div>
       <a href="/jsp/files/<%=filename %>" download><%=orgfilename %></a>
    </div>
    
    
    
    <!-- 
        다운로드 처리할 프로그램을 구현
        장점 : 통제가능
        단점 : 비용 발생
        
     -->
     <div>
       <a href="download.jsp?filename=<%=filename%>&orgfilename=<%=orgfilename%>"><%=orgfilename %></a>
    </div>
    
     
     
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>


















