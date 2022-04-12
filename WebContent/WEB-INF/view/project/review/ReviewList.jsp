<%@page import="poly.dto.DocReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.DocNoticeDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="poly.dto.PagingDTO" %>

    
      
<%

session.setAttribute("SESSION_USER_ID","USER01");

List<DocReviewDTO> rList = (List<DocReviewDTO>)request.getAttribute("rList");
PagingDTO pagination = (PagingDTO)request.getAttribute("pagination");

if(rList == null){
	rList = new ArrayList<DocReviewDTO>();
}

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
  
  
 <script type="text/javascript">
 	 function fn_paging(curPage) {
	  location.href = "/project/review/ReviewList.do?curPage=" + curPage;
	  }
 </script>

   <script>

   // 생략	

	$(document).on('click', '#btnSearch', function(e){

		e.preventDefault();

		var url = "/project/review/ReviewList";
		
		location.href = url;

		console.log(url);

	});	

</script> 
  
  
  
  <script type="text/javascript">
	function doDetail(seq) {
		location.herf="/project/NoticeInfo.do?nSeq=" + seq;
	}
  </script>
  
  
  
  
</head>

<body class="profile-page sidebar-collapse">
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
  <div class="section profile-content">
   <br>
   
    <div class="container">
     <div style="text-align: center;font-size: 2em">
	리뷰
</div>


<br>
		<!-- search{s} -->
		<div style="margin-left: auto;width: 350px;">
		<form action="/project/reviewTest.do">
		<div class="form-group row justify-content-center">
			
			
			
		
			<div class="w100" style="padding-right:10px">
				
				
			
				<select class="form-control form-control-sm" name="searchType" id="searchType">

					<option value="review_title">제목</option>

					<option value="review_content">본문</option>

					<option value="review_writer">작성자</option>

				</select>
			
			
			</div>

			<div class="w300" style="padding-right:10px">

				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">

			</div>

			<div>

				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>

			</div>

		</div>
			</form>
	</div>
			<!-- search{s} end -->
	<!-- 테이블 -->
	       <div style="width:100%;margin-left: auto;margin-right: auto">
        <div class="table-striped" style="width: 100%">

 <div class="row" style="background-color: black; width: 100%; height: 50px;">
  <div class="col-md-2 col-xs-2 col-sm-2 " style="text-align: center; padding-top: 15px; color: white;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">순번</div>
  <div class="col-md-4 col-xs-4 col-sm-4 " style="text-align: center; padding-top: 15px; color: white;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">제목</div>
  <div class="col-md-2 col-xs-2 col-sm-2 " style="text-align: center; padding-top: 15px; color: white;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">조회수</div>
  <div class="col-md-2 col-xs-2 col-sm-2 " style="text-align: center; padding-top: 15px; color: white;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">등록일</div>
  <div class="col-md-2 col-xs-2 col-sm-2 " style="text-align: center; padding-top: 15px; color: white;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;x">작성자</div>
</div>

    </div>
		
		<%
			for(int i=0; i<rList.size(); i++){
				DocReviewDTO rDTO = rList.get(i);
				
				if(rDTO == null){
					rDTO = new DocReviewDTO();
				}
			
		%>
		<div class="row" style="width: 100%; height: 50px;">
  <div class="col-md-2 col-xs-2 col-sm-2" style="text-align: center; padding-top: 10px; text-overflow:ellipsis; overflow:hidden;"><%out.print(CmmUtil.nvl(rDTO.getReview_no()));%></div>
  <div class="col-md-4 col-xs-4 col-sm-4" style="text-align: center; padding-top: 10px; text-overflow:ellipsis; overflow:hidden;"><a href="/project/review/ReviewDetail.do?review_no=<%=rDTO.getReview_no()%>"><%=CmmUtil.nvl(rDTO.getReview_title().replace("& #40;", "(").replace("& #41;", ")").replace("& gt;", ">").replace("& lt;", "<")) %></a></div>
  <div class="col-md-2 col-xs-2 col-sm-2" style="text-align: center; padding-top: 10px; text-overflow:ellipsis; overflow:hidden;"><%=CmmUtil.nvl(rDTO.getReview_count().replace("& #40;", "(").replace("& #41;", ")").replace("& gt;", ">").replace("& lt;", "<"))%></div>
  <div class="col-md-2 col-xs-2 col-sm-2" style="text-align: center; padding-top: 10px; text-overflow:ellipsis; overflow:hidden;"><%=CmmUtil.nvl(rDTO.getRegdate().replace("& #40;", "(").replace("& #41;", ")").replace("& gt;", ">").replace("& lt;", "<")) %></div>
  <div class="col-md-2 col-xs-2 col-sm-2" style="text-align: center; padding-top: 10px; text-overflow:ellipsis; overflow:hidden;"><%=CmmUtil.nvl(rDTO.getReview_writer().replace("& #40;", "(").replace("& #41;", ")").replace("& gt;", ">").replace("& lt;", "<")) %></div>
	</div>
	
<%
}
%>
	<!-- 페이징 시작 -->
				<div style="display: inline-block;">
		            <!-- 1~5페이지 아닌 경우에 처음 찍기 -->
		            <ul class="pagination">
                    <c:if test="${pagination.curRange ne 1 }">
                        <a class="page-link" href="#" onClick="fn_paging(1)">처음</a> 
                    </c:if>
                    <!-- 1페이지가 아닌 경우에 이전 찍기 -->
                    <c:if test="${pagination.curPage ne 1}">
                        <a class="page-link" href="#" onClick="fn_paging('${pagination.prevPage }')">이전</a> 
                    </c:if>
                    
                    
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span style="font-weight: bold;"><a  class="page-link" href="#"  onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a class="page-link" href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    
                    <!-- 마지막 페이지가 아닌 경우에 다음 찍기 -->
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a class="page-link" href="#" onClick="fn_paging('${pagination.nextPage }')">다음</a> 
                    </c:if>
                    
                    <!-- 마지막 페이지 블록이 아닐때 끝 찍기 -->
                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a class="page-link" href="#" onClick="fn_paging('${pagination.pageCnt }')">끝</a> 
                    </c:if>
                    
                    </ul>
                </div>
 <!-- 페이징 끝 --> 
 	<div style="float: right; margin-right: 10px">
		<c:choose>
		<c:when test="${sessionScope.SS_VERIFY ==0}">
			<a class="btn btn-primary" href="/project/review/ReviewReg.do">글쓰기</a>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
		</c:choose>
	</div>
      <!-- Tab panes -->

    </div>
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
    