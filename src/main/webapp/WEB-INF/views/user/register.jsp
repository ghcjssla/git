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
        <a href="/springBoard/resources/index2.html"><b>HAPPY</b>LOPERS</a>
      </div><!-- /.login-logo -->
		<div class="register-box-body">
		    <p class="login-box-msg">Register a new membership</p>
		
		    <form id="joinFrm" method="post">
		    <input type="hidden" name="fbid" />
		    <input type="hidden" name="upw" />
		    <input type="hidden" name="uname" />
		      <div class="form-group has-feedback">
		        <input name="uid" type="text" class="form-control" placeholder="ID">
		        <span class="glyphicon glyphicon-user form-control-feedback"></span>
		      </div>
		      <div class="form-group has-feedback">
		        <input name="email" type="email" class="form-control" placeholder="Email">
		        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		      </div>
		      <div class="form-group has-feedback">
		        <input id="pwd1" name="pwd1" type="password" class="form-control" placeholder="Password">
		        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
		      </div>
		      <div class="form-group has-feedback">
		        <input id="pwd2" name="pwd2" type="password" class="form-control" placeholder="Retype password">
		        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
		      </div>
		      <div class="row">
		      <!-- 
		        <div class="col-xs-8">
		          <div class="checkbox icheck">
		            <label>
		              <input type="checkbox"> I agree to the <a href="javascript:alert('으리');">terms</a>
		            </label>
		          </div>
		        </div>
		         -->
		        <!-- /.col -->
		        <div class="col-xs-12">
		          <span onCLick="joinTheHappyLopers();" class="btn btn-primary btn-block btn-flat">HappyLopers 가입하기</span>
		        </div>
		        <!-- /.col -->
		      </div>
		    </form>
		
		    <div class="social-auth-links text-center">
		      <p>- OR -</p>
		      <a href="javascript:joinHappyLopersWithFaceBook();" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> 페이스북으로 가입하기 </a>
		      <!-- <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
		        Google+</a> -->
		    </div>
		<div id="test"></div>
		    <a href="login.html" class="text-center">I already have a membership</a>
		  </div>
		  <!-- /.form-box -->
		</div>
		<!-- /.register-box -->

    <!-- jQuery 2.1.4 -->
    <script src="/springBoard/resources/plugins/jQuery/jquery-1.11.1.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="/springBoard/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="/springBoard/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/springBoard/resources/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/springBoard/resources/js/additional-methods.js"></script>
    <script type="text/javascript">
    var validId = false;
    $(function(){
    	$("#joinFrm input[name=uid]").blur(function(){
    		checkUserIdVisualization();
    	});
    });
    
    function checkUserIdVisualization(){
    	var userId = $("#joinFrm input[name=uid]").val();
        if(checkDuplicateId(userId)){
        	$("#joinFrm input[name=uid]").css("border","");
        	$("#joinFrm input[name=uid]").next().css("background-color","");
        	$("#uid-error").remove();
        }else{
        	$("#joinFrm input[name=uid]").parent().append("<label id=\"uid-error\" class=\"error\" for=\"uid\">이미 사용중인 ID입니다.</label>");
        	$("#joinFrm input[name=uid]").css("border","solid 1px red");
        	$("#joinFrm input[name=uid]").next().css("background-color","red");
        }
    }
    
    // validate signup form on keyup and submit
    var form = $("#joinFrm");
    form.validate({
        rules: {
        	uid:{
                required : true
            },
            pwd1: {
                required : true,
                rangelength: [5, 12]
            },
            pwd2: {
                required : true,
                rangelength: [5, 12],
                equalTo : '#pwd1'
            }
        },
        messages : {
        	uid :{
                required : "아이디를 입력해주세요"
            },
            pwd1 : {
                required : "비밀번호를 입력해주세요",
                rangelength: $.validator.format("비밀번호를 최소 {5}글자 이상 {12}글자 이하로 입력하세요.")
            },
            pwd2 : {
                required : "비밀번호를 입력해주세요",
                rangelength: $.validator.format("비밀번호를 최소 {5}글자 이상 {12}글자 이하로 입력하세요."),
                equalTo: "비밀번호가 일치하지 않습니다."
            }
        }
    });
    
    
    /**
    * 폼값 검사 후 비밀번호를 셋팅한다.
    * 유저네임도 셋팅한다
    * 원래 값 받으려했으나 최소한의 데이터만 받고 가입시키려고함
    * 받은 id값으로 name에 넣고 추후에 바꿀수 있게 하던가 할 예정
    * 바꾸지 않아도 상관은없고.
    */
    function formValidate(){
    	var isOk = false;
    	if(form.valid() && validId){
    		var ProvenPW = $("input[name=pwd1]").val();
    		var userId = $("input[name=uid]").val();
    		$("input[name=upw]").val(ProvenPW);
    		$("#joinFrm input[name=uname]").val(userId);
    		isOk = true;
    	}
    	return isOk; 
    }
    
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
	/**
	* 1. 페이스북 특성상 우선 페이스북이 로그인이 되어야 한다.
	* 2. 페이스북이 로그인 된 후 얻게되는 ID값을 이용해서
	* 3. 회원정보가 있으면 로그인을 한다.
	* 4. 회원정보가 없으면 회원정보를 입력한다.(페이스북아이디)
	* 5. 회원정보 입력후 로그인 한다.
	*/
	
	function joinHappyLopersWithFaceBook(){
		if(formValidate()){
			// 1. 페이스북 특성상 우선 페이스북이 로그인이 되어야 한다.
	        FB.login(function(response) {
	            if (response.authResponse) {
	                FB.api('/me?fields=email,id,name', function(response) {
	                    // 2. 페이스북이 로그인 된 후 얻게되는 ID값을 이용해서
	                    if(true == checkDuplicatedUserWithFacebook(response.id)){
	                        //3. 회원정보가 있으면 로그인을 한다.
	                        alert("이미 가입되었습니다");
	                        fbLogin();
	                    }else{
	                        //4. 회원정보가 없으면 회원정보를 입력한다.(페이스북아이디)
	                        alert(response.name+"님의 HappyLopers 가입을 진행합니다.");
	                        if(true == joinUserWithFacebook(response.id, response.name)){
	                            //5. 회원정보 입력후 로그인 한다.
	                            alert("가입되었습니다.");
	                            fbLogin();
	                        }
	                    }
	                });
	            } else {
	              console.log('User cancelled login or did not fully authorize.');
	            }
	        });
		}else{
			alert("입력값을 확인하세요");
		}
	}
	
	function joinTheHappyLopers(){
        if(formValidate()){
            if(formValidate()){
                $.ajax({
                    async: false,
                    url:'/springBoard/user/joinTheHappyLopers',
                    type:'post',
                    data:$("#joinFrm").serialize(),
                    success:function(data){
                        isJoin = data;
                        if(isJoin){
                        	alert("가입되었습니다.");
                        	$("#joinFrm").attr("action","/springBoard/user/loginPost");
                        	$("#joinFrm").submit();
                        }
                    }
                });
            }
        }else{
            alert("입력값을 확인하세요");
        }
    }
	
    function fbLogin(){
        FB.login(function(response) {
            if (response.authResponse) {
            console.log('Welcome!  Fetching your information.... ');
                FB.api('/me?fields=email,id,name', function(response) {
                    $("#joinFrm").attr("action","/springBoard/user/loginPost");
                    $("#joinFrm input[name=fbid]").val(response.id);
                    $("#joinFrm").submit();
                });
            } else {
                    console.log('User cancelled login or did not fully authorize.');
            }
        });
    }
	
	function fbLogOut(){
		FB.logout(function(response) {
			// Person is now logged out
		});
	}
	
	/**
	* 페이스북ID를 이용하여 이미 가입된 내역이 있는지 확인한다.
	* check값이 flase이면 중복 true면 데이터없음
	*/
	function checkDuplicatedUserWithFacebook(fbid){
		var duplicate = false;
		$("#joinFrm input[name=fbid]").val(fbid);
        $.ajax({
        	async: false,
            url:'/springBoard/user/checkDuplicatedUserWithFacebook',
            type:'post',
            data:$("#joinFrm").serialize(),
            success:function(data){
            	if(!data){
            		duplicate = true;
            	}
            }
        });
        return duplicate;
	}
    
	/**
	* 페이스북 으로 가입하기위하여 페이스북ID를 설정한다.
	* 비동기식으로 먼저체크하고 오류나는 경우가 발생하여
    * async 값을 false로 동기식으로 설정함
    * ajax동작 하기 이전에 폼유요성 검사를 한다.
    * 페이스북에서 사용자이름을 가져올 수 있기 때문에 자동으로 넣어준다.
	*/
	function joinUserWithFacebook(fbid, name){
		//alert("fbid : "+fbid+"\r\n"+"name : "+name+"\r\n"+"email : "+email);
		var isJoin = false;
		$("#joinFrm input[name=fbid]").val(fbid);
		$("#joinFrm input[name=uname]").val(name);
		if(formValidate()){
			$.ajax({
	            async: false,
	            url:'/springBoard/user/joinTheHappyLopers',
	            type:'post',
	            data:$("#joinFrm").serialize(),
	            success:function(data){
	                isJoin = data;
	            }
	        });
		}
        return isJoin;
	}
	
	/**
	* 중복된 아이디가 있는지 찾는다.
	* true이면 중복 false면 없는유저 
	* 비동기식으로 먼저체크하고 오류나는 경우가 발생하여
	* async 값을 false로 동기식으로 설정함
	*/
	function checkDuplicateId(targetId){
		var isDuplicate = false;
        $.ajax({
            async: false,
            url:'/springBoard/user/checkDuplicatedUserId',
            type:'post',
            data: { "uid": targetId },
            success:function(data){
            	isDuplicate = data;
            	if(true == data){
            		validId = true;
            	}
            }
        });
        return isDuplicate;
	}
	</script>
  </body>
</html>
