<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>능력 모의고사</title>
    <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<!--Google Fonts - 나눔고딕-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/common.css" />
<link rel="stylesheet" href="./css/mTest.css" />
  <script defer src="./js/mTest.js"></script>
</head>
<body>
<%@include  file="../top.jsp" %>
<c:if test="${member==null }">
<script type="text/javascript">
alert("로그인을 먼저 해주세요.");
location.href="./quiz.GGZ";
</script>
</c:if>
    <div class="contents">
        <div class="title">
        <p>능력 모의고사</p>
         <c:set var="step" value="${(100/cnt)*(mquiz.idx)}" />    <!-- step: 현재 단계 비율  -->
          <c:set var="steps" value="${100 - step}" />    <!-- step: 전체 비율 -->
          <c:choose>    	
          	<c:when test="${step>steps}">  <!--전체비율보다 현재 단계가 더 크면 그라데이션이 치우쳐지므로 조건을 설정해둠    -->
          		<div class="bar" style="background :linear-gradient(to right,  #FFCE3D  ${step}% ${steps}% , white ${steps}% ); ">
				</div> 	
          	</c:when>  
    		<c:when test="${mquiz.idx<cnt}">   
    			<div class="bar" style="background :linear-gradient(to left, white ${step}% ${steps}%  ,  #FFCE3D ${steps}% ); ">
				</div> 		 
    		</c:when> 
    		<c:otherwise> <!-- 마지막 문제일때 100%로 설정  -->
				<div class="bar" style="background :linear-gradient(to right, black 100% ,white 0%); ">
    			</div>
    		</c:otherwise>
    	</c:choose>
    	<span>${mquiz.idx }/${cnt}</span>   	
    </div>
       <div class="question"> <!-- 문제 출력 -->
				<p>${mquiz.question}</p>
        </div>
        <div class="choices"> <!-- 답 -->
                <input type="button" value="${mquiz.choice1}" class="btn" id="btn1" onclick="button1('${mquiz.choice1}')"> 
                <input type="button" value="${mquiz.choice2}" class="btn" id="btn2" onclick="button2('${mquiz.choice2}')"> 
                <input type="button" value="${mquiz.choice3}" class="btn" id="btn3" onclick="button3('${mquiz.choice3}')"> 
                <input type="button" value="${mquiz.choice4}" class="btn" id="btn4" onclick="button4('${mquiz.choice4}')"> 
        </div>
    </div>
     <div class="slide">
        	<input type="button" value="이전" class="s_btn" onclick="pre(${mquiz.idx},${grade},'${ch}','${an}')"> 
            <input type="submit" value="다음" class="s_btn" onclick="next(${mquiz.idx},${grade},'${mquiz.answer}',${cnt })" > 
     </div>
</body>
</html>