<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!-- Main content -->
<section class="content">

<div class="panel panel-default">
<!-- Default panel contents -->
<div class="panel-heading">쉽게따라하는 자바웹개발
<div class="btn-group btn-group-xs pull-right" role="group" aria-label="학습버튼">
    <button type="button" class="btn btn-primary btn-xs">시작</button>
    <button type="button" class="btn btn-success btn-xs"  data-toggle="modal" data-target="#modalBookFrm">종료</button>
</div>

</div>
<div class="panel-body">
<span>127/213</span>
    <div class="progress">
        <div class="progress-bar" role="progressbar" aria-valuenow="23" aria-valuemin="0" aria-valuemax="23" style="width:23%;">
            23%
        </div>
    </div>
</div>
<!-- List group -->
  <ul class="list-group">
    <li class="list-group-item">08:30 부터 30분 동안 22page <span style="float:right;">2016/01/16</span></li>
    <li class="list-group-item">09:30 부터 30분 동안 22page <span style="float:right;">2016/01/16</span></li>
    <li class="list-group-item">10:30 부터 30분 동안 22page <span style="float:right;">2016/01/16</span></li>
    <li class="list-group-item">08:30 부터 1시간 30분 동안 22page <span style="float:right;">2016/01/16</span></li>
    <li class="list-group-item">08:30 부터 4시간 동안 220page <span style="float:right;">2016/01/16</span></li>
    <li class="list-group-item">22:30 부터 30분 동안 22page <span style="float:right;">2016/01/16</span></li>
    <li class="list-group-item">08:30 부터 30분 동안 22page <span style="float:right;">2016/01/16</span></li>
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
            <label for="message-text" class="control-label">학습 양</label>
            <input type="number" class="form-control" placeholder="Text input">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">코멘트</label>
            <input type="text" class="form-control" id="recipient-name">
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