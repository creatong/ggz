<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../top.jsp" %> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
@font-face {
    font-family: 'twaysky';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twaysky.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
h1,h2,h3,h4,h5{
	font-family: twaysky;
}
/* body,div,table,tr,th,td{
	border:1px solid green;
} */

body{
	width:100%;
	height:1000px;
	background-image: url("./backImg/mallBack.jpg");
	background-size: 100% 100%;
	background-repeat: no-repeat;
}
.container{
	margin:80px auto;
	padding:50px;
	background-color:white;
	opacity:0.93;
	height:100%;
	width:100%;
}
.subCon{
	width:31%;
	float:left;
	height: 490px;
}
#preview{
	width:31%;
	float:left;
	height: 490px;
	margin-left:19%;
}
.table{
	width:100%;
}
img {
	margin-left:10%;
	width: 80%;
	height: 100%;
}
.textBox,.buttonBox{
	width:62%;
	clear: both;
	margin:auto;
}
.contentBox{
	width:62%;
	margin:auto;
	clear: both;
}
.buttonBox{
	text-align: center;
}
.ex{
	text-align: center;
	margin-top:49%;
}
.ex2,.form-control{
	margin:20px 0px;
	font-size: 1.1em;
}
th{
	width:30%;
	heigh:50%;
	text-align: center;
	padding-top:100px;
}
.btn{
	width:120px;
	height:60px;
	margin:0px 10px;
	font-size: 1.2em;
	background-color: black;
	color:white;
}
</style>
<meta charset="UTF-8">
<title>상품수정</title>
<script type="text/javascript">

function previewImage(f){

	var file = f.files;

	
	if(!/\.(jpg|jpeg|png)$/i.test(file[0].name)){
		alert('jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
		f.outerHTML = f.outerHTML;
		document.getElementById('preview').innerHTML = '';
	}
	else {
		var reader = new FileReader();
		reader.onload = function(rst){
			document.getElementById('preview').innerHTML = '<img src="' + rst.target.result + '">';
		}
		reader.readAsDataURL(file[0]);
	}
}

function insertProduct(){
	var insert = document.insertp;
	insert.action='mallInsertAction.GGZ';
	insert.submit();
}
</script>
</head>

<body>
<form name="insertp" action="mallInsertAction.GGZ" method="post" enctype="multipart/form-data">
<div class="container">
<div class="textBox"><h3>상품수정</h3><hr></div>

<div id="preview">
	<p class="ex">상품 미리보기 없음</p>
		</div>
<div class="subCon">
<table class="table">
<tr>
	
	<td colspan="2">
	원하시는 상품 이미지를 넣어주세요<br>
	<input type="file" name="img_name" alt="미리보기 이미지" onchange="previewImage(this)"/>
	<input type="text" name="name" class="form-control" value="${detailMall.name}" placeholder="상품 이름을 입력하세요" size="40"></td>
</tr>
	<tr>
		<th><p class="ex2">상품번호</p></th>
		<td><input type="text" name="mallIdx" class="form-control" value="${detailMall.idx}" size="40" readonly="readonly"></td>
	</tr>
<tr>
	<th><p class="ex2">카테고리</p></th>
	<td><select name="category" class="form-control">
		<option value="toy" 
			<c:if test="${detailMall.category=='toy' }">
				selected
			</c:if>>toy</option>
		<option value="clothing" 
			<c:if test="${detailMall.category=='clothing' }">
				selected
			</c:if>>clothing</option>
		<option value="snack"
				<c:if test="${detailMall.category=='snack' }">
					selected
				</c:if>>snack</option>
		</select></td>
</tr>
<tr>
	<th><p class="ex2">판매일자</p></th>
	<fmt:formatDate value="${detailMall.wdate }" pattern="yyyy년 MM월 dd일" var="wdate"/>
	<td>
		<input type="text" name="wdate" class="form-control" value="${wdate}" size="40" readonly="readonly">
	</td>
</tr>
<tr>
	<th><p class="ex2">상품가격</p></th>
	<td>
	<input type="text" name="price" class="form-control" value="${detailMall.price}" placeholder="가격을 입력하세요." size="40"></td>
</tr>
</table>
</div>
<div class="contentBox">
<br><br>
	<h4>상세설명</h4>
	<hr>
	<textarea class="form-control" cols="50" rows="10" name="content"  placeholder="상세설명을 입력하세요">${detailMall.content}
		</textarea>
</div>
<div class="buttonBox">
    <button type="button" class="btn btn-default" onclick="history.back()">
      <span class="glyphicon glyphicon-check"></span>뒤로가기
    </button>
    <button type="submit" class="btn btn-default" onclick="insertProduct()">
      <span class="glyphicon glyphicon-check"></span>등록
    </button>
</div>

</div>
</form>
</body>
</html>