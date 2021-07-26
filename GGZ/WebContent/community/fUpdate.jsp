<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시물 글 수정</title>
<style type="text/css">
body {
 	background-image: url("./backImg/freeboardList.jpg");
 	background-size:cover;
 	width:100%;
	height: 100%;
}
</style>
<script type="text/javascript">
function post_data() {
	//var subject = frm1.subject.value;  //유효성 검사
	frm1.submit();
}
function updateSave(){
	var frm = document.frm1;
	frm.action='fUpdate.GGZ?update=1.GGZ';
	frm.submit();
}
</script>
</head>
<body>
<h4>--글 수정--</h4>
<hr>
<div class="container">
<form name="frm1" method="post" action="fUpdate.GGZ?update=1.GGZ">
 <input type="hidden" name="idx" value="${bean.idx }">
 <input type="hidden" name="pno" value="${pno }">
 <table class="table">
 	<tr><td width="25%" class="td1">제목</td>
 		<td><input type="text" name="subject" value="${bean.subject}" size="70" class="form-control" required="required"></td>
 	</tr>
 	<tr><td class="td1">작성자</td>
 		<td><input type="text" name="name" value="${bean.name}" size="70" class="form-control" disabled></td>
 	</tr>
 	
 	<tr><td class="td1">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td><textarea  rows="20" cols="80" name="content" class="form-control" required="required">${bean.content}</textarea></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 		<button type="button" class="btn btn-default" onclick="updateSave()">
     		<span class="glyphicon glyphicon-check"></span>저장
   		</button>
 		<button type="reset" class="btn btn-default">
    	 	<span class="glyphicon glyphicon-repeat"></span>
   		 </button>
 	<a class="btn btn-default"  href="freeboard.GGZ?pno=${pno }">
 		<span class="glyphicon glyphicon-align-left"></span>목록</a>
 	</td></tr>
 </table>
 </form>
</div>
</body>
</html>