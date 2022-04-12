<%@page import="poly.dto.DocReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="oracle.net.aso.b"%>
<%@page import="poly.dto.DocNoticeDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	DocReviewDTO pDTO = (DocReviewDTO)request.getAttribute("pDTO");
	String res = (String)request.getAttribute("res");
%>

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
  
  <style> 
  		.centered { margin-left: auto; margin-right: auto; width: 450px;}
  </style>
		
	<script type="text/javascript">
		function goBand() {
			location.href="http://band.us/plugin/share?body=제목:<%=pDTO.getReview_title()%>,url:http://localhost:8080/project/review/ReviewDetail.do?review_no=<%=pDTO.getReview_no() %>&route=안민형";
		}
		
		function goTwitter() {
			location.href="https://twitter.com/intent/tweet?&text=제목:<%=pDTO.getReview_title()%>&url=http://localhost:8080/project/review/ReviewDetail.do?review_no=<%=pDTO.getReview_no() %>";
		}
	</script>

  
  
</head>

<body>
  <!-- Navbar -->
          <nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
            <div class="container">
              <a class="navbar-brand" href="/project/index.do">약국 위치</a>
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
                    <a class="nav-link" href="/project/map/pharmacy.do">약국위치</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/project/notice/NoticeList.do">공지사항 관리</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/project/review/ReviewList.do">리뷰 관리</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="/project/user/UserList.do">사용자 관리</a>
                  </li>
                  
                  <li class="nav-item">
                   <a href="/project/user/mypageDetail.do" class="btn btn-link btn-danger">마이페이지</a>
                  </li>
	                  
	                  <li class="nav-item">
	                   <a href="/project/Logout.do" class="btn btn-outline-default btn-round">로그아웃</a>
	                  </li>
	                </ul>
	              </div>
              	</c:when>
              	
              <c:when test="${sessionScope.SS_VERIFY == 0}">
              	<!-- c:when test="${sessionScope.SS_VF == 1}" -->
              	  <div class="collapse navbar-collapse" id="navbar-info">
	                <ul class="navbar-nav ml-auto">
				  <li class="nav-item">
                    <a class="nav-link" href="/project/map/pharmacy.do">약국위치</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/project/notice/NoticeList.do">공지사항</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/project/review/ReviewList.do">리뷰</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="btn btn-link btn-danger" href="/project/user/mypageDetail.do">마이페이지</a>
                  </li>

	                  
	                  <li class="nav-item">
	                   <a href="/project/Logout.do" class="btn btn-outline-default btn-round">로그아웃</a>
	                  </li>
	                </ul>
	              </div>
              	</c:when>
              	
              	
              	<c:otherwise>
              		<div class="collapse navbar-collapse" id="navbar-info">
	                <ul class="navbar-nav ml-auto">
	                  <li class="nav-item">
	                   <a href="/project/login.do" class="btn btn-outline-default btn-round">로그인</a>
	                  </li>
	                </ul>
	              </div>
              	</c:otherwise>	

              </c:choose>
              
            </div>
          </nav>
  <!-- End Navbar -->
  <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('/assets/img/review.jpg');">
    <div class="filter"></div>
  </div>
 
   <br>
	<br>
     <div style="text-align: center;font-size: 2em">
	리뷰 상세
</div>
    <br>
      <br>
      <div>
    	

		
		
	<form action="/project/review/ReviewUpdate.do">
		<div>	
			<input type="hidden" name="review_no" value="<%=pDTO.getReview_no()%>">
		</div>
		
		<div class="centered" >
			<input type="text" readonly="readonly" name="review_title" maxlength="100" style="width: 450px" value="<%=pDTO.getReview_title()%>" class="form-control">
		</div>
			<br>
		
		<div class="centered">
			<div readonly="readonly" name="review_content" style="width: 450px; height: 400px" class="form-control"><%=pDTO.getReview_content()%></div>
		</div>
			<br>
			
			
		<%if(res == "2"){%>
			<div class="text-center">
				<div style="display: inline-block;">	
					<input type="submit" value="수정" class="btn btn-primary">
				</div>

				<div style="display: inline-block;">
					<input type="button" onclick="location.href='/project/review/ReviewDelete.do?review_no=<%=pDTO.getReview_no()%>'" value="삭제" class="btn btn-danger">
				</div>
	
				<div style="display: inline-block;">	
					<input type="button" onclick="location.href='/project/review/ReviewList.do'" value="돌아가기"  class="btn btn-success">
				</div>
			</div>	
		<%} %>


		<%if(res =="1"){%>
			<div class="text-center">
				<div style="display: inline-block;">
					<input type="button" onclick="location.href='/project/review/ReviewDelete.do?review_no=<%=pDTO.getReview_no()%>'" value="삭제" class="btn btn-danger">
				</div>
	
				<div style="display: inline-block;">	
					<input type="button" onclick="location.href='/project/review/ReviewList.do'" value="돌아가기"  class="btn btn-success">
				</div>
			</div>
		<%} %>
		
				<%if(res =="3"){%>
			<div class="text-center">	
				<div style="display: inline-block;">	
					<input type="button" onclick="location.href='/project/review/ReviewList.do'" value="돌아가기"  class="btn btn-success">
				</div>
			</div>
		<%} %>		
		

	</form>
	<br>
	</div>

      <!-- Tab panes -->
    <footer class="footer footer-black  footer-white ">
      <div class="container">
        <div class="row">
          <nav class="footer-nav">
            <ul>
              <li>
                <a href="http://blog.creative-tim.com/" target="_blank"><button type="button" class="btn btn-link btn-success"  onclick="goBand()">band</button></a>
              </li>
              <li>
                <a href="https://www.creative-tim.com/license" target="_blank"><button type="button" class="btn btn-link btn-primary"  onclick="goTwitter()">Twitter</button></a>
              </li>
            </ul>
          </nav>
          <div class="credits ml-auto">
            <span class="copyright">
              ©
              <script>
                document.write(new Date().getFullYear())
              </script>, made with <i class="fa fa-heart heart"></i> by 안민형
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
    