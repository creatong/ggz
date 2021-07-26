<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="../css/myPage.css?v=3">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%@include file="../top.jsp"%>
<meta charset="UTF-8">
<title>myPage</title>
<script type="text/javascript">
	function validEmail() {
		var email = document.frmUser.email.value;
		if (email == "") {
			alert("이메일(아이디)를 입력해 주세요.!");
			document.frmUser.email.focus();
			return;
		}
		var url = "./idCheck.GGZ?email=" + email;
		window.open(url, "아이디 중복체크", "width=300,height=150,left=650,top=300");
	}
</script>
<style type="text/css">
@font-face {
    font-family: 'twaysky';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twaysky.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	width:100%;
	background-image: url("./backImg/mallBack.jpg");
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-position: center;
}
 /* body,div,table,th,tr,td,input{
	border:1px solid green;
} */
.container {
	width: 100%;
	border: 1px solid gray;
	margin-top: 80px;
	padding: 10px;
	padding-left: 12%;
	background-color: white;
	opacity: 0.85;
}
.mData,.oData{
	width:100%;
}
.mData{
	width: 80%;
 	margin: 30px auto;
  	padding: 30px 120px ;
}
.oData{
	width: 80%;
 	margin: 30px auto;
  	padding: 30px 120px ;
}
.th-set2{
	text-align:center;
	padding:10px 0px;
	text-size:1.1em;
}
.td-set2{
	vertical-align: top;
	
}
.td-set3{
	vertical-align: middle;
	text-align:center;
}
.td-set2,.td-set3,.th-set2{
	border:1px solid #BCBCBC;
}
img{
	width:90px;
	height:100px;
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
table{
	width:80%;
}
.mem_table{
	margin:auto 5px;
}
.ol_table{
	margin:auto;
}
.th-set1{
	width:30%;
	text-align:center;
	padding:25px 10px;
}
.input:focus + .line-box .line {
  width: 100%;
}
input{
	border:none;
	outline: none;
	width: 100%;
	padding: 10px;
	background: transparent;
}
strong{
	font-family: twaysky;
	font-size:1.3em;
}
</style>
</head>
<c:if test="${up=='y' }">
	<script>
		alert("정보수정 완료!");
	</script>
</c:if>

<body>
	<div class="container">
		<div class="mData">
		<strong>내 정보</strong>
		<hr>
		<p style="font-size:0.9em;text-align:right;">※비밀번호, 주소, 전화번호만 변경 가능</p>
			<table class="memTable">
				<tr>
				</tr><tr>
					<th class="th-set1">이름</th>
					<td class="td-set1"><span class="glyphicon glyphicon-user"></span></td>
					<td class="td-set1"><input type="text" class="input" name="name" placeholder="이름" value ="${member.name }" disabled="disabled">
					<span class="line-box"> 
					<span class="line"></span> 
					</span> </td>
				</tr><tr>
					<th class="th-set1">email</th>
					<td class="td-set1"><span class="glyphicon glyphicon-envelope"></span></td>
					<td class="td-set1"><input type="text" class="input" name="email" placeholder="아이디@ggz.com" value ="${member.email }"disabled="disabled">
					<span class="line-box"> 
					<span class="line"></span> 
					</span> </td>
				</tr><tr>
					<th class="th-set1">비밀번호</th>
					<td class="td-set1"><span class="glyphicon glyphicon-lock"></span></td>
					<td class="td-set1"><input type="password" class="input" name="pwd" placeholder="비밀번호" value ="${member.password }">
					<span class="line-box"> 
					<span class="line"></span> 
					</span> </td>
				</tr><tr>
					<th class="th-set1">생년월일</th>
					<fmt:formatDate value="${member.birthday }" pattern="yyyy년 MM월 dd일" var="birthday"/>
					<td class="td-set1"><span class="glyphicon glyphicon-certificate"></span></td>
					<td class="td-set1"><input type="text" class="input" name="birthday" placeholder="생년월일" value="${wdate }" disabled="disabled">
					<span class="line-box"> 
					<span class="line"></span> 
				</span> </td>
				</tr><tr>
					<th class="th-set1">주소</th>
					<td class="td-set1"><span class="glyphicon glyphicon-globe"></span></td>
					<td class="td-set1"><input type="text" class="input" name="addr" placeholder="주소" value="${member.addr }">
					<span class="line-box"> 
					<span class="line"></span> 
					</span> </td>
				</tr><tr>
					<th class="th-set1">전화번호</th>
					<td class="td-set1"><span class="glyphicon glyphicon-earphone"></span></td>
					<td class="td-set1"><input type="text" class="input" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" value = "${member.phone }"required placeholder="01000000000" name="phone">
					<span class="line-box"> 
					<span class="line"></span> 
					</span> </td>
				</tr><tr>
					<th class="th-set1">가입일</th>
					<fmt:formatDate value="${member.creatday }" pattern="yyyy년 MM월 dd일" var="creatday"/>
					<td class="td-set1"><span class="glyphicon glyphicon-certificate"></span></td>
					<td class="td-set1"><input type="text" class="input" name="birthday" placeholder="가입일" value="${creatday }" disabled="disabled">
					<span class="line-box"> 
					<span class="line"></span> 
				</span> </td>
				</tr><tr>
					<th class="th-set1">보유포인트</th>
					<td class="td-set1"><span class="glyphicon glyphicon-usd"></span></td>
					<td class="td-set1"><input type="text" class="input" name="addr" placeholder="보유포인트" value="${member.point }" disabled="disabled">
					<span class="line-box"> 
					<span class="line"></span> 
					</span> </td>
				</tr>
			</table>
		</div>
		<div class="oData">
		<strong>구매내역</strong>
		<hr>
			<table class="olTable">
				<tr>
					<th class="th-set2" colspan="2">상품정보</th>
					<th class="th-set2">판매가격</th>
					<th class="th-set2">구매일자</th>
				</tr>
					<c:forEach var="ol" items="${orderList }">
					<fmt:formatDate value="${ol.wdate }" pattern="yyyy년 MM월 dd일" var="wdate" />
					<tr>
						<td class="td-set2" style="text-align:center;width:14%;">
							<a href="mallDetailSelect.GGZ?pno=${pno}&mallIdx=${ol.mall_idx }">
								<img src="/mallImg_path/${ol.img_name }" alt="상품사진">
							</a>
						</td>
						<td class="td-set2">
							<a href="mallDetailSelect.GGZ?mallIdx=${cart1.mallIdx }&pno=${pno}" style="margin:5px 5px">
								${ol.mall_name}
							</a>
							<br><br><br>
							배송메모 : [${ol.memo }]
						</td>	
						<td class="td-set3">
							${ol.price} point
						</td>
						<td class="td-set3">
							${wdate }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
