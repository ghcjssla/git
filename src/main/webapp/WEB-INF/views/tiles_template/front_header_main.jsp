<%@page import="planB.common.util.UvPropUtil"%>
<%@page import="planB.admin.banner.util.BannerUtil"%>
<%@page import="planB.framework.datamodel.UvResultSet"%>
<%@page import="planB.common.util.UvUtil"%>
<%@page import="planB.admin.code.util.CodeUtil"%>
<%@page import="planB.common.util.UvSessionUtil"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page extends="planB.framework.base.UvBaseView"%>

<!--
<%=UvSessionUtil.getSessionValueStr("M_ID", request)%> 
<%=UvSessionUtil.getSessionValueStr("M_TYPE", request)%>
 -->
 
<script type="text/javascript">
$(document).ready(function(){
    cookiedata = document.cookie;
    if(cookiedata.indexOf("close=Y")<0){
        $(".toppopup").show(); 
    }else{
        $(".toppopup").hide(); 
    }
});

function jsCombinationSearch() {
	/* if ($('#SC_COMBINATION_KEYWORD').val() == "") {
		alert("검색어를 입력해 주세요.");
		$('#SC_COMBINATION_KEYWORD').focus();
		return false;
	} */
	
	$('#formCombinationSearch').attr('action', '<%=APP_ROOT%>/search');
	submitGet($('#formCombinationSearch'));
}


function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
    }
    return "";
} 

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
} 

function popClose(){
    if($("input[name='pop']").is(":checked") ==true){
        setCookie("close","Y",1);
    }
}
</script>

<%
	UvResultSet rsBanner = BannerUtil.getBannerList("TOP");
	if (rsBanner.getArraySize() > 0) {
%>
<div class="toppopup">
	<div class="toppopup-w">
		<%
			for (int i = 0, n = UvUtil.getSize(rsBanner); i < n; i++) {
		%>
		<p class="img">
			<%if (!toNotNull(rsBanner.getString("B_LINK", i)).equals("")) {%><a href="<%=rsBanner.getString("B_LINK", i)%>"><%}%>
			<img src="<%=UvPropUtil.getString("IMG_UPLOAD_URL")%><%=rsBanner.getString("F_URL", i)%><%=rsBanner.getString("F_NAME", i)%>" alt="" />
			<%if (!toNotNull(rsBanner.getString("B_LINK", i)).equals("")) {%></a><%}%>
		</p>
		<%
			}
		%>
		<p class="x-btn">
			<input type="checkbox" name="pop" />
			1일간 열지않음
			<a href="#close-toppopup">닫기</a>
		</p>
	</div>
</div>
<%
	}
%>
<div id="wrap">
	<div class="header_w">
		<div id="header">
			<ul class="top_link">
				<li><a href="http://www.rndinvest.or.kr/" target="_blank"><img src="/resources/front/images/common/top_link1.png" alt="R&amp;D사업화투자협의회" /></a></li>
				<li><a href="http://www.kvca.or.kr/" target="_blank"><img src="/resources/front/images/common/top_link2.png" alt="한국벤처캐피탈협회" /></a></li>
			</ul>
			<ul class="local">
				<li class="le"><a href="/">HOME</a></li>
				<%if (UvSessionUtil.getSessionValueStr("M_ID", request).equals("")) {%>
				<li><a href="<%=APP_ROOT%>/login/form">LOGIN</a></li>
				<li class="ri"><a href="<%=APP_ROOT%>/join/step1">JOIN</a></li>
				<%} else {%>
				<li><a href="<%=APP_ROOT%>/login/logout">LOGOUT</a></li>
				<li class="ri"><a href="<%=APP_ROOT%>/auth/mypage/">MYPAGE</a></li>
				<%}%>
				<!-- 
				<li class="ri"><a href="<%=APP_ROOT%>/bbs/voc/list">Q&amp;A</a></li>
				 -->
			</ul>
			<h2>
				<a href="<%=APP_ROOT%>/front/contents/onlineIR"><img src="/resources/front/images/common/h2_menu.png" alt="" /></a>
			</h2>
			<h1>
				<a href="/"><img src="/resources/front/images/common/h1_logo.png" alt="" /></a>
			</h1>
			<form id="formCombinationSearch" id="formCombinationSearch">
				<div class="all-search">
					<input type="hidden" id="CORP_AREA" name="CORP_AREA" class="search-option" />
					<%
					String AREA = "통합검색";
					if (!UvUtil.toNotNull(param.getString("CORP_AREA")).equals("")) {
						AREA = CodeUtil.getCodeInfo("CORP_AREA", UvUtil.toNotNull(param.getString("CORP_AREA"))).getString("CD_NM");
					}
					%>
					<p class="search-click" data-value="<%=UvUtil.toNotNull(param.getString("CORP_AREA"))%>"><%=UvUtil.toNotNull(AREA, "통합검색")%></p>
					<ul class="search-ul">
						<li><a href="#" data-value="">통합검색</a></li>
						<%UvResultSet rsArea = CodeUtil.getCodeList("CORP_AREA");%>
						<%for (int i = 0, n = UvUtil.getSize(rsArea); i < n; i++) {%>
						<li><a href="#" data-value="<%=rsArea.getString("CD", i)%>"><%=rsArea.getString("CD_NM", i)%></a></li>
						<%}%>
					</ul>
					<input type="text" id="SC_COMBINATION_KEYWORD" name="SC_COMBINATION_KEYWORD" value="<%=toNotNull(param.getString("SC_COMBINATION_KEYWORD"))%>" onKeyDown='if (event.keyCode == 13) { jsCombinationSearch(); }' /> <input type="button" value="검색" onclick="jsCombinationSearch();" />
				</div>
			</form>
		</div>
		<!-- //header -->
		<div class="banner_t">
			<div class="banner_w">
				<div id="banner">
					<ul class="bxslider">
						<li class="banner-1">
							<p class="img">
								<img src="/resources/front/images/banner/banner_img1.png" alt="R BUSINESS &amp;D" />
							</p>
							<ul class="txt-btn">
								<li><img src="/resources/front/images/banner/banner_txt1.png" alt="Online IR은 우수 중소기업을 소개하고 투자유치 지원하는 온라인 투자매칭 플랫폼입니다." /></li>
								<li>
									<%if (UvSessionUtil.getSessionValueStr("M_TYPE", request).equals("투자자")) {%>
									<a href="javascript:alert('투자기관은 등록할 수 없습니다.');"><img src="/resources/front/images/banner/banner_btn1.png" alt="등록하기" /></a>
									<%} else {%>
									<a href="<%=APP_ROOT%>/auth/mypage/"><img src="/resources/front/images/banner/banner_btn1.png" alt="등록하기" /></a>
									<%}%>
								</li>
							</ul>
						</li>
						<li class="banner-2">
							<p class="img">
								<img src="/resources/front/images/banner/banner_img2.png" alt="R BUSINESS &amp;D" />
							</p>
							<ul class="txt-btn">
								<li><img src="/resources/front/images/banner/banner_txt2.png" alt="Online IR은 우수 중소기업을 소개하고 투자유치 지원하는 온라인 투자매칭 플랫폼입니다." /></li>
								<li><a href="<%=APP_ROOT%>/front/contents/onlineIR"><img src="/resources/front/images/banner/banner_btn2.png" alt="Online IR 소개" /></a></li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- //banner -->
			</div>
			<!-- //banner_w -->
		</div>
		<!-- //banner_t -->
	</div>
	<!-- //header_w -->