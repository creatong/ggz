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
    <title>능력 모의고사 결과</title>
    <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<!--Google Fonts - 나눔고딕-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="./css/common.css?v=3" />
<link rel="stylesheet" href="./css/mTestGrade.css?v=3" />

<!-- 카카오 -->
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
Kakao.init('60ee68795e58b8782d4fe0f32f47f1c0'); // 초기화
function sendLink(gr) {
    Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
            title: '그그지',
            description: '모의고사 결과 ! 점수 : '+gr+' 점 입니다!!',
            imageUrl: 'https://static-s.aa-cdn.net/img/gp/20600010809631/UYDzlXQMBWcMT0nbXsFJNLEYbuBpmeyjMrnkaMpO2dJx27J2wIbB-0JwTwA3sVvMyxEv=s300?v=1',
            	 link: {
            	      mobileWebUrl: 'https://developers.kakao.com/docs/js/kakaotalklink#텍스트-템플릿-보내기',
            	      webUrl: 'https://developers.kakao.com/docs/js/kakaotalklink#텍스트-템플릿-보내기',
            	    },
        },
        buttons: [
            {
                title: '퀴즈 다시 풀어보기',
                link: {
                    mobileWebUrl: 'https://developers.kakao.com/docs/js/kakaotalklink#텍스트-템플릿-보내기',
                    webUrl: 'https://developers.kakao.com/docs/js/kakaotalklink#텍스트-템플릿-보내기',
                  },
            }
        ],
    })
}
</script>

</head>
<body>
<%@include file="../top.jsp" %>
    <div class="contents">    
  	  <div class="title">
      	  <p>능력 모의고사 결과</p>
   	 </div>
   	 	<div class="score">
   	 		<c:choose>
   	 			<c:when test="${grade>0}"> 
    			 <p>총 점수: ${grade }</p>
    		</c:when>   
    		<c:otherwise>
    		   	 <p>총 점수: 0점</p>
    		</c:otherwise>
    		</c:choose>
    		 <c:choose>    		 	
    		<c:when test="${point>0}"> 
    			 <p>포인트 ${point}p 적립! </p>
    		</c:when>     	
    		<c:otherwise>  	
    	     		<p>포인트 0p 적립! </p>
    	     </c:otherwise>	     
    	  </c:choose>  	  
   	 	</div>
   	 	 <div class="point">
   	 	 <p>현재 포인트 :  ${member.point}p </p>
   	 	 </div>	 	
    	 <div class="kakao">
  			<a href="javascript:sendLink('${grade}')"> 
  			<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width=50px height=50px /> <!-- 카카오톡이미지 --> 
  			<span>카카오톡 공유하기</span>
  			</a>
		</div>
    </div>
</body>
</html>