<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="description" content="이건 기상일지">
<meta name="author" content="해피로퍼 김호성">
<meta name="keywords" content="happylopers, happyloper, 해피로퍼, 김호성, 해피로퍼 김호성">
<link rel="apple-touch-icon-precomposed" href="/springBoard/resources/mobile/img/app_icon.png" />

<script type="text/javascript" language = "javascript">
 window.addEventListener('load', function() {
 setTimeout(scrollTo, 0, 0, 1);
}, false);
</script>
<style>
.end_bar{
    float:right;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<title>기상일지 페이지</title>

<!-- Bootstrap core CSS -->
<link href="/springBoard/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap theme -->
<link
	href="/springBoard/resources/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/springBoard/resources/bootstrap/css/wakeup/theme.css"
	rel="stylesheet">
<style>
 /* 모바일웹 css 설정 */
html {
    /* 화면을 길게 누르고 있을때 뜨는 팝업이나 액션시트를 제어 */
    -webkit-touch-callout:none;
    /* 텍스트나 이미지를 선택할 수 있게 하는 여부를 제어 */
    -webkit-user-select:none;
    /* 링크를 터치했을때 나오는 기본 영역의 색상을 제어 */
    -webkit-tap-highlight-color:rgba(0, 0, 0, 0);
}
</style>
<script></script>
<!-- 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
 -->
</head>

<body role="document">
	<div class="container" role="main">
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<jsp:useBean id="now" class="java.util.Date" />
		<h1><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${now}" /></h1>
		<legend>일지 커멘트 입력</legend>
		<form name="dailyLogForm" method="post">
		  <div class="form-group">
		    <label for="inputComment">기상 멘트</label>
		    <input name="comment" type="text" class="form-control" id="inputComment" placeholder="으리넘치게 작성">
		    <!-- <input type="text" name="date" id="date" />  -->
		  </div>
		<p>
			<button id="submitBtn" type="button" class="btn btn-lg btn-success btn-block">기상 버튼</button>
			<!-- 
			<button type="button" class="btn btn-lg btn-warning">수정</button>
			<button type="button" class="btn btn-lg btn-danger">삭제</button>
			 -->
		</p>
		<input type="hidden" name="seq" value=0>
		</form>
        
		<div class="page-header">
			<h1>으리의 기상목록</h1>
		</div>
		<div class="row">
			<div class="table-responsive">
				<table
					class="table table-striped table-hover table-bordered table-condensed ">
					<thead>
						<tr>
							<th class="text-center">일자</th>
							<th class="text-center">시간</th>
							<th class="text-center">내용</th>
							<th class="text-center">수정</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach varStatus="status" items="${list}" var="WakeUpVO">
							<tr>
								<td class="text-center">${status.index+1}일</td>
								<%-- 
								<td class="text-center dailyLog" data-target="#layerpop" data-toggle="modal" time='<fmt:formatDate pattern="HH:mm:ss" value="${WakeUpVO.date}" />' comment='${WakeUpVO.comment}' seq='${WakeUpVO.seq}'>
								--%>
								<td class="text-center" time='<fmt:formatDate pattern="HH:mm:ss" value="${WakeUpVO.date}" />' comment='${WakeUpVO.comment}' seq='${WakeUpVO.seq}'>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${WakeUpVO.date}" />
								<td class="text-center">
								<c:choose>
								    <c:when test="${fn:length(WakeUpVO.comment) > 9}">
								    ${fn:substring(WakeUpVO.comment, 0, 9)}...
								    </c:when>
								    <c:otherwise>${WakeUpVO.comment}</c:otherwise>
								</c:choose>
								</td>
								<td class="text-center">
								<!-- <button type="button" class="btn btn-default">수정</button> -->
								<button type="button" class="btn btn-danger removeBtn" seq="${WakeUpVO.seq}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- /container -->
	
	<!--
	모달 띄우는데 필수적인 속성은 버튼태그의 경우 
    data-target속성과 data-toggle속성입니다.
	data-target의 value는 버튼 클릭 시  모달로 띄우고자하는 
	id값을 #을 붙여서 연결을 해주는 것입니다.
	data-toggle의 value는 모달기능을 수행하겠다는 의미입니다.
	그리고 모달창 영역에 버튼태그의 data-dismiss 속성을 적용하면 모달을 닫게하는 기능을 적용하겠다라는 의미 
	출처 : http://hellogk.tistory.com/37#recentTrackback
	-->
	<!-- 모달팝업 설정 -->
	<form name="modifyDailyLogForm" method="post">
	<input id="modal_seq" type="hidden" name="modal_seq" value=0>
	<div class="modal fade" id="layerpop" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">수정</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	      <!-- 이쪽 디자인좀 수정해야할 듯 -->
	      <input name="modal_date" id="modal_date" type="time"/><br />
	      <input name="modal_comment" id="modal_comment" type="text"/>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button id="modifyBtn" type="button" class="btn btn-success">저장</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	</form>
	
	<div class="end_bar">
	   <input onClick="javascript:window.scrollTo(0,0);" type="button" value="위로" />
	</div>
	
	<script>
	$(function(){
		/*
		$("[name=dailyLogForm]").submit(function(event){
	        alert("넘기기전 사전작업");
	        alert($("#date").val());
	    });
	    */
	    
	    $("#submitBtn").click(function(){
	        //alert("클릭했나");
	        //alert("날짜 값 : "+$("#date").val());
	        //$("#date").val($.now());
	        $("[name=dailyLogForm]").attr("action","/springBoard/wakeup/register");
	        //alert("액션 값 : "+$("[name=dailyLogForm]").attr("action"));
	        $("[name=dailyLogForm]").submit();
	    });
	    
	    $("#modifyBtn").click(function(){
            $("[name=modifyDailyLogForm]").attr("action","/springBoard/wakeup/modify");
            $("[name=modifyDailyLogForm]").submit();
        }); 
	    
	    $(".removeBtn").on("click",function(e) {
	    	var deleteOK = confirm("삭제하시겠습니까?");
	    	if(deleteOK){
	    	var seq = $(this).attr("seq")
	    	console.log("선택한 SEQ : "+seq);
	    	$("[name=seq]").val(seq);
	    	$("[name=dailyLogForm]").attr("action","/springBoard/wakeup/delete");
	    	$("[name=dailyLogForm]").submit();
	    	}
        });
	    /* 기능이 필요없는 관계로 삭제 2016-01-15
	    $(".dailyLog").on("click",function(e) {
	    	var selectedTime = $(this).attr("time");
	    	var selectedComment = $(this).attr("comment");
	    	var selectedSeq = $(this).attr("seq");
	    	console.log(selectedTime);
	    	console.log(selectedComment);
	    	console.log(selectedSeq);
	    	$("#modal_date").val(selectedTime);
	    	$("#modal_comment").val(selectedComment);
	    	$("#modal_seq").val(selectedSeq);
        });
	    */
	    /* 이벤트 테스트
	    $(".dailyLog").css("background-color","red");
	    
	    $(".dailyLog").on("click",function(e) {
            alert("click 이벤트 발생 ");
        });
	    */
	});
	</script>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/springBoard/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
