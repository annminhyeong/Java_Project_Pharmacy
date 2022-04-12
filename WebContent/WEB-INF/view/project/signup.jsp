<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

    

<!--
=========================================================
 Paper Kit 2 - v2.2.0
=========================================================

 Product Page: https://www.creative-tim.com/product/paper-kit-2
 Copyright 2019 Creative Tim (https://www.creative-tim.com)
 Licensed under MIT (https://github.com/creativetimofficial/paper-kit-2/blob/master/LICENSE.md)

 Coded by Creative Tim

=========================================================

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->

<!DOCTYPE html>

<html lang="en">

<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>    
  <script type="text/javascript">
	function doLoginUserCheck(f) {
		
		if(f.id.value==""){
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		
		if(f.user_name.value==""){
			alert("이름를 입력하세요");
			f.user_name.focus();
			return false;
		}
		
		if(f.password.value==""){
			alert("비밀번호를 입력하세요");
			f.password.focus();
			return false;
		}
		
		if(f.password2.value==""){
			alert("비밀번호 확인를 입력하세요");
			f.password2.focus();
			return false;
		}
		
		if(f.email.value==""){
			alert("이메일를 입력하세요");
			f.email.focus();
			return false;
		}
	}
</script>	
    	
<script>
 
//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    
    	function checkEmail(){

		$("#email-success").hide();
		$("#email-danger").hide();
		var email = $('input[name=email]').val();
	
        var CheckForm = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        
        if(!CheckForm.test(email)){
        	$("#updatebtn").prop("disabled", true);
			$("#email-type").show();

         }else{
		$.ajax({
			
			data:{
				email : email,
			},
			
			url:"/project/checkEmail.do",
			success: function(data) {
				console.log(data);

				if(data>0){
					$("#email-type").hide();
					$("#email-success").hide();
					$("#email-danger").show();
					$("#updatebtn").prop("disabled", true);
				}
				 
				else {
					$("#email-type").hide();
					$("#email-success").show();
					$("#email-danger").hide();
					$("#updatebtn").prop("disabled", true);
				}

			}
			
		});
         }
	
	}
    
    
    
    
    
    
    
    
    
    
    var idCheck = 0;
    var pwdCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
        var inputed = $('#id').val();
        var inputed1 = $('#pwd1').val();
        var CheckForm = /^[a-z0-9]{5,16}$/;

        
        if(!CheckForm.test(inputed)){
        	$("#signupbtn").prop("disabled", true);
            $("#idtype").show();
            $("#idSuccess").hide();
			$("#idExist").hide();
			$("#idBlank").hide();
         }

        else{
        	 
        

        $.ajax({
            data : {
                id : inputed
            },
            url : "/project/checkId.do",
            success : function(data) {
                if(inputed=="" && data=='0') {
                    $("#idtype").hide();
                	$("#idSuccess").hide();
					$("#idExist").hide();
					$("#idBlank").show();
                	$("#signupbtn").prop("disabled", true);
                    idCheck = 0;
                } else if (data == '0') {
                    
                	
                	
                	$("#idtype").hide();
                	$("#idSuccess").show();
					$("#idExist").hide();
					$("#idBlank").hide();
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
                       
                    	$("#signupbtn").prop("disabled", false);
                        signupCheck();
                    } 
                } else if (data == '1') {
                	$("#idtype").hide();
                	$("#idSuccess").hide();
 					$("#idExist").show();
 					$("#idBlank").hide();
                    $("#signupbtn").prop("disabled", true);
                    idCheck = 0;
                } 
            }
        });
        
         }
    }

	$(function checkPwd(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function(){
			var pwd1=$("#pwd1").val();
			var pwd2=$("#pwd2").val();
	        var CheckForm1 = /^[a-z0-9]{8,16}$/;
	        
	        if(!CheckForm1.test(pwd1)){
	        	$("#signupbtn").prop("disabled", true);
	        	if(pwd1 !=""){
	            $("#pwdtypefail").show(); 
	        	}
	         }else{
			
			if(pwd1 != "" || pwd2 != ""){
				if(pwd1 == pwd2){ 
				$("#pwdtypefail").hide();
				$("#alert-success").show();
				$("#alert-danger").hide(); $("#submit").removeAttr("disabled");
				$("#signupbtn").prop("disabled", false);
				pwdCheck = 1;
				
				}else{
					$("#pwdtypefail").hide();
					$("#pwdtype").hide();
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
					$("#signupbtn").prop("disabled", true);
				} 
			} 
		}
		}); 
	}); 
</script>

<script type="text/javascript">
//이름 형식 체크
function test_name() {
   var name = f.user_name.value;
   var CheckForm = /^[a-zA-Z]{2,10}|[a-zA-Z]{2,10}|[가-힣]{2,4}$/;

   if (!CheckForm.test(name)) {
      $("#name-type").show();

   } else {
      $("#name-type").hide();
   }
}

</script>


	
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="/assets/img//apple-icon.png">
  <link rel="icon" type="image/png" href="/assets/img//favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="register-page sidebar-collapse">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="/project/index.do" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom" target="_self">
          	약국검색
        </a>

      </div>

    </div>
  </nav>

  <div class="page-header" style="background-image: url('/assets/img/login-image.jpg');">
    <div class="filter"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-4 ml-auto mr-auto">
          <div class="card card-register" style="margin:auto;">
            <h3 class="title mx-auto">회원 가입</h3>

            <form class="register-form" action="/project/insertUserinfo.do" method="post" onsubmit="return doLoginUserCheck(this);" name="f">
              <label>아이디</label>
              <input type="text" class="form-control" name="id" placeholder="id를 넣으세요" required  id="id" oninput="checkId()">
              	<div class="alert alert-danger" id="idtype" style="display: none;">형식이 올바르지 않습니다.(영문소문자, 숫자 5~16글자)</div>
              	<div class="alert alert-success" id="idSuccess" style="display: none;">아이디 사용가능</div> 
              	<div class="alert alert-danger" id="idExist" style="display: none;">아이디가 중복됩니다</div>
              	<div class="alert alert-danger" id="idBlank" style="display: none;">아이디를 입력해주세요</div>
              		
              <label>이름</label>
			  <input type="text" class="form-control" name="user_name" placeholder="이름를 넣으세요" oninput="test_name()">
			  <div class="alert alert-danger" id="name-type" style="display: none;">이름 형식이 아닙니다.</div>
              	
              <label>비밀번호</label>
              <input type="password" class="form-control" placeholder="Password" name="password" id="pwd1">
			  <div class="alert alert-danger" id="pwdtypefail" style="display: none;">형식이 올바르지 않습니다.(영문소문자, 숫자 8~16글자)</div>
              <label>비밀번호 확인</label>
              <input type="password" class="form-control" placeholder="Password" name="password2" id="pwd2" oninput="checkPwd()">

              <div class="alert alert-success" id="alert-success">비밀번호 사용가능.</div> 
              <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
             	
             <label>이메일</label>
             <input type="email" class="form-control" name="email" oninput="checkEmail()">
              <div class="alert alert-success" id="email-success" style="display: none;">이메일 사용가능.</div> 
              <div class="alert alert-danger" id="email-danger" style="display: none;">이메일이 중복됩니다.</div>
			  <div class="alert alert-danger" id="email-type" style="display: none;">이메일이 형식이 아닙니다.</div>
              	
              <input type="submit" class="btn btn-danger btn-block btn-round" value="회원가입" id="signupbtn">
              
            </form>
            
          </div>
        </div>
      </div>
    </div>

  </div>
  <!--   Core JS Files   -->
  <script src="/assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="/assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="/assets/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
  <script src="/assets/js/plugins/moment.min.js"></script>
  <script src="/assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
  <!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
  <script src="/assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
</body>

</html>
    