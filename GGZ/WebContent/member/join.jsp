<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../top.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>join</title>
<script type="text/javascript">
	function chkaddr(ca) {
		var frm = document.frmUser;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if (ca == "") {
			alert("주소를 입력해주세요!");
			frm.addr.focus();
			return true;
		} else if (false == hangulcheck.test(ca)) {
			alert("한글만 입력");
			frm.addr.focus();
			return true;
		} 

	}
	function validForm() {
		var frm = document.frmUser;
		//a.
		if (chkN(frm.name.value)) {
			frm.name.focus();
			return false;
		}

		//b.
			if (chkPW(frm.pwd.value)) {
		 frm.pwd.focus();
		 return false;
		 } 

		if (chkEmail(frm.email.value)) {
			frm.email.focus();
			return false;
		}

		//c.
		if (frm.birthday.value.trim() == "") {
			alert("생일을 입력하세요");
			frm.birthday.focus();
			return false;
		}

		if (chkaddr(frm.addr.value)) {
			frm.addr.focus();
			return false;
		}

		if (frm.phone.length) { 
			alert("핸드폰 번호를 입력하세요");
			frm.phone.focus();
			return false;
		}
		if (frm.check.value == 'y' && frm.checkp.value =='y') {
			frm.submit();
		} else {
			if (frm.check.value != 'y') {
				alert("이메일 중복체크를 하세요");
			}else if(frm.checkp.value !='y'){
				alert("번호 중복체크를 하세요");
			}
		}

	}

	function chkN(cn) {
		var frm = document.frmUser;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		if (frm.name.value == "") {
			alert("이름은 필수 입력입니다.");
			frm.name.focus();
			return true;
		} else if (false == hangulcheck.test(cn)) {
			alert("한글만 입력하세요");
			frm.name.focus();
			return true;
		} else if (cn.search(/\s/) != -1) {
			alert("공백 없이 입력해주세요.");
			frm.name.focus();
			return true;
		}
	}

	function chkEmail(ce) {
		var frm = document.frmUser;
		var reg = /[a-zA-Z0-9]/i;
		if (frm.email.value == "") {
			alert("이메일을 입력하세요");
			frm.email.focus();
			return true;
		} else if (false == reg.test(ce)) {
			alert("영문과 숫자를 조합해야 합니다");
			frm.email.focus();
			return true;
		} else if (ce.search(/\s/) != -1) {
			alert("공백 없이 입력해주세요.");
			frm.email.focus();
			return true;
		}
	}

	function chkPW(pw) {
		var frm = document.frmUser;
		var id = document.frmUser.email.value;

		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if (frm.pwd.value == "") {
			alert('비밀번호를 입력하세요');
			frm.pwd.focus();
			return true;
		} else if (false == reg.test(pw)) {
			alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			frm.pwd.focus();
			return true;
		} else if (/(\w)\1\1\1/.test(pw)) {
			alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			frm.pwd.focus();
			return true;
		} else if (pw.search(/\s/) != -1) {
			alert("비밀번호는 공백 없이 입력해주세요.");
			frm.pwd.focus();
			return true;
		} else if (hangulcheck.test(pw)) {
			alert("비밀번호에 한글을 사용 할 수 없습니다.");
			frm.pwd.focus();
			return true;
		}
	}

	function validEmail() {
		var frm = document.frmUser;
		var email = document.frmUser.email.value;
		if (email == "") {
			alert("이메일(아이디)를 입력해 주세요.!");
			document.frmUser.email.focus();
			return false;
		}
		var url = "./idCheck.GGZ?email=" + email;
		window.open(url, "아이디 중복체크", "width=300,height=150,left=650,top=300");
	}
	function validPhone() {
		var frm = document.frmUser;
		var phone = document.frmUser.phone.value;
		if (phone == "") {
			alert("번호를 입력해주세요");
			document.frmUser.email.focus();
			return false;
		}
		var url = "./phoneCheck.GGZ?phone=" + phone;
		window.open(url, "번호 중복체크", "width=300,height=150,left=650,top=300");
	}
</script>
<style type="text/css">
/* form,table,td,tr,th,div{
	border:1px solid red;
} */
body {
 	  background-image: url("./backImg/scale_1201.jpg");
 	 	 background-size:cover;
	   	 width:100%;
	   	 height:100%;
}
table,tr{
	border:none;
	display: block;
	width:100%;
	position: relative;
 	margin: 20px 0px;
}
form {
	opacity: 0.9;
  width: 80%;
  margin: 60px auto;
  background: #efefef;
  padding: 60px 120px 80px 230px;
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
.joinImg{
float:left;
width:45%;

}
.frmJoin{
 position:absolute;
width:45%;
height:50%;
margin-top:80px;
left:27%;
}
.buttonBox{
	width:60%;
	text-align: center;
	margin-right:190px;
}
</style>

</head>
<body>
<div class="frmJoin">
<form name="frmUser" method="post" action="./join.GGZ">
<input type="hidden" name="insert" value="y"> 
<input type="hidden" name="check" value="n">

<h3 style="text-align: left">회원가입</h3>
	<table>
		<tr>
			<td><span class="glyphicon glyphicon-user"></span></td>
			<td><input type="text" class="input" name="name" placeholder="이름" required>
			<span class="line-box"> 
			<span class="line"></span> 
			</span> </td>
		</tr>
		<tr>
			<td><span class="glyphicon glyphicon-envelope"></span></td>
			<td><input style="display:inline-block" type="text" class="input" name="email" placeholder="아이디@ggz.com" required>
			<button style="position: absolute; color: #ffffff;" type="button" class="btn btn" onclick="validEmail()">
				<span title="중복체크" class="glyphicon glyphicon-ok-circle"></span>
			</button>
			<span class="line-box"> 
			<span class="line"></span> 
			</span> </td>
		</tr>
		<tr>
			<td><span class="glyphicon glyphicon-lock"></span></td>
			<td><input type="password" class="input" name="pwd" placeholder="비밀번호" required>
			<span class="line-box"> 
			<span class="line"></span> 
			</span> </td>
		</tr>
		<tr>
			<td><span class="glyphicon glyphicon-certificate"></span></td>
			<td><input type="date" class="input" name="birthday" placeholder="생년월일" required>
			<span class="line-box"> 
			<span class="line"></span> 
			</span> </td>
		</tr>
		<tr>
			<td><span class="glyphicon glyphicon-globe"></span></td>
			<td><input type="text" class="input" name="addr" placeholder="주소" required>
			<span class="line-box"> 
			<span class="line"></span> 
			</span> </td>
		</tr>
		<tr>
			<td><span class="glyphicon glyphicon-earphone"></span></td>
			<td><input type="text" class="input" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" required placeholder="010-0000-0000" name="phone">
				<button style="position: absolute; color: #ffffff;" type="button" class="btn btn" onclick="validPhone()">
				<span title="중복체크" class="glyphicon glyphicon-ok-circle"></span>
			</button>
			<span class="line-box"> 
			<span class="line"></span> 
			</span> </td>
		</tr>
	</table>
		<div class="buttonBox">
		<button type="button" onclick="history.back()">취소</button> 
		<button type="submit" onclick="validForm()">가입하기</button> 
		</div>
	</form>
</div>
</body>
</html>