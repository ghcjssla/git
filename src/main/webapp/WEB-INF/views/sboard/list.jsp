<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">Board List</h3>
				</div>
				<div class='box-body'>
					<select name="searchType">
						<option value="none"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							작성자</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							제목&내용</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							내용&작성자</option> titleOrContentOrWriter
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							제목&내용&작성자</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>
					<button id='newBtn' onClick="javascript:test('register')">새글</button>
				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">게시판</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<%-- <th class="text-center" style="width: 10px">NO</th>--%>
							<th class="text-center">TITLE</th>
							<th class="text-center">WRITER</th>
							<th class="text-center">REGDATE</th>
							<%-- <th class="text-center" style="width: 40px">CNT</th> --%>
						</tr>
						<%-- 
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd a hh:mm" var="nowValue"/>
                        --%>
						<c:forEach items="${list}" var="boardVO" varStatus="status">
						<c:set var="reversI" value="${fn:length(list) - status.index }" scope="page" />
							<tr>
								<%-- <td class="text-center">${(pageMaker.totalCount - (pageMaker.cri.perPageNum * (pageMaker.cri.page-1))) - status.index}</td>--%>
								<td><a href='/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
								${fn:substring(boardVO.title, 0, 20)}<strong>[${boardVO.replycnt}]</strong>..
									</a>
								</td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yy-MM-dd"
										value="${boardVO.regdate}" /></td>
								<%-- <td><span class="badge bg-red">${boardVO.viewcnt }</span></td>--%>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">
					<!--
서버에서 페이징 소스 만들기-->
					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<form id="jobForm">
	<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
	<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		//alert("처리가 완료되었습니다.");
	}
	/*
	$(".pagination li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","/board/list").attr("method", "get");
		jobForm.submit();
	});
	 */
</script>

<script>
	function test(url) {
	    location.href = url;
	}
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>
<%@include file="../include/footer.jsp"%>
