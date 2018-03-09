<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page extends="planB.framework.base.UvBaseView"%>

<%@ page import="planB.common.util.*"%>

<script>
$(function () {
	var current_skin = "<%=UvUtil.toNotNull(UvSessionUtil.getSessionValueStr("AU_SKIN", request), "skin-blue")%>";
	$('#layout-skins-list [data-skin]').click(function(e) {
		e.preventDefault();
		var skinName = $(this).data('skin');
		$('body').removeClass(current_skin);
		$('body').addClass(skinName);
		current_skin = skinName;
		
		$('link[href="/admin/AdminLTE2/dist/css/skins/<%=UvUtil.toNotNull(UvSessionUtil.getSessionValueStr("AU_SKIN", request), "skin-blue")%>.min.css"]').attr('href','/admin/AdminLTE2/dist/css/skins/' + skinName + '.min.css');
		
		$.getJSON(
			"<%=APP_ROOT%>/admin/member/adminUser/updateSkin"
			, {AU_SKIN:skinName}
		);
	});
	
	
	$("#layout-skins-list").hide();
});
</script>
<!-- Create the tabs -->
<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
	<li class="active"><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
</ul>
<!-- Tab panes -->
<div class="tab-content">
	<div class="tab-pane active" id="control-sidebar-settings-tab">
		<h3>Skins</h3>
		<div class="box box-solid" style="max-width: 300px;">
			<div class="box-body no-padding">
				<table id="layout-skins-list" class="table table-striped bring-up nth-2-center">
					<thead>
						<tr>
							<td style="width: 210px;">Skin Class</td>
							<td>Previewdasd</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>blue</code></td>
							<td><a href="#" data-skin="skin-blue" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>blue-light</code></td>
							<td><a href="#" data-skin="skin-blue-light" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>yellow</code></td>
							<td><a href="#" data-skin="skin-yellow" class="btn btn-warning btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>yellow-light</code></td>
							<td><a href="#" data-skin="skin-yellow-light" class="btn btn-warning btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>green</code></td>
							<td><a href="#" data-skin="skin-green" class="btn btn-success btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>green-light</code></td>
							<td><a href="#" data-skin="skin-green-light" class="btn btn-success btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>purple</code></td>
							<td><a href="#" data-skin="skin-purple" class="btn bg-purple btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>purple-light</code></td>
							<td><a href="#" data-skin="skin-purple-light" class="btn bg-purple btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>red</code></td>
							<td><a href="#" data-skin="skin-red" class="btn btn-danger btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>red-light</code></td>
							<td><a href="#" data-skin="skin-red-light" class="btn btn-danger btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>black</code></td>
							<td><a href="#" data-skin="skin-black" class="btn bg-black btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
						<tr>
							<td><code>black-light</code></td>
							<td><a href="#" data-skin="skin-black-light" class="btn bg-black btn-xs"><i class="fa fa-eye"></i></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
	<!-- /.tab-pane -->
</div>