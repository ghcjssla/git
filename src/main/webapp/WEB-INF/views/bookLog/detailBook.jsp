<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!-- 
뷰단에서 업데이트하기전에 학습페이지가 최종 학습한 페이지보다 적을 수 없다
벨리데이션 체크 필요

~동안 시간 계산해야함


 -->
<div class="panel panel-default">
  <div class="panel-body">
    <c:choose>
         <c:when test="${fn:length(book.name) > 25}">
          <c:out value="${fn:substring(book.name,0,24)}"/>…
         </c:when>
         <c:otherwise>
          <c:out value="${book.name}"/>
         </c:otherwise>
    </c:choose>
    <button type="button" class="btn bg-gray-active color-palette btn-xs"  data-toggle="modal" data-target="#modalBookUpdateFrm">수정</button>
  </div>
  <%-- <div class="panel-footer"></div>--%>
</div>
 
<!-- Main content -->
<section class="content">

<div class="panel panel-default">
<!-- Default panel contents -->

<div class="panel-heading">
<c:choose>
        <c:when test="${bookLog.last_page eq book.total_page}">
        소요일수[<fmt:formatNumber value="${book.total_page/progressRate}" pattern=".0" type="NUMBER"/>]
        </c:when>
        <c:otherwise>
        소요예정[<fmt:formatNumber value="${book.total_page/progressRate}" pattern=".0" type="NUMBER"/>]일
        </c:otherwise>
</c:choose>

<c:if test="${book.link ne null}">
    <a href="${book.link}"><button type="button" class="btn bg-orange margin">${book.link_name}</button></a>
</c:if>

<div class="btn-group btn-group-xs pull-right" role="group" aria-label="학습버튼">
    <c:choose>
	    <c:when test="${bookLog.last_page eq book.total_page}">
	    <button type="button" class="btn btn-success btn-xs" style='cursor:default' data-toggle="modal" data-target="#modalBookReportUpdateFrm">
	    <c:choose>
            <c:when test="${book.link eq null}">후기등록[${book.link}]</c:when>
            <c:otherwise>후기수정</c:otherwise>
        </c:choose>
	    </button>
	    </c:when>
	    
	    <c:when test="${'Y' eq bookLog.finish || bookLog eq null}">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modalStartBookFrm">학습 시작</button>
        </c:when>
        
        <c:when test="${'N' eq bookLog.finish}">
        <button class="btn btn-warning btn-xs" style='cursor:default'>진행중</button>
        <button type="button" class="btn btn-success btn-xs"  data-toggle="modal" data-target="#modalBookFrm">종료</button>
        </c:when>
    </c:choose>
</div>
</div>

<div class="panel-body">
    <c:set var="percent" value="${(bookLog.last_page*100)/book.total_page}"></c:set>
    <div class="progress">
        <div class="progress-bar <c:choose><c:when test="${bookLog.last_page eq book.total_page}">progress-bar-green</c:when><c:when test="${'L' eq mode}">bg-orange</c:when><c:when test="${'W' eq mode}">bg-gray</c:when></c:choose> <c:if test="${'N' eq bookLog.finish}">progress-bar-striped active</c:if>" role="progressbar" aria-valuenow="<fmt:formatNumber value="${percent}" pattern="0"/>" aria-valuemin="0" aria-valuemax="<fmt:formatNumber value="${percent}" pattern="0"/>" style="width:<fmt:formatNumber value="${percent}" pattern="0"/>%; min-width: 6em;">
            <span id="percent"><fmt:formatNumber value="${percent}" pattern="0"/>%</span>[<span>${bookLog.last_page}/${book.total_page}</span>]
        </div>
    </div>
</div>


<!--
일, 시, 분, 초는 각각 따로 논다.
따라서 각각 독립적인 choose를 통해 구현한다.

일 구현

1일보다 크면
일자 계산하고 출력

총시간에서 일자계산값 뺀 값이 1시간보다 크면
시간 계산하고 출력

총시간에서 일자계산값+시간계산값 뺀 값이 1분보다 크면
분 계산하고 출력

총시간에서 일자계산값+시간계산값+분계산값 뺀 값이 1초보다 크면
초 계산하고 출력

위의 것들 모두 각각 구현되야 한다.
1일보다 크지만 1시간은 안될 수 있다  1분 1초 이런 것
그렇기 때문에 따로 구현되야 한다.


그러면 크게 choose로 일,시,분,초 구현하고
내부적으로 들어가서 일,시,분,초는 if 로 구현한다.

일은
choose
일 계산 후 출력
if (총시간-일) >= 시{
   시간계산 후 출력
}
if (총시간-(일+시)) >= 분{
   분계산 후 출력
}
if (총시간-(일+시+분)) >= 초{
   초계산 후 출력
}


시는
choose
시계산 후 출력
if (총시간-시) >= 분{
   분계산 후 출력
}
if (총시간-(시+분)) >= 초{
   초계산 후 출력
}


분은
choose
분 계산후 출력
if (총시간-분) >= 초{
   초계산 후 출력
}

초는
choose
초 계산후 출력


각 계산부에 시간값을 넣고 마지막에 출력하는 방식으로 해야겠네...
그래야 시간이 전혀 없는 것 까지 커버 가능

 -->


<!-- List group -->
  <ul class="list-group">
    <c:forEach items="${list}" var="BookLogVO" varStatus="status" begin="0" end="${fn:length(list)}" step="1">
    <!-- 인덱스는 0부터 시작 카운트는 1부터 시작 -->
    <c:set var="reversI" value="${fn:length(list) - status.index }" scope="page" />
        <li class="list-group-item">
        <i style="cursor:Pointer" class="fa fa-fw fa-minus-square bookLogDeleteIcon" aria-hidden="true" data-toggle="modal" data-target="#modalBookLogDelete" seq="${BookLogVO.seq}"></i>
        <%--[<fmt:formatDate pattern="dd일 HH:mm" value="${BookLogVO.start_date}" /> ~ <fmt:formatDate pattern="dd일 HH:mm" value="${BookLogVO.end_date}" />]--%>
	    <c:set var="timeCost" value="${BookLogVO.end_date.time - BookLogVO.start_date.time}" />
	    <c:set var="ms" value="1000" />
	    <c:set var="msForDay" value="${ms*60*60*24}" />
	    <c:set var="msForHour" value="${ms*60*60}" />
	    <c:set var="msForMin" value="${ms*60}" />
	    <c:choose>
	    <c:when test="${timeCost >= msForDay}">
            <fmt:parseNumber value="${timeCost/msForDay}" integerOnly="true" var="day" />${day}일
		    <c:if test="${(timeCost-(msForDay*day)) >= msForHour}">
	        <fmt:parseNumber value="${(timeCost-(msForDay*day)) / msForHour}" integerOnly="true" var="hour" />${hour}시간
	        </c:if>
	        <c:if test="${(timeCost-((msForDay*day)+(msForHour*hour))) >= msForMin}">
	        <fmt:parseNumber value="${(timeCost-((msForDay*day)+(msForHour*hour))) / msForMin}" integerOnly="true" var="min" />${min}분
	        </c:if>
	        <c:if test="${(timeCost-((msForDay*day)+(msForHour*hour)+(msForMin*min))) >= ms}">
            <fmt:parseNumber value="${(timeCost-((msForDay*day)+(msForHour*hour)+(msForMin*min))) / ms}" var="sec" />${sec}초
            </c:if>
	    </c:when>
	    <c:when test="${(timeCost >= msForHour)}">
            <fmt:parseNumber value="${timeCost / msForHour}" integerOnly="true" var="hour" />${hour}시간
            <c:if test="${(timeCost - (msForHour*hour)) >= msForMin }">
            <fmt:parseNumber value="${(timeCost - (msForHour*hour)) / msForMin}" integerOnly="true" var="min" />${min}분
            </c:if>
            <c:if test="${(timeCost - ((msForHour*hour)+(msForMin*min))) >= ms}">
            <fmt:parseNumber value="${(timeCost - ((msForHour*hour)+(msForMin*min))) / ms}" var="sec" />${sec}초
            </c:if>
        </c:when>
        <c:when test="${timeCost >= msForMin}">
            <fmt:parseNumber value="${timeCost / msForMin}" integerOnly="true" var="min" />${min}분
            <c:if test="${(timeCost - (msForMin*min)) >= ms}">
            <fmt:parseNumber value="${(timeCost - (msForMin*min)) / ms}" var="sec" />${sec}초
            </c:if>
        </c:when>
        <c:when test="${timeCost >= ms}">
           <fmt:parseNumber value="${timeCost / ms}" var="sec" />${sec}초
        </c:when>
        <%--
        <c:otherwise>
                      불가능한시간
        </c:otherwise>
         --%>
	    </c:choose>
	    
	    <c:choose>
	    <c:when test="${'Y' eq BookLogVO.finish}">
	           동안 ${list[status.index].last_page-list[status.count].last_page}p 학습 <%--/ ${fn:substring(BookLogVO.comment, 0, 9)}...--%>
	    </c:when>
	    <c:when test="${'N' eq BookLogVO.finish}">
	    ${bookLog.last_page}p 부터 학습중
	    </c:when>
	    </c:choose>
	    <span style="float:right;">
	        <fmt:formatDate pattern="yyyy/MM/dd" value="${BookLogVO.end_date}" />
	    </span>
	    </li>
    </c:forEach>
  </ul>
</div>



<div class="modal fade" id="modalBookFrm" tabindex="-1" role="dialog" aria-labelledby="modalBookFrmLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalBookFrmLabel">학습 정보 입력</h4>
      </div>
      <div class="modal-body">
        <form name="bookLogFrom" id="bookLogFrom">
          <div class="form-group">
            <label for="message-text" class="control-label">학습 양(전체페이지 : ${book.total_page}page)</label>
            <input name="last_page" value="${bookLog.last_page}" type="number" class="form-control" placeholder="페이지 숫자 입력">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">코멘트</label>
            <input name="comment" type="text" class="form-control" id="recipient-name" placeholder="으리의 멘트 입력">
          </div>
          <input type="hidden" name="seq" value="${book.seq}" />
          <input type="hidden" name="book_seq" value="${bookLog.seq}" />
          <input type="hidden" name="finish" value="Y" />
          <input type="hidden" name="uid" value="${login.uid}">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button id="bookLogFrmSubmitBtn" type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>






<!-- 학습시작모달 -->
<div class="modal fade" id="modalStartBookFrm" tabindex="-1" role="dialog" aria-labelledby="bookNameModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="bookNameModalLabel">${book.name}</h4>
      </div>
      <div class="modal-body">
        [${book.name}] 학습을 시작하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="startBtn">시작하겠습니다.</button>
      </div>
    </div>
  </div>
</div>



<!-- 수정 모달 -->
<div class="modal fade modal-primary" id="modalBookUpdateFrm" tabindex="-1" role="dialog" aria-labelledby="modalBookUpdateFrmLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalBookUpdateFrmLabel">책 정보 수정</h4>
      </div>
      <div class="modal-body">
        <form name="bookUpdateFrom" id="bookUpdateFrom">
        <input name="seq" type="hidden" value="${book.seq}">
          <div class="form-group">
            <label for="recipient-name" class="control-label">책 제목</label>
            <input name="name" type="text" class="form-control" id="recipient-name" value="${book.name}">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">전체 페이지</label>
            <input name="total_page" type="number" class="form-control" placeholder="전체 페이지" value="${book.total_page}">
          </div>
          <input type="hidden" name="uid" value="${login.uid}">
        </form>
      </div>
      <div class="modal-footer">
        <button id="bookDeleteBtn" type="button" class="btn btn-danger" style="float:left" data-toggle="modal" data-target="#modalBookLogDelete">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button id="bookUpdateFrmSubmitBtn" type="button" class="btn btn-primary">수정</button>
      </div>
    </div>
  </div>
</div>

<!-- 후기등록 모달 -->
<div class="modal fade modal-success" id="modalBookReportUpdateFrm" tabindex="-1" role="dialog" aria-labelledby="modalBookReportFrmLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalBookReportUpdateFrmLabel">
        <c:choose>
            <c:when test="${book.link eq null}">후기 등록[${book.link}]</c:when>
            <c:otherwise>후기 수정</c:otherwise>
        </c:choose>
        </h4>
      </div>
      <div class="modal-body">
        <form name="bookUpdateReportFrom" id="bookUpdateReportFrom">
        <input name="seq" type="hidden" value="${book.seq}">
          <div class="form-group">
            <label for="recipient-name" class="control-label">링크 제목</label>
            <input name="link_name" type="text" class="form-control" id="recipient-name" placeholder="링크 제목을 입력해 주세요" value="<c:choose><c:when test="${book.link_name eq null}">000님의 후기</c:when><c:otherwise>${book.link_name}</c:otherwise></c:choose>">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">링크주소</label>
            <input name="link" type="text" class="form-control" placeholder="링크 주소를 입력해 주세요" value="${book.link}">
          </div>
          <input type="hidden" name="uid" value="${login.uid}">
        </form>
      </div>
      <div class="modal-footer">
        <button id="bookReportDeleteBtn" type="button" class="btn btn-danger" style="float:left" >삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button id="bookUpdateReportFrmSubmitBtn" type="button" class="btn btn-outline">
        <c:choose>
            <c:when test="${book.link eq null}">입력</c:when>
            <c:otherwise>수정</c:otherwise>
        </c:choose>
        </button>
      </div>
    </div>
  </div>
</div>




<!-- 삭제모달 -->
<form id="bookDeleteFrom" name="bookDeleteFrom">
<div class="modal modal-danger" id="modalBookLogDelete">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">경고!!</h4>
      </div>
      <div class="modal-body">
      <input name="deleteTarget" type="hidden" value="" />
      <input name="seq" type="hidden"/>
      <input name="book_seq" type="hidden" value="${book.seq}"/>
        <p>정말 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-outline" id="bookDeleteFrmSubmitBtn">삭제</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</form>





</section>

<form id="startBookLogFrm" name=startBookLogFrm>
    <input type="hidden" name="book_seq" value="${book.seq}" />
    <input type="hidden" name="uid" value="${login.uid}">
</form>
<!-- /.content -->


<script type="text/javascript" src="/springBoard/resources/js/jquery.validate.js"></script>
<script>
<%--
$.validator.setDefaults({
    submitHandler: function() {
        alert("submitted!");
    }
});
--%>
$().ready(function() {
    // validate signup form on keyup and submit
    $("#bookLogFrom").validate({
        rules: {
        	last_page:{
        		required : true,
        		number: true,
        		min : ${bookLog.last_page}<c:if test="${empty bookLog.last_page}">0</c:if>,
        		max : ${book.total_page}
        	},
            comment: {
                maxlength: 20
            }
        },
        messages : {
        	last_page:{
        		required : "지금까지 학습한 페이지를 입력해주세요",
        		min : "최근 학습한 페이지 보다 작습니다.",
        		max : "책의 총 페이지보다 많습니다.(총 ${book.total_page}page)"
        	},
            comment: {
                maxlength: "20자 이내로 작성해주세요"
            }
        }
    });
});
</script>

<script>
$("#startBtn").on("click",function(){
	$("#startBookLogFrm").attr("action","/springBoard/bookLog/insertBookLog");
	$("#startBookLogFrm").attr("method","post");
	$("#startBookLogFrm").submit();
});

$("#bookLogFrmSubmitBtn").on("click",function(){
    $("#bookLogFrom").attr("action","/springBoard/bookLog/updateBookLog");
    $("#bookLogFrom").attr("method","post");
    $("#bookLogFrom").submit();
});

$("#bookUpdateFrmSubmitBtn").on("click",function(){
    $("#bookUpdateFrom").attr("action","/springBoard/bookLog/updateBook");
    $("#bookUpdateFrom").attr("method","post");
    $("#bookUpdateFrom").submit();
});

$("#bookDeleteBtn").on("click",function(){
	$("input[name=deleteTarget]").val("book");
	$('#modalBookUpdateFrm').modal('hide');
});


$(".bookLogDeleteIcon").on("click",function(){
	$("input[name=deleteTarget]").val("bookLog");
	var seq = $(this).attr("seq");
	$("#bookDeleteFrom input[name=seq]").val(seq);
});

$("#bookDeleteFrmSubmitBtn").on("click",function(){
	//alert($("input[name=deleteTarget]").val());
	//alert("seq : "+$("#bookDeleteFrom input[name=seq]").val()+"/"+"book_seq : "+$("#bookDeleteFrom input[name=book_seq]").val());
	var deleteTarget = $("input[name=deleteTarget]").val();
	if("book" == deleteTarget){
		$("#bookDeleteFrom").attr("action","/springBoard/bookLog/deleteBookAll");
	}else if("bookLog" == deleteTarget){
		$("#bookDeleteFrom").attr("action","/springBoard/bookLog/deleteBookLog");
	}
    $("#bookDeleteFrom").attr("method","post");
    $("#bookDeleteFrom").submit();
});

/**
 * 이거 하나로 책후기 입력,수정 이용함.
 */
$("#bookUpdateReportFrmSubmitBtn").on("click",function(){
	bookUpdateReportCommonAction();
});

$("#bookReportDeleteBtn").on("click",function(){
	$("input[name=link]").val("");
	$("input[name=link_name]").val("");
	bookUpdateReportCommonAction();
});

function bookUpdateReportCommonAction(){
	$("#bookUpdateReportFrom").attr("action","/springBoard/bookLog/updateBookReport");
    $("#bookUpdateReportFrom").attr("method","post");
    $("#bookUpdateReportFrom").submit();
}

</script>
<%@include file="../include/footer.jsp"%>