<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style type="text/css">

</style>
</head>
<body>
<c:if test="${login=='y' }">
	<script>
		alert("로그인 하셨습니다.!"); 
	</script>
</c:if>

<c:if test="${logout=='y' }">
	<script>
		alert("로그아웃 하셨습니다.!"); 
	</script>
</c:if>


<header>
<nav>
<ul class="menu">
<c:choose>
	<c:when test="${member == null}">
		<li><a href="login.GGZ">로그인</a></li>				
	</c:when>
	<c:otherwise>
		<h3 style="color:orange;">${member.email}&nbsp;님&nbsp;</h3>
		<h4>${member.birthday}</h4>
		<li class="point">${member.point}&nbsp;포인트 </li>
		<li><a href="./update.GGZ">내 정보</a></li>
		<li><a href="./logout.GGZ">로그아웃</a></li>
	</c:otherwise>
</c:choose>

</ul>
</nav>
</div>
</header>



</body>
</html>