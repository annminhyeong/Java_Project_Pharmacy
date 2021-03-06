<%@page import="poly.dto.DocUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DocUserDTO pDTO = (DocUserDTO)request.getAttribute("pDTO");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="/assets/img//apple-icon.png">
  <link rel="icon" type="image/png" href="/assets/img//favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Paper Kit by Creative Tim
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
  
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>    
<script type="text/javascript">
		
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
	
	
	
	$(function checkPwd(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function(){
			var pwd1=$("#pwd1").val();
			var pwd2=$("#pwd2").val();
	        var CheckForm1 = /^[a-z0-9]{8,16}$/;
	        
	        if(!CheckForm1.test(pwd1)){
	        	$("#updatebtn").prop("disabled", true);
	        	if(pwd1 !=""){
	            $("#pwdtypefail").show(); 
	        	}
	         }else{
			
			
			if(pwd1 != "" || pwd2 != ""){
				if(pwd1 == pwd2){ 
				$("#pwdtypefail").hide();
				$("#alert-success").show();
				$("#alert-danger").hide(); $("#submit").removeAttr("disabled");
				$("#updatebtn").prop("disabled", false);
				
				}else{
					$("#pwdtypefail").hide();
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
					$("#updatebtn").prop("disabled", true);
				} 
			}
	      }
		}); 
	}); 
</script>
<script type="text/javascript">
   
    	//???????????? ?????? ????????? ??????
    	function doRegUserCheck(f) {
			
    		if(f.id.value==""){
    			alert("???????????? ???????????????");
    			f.id.focus();
    			return false;
    		}
    		
    		if(f.user_name.value==""){
    			alert("????????? ???????????????");
    			f.user_name.focus();
    			return false;
    		}
    		
    		if(f.password.value==""){
    			alert("??????????????? ???????????????");
    			f.password.focus();
    			return false;
    		}
    		
    		if(f.password2.value==""){
    			alert("???????????? ????????? ???????????????");
    			f.password2.focus();
    			return false;
    		}
    		
    		if(f.email.value==""){
    			alert("???????????? ???????????????");
    			f.email.focus();
    			return false;
    		}
    		
		}  
</script>
<script type="text/javascript">
//?????? ?????? ??????
function test_name() {
   var name = f.user_name.value;
   console.log(name)
   var CheckForm = /^[a-zA-Z]{2,10}|[a-zA-Z]{2,10}|[???-???]{2,4}$/;

   if (!CheckForm.test(name)) {

      $("#name-type").show();

   } else {
      $("#name-type").hide();
   }
}

</script>
</head>

<body class="profile-page sidebar-collapse">
  <!-- Navbar -->
          <nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
            <div class="container">
              <a class="navbar-brand" href="/project/index.do">?????? ??????</a>
              <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar-info" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
              </button>
              <c:choose>
              	<c:when test="${sessionScope.SS_VERIFY == 1}">
              	<!-- c:when test="${SessionScope.SS_VF == 1}" -->
              	  <div class="collapse navbar-collapse" id="navbar-info">
	                <ul class="navbar-nav ml-auto">
				  <li class="nav-item">
                    <a class="nav-link" href="/project/map/pharmacy.do">????????????</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/project/notice/NoticeList.do">???????????? ??????</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/project/review/ReviewList.do">?????? ??????</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="/project/user/UserList.do">????????? ??????</a>
                  </li>
                  
                  <li class="nav-item">
                   <a href="/project/user/mypageDetail.do" class="btn btn-link btn-danger">???????????????</a>
                  </li>
	                  
	                  <li class="nav-item">
	                   <a href="/project/Logout.do" class="btn btn-outline-default btn-round">????????????</a>
	                  </li>
	                </ul>
	              </div>
              	</c:when>
              	
              <c:when test="${sessionScope.SS_VERIFY == 0}">
              	<!-- c:when test="${sessionScope.SS_VF == 1}" -->
              	  <div class="collapse navbar-collapse" id="navbar-info">
	                <ul class="navbar-nav ml-auto">
				  <li class="nav-item">
                    <a class="nav-link" href="/project/map/pharmacy.do">????????????</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/project/notice/NoticeList.do">????????????</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/project/review/ReviewList.do">??????</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="btn btn-link btn-danger" href="/project/user/mypageDetail.do">???????????????</a>
                  </li>

	                  
	                  <li class="nav-item">
	                   <a href="/project/Logout.do" class="btn btn-outline-default btn-round">????????????</a>
	                  </li>
	                </ul>
	              </div>
              	</c:when>
              	
              	
              	<c:otherwise>
              		<div class="collapse navbar-collapse" id="navbar-info">
	                <ul class="navbar-nav ml-auto">
	                  <li class="nav-item">
	                   <a href="/project/login.do" class="btn btn-outline-default btn-round">?????????</a>
	                  </li>
	                </ul>
	              </div>
              	</c:otherwise>	

              </c:choose>
              
            </div>
          </nav>
  <!-- End Navbar -->
  <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('/assets/img/fabio-mangione.jpg');">
    <div class="filter"></div>
  </div>
  <div class="section profile-content">
    <div class="container">
      <div class="owner">
        <div class="avatar">
<!--          <img src="/assets/img/faces/joe-gardner-2.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">-->
        </div>

      </div>

      <br/>
      <div class="col-md-6 ml-auto mr-auto text-center">
        
            <form action="/project/mypageUpdateProc.do" name="f" method="post" onsubmit="return doRegUserCheck(this);">
            <label>??????:</label>
            <input type="text" id="user_name" name="user_name" class="form-control" placeholder="name" value="<%=pDTO.getUser_name() %>" oninput="test_name()">
            <div class="alert alert-danger" id="name-type" style="display: none;">?????? ????????? ????????????.</div>
            
            <label>?????????:</label>
            <input type="text" name="email" class="form-control" placeholder="Email" value="<%=pDTO.getEmail() %>" oninput="checkEmail()">
			  <div class="alert alert-success" id="email-success" style="display: none;">????????? ????????????.</div> 
              <div class="alert alert-danger" id="email-danger" style="display: none;">???????????? ???????????????.</div>
			  <div class="alert alert-danger" id="email-type" style="display: none;">???????????? ????????? ????????????.</div>
              
              <label>???????????? ??????</label>
              <input type="password" class="form-control" placeholder="Password" name="password" id="pwd1">
              <div class="alert alert-danger" id="pwdtypefail" style="display: none;">????????? ???????????? ????????????.(???????????????, ?????? 8~16??????)</div>
              
              <label>???????????? ?????? ??????</label>
              <input type="password" class="form-control" placeholder="Password" name="password2" id="pwd2" oninput="checkPwd()">
              <div class="alert alert-success" id="alert-success">??????????????? ???????????????.</div> 
              <div class="alert alert-danger" id="alert-danger">??????????????? ???????????? ????????????.</div>
            
                         
              
            <br>
            
            <button class="btn btn-outline-default btn-round" id="updatebtn">
            <i class="fa fa-cog"></i> ????????????</button>
           </form> 
            
      
      
      </div>

      <!-- Tab panes -->

    </div>
  </div>
  <footer class="footer    ">
    <div class="container">
      <div class="row">

        </nav>
        <div class="credits ml-auto">
          <span class="copyright">
            ??
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="fa fa-heart heart"></i> by ?????????
          </span>
        </div>
      </div>
    </div>
  </footer>
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
    