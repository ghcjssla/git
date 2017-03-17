/**
 * 페이스북 API 사용하기위한 초기화 관련 소스
 */
$(function(){
    fbInit();
});
function fbInit(){
    window.fbAsyncInit = function() {
        FB.init({
          appId      : '1796197107284136',
          cookie     : true,  // enable cookies to allow the server to access 
                              // the session
          xfbml      : true,  // parse social plugins on this page
          version    : 'v2.8' // use graph api version 2.8
        });
    };
        
    // Load the SDK asynchronously
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
}



/**
* 1. 페이스북 특성상 우선 페이스북이 로그인이 되어야 한다.
* 2. 페이스북이 로그인 된 후 얻게되는 ID값을 이용해서
* 3. 회원정보가 있으면 로그인을 한다.
* 4. 회원정보가 없으면 회원정보를 입력한다.(페이스북아이디)
* 5. 회원정보 입력후 로그인 한다.
*/

function fbJoin(){
	// 1. 페이스북 특성상 우선 페이스북이 로그인이 되어야 한다.
	FB.login(function(response) {
        if (response.authResponse) {
            FB.api('/me?fields=email,id,name', function(response) {
                // 2. 페이스북이 로그인 된 후 얻게되는 ID값을 이용해서
                if(!checkDuplicatedUserWithFacebook()){
                	//3. 회원정보가 있으면 로그인을 한다.
                	alert("이미 가입되었습니다");
                	fbLogin();
                }else{
                	//4. 회원정보가 없으면 회원정보를 입력한다.(페이스북아이디)
                    alert(response.name+"님의 HappyLopers 가입을 진행합니다.");
                	if(joinUserWithFacebook(response.id)){
                		//5. 회원정보 입력후 로그인 한다.
                		alert("가입되었습니다.");
                		fbLogin();
                	}else{
                		alert("페이스북계정을 이용한 가입이되지않았습니다.");
                	}
                }
            });
        } else {
          console.log('User cancelled login or did not fully authorize.');
        }
    });
}

function fbLogin(){
    FB.login(function(response) {
        if (response.authResponse) {
        console.log('Welcome!  Fetching your information.... ');
            FB.api('/me?fields=email,id,name', function(response) {
                $("#loginForm").attr("action","/springBoard/user/loginPost");
                $("#loginForm input[name=fbid]").val(response.id);
                $("#loginForm").submit();
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

function checkDuplicatedUserWithFacebook(){
	var duplicate = false;
    $.ajax({
    	async: false,
        url:'/springBoard/user/checkDuplicatedUserWithFacebook',
        type:'post',
        data:$("#joinFrm").serialize(),
        success:function(data){
        	//check값이 flase이면 중복 true면 데이터없음
        	if(!data){
        		duplicate = true;
        	}
        }
    });
    return duplicate;
}

function joinUserWithFacebook(fbid){
	var isJoin = false;
	$("#joinFrm input[name=fbid]").val(fbid);
    $.ajax({
    	async: false,
        url:'/springBoard/user/joinTheHappyLopers',
        type:'post',
        data:$("#joinFrm").serialize(),
        success:function(data){
        	isJoin = data;
        }
    });
    return isJoin;
}