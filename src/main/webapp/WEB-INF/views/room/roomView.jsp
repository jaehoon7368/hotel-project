<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@page import="com.sh.airbnb.room.model.dto.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/room/room.css" />
<%
	List<Room> roomList = (List<Room>) request.getAttribute("roomList");
	Hotel hotel = (Hotel) request.getAttribute("hotel");
%>

<div id="hotel-info">
                <h1><%=hotel.getHotelName() %></h1>
                <div id="total-image">
                    <div id="hotel-image">
                        <img src="<%=request.getContextPath()%>/upload/hotel/<%=hotel.getRenamedFilename() %>" alt="">
                    </div>
                    <div id="room-image-box">
                    <%for(Room room : roomList){ %>
                        <div class="room-image">
                            <img src="<%=request.getContextPath()%>/upload/room/<%=room.getRenamedFilename() %>" alt="">
                        </div>
                    <%} %>
                    </div>
                </div>
            </div>

				<% for(Room room : roomList) {%>
            <div id="room-info">
                <div id="main-room-image">
                    <img src="<%=request.getContextPath()%>/upload/room/<%=room.getRenamedFilename() %>" alt="">
                </div>

                <div id="main-room-info">
                    <h2><%=room.getRoomType()%></h2>
                    <div id="price-box">
                        <p id="price-name"><span><%=room.getRoomPrice()%>원</span>가격</p>
                        <hr class="color-gray">
                        <div>
                            <p>객실이용안내</p>
                        </div>
                            <a href="" id="reservation-a">
                                <div id="reservation-btn">
                                    <p>예약</p>
                                </div>
                            </a>
                    </div>
                </div>
            </div>
                <%} %>
                
          <hr>
            <div id="comment-container">
                <h2>리뷰</h2>
                <div id="comment-editor">
                    <form action="<%=request.getContextPath()%>/room/hotelCommentEnroll" method="post" name="boardCommentFrm">
                        <input type="hidden" name="hotelNo" value="<%=hotel.getHotelNo()%>>">
                        <input type="hidden" name="writer">
                        <input type="hidden" name="commentLevel" value="1" />
                        <input type="hidden" name="commentRef" value="0" />
                        <textarea id="comment-content" name="content"></textarea>
                        <button type="submit" id="btn-comment-enroll1">등록</button>
                    </form>
                </div>

                <table id="tbl-comment">
                    <tr class="level1">
                        <td>
                            <sub class="comment-writer">honggd</sub>
                            <sub class="comment-date">23-01-18</sub>
                            <br>
                            <!-- 댓글내용-->
                            가나다라마바사아
                        </td>
                        <td>
                            <button class="btn-reply" value="">답글</button>
                            <button class="btn-delete" value="">삭제</button>
                        </td>
                    </tr>
                    <tr class="level2">
                        <td>
                            <sub class="comment-writer">honggd</sub>
                            <sub class="comment-date">23-01-18</sub>
                            <br>
                            <!-- 대댓글 -->
                            123456789
                        </td>
                        <td>
                            <button class="btn-delete" value="">삭제</button>
                        </td>
                    </tr>
                </table>
                
            </div>

            <div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	3e905506f4a3cc07b319becdea930119&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=hotel.getHotelAddress() %>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%= hotel.getHotelName()%></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>            

<%@ include file="/WEB-INF/views/common/footer.jsp" %>