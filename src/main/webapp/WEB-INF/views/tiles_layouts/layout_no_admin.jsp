<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ page import="planB.common.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><%=UvPropUtil.getString("SITE_NAME")%> 관리자</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.6 일부러 MIN안씀팝업때문에 수정했음-->
	<link rel="stylesheet" href="/admin/AdminLTE2/bootstrap/css/bootstrap.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="/admin/AdminLTE2/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="/admin/AdminLTE2/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="/admin/AdminLTE2/dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  	<link rel="stylesheet" href="/admin/AdminLTE2/dist/css/skins/<%=UvUtil.toNotNull(UvSessionUtil.getSessionValueStr("AU_SKIN", request), "skin-blue")%>.min.css">
	
	<link rel="stylesheet" href="/admin/css/admin.css">
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="/admin/js/html5shiv.min.js"></script>
		<script src="/admin/js/respond.min.js"></script>
		<![endif]-->
	
	<!-- jQuery 2.2.0 -->
	<script src="/admin/js/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="/admin/AdminLTE2/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/admin/AdminLTE2/dist/js/app.min.js"></script>
	<!-- SlimScroll -->
	<script src="/admin/AdminLTE2/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="/admin/AdminLTE2/plugins/fastclick/fastclick.js"></script>
	<!-- bootstrap datepicker -->
  	<link rel="stylesheet" href="/admin/AdminLTE2/plugins/datepicker/datepicker3.css">
	<script src="/admin/AdminLTE2/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="/admin/AdminLTE2/plugins/datepicker/locales/bootstrap-datepicker.kr.js"></script>

	<script src="/admin/js/admin.js"></script>
	<script src="/admin/js/check.js"></script>
	<script src="/admin/js/form.js"></script>
	<script src="/admin/js/string.js"></script>
	<script src="/common/js/common.js"></script>
	
	<script src="/common/component/jquery-upload-file/js/file_handlers.js"></script>
		
	<!-- iCheck for checkboxes and radio inputs -->
  	<link rel="stylesheet" href="/admin/AdminLTE2/plugins/iCheck/all.css">
	<script src="/admin/AdminLTE2/plugins/iCheck/icheck.min.js"></script>
</head>

<script type="text/javascript">
	$.ajaxSetup({
		cache : false
	});

	$(document).ajaxError(function(e, xhr, settings, exception) {
		alert('error in: ' + settings.url + ' \\n' + 'error:\\n' + exception);
	});
	
	$(document).ready(function() {
		//iCheck for checkbox and radio inputs
	    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
	      checkboxClass: 'icheckbox_minimal-blue',
	      radioClass: 'iradio_minimal-blue'
	    });
	});
</script>

<body class="hold-transition <%=UvUtil.toNotNull(UvSessionUtil.getSessionValueStr("AU_SKIN", request), "skin-blue")%> sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content">
				<tiles:insertAttribute name="admin_content" />
			</section>
		</div>
	</div>
</body>
</html>
