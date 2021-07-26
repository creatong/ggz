<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%@include file="../top.jsp" %> 
<meta charset="UTF-8">
<title>Freeboard 글쓰기</title>
<script type="text/javascript">
	function saveWrite(){
		var frm=document.frm1;
		frm.action='fWrite.GGZ';
		frm.submit();
	}
</script>
<style type="text/css">
body {
 	background-image: url("./backImg/freeboardList.jpg");
 	background-size:cover;
 	width:100%;
	height: 100%;
}
form{
	background-color: white;
}
.container{

}
.container1{
	width: 100%;
	height: 1000px;
	background-color: white;
	opacity: 0.9;
	margin-top: 80px;
}
</style>
</head>
<body>
<div class="container1">

<div class="container">
<br>
<h3 style="text-align: left;">--글 쓰기--</h3>
<hr>

<form name="frm1" method="post" action="fWrite.GGZ"> <!-- action:submit버튼 실행시 동작-->
<input type="hidden" name="insert" value="1"/>
<input type="hidden" name="midx" value="${member.idx }">
<input type="hidden" name="pno" value="${pno }"/>
<div class="form-group">
 <table class="table" style="text-align: center;">
 	<tr><td width="25%" class="td1">제목</td>
 		<td><input type="text" class="form-control validate" name="subject" size="70" class="input1" required="required"></td>
 	</tr>
 	<tr><td class="td1">작성자</td>
 		<td><input type="text" class="form-control" name="name" value="${member.name}" size="70" class="input1" required="required"></td>
 	</tr>
 	<tr><td class="td1">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td><textarea class="form-control" rows="15" cols="80" name="content" class="input1" required="required"></textarea></td>
 	</tr>
 	
 	<tr><td colspan="2" align="center">
 	<button type="button" class="btn btn-default" onclick="saveWrite()">
      <span class="glyphicon glyphicon-check"></span>저장
    </button>
   <span title="다시쓰기">
    <button type="reset" class="btn btn-default">
      <span class="glyphicon glyphicon-repeat"></span>
    </button>
    </span>
 	<a class="btn btn-default"  href="freeboard.GGZ?pno=${pno }">
 		<span class="glyphicon glyphicon-align-left"></span>목록</a>
 	</td></tr>
 </table>
 </div>
 </form>
</div>
</div>
</body>
</html>