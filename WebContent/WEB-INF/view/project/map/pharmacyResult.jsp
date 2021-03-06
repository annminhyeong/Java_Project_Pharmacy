<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="poly.dto.PharmacyDTO" %>
<%
	List<PharmacyDTO> pList =(List<PharmacyDTO>)request.getAttribute("pList");
	String sidogugun = (String)request.getAttribute("sidogugun");
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
  <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('/assets/img/pharmacy.jpg');">
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
		<div id="map" style="width:100%;height:600px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71080152aeb4224188d5beebc658529&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71080152aeb4224188d5beebc658529"></script>

<script>

var mapContainer = document.getElementById('map'), // ????????? ????????? div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
        level: 6 // ????????? ?????? ??????
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????



var mapTypeControl = new kakao.maps.MapTypeControl();
//????????? ???????????? ???????????? ???????????? ???????????????
//kakao.maps.ControlPosition??? ???????????? ????????? ????????? ??????????????? TOPRIGHT??? ????????? ?????? ???????????????
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
//?????? ?????? ????????? ????????? ??? ??????  ??? ???????????? ???????????????
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
 



 

// ????????? ????????? ????????? ????????? ????????? ?????? ?????? ??????????????? 
var positions = [
    <%for(PharmacyDTO pDTO : pList){%>
	{
        content: '<div>' +
        '    <div><%=pDTO.getPharmacyName()%>????????????</div>' +
        '    <ul>' +
        '        <li>' +
        '            <span>???</span>' +
        '            <span><%=pDTO.getMonStart()%>~<%=pDTO.getMonEnd()%></span>' +
        '        </li>' +
        '        <li>' +
        '            <span>???</span>' +
        '            <span><%=pDTO.getTueStart()%>~<%=pDTO.getTueEnd()%></span>' +

        '        </li>' +
        '        <li>' +
        '            <span>???</span>' +
        '            <span><%=pDTO.getWedStart()%>~<%=pDTO.getWedEnd()%></span>' +

        '        </li>' +
        '        <li>' +
        '            <span>???</span>' +
        '            <span><%=pDTO.getThuStart()%>~<%=pDTO.getThuEnd()%></span>' +

        '        </li>' +
        '        <li>' +
        '            <span>???</span>' +
        '            <span><%=pDTO.getFriStart()%>~<%=pDTO.getFriEnd()%></span>' +
        '        </li>' +
        '        <li>' +
        '            <span>???</span>' +
        '            <span><%=pDTO.getSatStart()%>~<%=pDTO.getSatEnd()%></span>' +
        '        </li>' +
        '        <li>' +
        '            <span>???</span>' +
        '            <span><%=pDTO.getSunStart()%>~<%=pDTO.getSunEnd()%></span>' +
        '        </li>' +
        '    </ul>' +
        '</div>',
        
        latlng: new kakao.maps.LatLng(<%=pDTO.getLatitude() %>, <%=pDTO.getLongitude() %>)
    },
    <%}%>
    
];
for (var i = 0; i < positions.length; i ++) {
    // ????????? ???????????????
    var marker = new kakao.maps.Marker({
        map: map, // ????????? ????????? ??????
        position: positions[i].latlng // ????????? ??????
    });

    // ????????? ????????? ?????????????????? ??????????????? 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content,// ?????????????????? ????????? ??????
        position:marker.getPosition()  
    });
    
    // ????????? mouseover ???????????? mouseout ???????????? ???????????????
    // ????????? ??????????????? ???????????? ????????? ??????????????? 
    // for????????? ???????????? ????????? ?????? ????????? ????????? ???????????? ???????????? ???????????????
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// ?????????????????? ???????????? ???????????? ????????? ??????????????? 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// ?????????????????? ?????? ???????????? ????????? ??????????????? 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}


</script>
<script type="text/javascript">
var geocoder = new kakao.maps.services.Geocoder();

var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
        // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
        map.setCenter(coords);
    }
};
//'??????????????? ????????? ????????? ????????????10??? 112'
geocoder.addressSearch('<%=sidogugun%>', callback);

</script>

      <!-- Tab panes -->

    </div>
  </div>
  <footer class="footer    ">
    <div class="container">
      <div class="row">
        <div class="credits ml-auto">
          <span class="copyright">
            ??
            <script>
              document.write(new Date().getFullYear());
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