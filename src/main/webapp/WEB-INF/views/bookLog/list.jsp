<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<style>
    .nav-tabs-custom li{
    cursor:pointer;
    }
</style>

<!-- Main content -->
<section class="content">
<div class="panel panel-default text-right">
<span style='float:left; margin:0.6em;'>학습할 책을 등록합니다.</span>
<span id="insertBootBtn" class="btn btn-primary glyphicon glyphicon-plus pull-rights" data-toggle="modal" data-target="#modalBookFrm">등록</span>
</div>
<div style='clear:both'></div>
<%--
<nav>
    <ul class="nav nav-tabs nav-justified">
      <li role="presentation" id="learning" <c:if test="${'L' eq mode}">class="active"</c:if>><a href="/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/bookLog/list?mode=L">학습중&nbsp;&nbsp;<span class="badge">${bookStateNum.L}</span></a></li>
      <li role="presentation" id="waiting" <c:if test="${'W' eq mode}">class="active"</c:if>><a href="/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/bookLog/list?mode=W">대기중&nbsp;&nbsp;<span class="badge">${bookStateNum.W}</span></a></li>
      <li role="presentation" id="studied" <c:if test="${'S' eq mode}">class="active"</c:if>><a href="/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/bookLog/list?mode=S">완료&nbsp;&nbsp;<span class="badge">${bookStateNum.S}</span></a></li>
    </ul>
</nav>
 --%>

<!-- Custom Tabs -->
<div class="nav-tabs-custom">
    <ul class="nav nav-tabs">
	    <li id="learning" <c:if test="${'L' eq mode}">class="active"</c:if>><a <%-- href="#tab_1" data-toggle="tab" --%>>학습중&nbsp;&nbsp;<span class="badge bg-orange">${bookStateNum.L}</span></a></li>
	    <li id="waiting" <c:if test="${'W' eq mode}">class="active"</c:if>><a <%--href="#tab_2" data-toggle="tab" --%>>대기중&nbsp;&nbsp;<span class="badge">${bookStateNum.W}</span></a></li>
	    <li id="studied" <c:if test="${'S' eq mode}">class="active"</c:if>><a <%--href="#tab_3" data-toggle="tab" --%>>완료&nbsp;&nbsp;<span class="badge bg-green">${bookStateNum.S}</span></a></li>
    </ul>
    
	<div id="bookList">
		<!-- 퍼센트 수치에 따라 색상이 바뀌면 좋을듯 -->
		<ul class="list-group">
		<c:forEach items="${list}" var="BookVO">
		<c:set var="percent" value="${(BookVO.last_page*100)/BookVO.total_page}"></c:set>
			<li class="list-group-item">
				<a href="/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/bookLog/detailBook?book_seq=${BookVO.seq}&mode=${mode}">
				<c:choose>
				     <c:when test="${fn:length(BookVO.name) > 19}">
				      <c:out value="${fn:substring(BookVO.name,0,19)}"/>…
				     </c:when>
				     <c:otherwise>
				      <c:out value="${BookVO.name}"/>
				     </c:otherwise>
				</c:choose>
				</a>
				<c:if test="${BookVO.link ne null}">
				    <a href="${BookVO.link}"><i class="fa fa-fw fa-external-link"></i></a>
				</c:if>
			<%-- ${BookVO.total_page}/${BookVO.last_page}/${BookVO.finish} --%>
			<%-- [<span>${BookVO.last_page}p/${BookVO.total_page}p</span>] --%>
			<span class="badge <c:choose><c:when test="${100 eq percent}">bg-green</c:when><c:when test="${'L' eq mode}">bg-orange</c:when></c:choose>"><fmt:formatNumber value="${percent}" pattern="0"/>%</span>
			</li>
		</c:forEach>
		</ul>
	</div>
</div><!-- nav-tabs-custom -->


<div class="modal fade" id="modalBookFrm" tabindex="-1" role="dialog" aria-labelledby="modalBookFrmLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><a name="top"></a><input type="hidden" id="isModal" value="false"/>
        <button id="modalCloseBtn" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalBookFrmLabel">책 정보 입력</h4>
      </div>
      <div class="modal-body">
        <form autocomplete="off"  name="bookFrom" id="bookFrom">
          <div class="form-group">
            <label for="recipient-name" class="control-label">책 제목</label>
            <input id="searchBook" name="name" type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">전체 페이지</label>
            <input name="total_page" type="number" class="form-control" placeholder="전체 페이지">
          </div>
          <input type="hidden" name="uid" value="${login.uid}">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button id="modalBookFrmSubmitBtn" type="button" class="btn btn-primary">저장</button>
      </div>
      <div id="naverBoookList"></div>
    </div>
  </div>
</div>
</section>
<!-- /.content -->
<script>
$("#modalBookFrmSubmitBtn").on("click",function(){
	$("#bookFrom").attr("action","/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/bookLog/registerBook");
	$("#bookFrom").attr("method","post");
    $("#bookFrom").submit();
});
</script>


<script type="text/javascript" src="/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/resources/js/jquery.validate.js"></script>
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
                maxlength : 100
            },
            total_page: {
            	required : true,
            	number: true
            }
        },
        messages : {
        	name :{
                required : "책 제목을 입력해 주세요",
                maxlength : "책 제목이 너무 깁니다. 100자 제한"
            },
            total_page : {
            	required : "전체 페이지를 입력해 주세요",
            	number: "페이지는 숫자로 입력해 주세요"
            }
        }
    });
    
    $("#searchBook").on("keyup",function(){
        goBookSearch($(this).val().replace(/(\s*)/g,""));
    });
    
    $("#learning").on("click",function(){
    	goBookList(this);
    });
    
    $("#waiting").on("click",function(){
        goBookList(this);
    });
    
    $("#studied").on("click",function(){
        goBookList(this);
    });
    
    function goBookList(obj){
    	var goURL = "/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/bookLog/list";
    	
    	if("learning"==$(obj).attr("id")){
    		$("#learning").attr("class","active");
    		$("#waiting").attr("class","");
    		$("#studied").attr("class","");
    		goURL+="?mode=L";
    		$(location).attr('href',goURL);
    	}else if("waiting"==$(obj).attr("id")){
    		$("#learning").attr("class","");
            $("#waiting").attr("class","active");
            $("#studied").attr("class","");
            goURL+="?mode=W";
            $(location).attr('href',goURL);
    	}else if("studied"==$(obj).attr("id")){
    		$("#learning").attr("class","");
            $("#waiting").attr("class","");
            $("#studied").attr("class","active");
            goURL+="?mode=S";
            $(location).attr('href',goURL);
        }
    }
    
    $(document).bind('touchstart',function (e) {
    	//alert(document.activeElement.name+" "+$("#isModal").val());
    	if(document.activeElement.name=="name" && $("#isModal").val() == true){
    		goBookSearch($(this).val().replace(/(\s*)/g,""));
    	}
    });
    
    
    //검색 초기화 작업
    $("#modalCloseBtn").on("click",function(){
    	$("#searchBook").val("");
    	$("#naverBoookList").text("");
    	$("#isModal").val(false);
    });
    $("#insertBootBtn").on("click",function(){
        $("#searchBook").val("");
        $("#naverBoookList").text("");
        $("#isModal").val(true);
    });
    
});
</script>


<script>
function setKeyWord(searchKeyWord){
	var regExp = /<\/?[^>]+>/gi;
	searchKeyWord = searchKeyWord.replace(regExp,"");
	$("#searchBook").val(searchKeyWord);
}

function goBookSearch(searchKeyWord,page){
	var nowPage = 1;
	if(page > 0){
		nowPage = page;
	}
	var searchMode = "goBookSearch";
	commonSearchBook(searchKeyWord, nowPage, searchMode);
}

function addBookSearch(searchKeyWord){
	$("#searchMoreBtn").remove();
    var nowPage = $("#nowPage").text();
    var maxPage = $("#totalPage").text();
    nowPage++;
    if(maxPage < nowPage){
    	nowPage = maxPage;
    }
    $("#nowPage").text(nowPage);
    var searchMode = "addBookSearch";
    commonSearchBook(searchKeyWord, nowPage, searchMode);
}

function commonSearchBook(searchKeyWord, nowPage, searchMode){
	var perPage = 5;
    var totalPage = 0;
    
	$.ajax({
        type: "GET"
        ,dataType: "xml"
        ,url: "/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/bookLog/searchNaverBook/"
        ,data:{keyWord:searchKeyWord,start:nowPage,display:perPage}
        ,success: function(xml){
        	if("goBookSearch"==searchMode){
        	    $("#naverBoookList").text("");
        	}else if("addBookSearch"==searchMode){
                
            }
            var xmlDataTotal = $(xml).find("total").text();
            var xmlDataStart = $(xml).find("start").text();
             var xmlData = $(xml).find("item");
             var listLength = xmlData.length;
             if (listLength) {
                 totalPage = Math.round(xmlDataTotal/perPage);
                 var contentStr = "";
                 if("goBookSearch"==searchMode){
                	 contentStr = "<span style='float:right'>총"+xmlDataTotal+"건"+" <span id='nowPage'>"+xmlDataStart+"</span>/<span id='totalPage'>"+totalPage+"</span>page</span><br /><hr style='both:clear' />";	 
                 }else if("addBookSearch"==searchMode){
                	 
                 }
                 $(xmlData).each(function(){
                     contentStr += "<a href='#top'><span onclick='javascript:setKeyWord(\""+$(this).find("title").text()+"\")'><img src='"+$(this).find("image").text()+"' />["+ $(this).find("title").text() +"]</span></a><hr /></br>";
                 });
                 $("#naverBoookList").append(contentStr);
                 $("#naverBoookList").append("<button onClick=\"javascript:addBookSearch('"+searchKeyWord+"')\" style='margin:0 auto;' id=\"searchMoreBtn\" type=\"button\" class=\"btn btn-default btn-lg btn-block\" >더보기</button>");
             }
         }
      });
}
</script>


<%@include file="../include/footer.jsp"%>

