<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<%@include file="../top.jsp" %> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Freeboard View (목록)</title>
<style type="text/css">
body {
 	background-image: url("./backImg/freeboardList.jpg");
 	background-size:cover;
 	width:100%;

}
form{
	background-color: white;
}
.container{

}
.container1{
	background-color: white;
	opacity: 0.9;
 	margin-top: 80px;
}
</style>
<script type="text/javascript">
	function searchCheck(){
		var frm = document.frmSearch;
		var d1 = frm.findT.value;
		if(d1==""){
			alert('검색어를 입력해주세요.!!');
		}else{
			frm.submit();
		}
	}
	function memberCheck(member,pno){
		if(member==""){
			alert('로그인을 해야합니다.!!');
			return false;
		}else{
			location.href='fWrite.GGZ?pno='+pno;
			return true;
		}
		
	}
</script>
</head>
<body>
<div class="container1" style="width:100%">

<div class="container" style="text-align: right;">
<h3 style="text-align: left;">---자유게시판---</h3>
<h5 style="text-align: left;">자유롭게 글을 올려주세요!</h5>
<hr>
<form name="frmSearch" method="post" action="fSearch.GGZ">
<select style="width:10%; display:inline-block;" name="field" class="form-control">
	<option value="이름" <c:if test="${field=='이름' }"> selected </c:if>>이름</option>
	<option value="내용" <c:if test="${field=='내용' }"> selected </c:if>>내용</option>
	<option value="제목" <c:if test="${field=='제목' }"> selected </c:if>>제목</option>
</select>

	<input style="width:30%; display:inline-block;" type="text" class="form-control" name="findT" value="${findT}" placeholder="검색어를 입력하세요.">
	<button type="button" class="btn btn-default" onclick="searchCheck()">
      <span class="glyphicon glyphicon-search"></span>검색
    </button>
 
</form>
</div>
<div class="container" style="margin-bottom: 0px">
<table class="table table-hover">
	<thead>
 	<tr><th width="10%">번호</th>
 		<th width="45%">제목</th>
 		<th width="15%">작성자</th>
 		<th width="10%">조회수</th>
 		<th width="20%">작성일</th>
 	</tr>
 	</thead>
 	<c:forEach var="vo" items="${blists.f_list}"> <!-- vo가 Freeboard타입  blists.getList() 실행-->
	<tr>
		<td>${vo.idx }</td> <!-- 번호 -->	
 		<td><a href="fDetail.GGZ?idx=${vo.idx}&pno=${blists.currentPage}" class="subject">${vo.subject }</a>	<!-- 제목 -->
 		...<span style="color:orange;font-size: 80%;">(${vo.commentCount })
 		</span>
 		</td>
 		<td >${vo.name }</td> <!-- 이름 -->
 		<td>${vo.readCount }</td> <!-- 조회수 -->
 		<td>
 		<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd"/> <!-- 작성일 -->
 		</td>
 	</tr>
 	</c:forEach>
 	<thead>
 	<tr>
 		<td colspan="4">
 		<a class="btn btn-default" onclick="return memberCheck('${member.email}','${blists.currentPage}')">
 			<span class="glyphicon glyphicon-pencil"></span>글쓰기</a>
 		<a class="btn btn-default" href="${pageContext.request.contextPath }">홈</a></td>
 		<td>작성글 총 개수 : ${blists.totalCount}</td>
 	</tr>
 	<thead>
 </table>
</div>
 <!-- 페이지 이동 -->
 <div style="text-align: center;">
		<ul class="pagination" style="display:inline-block;">
		<li><a class="pagination" href="?pno=1">&lt;&lt;</a></li>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
		<li><a class="pagination" href="?pno=${blists.startPage-1 }">&lt;</a></li>  
			<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
		<c:forEach var="i" begin="${blists.startPage }" end="${blists.endPage }">  <!-- 페이지목록의 범위  -->
 			<li><a class="pagination" href="?pno=${i}">${i}</a></li>
		</c:forEach>
			<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
		<li><a class="pagination" href="?pno=${blists.endPage+1 }">&gt;</a></li> 
		<li><a class="pagination" href="?pno=${blists.totalPage }">&gt;&gt;</a></li>
		</ul>
</div>
</div>
</body>
</html>