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
<!--f71080152aeb4224188d5beebc658529-->
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <title>파싱 테스트</title>
    <% for(PharmacyDTO pDTO : pList){ %>
    	<p><%=pDTO.getPharmacyName() %></p>
    	<p><%=pDTO.getAddr() %></p>
    	<p><%=pDTO.getLongitude()%></p>
    	<p><%=pDTO.getLatitude() %></p>
    <%} %>
</head>
<body>

<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71080152aeb4224188d5beebc658529&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71080152aeb4224188d5beebc658529"></script>

<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



var mapTypeControl = new kakao.maps.MapTypeControl();
//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
 



 

// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    <%for(PharmacyDTO pDTO : pList){%>
	{
        content: '<div>' +
        '    <div><%=pDTO.getPharmacyName()%>운영시간</div>' +
        '    <ul>' +
        '        <li>' +
        '            <span>월</span>' +
        '            <span><%=pDTO.getMonStart()%>~<%=pDTO.getMonEnd()%></span>' +
        '        </li>' +
        '        <li>' +
        '            <span>화</span>' +
        '            <span><%=pDTO.getTueStart()%>~<%=pDTO.getTueEnd()%></span>' +

        '        </li>' +
        '        <li>' +
        '            <span>수</span>' +
        '            <span><%=pDTO.getWedStart()%>~<%=pDTO.getWedEnd()%></span>' +

        '        </li>' +
        '        <li>' +
        '            <span>목</span>' +
        '            <span><%=pDTO.getThuStart()%>~<%=pDTO.getThuEnd()%></span>' +

        '        </li>' +
        '        <li>' +
        '            <span>금</span>' +
        '            <span><%=pDTO.getFriStart()%>~<%=pDTO.getFriEnd()%></span>' +
        '        </li>' +
        '        <li>' +
        '            <span>토</span>' +
        '            <span><%=pDTO.getSatStart()%>~<%=pDTO.getSatEnd()%></span>' +
        '        </li>' +
        '        <li>' +
        '            <span>일</span>' +
        '            <span><%=pDTO.getSunStart()%>~<%=pDTO.getSunEnd()%></span>' +
        '        </li>' +
        '    </ul>' +
        '</div>',
        
        latlng: new kakao.maps.LatLng(<%=pDTO.getLatitude() %>, <%=pDTO.getLongitude() %>)
    },
    <%}%>
    
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content,// 인포윈도우에 표시할 내용
        position:marker.getPosition()  
    });
    
    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
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
		
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    }
};
//'서울특별시 강서구 화곡동 우장산로10길 112'
geocoder.addressSearch('<%=sidogugun%>', callback);

</script>
</body>
</html>