<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<%
request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_ID"));
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
 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <!-- include summernote css/js-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">    
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nanum+Gothic">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
    <!-- include summernote-ko-KR -->
    <script src="/summernote/js/summernote-ko-KR.js"></script>
    <script>
    
        $(document).ready(function () {
            $('#summernote').summernote({
                placeholder: '내용을 입력해 주세요.',
                minHeight: 370,
                maxHeight: null,
                focus: true,
                lang: 'ko-KR',
                onImageUpload : function(files, editor, welEditable) {
                    sendFile(files[0], editor, welEditable);
                }
            });

            function sendFile(file, editor, welEditable) {
                data = new FormData();
                data.append("uploadFile", file);
                $.ajax({
                    data : data,
                    type : "POST",
                    url : "/imageUpload",
                    cache : false,
                    contentType : false,
                    processData : false,
                    success : function (data) {
                        editor.insertImage(welEditable, data.url);
                    }
                })
            }
        });

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
  
  

  <script type="text/javascript">

//로그인 여부 체크


//전송시 유효성 체크
/* function doSubmit(f){
	if(f.review_title.value == ""){
		alert("제목을 입력하시기 바랍니다.");
		f.review_title.focus();
		return false;
	}
	
	if(calBytes(f.review_title.value) > 200){
		alert("최대 200Bytes까지 입력 가능합니다.");
		f.review_title.focus();
		return false;
	}	
	
	if(f.review_content.value == ""){
		alert("내용을 입력하시기 바랍니다.");
		f.review_content.focus();
		return false;
	}	
	
	if(calBytes(f.review_content.value) > 4000){
		alert("최대 4000Bytes까지 입력 가능합니다.");
		f.review_content.focus();
		return false;
	}		
	
	
} */

//글자 길이 바이트 단위로 체크하기(바이트값 전달)
/* function calBytes(str){
	
	var tcount = 0;
	var tmpStr = new String(str);
	var strCnt = tmpStr.length;

	var onechar;
	
	for (i=0;i<strCnt;i++){
		onechar = tmpStr.charAt(i);
		
		if (escape(onechar).length > 4){
			tcount += 2;
		}else{
			tcount += 1;
		}
	}
	
	return tcount;
}
 */
</script>

  <style> 
  		.centered { margin-left: auto; margin-right: auto; width: 450px;}
  </style>
  
  
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
	리뷰 글쓰기
</div>
    <br>
      <br>

	<form name="f" method="post" action="/project/review/ReviewRegProc.do" onsubmit="return doSubmit(this);">

		<div>

			<div class="centered">
				<input type="text" name="review_title" maxlength="100"
					style="width: 450px" placeholder="제목" class="form-control"
					id="title">
			</div>
			<br>
			<div class="centered">

				<!-- 			<textarea name="review_content" style="width: 450px; height: 400px" placeholder="내용을 입력해주세요" class="form-control" rows="4"></textarea> -->

				<textarea class="table_textbox" id="summernote"
					name="review_content"></textarea>
			</div>
		</div>

		<br>

		<div class="text-center">
			<div style="display: inline-block;">
				<input type="submit" value="등록" class="btn btn-primary"
					id="reg_btn2">
			</div>
			<div style="display: inline-block;">
				<input type="reset" value="다시 작성" class="btn btn-danger">
			</div>
			<div style="display: inline-block;">
				<input type="button"
					onclick="location.href='/project/review/ReviewList.do'"
					value="돌아가기" class="btn btn-success">
			</div>
		</div>

	</form>
      <!-- Tab panes -->


  <footer class="footer    ">
    <div class="container">
      <div class="row">
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
  <!-- <script src="/assets/js/core/jquery.min.js" type="text/javascript"></script> -->
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
    