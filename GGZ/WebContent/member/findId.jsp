<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%@include file="../top.jsp" %>
<style type="text/css">
td{
width: 250px;

}
body {
 	    background-image: url("./backImg/scale_1201.jpg");
 	 	 background-size:cover;
	   	 width:100%;
			margin-top: 150px;
}
.container{
	margin-top:150px;
	width:90%;
}
table,tr{
 	border:none; 
	display: block;
	position: relative;
 	margin: 20px 30px;
}
form {
 	opacity: 0.9;
  width: 44%;
  margin: 60px auto;
  background: #efefef;
  padding: 60px 120px 80px 120px;
  text-align: center;
  -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
  box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
}
input{
	border:none;
	outline: none;
	width: 100%;
	padding: 10px;
	background: transparent;
}
.line-box {
  position: relative;
  width: 100%;
  height: 2px;
  background: #BCBCBC;
  display: block;
}

.line {

  position: absolute;
  width: 0%;
  height: 2px;
  top: 0px;
  left: 50%;
  transform: translateX(-50%);
  background: purple;
  transition: ease .6s;
}

.input:focus + .line-box .line {
  width: 100%;
}
button {
text-align: center;
  display: inline-block;
  padding: 12px 24px;
  background: rgb(220,220,220);
  font-weight: bold;
  color: rgb(120,120,120);
  border: none;
  outline: none;
  border-radius: 3px;
  cursor: pointer;
  transition: ease .3s;
}

button:hover {
  background: purple;
  color: #ffffff;
}

.frmFindId{
 position:absolute;
 width:40%;
 left:30%;
   

}
h5{
font-size: 16px;
size: 20px;
}

</style>
<meta charset="UTF-8">
<title>FindId</title>
<script type="text/javascript">
	function goFindPassword() {
		location.href='findPassword.GGZ?view=y';		/* 요청 url 변경 */
	}
</script>
</head>
<!-- <input type="button" value="아이디찾기" onclick="location.href='./findId.GGZ?view=y';"> -->
<!-- <input type="button" value="비밀번호 찾기" onclick="location.href='./findPassword.GGZ?view=y';"> -->

<body>

<div class="container">

<form name="frmFindId" action="./findId.GGZ" method="post">
<h5 style="text-align: center; font-family: 'twaysky';">그땐 그랬지</h5>
<input type="hidden" name="view" value="n">
<c:choose>
<c:when test="${view == y}">
	<table>
		<tr>
			<td c>이름</td>
			<td><input type="text" name="name">
			<span class="line-box"> 
			<span class="line"></span> 
			</span></td>
		</tr>
		<tr>
			<td>핸드폰 번호</td>
			<td><input type="text" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
				required placeholder="010-0000-0000" name="phone">
				<span class="line-box"> 
				<span class="line"></span> 
				</span></td>
		</tr>
	</table>
	<button type="submit">아이디 확인</button> 
	<hr>

		<li>비밀번호가 기억나지 않나요?</li> <a href="./findPassword.GGZ?view=y">비밀번호 찾기 바로가기</a>
		<li>진행에 어려움이 있으시면,안내센터로 문의주세요</li>
	</c:when>
	<c:otherwise>
		
			<h4>아이디는&nbsp;"&nbsp;${findId.email}&nbsp;"&nbsp;입니다.</h4>
	<input type="button" value="비밀번호 찾기" onclick="goFindPassword()">
	<hr>

		<li>비밀번호가 기억나지 않나요?</li> <a href="./findPassword.GGZ?view=y">비밀번호 찾기 바로가기</a>
		<li>진행에 어려움이 있으시면,안내센터로 문의주세요</li>
	</c:otherwise>
</c:choose>
</form>
</div>
	
</body>
</html>