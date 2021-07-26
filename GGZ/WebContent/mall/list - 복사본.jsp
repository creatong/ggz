<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<%-- <%@include file="../top.jsp" %> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
<!-- <link rel="stylesheet" href="../css/freeboard.css"> -->

<script type="text/javascript">
function boldButton(btn){ //1번 버튼 함수

	var target1 = document.getElementById(btn);
	target1.style.fontWeight="bold";

	}
	function searchProduct(){
		var search = document.search;
		search.action='MSearch.GGZ';
		search.submit();
	}

}
</script>


<style>
 	body,div{
 	border:1px solid red;
 	}
 	
	a:hover{
	font-weight:bold;
	font-size:large;
	color:black;
	}

	.btn{
	margin:20px;
	text-decoration:none;
	color:black;
	;
	}
	body{
	width:100%;
	
	}
	#wrap{
	width:70%;
	height:80%;
	margin:150px auto;
	overflow:hidden;
	
	}
	#menu{
	width:70%;
	height:50px;
	text-align:center;
	margin:auto;
	}
	#itembox{
	width:100%;
	height:80%;
	margin:auto;
	}
	
	.item{
	width:375px;
	height:375px;
	float:left;
	margin:30px;
	text-align:center;
	}
	.item_img{
	width:375px;
	height:325px;
	}
	.item_name{
	width:375px;
	height:55px;
	text-align:center;
	}
	#page{
	width:100%;
	height:10%;
	text-align:center;
	overflow:hidden;
	margin:auto;
	}
	#searchProduct{
	text-align:right;
	margin:auto;
	}


</style>
</head>

<body onload="boldButton('${btn}')">
	
	


  	<div id="wrap">
  		<div id="menu">
  		<a class="btn" id="btn5" href="./listSelect.GGZ?btn=btn5">전체보기</a>
 		<a class="btn" id="btn1" href="./categorySelect.GGZ?category=toy&btn=btn1">장난감</a>
 		<a class="btn" id="btn2" href="./categorySelect.GGZ?category=clothing&btn=btn2" >의류</a>
 		<a class="btn" id="btn3" href="./categorySelect.GGZ?category=acc&btn=btn3" >악세서리 </a>
 		<a class="btn" id="btn4" href="./categorySelect.GGZ?category=snack&btn=btn4" >과자</a>
 		<a class="btn" href="./mallIn.GGZ">상품 추가</a><br>
 		상품 총 개수 : ${blists.totalCount} 	
 		</div>
 		<div id="searchProduct">
 			<input type="text" name="search" placeholder="상품 이름을 검색해주세요">
 			<button type="submit" onclick="searchProduct()">검색</button>
 		</div>
 		<div id="itembox">
 		
 				<c:forEach var="vo" items="${blists.m_list}">
 				<div class="item">
 					<div class="item_img">
		 			<a href="mallDetailSelect.GGZ?pno=${pno }&mallIdx=${vo.idx}"><img src="/mallImg_path/${vo.img_name }" width="100%" height="100%" ></a><br>
 					</div>
 					<div class="item_name">
 					${vo.name }
 					</div>
 				</div>
 				</c:forEach>
 			
 		</div>
 		<div id="page">
 		 <!-- 페이지 이동 -->
 		 	
 		 	<a class="pagenum" href="?pno=1&category=${category}">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
			<a class="pagenum" href="?pno=${blists.startPage-1 }&category=${category}">&lt;</a>  
			<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
			
			  <!-- 페이지목록의 범위  -->
			  <c:forEach var="i" begin="${blists.startPage }" end="${blists.endPage }">
				<a class="pagenum" href="?pno=${i}&category=${category}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
			  </c:forEach>
			
			<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
			<a class="pagenum" href="?pno=${blists.endPage+1 }&category=${category}">&gt;</a> 
			<a class="pagenum" href="?pno=${blists.totalPage }&category=${category}">&gt;&gt;</a>
			
		</div>
	</div>
</body>
</html>








