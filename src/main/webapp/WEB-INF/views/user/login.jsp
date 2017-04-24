<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>HAPPYLOPERS-해피로퍼즈 - 로그인</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/springBoard/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/springBoard/resources/AdminLTE/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="/springBoard/resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="/springBoard"><b>HAPPY</b>LOPERS</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">계정과 비밀번호를 입력하세요</p>

<form id="loginForm" action="/springBoard/user/loginPost" method="post">
<input type="hidden" name="fbid" />
  <div class="form-group has-feedback">
    <input type="text" name="uid" class="form-control" placeholder="USER ID"/>
    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
  </div>
  <div class="form-group has-feedback">
    <input type="password" name="upw" class="form-control" placeholder="Password"/>
    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
  </div>
  <div class="row">
    <div class="col-xs-8">    
      <div class="checkbox icheck">
        <label>
          <input type="checkbox" name="useCookie"> Remember Me
        </label>
      </div>                        
    </div><!-- /.col -->
    <div class="col-xs-4">
      <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
    </div><!-- /.col -->
  </div>
</form>


        <a href="#">I forgot my password</a><span style="font-size:0.1em">(미구현)</span><br>
        <!-- <a href="/springBoard/user/register" class="text-center">Register a new membership</a><span style="font-size:0.1em"></span> -->
        <a href="/springBoard/user/register" class="text-center">가입하기</a><span style="font-size:0.1em"></span>
		
		<!-- <a href="javascript:fbLogin();" class="btn btn-block btn-social btn-facebook" style="margin-top:2em">
		  <i class="fa fa-facebook"></i> 페이스북 계정으로 로그인
		</a> -->
		<a href="${fbURL}" class="btn btn-block btn-social btn-facebook" style="margin-top:2em">
          <i class="fa fa-facebook"></i> 페이스북 계정으로 로그인
        </a>
		<!-- <div onClick="fbLogOut();">로그아웃</div> -->
		
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="/springBoard/resources/plugins/jQuery/jquery-1.11.1.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="/springBoard/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="/springBoard/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/springBoard/resources/js/jquery.validate.js"></script>
    <script type="text/javascript">
    // validate signup form on keyup and submit
    $("#loginForm").validate({
        rules: {
        	uid:{
                required : true
            },
            upw: {
                required : true
            }
        },
        messages : {
        	uid :{
                required : "아이디를 입력해주세요"
            },
            upw : {
                required : "비밀번호를 입력해주세요"
            }
        }
    });
    </script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
    
    <script type="text/javascript" src="/springBoard/resources/js/facebook_init.js"></script>
	<script>
	function fbLogin(){
		FB.login(function(response) {
	        if (response.authResponse) {
	            FB.api('/me?fields=email,id,name', function(response) {
	            	if(false == checkDuplicatedUserWithFacebook(response.id)){
	            		alert("회원가입이 필요합니다 해당페이지로 이동합니다.");
	            		location.href="/springBoard/user/register";
	            	}else{
	            		$("input[name='fbid']").val(response.id);
	                    $("input[name='uid']").val("facebook_login");
	                    $("input[name='upw']").val("facebook_login");
	                    $("#loginForm").submit();
	            	}
	            });
	        } else {
	                console.log('User cancelled login or did not fully authorize.');
	        }
	    });
	}
	
	

    function checkDuplicatedUserWithFacebook(fbid){
        var duplicate = false;
        $.ajax({
            async: false,
            url:'/springBoard/user/checkDuplicatedUserWithFacebook',
            type:'post',
            data: { "fbid": fbid },
            success:function(data){
                //check값이 flase이면 중복 true면 데이터없음
                if(!data){
                    duplicate = true;
                }
            }
        });
        return duplicate;
    }
    
    
	function fbLogOut(){
		FB.logout(function(response) {
			// Person is now logged out
		});
	}
	</script>
    
    
  </body>
</html>