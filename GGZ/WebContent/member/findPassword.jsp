<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%@include file="../top.jsp" %>
<style type="text/css">
@font-face {
    font-family: 'twaysky';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twaysky.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/* body,div,table,th,td{
	border:1px solid red;
} */
body {
 	    background-image: url("./backImg/scale_1201.jpg");
 	 	 background-size:cover;
	   	 width:100%;
		margin-top: 170px;
}
.container{
	margin-top:150px;
	width:90%;
}
table,tr{
	width:100%;
 	/* border:none;  */
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

.frmFindPassword{
 position:absolute;
 width:40%;
 left:30%;
   

}
h1,h2,h3,h5,h5{
font-family:twaysky;
}
strong{
	font-family:twaysky;
	font-size: 1.5em;
}
</style>
<meta charset="UTF-8">
<title>FindPassword</title>
</head>


<body>
	<form name="frmFindPassword" action="./findPassword.GGZ" method="post">
	<strong>그땐 그랬지</strong>
<input type="hidden" name="view" value="n">
<c:choose>
<c:when test="${view == y}">
	<table>
		<tr>
			<th width="34%;">이메일</th>
			<td width="50%;"><input type="text" name="email" size="25">
			<span class="line-box" > 
				<span class="line"></span> 
				</span></td><th>@ggz.com</th>
		</tr>
		<tr>
			<th width="30%;">이름</th>
			<td width="70%;"><input type="text" name="name" size="50">
			<span class="line-box" > 
				<span class="line"></span> 
				</span></td>
		</tr>
		<tr>
			<th width="30%;">핸드폰 번호</th>
			<td width="70%;"><input type="text" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
				required placeholder="010-0000-0000" name="phone" size="50">
				<span class="line-box">
				<span class="line"></span> 
				</span></td>
		</tr>
	</table>
	<button type="submit">비밀번호 확인</button> 
	<hr>

	</c:when>
	<c:otherwise>
		
			<h4>비밀번호는&nbsp;"&nbsp;${findPassword.password}&nbsp;"&nbsp;입니다.</h4>
	<input type="button" value="홈" onclick="location.href='./index.GGZ';">
	<hr>

	</c:otherwise>
</c:choose>
</form>

</body>
</html>