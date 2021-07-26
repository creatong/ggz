<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
strong{
	font-family: twaysky;
	font-size:1.3em;
}
/* body,table,tr,td,th,div{
	border: 1px solid gray;
}  */
body{
	width:100%;
	height:1000px;
	background-image: url("./backImg/mallBack.jpg");
	background-size: 100% 100%;
	background-repeat: no-repeat;
}
.container{
	background-color:white;
	opacity:0.85;
	width:100%;
	height:100%;
	margin:80px auto;
	padding-top:20px;
}
.delBox,.prodBox,.pointBox,.submitBox{
	width:60%;
	margin:auto;
}
.delTable,.prodTable,.pointTable,.submitTable{
	width:100%;
	border-collapse: collapse;
}
.th-set1,.pointTh,.delTh{
	padding:15px 10px;
	border-bottom: 1px solid gray;	
	text-align:left;
}
.td-set1{
	border-bottom: 1px solid gray;
}
.pointTh,.delTh{
	width:23%;
}
img{
	width:100px;
	height:100px;
}
input[type=submit] {
	width: 200px;
	height: 50px;
	font-size: 1.3em;
	border-radius: 10%;
	margin-left: 40%;
	border: none;
	background-color: black;
	color: white;
	cursor: pointer;
}
input[type=text]{
	height:30px;
	width:35%;
}
.button_set2{
	width: 70px;
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
.submitBox{
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>PayMent</title>
</head>
<body>
 
<c:if test="${member==null }">
	<script type="text/javascript">
		alert('로그인한 사용자만 가능한 서비스입니다 로그인을 해주십시오');
		history.back();
	</script>
</c:if>
<div class="container">
<form action="./pmtSuccess.GGZ" method="post" name="frm">
		
<div class="delBox">
	<strong>PayMent</strong>
	<hr style="border: 2px double gray;">
	<table class="delTable">
		<tr>
			<th class="delTh">수령인</th>
			<td class="td-set1">${member.name }</td>
		</tr>
		<tr>
			<th class="delTh">휴대전화</th>
			<td class="td-set1"><input type="text" name="m_phone" value="${member.phone }"></td>
		</tr>
		<tr>
			<th class="delTh">배송지</th>
			<td class="td-set1"><input type="text" name="m_addr" value="${member.addr }"></td>
		</tr>
		<tr>
			<th class="delTh">배송메모</th>
			<td class="td-set1"><input type="text" name="memo"></td>
		</tr>
	</table>
</div>
<br><br>
<div class="prodBox">
	<table class="prodTable">
		<tr>
			<th class="th-set1"colspan="2"><strong>상품정보</strong></th>
			<th class="th-set1" style="text-align:center;">수량</th>
			<th class="th-set1"style="text-align:center;">주문포인트</th>
		</tr>
			<c:forEach  var="vo" items="${cart }">
				<tr>
					<td class="td-set1" style="text-align:center;"><img src="/mallImg_path/${vo.img_name }"></td>	
					<td class="td-set1" width="55%">${vo.m_name }</td>
					<td class="td-set1" style="text-align:center;width:15%;" >${vo.quan } 개</td>
					<td class="td-set1" style="text-align:center;width:15%;">${vo.totalPrice } 포인트</td>
				</tr>
			</c:forEach>
	</table>
</div>
<br><br>
<div class="pointBox">
	<table class="pointTable">
		<tr>
			<th class="pointTh">보유 포인트</th>
			<td class="td-set1">${member.point } point</td>
		</tr>
		<tr>
			<th class="pointTh">결제 포인트</th>
			<td class="td-set1">${sumAll } point</td>
		</tr>
		<tr>
			<th class="pointTh">결제후 포인트</th>
			<td class="td-set1">${member.point-sumAll } point</td>
		</tr>
	</table>
</div>
<br><br>
<div class="submitBox">
	<button type="submit" class="btn btn-default">
    <span class="glyphicon glyphicon-check"></span>결제하기
  	</button>
	<button type="button" class="btn btn-default" onclick="history.back()">
    <span class="glyphicon glyphicon-check"></span>뒤로가기
  	</button>
</div>
<input type="hidden" name="sumAll" value="${sumAll }">
<input type="hidden" name="pno" value="${pno }">
<input type="hidden" name="mallIdx" value="${mallIdx }">
</form>
</div>
</body>
</html>