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
  <script type="text/javascript">
	function doLoginUserCheck(f) {
		
		if(f.id.value==""){
			alert("아이디를 입력하세요.");
			f.id.focus();
			return false;
		}
		
		if(f.password.value==""){
			alert("비밀번호를 입력하세요.");
			f.password.focus();
			return false;
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
            <h3 class="title mx-auto">로그인</h3>

            <form class="register-form" action="/project/getUserLoginCheck.do" method="post" onsubmit="return doLoginUserCheck(this);" name="f">
              <label>아이디</label>
              <input type="text" class="form-control" placeholder="id" name="id">
              <label>비밀번호</label>
              <input type="password" class="form-control" placeholder="Password" name="password">
              <button class="btn btn-danger btn-block btn-round">로그인</button>
            </form>
            <div class="forgot">
			 		      <a href="/project/searchPwd.do" class="btn btn-link btn-danger">password find</a>
   			  <a href="/project/searchId.do" class="btn btn-link btn-danger">id find</a>
              <a href="/project/signup.do" class="btn btn-link btn-danger">create account?</a><br>


              
              
                                        
              
               
              
            </div>
            
          </div>
        </div>
      </div>
    </div>
    <div class="footer register-footer text-center">
      <h6>©
        <script>
          document.write(new Date().getFullYear())
        </script>, made with <i class="fa fa-heart heart"></i> by 안민형</h6>
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
    