<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%-- <jsp:include page="../top.jsp" /> --%>
	<%@include file="../top.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>mallDetail.jsp</title>
<style type="text/css">
@font-face {
    font-family: 'twaysky';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twaysky.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
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
	width:100%;
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
.imgContainer {
	width: 45%;
	float: left;
	height: 420px;
	margin:0px 3%;
	z-index: 5;
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
.th_set1,.td_set1{
border-bottom: 1px solid gray;
vertical-align: middle;
}
.th_set1 {
	text-align: left;
	font-size: 1.2em;
	width:20%;
}
.td_set1 {
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
	text-align: center;
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
.adminButton{
	width: 93%;
	margin:auto;
	padding-top: 20px;
	text-align:right;
}
.button_set2{
	width: 85px;
	height: 30px;
	border: 1px solid gray;
	background-color: white;
	color: black;
	cursor: pointer;
}
.btn{
	width:170px;
	height:60px;
	margin:0px 10px;
	font-size: 1.2em;
	background-color: black;
	color:white;
}
strong{
	font-family: twaysky;
	font-size:1.3em;
}
</style>
<script type="text/javascript">
var frm = document.frm;

	function goPayMent(pno,memberCheck) {
		if(memberCheck=='y'){
			document.frm.action='./cartInsert.GGZ?goPmt=y'+'&pno='+pno;
			document.frm.submit();
			return true;
		}else{
			alert('로그인한 사용자만 가능한 서비스 입니다 로그인을 해주십시오');
			return false;
		}
	
	}
	function goBasket(pno,memberCheck) {
		if(memberCheck=='y'){
			document.frm.action='./cartInsert.GGZ?pno='+pno;
			document.frm.submit();
			return true;
		}else{
			alert('로그인한 사용자만 가능한 서비스 입니다 로그인을 해주십시오');
			return false;
		}

	}
	function mallDelete(mallIdx) {
		var c= confirm('정말로 상품을 삭제하시겠습니까?')
		if(c){
			alert('삭제 되었습니다');
			location.href='./mallDelete.GGZ?delete=y&mallIdx='+mallIdx;
		}
		
		
	}
	function mallUpdate(mallIdx,pno) {
		location.href='./mallUpdate.GGZ?mallIdx='+mallIdx+'&pno='+pno+'&update=n';
	}
</script>

</head>
<body>
<div class="container">
	<form action="payMent.GGZ" name="frm" method="post">
		<c:choose>
			<c:when test="${member!=null }">
				<c:set var="memberCheck" value="y"/>
			</c:when>
			<c:otherwise>
				<c:set var="memberCheck" value="n"/>
			</c:otherwise>
		</c:choose>
		<input type="hidden" name="mallIdx" value="${mallIdx }"> 
		<input type="hidden" name="pno" value="${pno }">
		<fmt:formatDate value="${detailMall.wdate }" pattern="yyyy년 MM월 dd일" var="wdate" />
		<div class="subCon1">
		<strong>Goods Detail</strong>
			<hr style="border: 2px double gray;"><br>
		<div class="imgContainer">
			<img alt="상품이미지" src="/mallImg_path/${detailMall.img_name }" >
		</div>
		<div class="tableContainer">
			<table>
				<tr>
					<th colspan="3"
						style="text-align: left; font-size: 2em; height: 70px" style="font-weight:bold;">${detailMall.name }</th>

				</tr>
				<tr height="25px">
					<th colspan="3"><hr style="border: 1.5px double gray;"></th>
				</tr>
				<tr>
					<th class="th_set1" style="font-weight:bold;">제품번호</th>
					<td class="td_set1" colspan="2">${detailMall.idx }</td>
				</tr>
				<tr>
					<th class="th_set1" style="font-weight:bold;">카테고리</th>
					<td class="td_set1" colspan="2">${detailMall.category }</td>
				</tr>
				<tr>
					<th class="th_set1" style="font-weight:bold;">판매일자</th>
					<td class="td_set1" colspan="2">${wdate }</td>
				</tr>
				<tr>
					<th class="th_set1" style="font-weight:bold;">판매가격</th>
					<td class="td_set1">${detailMall.price } point</td>
				</tr>
			</table>
		</div>
		</div>
		<div class="subCon2">
		<div class="cttContainer" style="clear: both;">
			<strong>상품설명</strong>
			<hr style="border: 2px double gray;">
			<p class="style_set1">${detailMall.content }</p>
		</div>

		<div class="buttonContainer">
			<button type="button" class="btn btn-default" onclick="history.back()">
    	 	<span class="glyphicon glyphicon-check"></span>뒤로가기
  			</button>
  			<button type="button" class="btn btn-default" onclick="return goBasket('${pno}','${memberCheck }')">
    	 	<span class="glyphicon glyphicon-check"></span>장바구니 담기
  			</button>
  			<button type="button" class="btn btn-default" onclick="return goPayMent('${pno }','${memberCheck }')">
    	 	<span class="glyphicon glyphicon-check"></span>결제하기
  			</button>
		</div>
		<div class="adminButton">
			<input class ="button_set2" type="button" name="delete" value="상품 삭제"onclick="mallDelete('${detailMall.idx}')">
			<input class ="button_set2" type="button" name="update" value="상품 수정"onclick="mallUpdate('${detailMall.idx}',${pno })">
		</div>
		</div>
	</form>
	</div>
</body>
</html>