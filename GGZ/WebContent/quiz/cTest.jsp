<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인물 퀴즈</title>
    <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<!--Google Fonts - 나눔고딕-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/common.css?v=3" />
<link rel="stylesheet" href="./css/cTest.css?v=3" />
<script type="text/javascript">
 var c =""; //사용자가 고른 답 변수
 var g = 0; //점수 저장 변수
 var a = "";//현재 문제 답 변수
var frm =document.createElement("form"); // form태그 hidden 값을 보내기 위해 설정 
frm.setAttribute("method","post");
var hiddenGrade= document.createElement("input"); 
var hiddenAnswer= document.createElement("input");
var hiddenChoice= document.createElement("input");
var hiddenPoint = document.createElement("input");
	function pre(i,grade,ch,an){ //이전 버튼 함수 
	 if(ch==an){ //이전문제에서 정답을 맞혔을 때 
		 grade= grade-20;  //점수 20점 빼주기 
	 }
		g=grade; // g변수에 현재 점수 저장
		a=an; //a 변수에 현재 문제 답 저장
		if(i==1){ 
			return;
		}
		i= i-1; //인덱스 마이너스 1 해주기
		var url= './cTestpre.GGZ?idx='+i;
    	frm.setAttribute("action",url);
    	
    	
    	//hidden값으로 현재 점수, 문제 답 보내기 
    	hiddenGrade.setAttribute("type","hidden");
    	hiddenGrade.setAttribute("name","grade");
    	hiddenGrade.setAttribute("value",g); 

	    hiddenAnswer.setAttribute("type","hidden");
	    hiddenAnswer.setAttribute("name","answer");
	    hiddenAnswer.setAttribute("value",a);
	    
		frm.appendChild(hiddenGrade);
		frm.appendChild(hiddenAnswer);
		
		document.body.appendChild(frm); 
		frm.submit();
	}
	function  next(i,grade,answer,cnt) {  //다음 버튼 함수
		c=document.getElementById("text").value;
		a=answer;
	    if(c==answer){ //사용자가 고른 답안과 정답 확인 
	    	g =grade+ 20;
	    }
	    else{
	    	g=grade+0; //오답
	    }
		if(i==cnt){ //현재 문제가 마지막 문제면
			var url= './cTestGrade.GGZ';
	    	frm.setAttribute("action",url);
	    	//총점수 hidden 값으로 보내기
	    	hiddenGrade.setAttribute("type","hidden");
	    	hiddenGrade.setAttribute("name","grade");
	    	hiddenGrade.setAttribute("value",g);
	    	
	    	if(g==100){
	    		var p = 1000;
	    	}else if(g>=70){
	    		var p = 500;
	    	}else if(g>=50){
	    		var p = 100;
	    	}else{
	    		var p=0;
	    	}
	    	hiddenPoint.setAttribute("type","hidden");
	    	hiddenPoint.setAttribute("name","point");
	    	hiddenPoint.setAttribute("value",p);
			frm.appendChild(hiddenGrade);
			frm.appendChild(hiddenPoint);
			document.body.appendChild(frm);
			frm.submit();
			}else{
				i= i+1;
				var url= './cTestnext.GGZ?idx='+i;
		    	frm.setAttribute("action",url);
		    	
		    	//hidden값으로 현재 점수, 문제 답, 사용자가 고른 답 보내기 
		    	hiddenGrade.setAttribute("type","hidden");
		    	hiddenGrade.setAttribute("name","grade");
		    	hiddenGrade.setAttribute("value",g);

			    hiddenAnswer.setAttribute("type","hidden");
			    hiddenAnswer.setAttribute("name","answer");
			    hiddenAnswer.setAttribute("value",a);
			    	
			    hiddenChoice.setAttribute("type","hidden");
			    hiddenChoice.setAttribute("name","choice");
			    hiddenChoice.setAttribute("value",c);
				frm.appendChild(hiddenGrade);
				frm.appendChild(hiddenChoice);
				frm.appendChild(hiddenAnswer);
				
				document.body.appendChild(frm);
				frm.submit();
			}
		
	}	

</script>

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
    	    <p>인물퀴즈</p>
    	  <c:set var="step" value="${(100/cnt)*(cquiz.idx)}" />  <!-- step: 현재 단계 비율  -->
          <c:set var="steps" value="${100 - step}" />   <!-- step: 전체 비율 -->
          <c:choose>    	
          	<c:when test="${step>steps}"> <!--전체비율보다 현재 단계가 더 크면 그라데이션이 치우쳐지므로 조건을 설정해둠    -->
          		<div class="bar" style="background :linear-gradient(to right, #FFCE3D ${step}% ${steps}% , white ${steps}% ); ">
				</div> 	
          	</c:when>  
    		<c:when test="${cquiz.idx<cnt}">  
    			<div class="bar" style="background :linear-gradient(to left, white ${step}% ${steps}%  , #FFCE3D ${steps}% ); ">
				</div> 		 
    		</c:when>
    		<c:otherwise> <!-- 마지막 문제일때 100%로 설정  -->
				<div class="bar" style="background :linear-gradient(to right, black 100% ,white 0%); ">
    			</div>
    		</c:otherwise>
    	</c:choose>
    	<span>${cquiz.idx }/${cnt}</span>
  	  	</div>
        <div class="question"> <!-- 퀴즈 문제  -->
				 ${cquiz.idx}. ${cquiz.question}<br>
				 <img src="./quiz_image/${cquiz.image}" width="200px" height="200px"/>

        </div>
        <div class="choices"> <!-- 정답입력창 -->
        		<p>답을 입력 해주세요</p>
                <input type="text" class="input" id="text">       
        </div>
    </div>
     <div class="slide"> 
        	<input type="button" value="이전" class="s_btn" onclick="pre(${cquiz.idx},${grade},'${ch}','${an}')"> 
            <input type="button" value="다음" class="s_btn" onclick="next(${cquiz.idx},${grade},'${cquiz.answer}',${cnt })" > 
     </div>
</body>
</html>