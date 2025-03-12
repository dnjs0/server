<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //1. 데이터 가져오기(id, pw)
    //2. DB 작업 > select..
    //3. 결과
    //3.1 맞다 > 인증 티켓 발급 (*****)
    //3.2 틀리다 > 경고
    
    //1.
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    //2.
    DBUtil util = new DBUtil();
    Connection conn = util.open();

    //둘중에 하나 택1
    //String sql = "select count(*) as cnt from tblUser where id = ?  and pw = ?";
    String sql = "select * from tblUser where id=? and pw=?";
    PreparedStatement stat = conn.prepareStatement(sql);
    
    ResultSet rs = stat.executeQuery();
    
    
    //3.
    boolean isAuth = false;
    if(rs.next()){
        //존재O >로그인 성공
        isAuth = true;
        
        //인증 티켓 발급 > 로그인!!
        //session.setAttribute("키","값");
        session.setAttribute("auth",id);// 나를 식별하기 위한 id 넣기
        
    }else{
       //존재X > 로그인 실패
       isAuth = false;
    }
    
    
    
    
    
    

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
	<!--  -->
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>