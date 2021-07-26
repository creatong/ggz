<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>mallinsert.jsp</title>

<style type="text/css">
/* body, img, div, tr, td, th, table {
	border: 1px solid black;
} */


body {
	background-image: url("./backImg/mallBack.jpg");
	background-size: 100% 100%;
	background-repeat: no-repeat;
	width: 100%;
	height:1000px;
}
.container{
//	background-color:white;
	margin:80px auto;
	width:60%;
	height:100%;
	border:1px solid gray;
	padding:50px;
	/* opacity: 0.85; */
	background-color: rgba(255,255,255,0.85);
	
}
.subCon1{
	width:60%;
	margin:auto;
}
.subCon2{
	width:60%;
	margin:auto;
}
#preview {
	width: 45%;
	float: left;
	height: 420px;
	margin:40px 3%;
	overflow:hidden;
}
.tableContainer {
	width: 45%;
	float: left;
	height: 490px;
}
img {
	width: 100%;
	height: 490px;
}

table {
	width: 100%;
	height: 490px;
	border-collapse: collapse;
}
.style_set1{
border-bottom: 1px solid gray;
}
th {
	text-align: right;
	font-size: 1.2em;
}
td {
	text-align: center;
	font-size: 1.1em;
}
.cttContainer {
	width: 93%;
	padding-top: 20px;
	margin:auto;
}
.buttonContainer {
	width: 93%;
	margin:auto;
	padding-top: 20px;
}
.button_set1 {
	width: 200px;
	height: 50px;
	font-size: 1.3em;
	border-radius: 10%;
	margin: 10px 35px;
	border: none;
	background-color: black;
	color: white;
	cursor: pointer;
}
.button_set2{
	background-color:white;
	border : 1px solid gray;
}
.top{
	margin-bottom:180px
}
</style>
<script type="text/javascript">
	function validForm(){
		var frm = document.frmUser;
		var i;
		
		
		if(frm.name.value=="") {
			alert("이름은 필수 입력입니다.");
			frm.name.focus();
			return false;
		}
		if(frm.img_name.value=="") {
			alert("이미지 파일은 필수 입력입니다.");
			frm.img_name.focus();
			return false;
		}
		
		
		if(frm.price.value.length > 6) {
			alert("6자리를 초과하는 가격은 입력할 수 없습니다.");
			frm.price.focus();
			return false;
		}
		
		if(frm.price.value == "") {
			alert("가격은 필수 입력입니다.");
			frm.price.focus();
			return false;
		}
		
		if(frm.content.value=="") {
			alert("상세설명은 필수 입력입니다.");
			frm.content.focus();
			return false;
		}
	}
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
		var insert = document.insert;
		insert.action='mallInsertAction.GGZ';
		insert.submit();
	}
	
</script>
</head>
<body>
<%@include file="../top.jsp" %>
<div class="container">
	<form action="mallInsertAction.GGZ" name="frmUser" method="post" enctype="multipart/form-data" onsubmit="return validForm()">
		
		<c:choose>
			<c:when test="${member!=null }">
				<c:set var="memberCheck" value="y"/>
			</c:when>
			<c:otherwise>
				<c:set var="memberCheck" value="n"/>
			</c:otherwise>
		</c:choose>
		
		<div class="subCon1">
		<h2>Goods Detail</h2>
			<hr style="border: 2px double gray;"><br>
		<div id="preview">
			
		</div>
		<div class="tableContainer">
			<table>
				<tr>
					<th colspan="3">
						<input type="file" name="img_name" onchange="previewImage(this)"/><br>
						<input type="text" name="name" class="form-control" placeholder="상품 이름을 입력하세요.(최대 15자)">
					</th>

				</tr>
				<tr height="25px">
					<th colspan="3"><hr style="border: 1.5px double gray;"></th>
				</tr>
				<tr>
					<th class="style_set1" style="text-align:left">제품번호</th>
					<td class="style_set1" colspan="2">N/A</td>
				</tr>
				<tr>
					<th class="style_set1" style="text-align:left">카테고리</th>
					<td class="style_set1" colspan="2">
					<select name="category" class="form-control">
					<option value="toy">장난감</option>
					<option value="clothing">의류</option>
					<option value="acc">악세사리</option>
					<option value="snack">과자</option>
					</select></td>
					
				</tr>
				<tr>
					<th class="style_set1" style="text-align:left">판매일자</th>
					<td class="style_set1" colspan="2">N/A</td>
				</tr>
				<tr>
					<th class="style_set1" style="text-align:left">판매가격</th>
					<td class="style_set1"><input type="text" name="price" class="form-control" placeholder="가격을 입력하세요.(최대 6자리)"></td>
					<td class="style_set1">
					<span title="좋아요">
					</span></td>
				</tr>
			</table>
		</div>
		</div>
		<div class="subCon2">
		<div class="cttContainer" style="clear: both;">
			<h3>상품설명</h3>
			<hr style="border: 2px double gray;">
			<p class="style_set1"><textarea class="form-control"  cols="130" rows="10" name="content" placeholder="상세설명을 입력하세요 (최대 100자)"></textarea></p>
		</div>

		<div class="buttonContainer">
		<input class ="button_set1" type="button"  value="뒤로가기" onclick="history.back()">
		
		<button type="submit" class="button_set1" onclick="insertProduct()">등록</button>
		</div>
	
		</div>
	</form>
	</div>
</body>
</html>