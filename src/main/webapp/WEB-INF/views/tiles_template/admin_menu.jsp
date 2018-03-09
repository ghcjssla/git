<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page extends="planB.framework.base.UvBaseView"%>

<%@ page import="planB.framework.datamodel.*"%>
<%@ page import="planB.common.util.*"%>
<%@ page import="planB.common.config.*"%>

<%
	UvResultSet rsMenuList = MenuConfig.ADMIN_MENU;;
	UvResultSet rsSubMenuList = new UvResultSet();
%>

<script>
$(document).ready(function() {
	$('#<%=UvUtil.toNotNull(param.getString("U_CD"))%>').addClass("active");
	$('#<%=UvUtil.toNotNull(param.getString("M_CD"))%>').addClass("active");
	
	<%if (!UvUtil.toNotNull(request.getParameter("M_CD")).equals("")) {%>
	$("#PROG_TITLE").html($("#<%=UvUtil.toNotNull(param.getString("M_CD"))%>").attr("MENU_NM"));
	$("#PROG_NAV1").html($("#<%=UvUtil.toNotNull(param.getString("U_CD"))%>").attr("MENU_NM"));
	$("#PROG_NAV2").html($("#<%=UvUtil.toNotNull(param.getString("M_CD"))%>").attr("MENU_NM"));
	$("#PROG_NAV1").show();
	$("#PROG_NAV2").show();
	<%} else {%>
	$("#PROG_TITLE").html($("#<%=UvUtil.toNotNull(param.getString("U_CD"))%>").attr("MENU_NM"));
	$("#PROG_NAV1").html($("#<%=UvUtil.toNotNull(param.getString("U_CD"))%>").attr("MENU_NM"));
	$("#PROG_NAV1").show();
	<%}%>
});
    
function jsGoMenu(strMENU_CD) {
	$.getJSON(
		"<%=APP_ROOT%>/menu/goMenu" 
		, {MENU_CD:strMENU_CD}
		, function(data) {
			if (data.result == "success") {
				location.href = "<%=APP_ROOT%>" + data.MENU_URI;
			} else {
				alert(data.message);
			}
		});
	}
</script>

<section class="sidebar">
	<ul class="sidebar-menu">
		<li class="header">관리자 메뉴</li>
		<%
		for (int i = 0, n = getSize(rsMenuList); i < n; i++) {
			rsSubMenuList = (UvResultSet) rsMenuList.getValue("SUB_MENU", i);

			if (rsSubMenuList.getArraySize() > 0) {
		%>
		<li class="treeview" id="<%=rsMenuList.getString("MENU_CD", i)%>" MENU_NM="<%=rsMenuList.getString("MENU_NM", i)%>"><a href="#"> <i class="fa <%=UvUtil.toNotNull(rsMenuList.getString("MENU_ICON", i), "fa-cog")%>"></i> <span><%=rsMenuList.getString("MENU_NM", i)%></span> <i class="fa fa-angle-left pull-right"></i></a>
			<ul class="treeview-menu">
				<%for (int j = 0, k = getSize(rsSubMenuList); j < k; j++) {%>
				<li id="<%=rsSubMenuList.getString("MENU_CD", j)%>" MENU_NM="<%=rsSubMenuList.getString("MENU_NM", j)%>"><a href="javascript:jsGoMenu('<%=rsSubMenuList.getString("MENU_CD", j)%>');"><i class="fa <%=UvUtil.toNotNull(rsSubMenuList.getString("MENU_ICON", j), "fa-circle-o")%>"></i><%=rsSubMenuList.getString("MENU_NM", j)%></a></li>
				<%}%>
			</ul> 
		<%
			} else {
		%>
		<li id="<%=rsMenuList.getString("MENU_CD", i)%>" MENU_NM="<%=rsMenuList.getString("MENU_NM", i)%>"><a href="javascript:jsGoMenu('<%=rsMenuList.getString("MENU_CD", i)%>');"> <i class="fa <%=UvUtil.toNotNull(rsMenuList.getString("MENU_ICON", i), "fa-cog")%>"></i> <span><%=rsMenuList.getString("MENU_NM", i)%></span></a></li>
		<%
			}
		}
		%>
	</ul>
</section>

<script>
$(document).ready(function() {
<%
String[] AU_AUTH = (String[])request.getSession().getAttribute("AU_AUTH");
%>
<% if(AU_AUTH != null) {
	if (AU_AUTH.length > 0) {%>
		<%for (int i = 0, n = getSize(rsMenuList); i < n; i++) { %>
			$('#<%=rsMenuList.getString("MENU_CD", i)%>').hide();
		<%}%>
		
		<%for (int i = 0, n = AU_AUTH.length; i < n; i++) {%>
			$('#<%=AU_AUTH[i]%>').show();
		<%}%>
<% } } %>
});
</script>