<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="../top.jsp" %> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>목록 누르면 View</title>
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
	function resetOk() {
		document.frmCmt.func.value = 1;   //댓글 추가
/* 		document.frm.cmd.value = '저장';
		document.frm.name.value = '';
		document.frm.content.value='';
		document.frm.password.value='';
		document.frm.content.disabled=false;
 */		document.frmCmt.name.disabled=false;      
 //댓글 수정하고 다시 올때: <body onload="resetOk()">, 댓글 수정 취소할때 reset 버튼 onclick
	}
	
	function  updateCmt(cmtidx,name,content) {  //실제 댓글 수정은 content 컬럼만 , 화면에 값표시 함수
		var obj = document.frmCmt;
		obj.cmtidx.value=cmtidx;
		obj.name.value = name;  //
		//textarea 로 값 표시하기전에 <br>을 개행문자로 바꾸기 
		while(content.indexOf('<br>')!=-1){  //문자열 <br> 가 없을떄 까지 반복
			content = content.replace('<br>','\n');
		}
		obj.content.value=content;
		obj.func.value=2;    //댓글 수정  (func 1은 댓글입력, func 3은 댓글 삭제)
		document.frmCmt.name.disabled=true;    //disabled 를 설정
	}
	
	function deleteCmt(cmtidx,pno,idx){
		var yn=confirm('댓글을 삭제하시겠습니까?');
		if(yn){
			alert('댓글을 삭제합니다.');  /* cmtidx:댓글 idx , pno:현재페이지번호 , mref:메인글 idx */
			location.href='comment.GGZ?func=3&cmtidx='+cmtidx+'&pno='+pno+'&mref='+idx;
		}  //현재 detail.jsp -> commentAction.jsp  -> 처리 -> detailAction.jsp (꼭필요한 파라미터는 메인글 idx, 페이지번호 pno)
		   //그러므로 댓글 수정 삭제시에 메인글 idx 와 pno를 파라미터로 전달해야한다.
	}
	
	//댓글 수정,삭제 - 데이터 전달
	function delSet(idx) {
		frm2.cmtidx.value=idx;	
		modal.style.display = "block";   //modal 화면에 보이기
	}
	
	//메인글 삭제 확인
	function deleteOk(idx,cpage){
		var yn= confirm( '글을 삭제하시겠습니까?');
		
		if(yn){
			alert('글 ' + idx +'를 삭제합니다.');
			location.href='fDelete.GGZ?idx='+idx+'&pno='+cpage;
		}
	}
	
	function cmtCheck(uid){
		if(uid == ""){
			alert("로그인을 해야합니다.!!");
			//location.href='home.jsp';
		}
	}
	
	function saveCheck(uid){
		var frm = document.frmCmt;
		if(uid == ""){
			
			alert("로그인을 해야합니다.!!");
			//location.href='home.jsp';
		}else if(frm.value==""){
			alert("댓글 내용을 입력해주세요.");
			return false;
		}
		else{
			frm.action='./comment.GGZ';
			frm.submit();
		}
	}

</script>

</head>
<body onload="resetOk()">
<div class="container1" style="width:100%">

<div class="container">
<br>
<h4 style="text-align: left;">---글 상세---</h4>
<hr>
<div class="container">
<table class="table">
		<tr>
			<td width="20%" class="td1">제목</td>
			<td width="40%" class="input1">${bean.subject}</td>
			<td width="20%" class="td1">조회수</td>
			<td class="input1">${bean.readCount}</td>
		</tr>
		<tr>
			<td class="td1">작성자</td>
			<td class="input1">${bean.name}
			<td class="td1">작성날짜</td>
			<td class="input1"><fmt:formatDate value="${bean.wdate }"
					pattern="yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<td class="td1">내용</td>
			<td colspan="3" class="input1" style="text-align: left;">
				<div style="height: 300px;">
					<pre>${bean.content }</pre>
				</div>
			</td>
			<!-- 엔터,탭,기호 등 텍스트 그대로 출력할 때 사용 -->
		</tr>
		<tr>
			<td colspan="4" align="center"><br>
			
			<c:if test="${bean.name == member.name }">
				<a class="btn btn-default"  href="fUpdate.GGZ?func=view&idx=${bean.idx }&pno=${pno}">
					<span class="glyphicon glyphicon-edit"></span>수정</a>
				<a class="btn btn-default"  onclick="javascript:deleteOk(${bean.idx },${pno });">
					<span class="glyphicon glyphicon-trash"></span>삭제</a> 
			</c:if>	
				<a class="btn btn-default"  href="freeboard.GGZ?pno=${pno }">
					<span class="glyphicon glyphicon-align-left"></span>목록</a><br> <br>
				<br>
			</td>
		</tr>
	</table>
</div>
	<!-- 메인글 출력 끝 -->

	<!-- 댓글 시작 -->
	<form name="frmCmt" method="post" action="comment.GGZ">
		<!-- 댓글 입력  , 추가 : 댓글수정과 삭제 -->
		<input type="hidden" name="func" value="1">
		<!-- 기본값은 댓글 입력 , 수정:2 ,삭제:3 -->
		<input type="hidden" name="cmtidx" value="0">
		<!-- 댓글의 PK(기본키) 컬럼 값 -->
		<input type="hidden" name="mref" value="${bean.idx}">
		<input type="hidden" name="midx" value="${member.idx}">
		<input type="hidden" name="name" value="${member.name}">
		<!-- 메인글의 idx -->
		<input type="hidden" name="pno" value="${pno}">
		<!-- 현재글의 페이지번호 -->
		<input type="hidden" value="${bean.name}" name="name">
		<table style="width: 60%; margin: auto;">
			<tr>
				<td colspan="4">댓글 갯수 : ${bean.commentCount } 
				<span title="새로고침">
				<button type="button" class="btn btn-default" onclick="history.go(0)">
   				  	<span  class="glyphicon glyphicon-refresh"></span>
    			</button>
					</span>
					<!--  또는 window.location.reload() 현재페이지로 url 재요청-->
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<!-- 댓글 입력 -->
			<tr>
				<td colspan="3">
					<!-- 크기조절불가 : style="resize: none;" --> 
					<textarea rows="4" cols="60" name="content" style="resize: none;"
						placeholder="댓글을 작성하세요." class="form-control" onclick="cmtCheck('${member.email}')"></textarea>
				</td>
				<td width="15%" style="text-align: left;">
				<button type="button" class="btn btn-default" onclick="saveCheck('${member.email}')">
   				   <span class="glyphicon glyphicon-check"></span>저장
    			</button>
    			<button type="reset" class="btn btn-default" onclick="resetOk()">
   				   <span class="glyphicon glyphicon-remove"></span>취소
    			</button>
	
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<!-- 댓글 출력  -->
			<c:forEach var="cmt" items="${cmtlist}">
				<c:set var="cr" value="${cr}" />
				<!-- 개행문자 저장한 애트리뷰트 가져오기 -->
				<c:set var="content" value="${fn:replace(cmt.content,cr,'<br>')}" />
				<!--개행문자를 <br>로 바꾸기  -->
				<tr>
					<td colspan="4" style="text-align: left;">
						<div id="comment">
							<div>
								<span class="name">${cmt.name}</span> 
								<span class="now"> <fmt:formatDate value="${cmt.wdate }"
										pattern="yyyy-MM-dd a hh:mm" />
								</span>
								<span style="float: right;"> <!-- span은 부모영역의 오른쪽으로 정렬  -->
									<!-- updateCmt() :댓글 리스트 중에   선택한 인덱스의 name,content 값을 input의 value 로 합니다.-->
									<a class="btn btn-default" href="javascript:updateCmt('${cmt.idx}','${cmt.name}','${content}')"
									style="cursor: pointer; text-decoration: none;"> 
										<span class="glyphicon glyphicon-erase"></span>									</a>
									</a>
									<!-- deleteCmt() : 선택한 글 index값(idx 프로퍼티)을 파라미터로 전달하는 url 요청-->
									<a class="btn btn-default" href="javascript:deleteCmt('${cmt.idx}','${pno}','${bean.idx}')"
									style="cursor: pointer; text-decoration: none;"> 
									<span class="glyphicon glyphicon-trash"></span>	
									</a> 
								
								</span>
							</div>
							<div style="padding-top: 10px;">
								<!-- 댓글 내용 -->
								<%-- <pre>${cmt.content}<br></pre> --%>
								${content}
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
<br>
</div>
</div>
</body>
</html>