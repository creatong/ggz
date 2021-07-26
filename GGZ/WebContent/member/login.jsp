<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	   
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%@include file="../top.jsp" %>
<meta charset="UTF-8">
<title>login</title>
<script type="text/javascript">
	function goJoin() {
		location.href='./join.GGZ';		/* 요청 url 변경 */
	}
</script>
<style type="text/css">
/*  body,div,table,th,tr,td,input{  */
/*      border:1px solid red;  */
/*  }  */



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
  width: 80%;
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

.frmLogin{
 position:absolute;
 width:40%;
 left:30%;
   

}
img{
  width: 80%;
  height: 60%;
  margin: 60px auto;
 }
 .a{
width: 10px; 
 }
</style>
</head>

<body>
<c:if test="${login=='n' }">
<script type="text/javascript">
alert("로그인정보가 틀립니다. 다시하세요");
</script>
</c:if>
<c:if test="${re=='y' }">
<script type="text/javascript">
alert("패스워드 수정완료  다시로그인하세요");
</script>
</c:if>

<div class="container">



<div class="frmLogin">
<form name="frmLogin" action="./login.GGZ" method="post" >
<h5 style="text-align: center; font-family: 'twaysky'; font-size: 16px;">그땐 그랬지</h5>
<table>
		<tr>
			<td class="a"><span class="glyphicon glyphicon-user"></span></td>
			<td><input type="text" class="input" name="userid" placeholder="아이디" required>
			<span class="line-box"> 
			<span class="line"></span> 
			</span> </td>
		</tr>
		<tr>
			<td class="a"><span class="glyphicon glyphicon-lock"></span></td>
			<td><input type="password" class="input" name="pwd" placeholder="비밀번호" required>
			<span class="line-box"> 
			<span class="line"></span> 
			</span> </td>
		</tr>
</table>		
	<button type="submit">로그인</button> 
	<hr>
	
	<div>
		<a href="./findId.GGZ?view=y">아이디찾기</a> |
		<a href="./findPassword.GGZ?view=y">비밀번호 찾기</a> <br><br>
	</div>
		
	<div>
	아직 회원이 아니신가요?
	<button type="button" class="btn btn-link" onclick="goJoin()">회원가입</button> 
	</div>
	</form>
</div>
</div>
</body>
</html>