<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script>
function go_back(){
    history.back();
}
</script>
        <!-- Main content -->
        <section class="content">
          <div class="error-page">
            <h2 class="headline text-yellow"> 404</h2>
            <div class="error-content">
              <h3><i class="fa fa-warning text-yellow"></i> 페이지가 없습니다.</h3>
              <p class='text-center'>
              <%-- 
                                            원하시면 <a href="http://blog.naver.com/mantto2">으리의 블로그</a>에 가서 적당한 곳에 글을 남겨주세요<br /><br />
                                            --%>
                <a href="javascript:go_back();">이전 페이지 가기</a>
              </p>
              <%--
              <form class="search-form">
                <div class="input-group">
                  <input type="text" name="search" class="form-control" placeholder="Search">
                  <div class="input-group-btn">
                    <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i></button>
                  </div>
                </div><!-- /.input-group -->
              </form>
               --%>
            </div><!-- /.error-content -->
          </div><!-- /.error-page -->
        </section><!-- /.content -->
<%@include file="../include/footer.jsp"%>
