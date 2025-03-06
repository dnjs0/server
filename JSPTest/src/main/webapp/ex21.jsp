<%@page import="java.util.Comparator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //디렉토리 탐색
    String path = application.getRealPath("/pic");

    File dir = new File(path);
    File[] list = dir.listFiles();
    
    //시간 순서대로 정렬
    //System.out.println(list[0].lastModified());//1741244890154
    Arrays.sort(list, new Comparator<File>() {
        public int compare(File o1, File o2){
            return Long.compare(o1.lastModified(), o2.lastModified());
        }
    });
    
    

%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	   #list{
	       display : flex;
	       flex-wrap : wrap;
	   }
	   #list > div > img{
	       width : 126px;
	       height : 126px;
	       border : 1px solid #999;
	       margin : 9px;
	       padding : 3px;
	       object-fit : cover;
	       cursor : pointer;
	   }
	   
	   #img1{
	       max-width : 490px;
	       max-height : 490px;
	       display : block;
	       margin : 15px auto;
	   }
	   
	   #list > div{
	       position : relative;
	       left:0;
	       top:0;
	   
	   }
	   
	   #list .delete{
	       font-size : 1.5rem;
	       cursor : pointer;
	       position : absolute;
	       right:14px;
	       top:10px;
	       text-shadow:0px 0px 3px #FFF;
	       display: none;
	   }
	   #list > div:hover .delete{
	       display : inline;
	   }
	</style>
</head>
<body>
	<!-- ex21.jsp -->
	<h1>Image Gallery</h1>
	
	<div id="list">
	<%for(File file : list){ %>
	   <div data-modal-button="view" data-filename="<%= file.getName()%>">
		   <img src="pic/<%= file.getName()%>">
		   <span class="delete"
		     onclick = "del('<%=file.getName()%>')">&times;</span>
	   </div>
	<%} %>
	</div>
	
	<div data-modal-window="view" data-modal-title="Image">
	   <img id="img1" alt="" src="">
	   <hr>
	   <div>
	       <button class="ok" data-modal-ok="view">확인</button>
	   </div> 
	</div>
	
	
	<hr>
	
	<form action="ex21_ok.jsp" method="POST" enctype="multipart/form-data">
	<table class="vertical">
	   <tr>
	       <th>이미지</th>
	       <td><input type="file" name="attach" required accept="image/*"></td>
	       <!-- accept="image/jpeg" : jpeg만 허락한다!! -->
	       <!-- accept="image/*" : image만 허락한다!! -->
	   </tr>
	</table>
	<div>
	   <button>이미지 업로드</button>
	</div>
	</form>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	   document.querySelectorAll('#list > div').forEach((item)=> {
		   item.addEventListener('click',function(){
			   //alert();
			   //alert(event.currentTarget.dataset['filename']);
			   $('#img1').attr('src','pic/'+event.currentTarget.dataset['filename']);
		   });
	   });
	   
	   function del(filename){
		   //alert(filename);
		   
		   if(confirm('delete?')){
			   location.href = 'ex21_del.jsp?filename='+filename;
			   
		   }
			   event.stopPropagation();
			   return false;
	   }
	</script>
</body>
</html>

















