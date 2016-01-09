<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="https:/ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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
</head>

<body role="document">
	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<jsp:useBean id="now" class="java.util.Date" />
        
		<div class="jumbotron">
			<h1><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${now}" /></h1>
			<h1>기상일지 페이지</h1>
			<p>이곳이 내가 기상일지를 작성할 페이지다.</p>
		</div>

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
			<h1><fmt:formatDate pattern="YYYY-MM" value="${now}" /> 으리의 기상목록</h1>
		</div>
		<div class="row">
			<div class="table-responsive">
				<table
					class="table table-striped table-hover table-bordered table-condensed ">
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">시간</th>
							<th class="text-center">내용</th>
							<th class="text-center">수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach varStatus="status" items="${list}" var="WakeUpVO">
							<tr>
								<td class="text-center">${status.index+1}</td>
								<td class="text-center">
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${WakeUpVO.date}" />
								<td class="text-center">${WakeUpVO.comment}</td>
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
	
	<script type="text/javascript">
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
	    
	    $(".removeBtn").on("click",function(e) {
	    	var seq = $(this).attr("seq")
	    	console.log("선택한 SEQ : "+seq);
	    	$("[name=seq]").val(seq);
	    	$("[name=dailyLogForm]").attr("action","/springBoard/wakeup/delete");
	    	$("[name=dailyLogForm]").submit();
        });
	});
	
	</script>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/springBoard/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
