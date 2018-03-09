<%@page import="planB.framework.datamodel.UvResultSet"%>
<%@page import="planB.admin.code.util.CodeUtil"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page extends="planB.framework.base.UvBaseView"%>

<div class="footer_w">
	<div id="footer">
		<div class="c-slide">
			<ul class="ft_c-slide">
				<li><a href="http://www.smba.go.kr" target="_blank"><img src="/resources/front/images/common/ft_customer-1.png" alt="중소기업청" /></a> <a href="http://www.smtech.go.kr"target="_blank"><img src="/resources/front/images/common/ft_customer-2.png" alt="중소기업청 기술개발사업 종합관리시스템" /></a> <a href="http://www.tipa.or.kr"target="_blank"><img src="/resources/front/images/common/ft_customer-3.png" alt="중소기업기술정보진흥원" /></a> <a href="http://www.kvca.or.kr"target="_blank"><img src="/resources/front/images/common/ft_customer-5.png" alt="한국벤처캐피탈협회" /></a> <a href="http://diva.kvca.or.kr"target="_blank"><img src="/resources/front/images/common/ft_customer-6.png" alt="중소기업창업투자회사전자공시" /></a></li>
				<li><a href="http://diva.kvca.or.kr"target="_blank"><img src="/resources/front/images/common/ft_customer-6.png" alt="중소기업창업투자회사전자공시" /></a><a href="http://www.smba.go.kr" target="_blank"><img src="/resources/front/images/common/ft_customer-1.png" alt="중소기업청" /></a> <a href="http://www.smtech.go.kr"target="_blank"><img src="/resources/front/images/common/ft_customer-2.png" alt="중소기업청 기술개발사업 종합관리시스템" /></a> <a href="http://www.tipa.or.kr"target="_blank"><img src="/resources/front/images/common/ft_customer-3.png" alt="중소기업기술정보진흥원" /></a> <a href="http://www.kvca.or.kr"target="_blank"><img src="/resources/front/images/common/ft_customer-5.png" alt="한국벤처캐피탈협회" /></a> </li>
			</ul>
		</div>
		<!-- //c-slide -->
		<div class="ft_btm">
			<p class="ft_logo">
				<img src="/resources/front/images/common/ft_logo.png" alt="" />
			</p>
			<ul class="local">
				<li class="le"><a href="<%=APP_ROOT%>/front/contents/onlineIR"><img src="/resources/front/images/common/ft_ir.png" alt="Online IR소개" /></a></li>

				<li><a href="<%=APP_ROOT%>/front/privacy"><img src="/resources/front/images/common/ft_info.png" alt="개인정보취급방침" /></a></li>
				<li><a href="<%=APP_ROOT%>/front/contents/email"><img src="/resources/front/images/common/ft_noemail.png" alt="이메일무단수신거부" /></a></li>
				<li><a href="<%=APP_ROOT%>/front/contents/terms"><img src="/resources/front/images/common/ft_service.png" alt="서비스이용약관" /></a></li>
				<!-- 
				<li><a href="<%=APP_ROOT%>/bbs/voc/list"><img src="/resources/front/images/common/ft_qna.png" alt="묻고답하기" /></a></li>
				 -->
			</ul>
			<address>06595 서울특별시 서초구 서초대로 45길 16 VR빌딩 TEL. 02-2156-2132 FAX. 02-2156-2140</address>
			<p class="copy">Copyright &copy; 2016 Korean Venture Capital Association. All Rights Reserved.</p>
			<p class="ft_menu">
				<a href="#"><img src="/resources/front/images/common/ft_menu.png" alt="" /></a>
			</p>
			<p class="site-sel">
				<img src="/resources/front/images/common/ft_site-sel.png" alt="관련사이트 바로가기" />
			</p>
			<ul class="site-ul">
				<%UvResultSet rsRef = CodeUtil.getCodeList("REF_SITE");%>
				<%for (int i = 0, n = getSize(rsRef); i < n; i++) {%>
				<li><a href="<%=rsRef.getString("ETC_INF1", i)%>" target="_blank"><%=rsRef.getString("CD_NM", i)%></a></li>
				<%}%>
			</ul>
		</div>
		<!-- //ft_btm -->
	</div>
	<!-- //footer -->
</div>
<!-- //footer_w -->
</div>
<!-- //wrap -->

