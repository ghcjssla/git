<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!-- Main content -->
<section class="content">
<div class="panel panel-default text-right">
<span style='float:left; margin:0.6em;'>학습할 책을 등록합니다.</span>
<span class="btn btn-primary glyphicon glyphicon-plus pull-rights" data-toggle="modal" data-target="#modalBookFrm">등록</span>
</div>
<div style='clear:both'></div>







<div id="bookList">
<!-- 퍼센트 수치에 따라 색상이 바뀌면 좋을듯 -->
    <ul class="list-group">
	  <c:forEach items="${list}" var="BookVO">
	  <c:set var="percent" value="${(BookVO.last_page*100)/BookVO.total_page}"></c:set>
      <li class="list-group-item">
      <a href="/springBoard/bookLog/detailBook?book_seq=${BookVO.seq}">${BookVO.name}</a>
      <%-- ${BookVO.total_page}/${BookVO.last_page}/${BookVO.finish} --%>
      <%-- [<span>${BookVO.last_page}p/${BookVO.total_page}p</span>] --%>
      <span class="badge <c:choose><c:when test="${100 eq percent}">bg-green color-palette</c:when><c:otherwise></c:otherwise></c:choose>"><fmt:formatNumber value="${percent}" pattern="0"/>%</span>
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
        <form name="bookFrom" id="bookFrom">
          <div class="form-group">
            <label for="recipient-name" class="control-label">책 제목</label>
            <input name="name" type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">전체 페이지</label>
            <input name="total_page" type="number" class="form-control" placeholder="전체 페이지">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button id="modalBookFrmSubmitBtn" type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>
</section>
<!-- /.content -->
<script>
$("#modalBookFrmSubmitBtn").on("click",function(){
	$("#bookFrom").attr("action","/springBoard/bookLog/registerBook");
	$("#bookFrom").attr("method","post");
    $("#bookFrom").submit();
});
</script>


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
    $("#bookFrom").validate({
        rules: {
        	name:{
                required : true,
                maxlength : 30
            },
            total_page: {
            	required : true,
            	number: true
            }
        },
        messages : {
        	name :{
                required : "책 제목을 입력해 주세요",
                maxlength : "책 제목이 너무 깁니다. 30자 제한"
            },
            total_page : {
            	required : "전체 페이지를 입력해 주세요",
            	number: "페이지는 숫자로 입력해 주세요"
            }
        }
    });
});
</script>

<%@include file="../include/footer.jsp"%>

