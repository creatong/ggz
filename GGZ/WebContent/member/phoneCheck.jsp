<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>이메일 중복체크</title>
<script type="text/javascript">
	function usePhone() {
		opener.frmUser.checkp.value='y';
		self.close();
	}
</script>
</head>

<body bgcolor="#FFFFCC">
<div class="container">
	<div align="center">
	<br>${phone }<br>
	${msg }<br><br>
	<c:if test="${msg=='사용가능' }">
		<button type="button" class="btn btn-default" onclick="usePhone()">사용하기</button>
	</c:if>
	<button type="button" class="btn btn-default" onclick="self.close()">닫기</button>
	</div>
</div>
</body>
</html>