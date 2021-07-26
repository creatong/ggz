<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>퀴즈 선택하기</title>
    <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<!--Google Fonts - 나눔고딕-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="./css/common.css?v=3" />
<link rel="stylesheet" href="./css/quiz.css?v=3" />
<body>
<%@include  file="../top.jsp" %>
	<div class="description">
		<div class="inner">
				<p>퀴즈를 풀면서 포인트를 쌓아보세요!</p>
				<p>포인트로 물건을 구매할 수 있습니다.</p>
		</div>			
	</div>
    <div class="contents">
        <div class="title">
        <p>퀴즈 선택하기</p>
    	</div>
    	<div class ="quiz">
    	    <input type="button" value="1. 인물퀴즈" class="btn" onclick="location.href='./cTest.GGZ'"> 
        	<input type="button" value="2. 능력 모의고사" class="btn" onclick="location.href='./mTest.GGZ'"> 
    	</div>
    </div>

</body>
</html>