<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!-- Main content -->
<section class="content">
<div class="panel panel-default text-right">
    <span class="btn btn-default glyphicon glyphicon-plus" data-toggle="modal" data-target="#modalBookFrm">등록</span>
</div>

<div id="bookList">
<!-- 퍼센트 수치에 따라 색상이 바뀌면 좋을듯 -->
    <ul class="list-group">
	  <li class="list-group-item"><a href="/springBoard/bookLog/detailBook">쉽게따라하는 자바웹개발</a> <span class="badge bg-blue">20%</span></li>
	  <li class="list-group-item"><a href="/springBoard/bookLog/detailBook">토비의 스프링</a> <span class="badge bg-blue">90%</span></li>
	  <li class="list-group-item"><a href="/springBoard/bookLog/detailBook">엄마손파이</a> <span class="badge bg-red">90%</span></li>
	  <li class="list-group-item"><a href="/springBoard/bookLog/detailBook">쉽게따라하는 자바웹개발</a> <span class="badge bg-blue">20%</span></li>
      <li class="list-group-item"><a href="/springBoard/bookLog/detailBook">토비의 스프링</a> <span class="badge bg-blue">90%</span></li>
      <li class="list-group-item"><a href="/springBoard/bookLog/detailBook">엄마손파이</a> <span class="badge bg-red">90%</span></li>
      <li class="list-group-item"><a href="/springBoard/bookLog/detailBook">쉽게따라하는 자바웹개발</a> <span class="badge bg-blue">20%</span></li>
      <li class="list-group-item"><a href="/springBoard/bookLog/detailBook">토비의 스프링</a> <span class="badge bg-blue">90%</span></li>
      <li class="list-group-item"><a href="/springBoard/bookLog/detailBook">엄마손파이</a> <span class="badge bg-red">90%</span></li>
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
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">책 제목</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">전체 페이지</label>
            <input type="number" class="form-control" placeholder="Text input">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>
</section>
<!-- /.content -->




<%@include file="../include/footer.jsp"%>

