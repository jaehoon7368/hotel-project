<%@page import="java.text.DecimalFormat"%>
<%@page import="com.sh.airbnb.review.model.dto.Review"%>
<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@page import="com.sh.airbnb.room.model.dto.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/room/room.css" />
<%
	List<Room> roomList = (List<Room>) request.getAttribute("roomList");
	List<Room> roomImage = (List<Room>) request.getAttribute("roomImage");
	Hotel hotel = (Hotel) request.getAttribute("hotel");
	List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
	String checkIn = (String) request.getAttribute("checkIn");
	String checkOut = (String) request.getAttribute("checkOut");
	
	DecimalFormat decFormat = new DecimalFormat("###,###");
%>

<div id="hotel-info">
                <h1><%=hotel.getHotelName() %></h1>
                <p id="hotel-address"><%=hotel.getHotelAddress() %></p>
                <div id="total-image">
                    <div id="hotel-image">
                        <img src="<%=request.getContextPath()%>/upload/hotel/<%=hotel.getRenamedFilename() %>" alt="">
                    </div>
                    <div id="room-image-box">
                    <%for(Room room : roomImage){ %>
                        <div class="room-image">
                            <img src="<%=request.getContextPath()%>/upload/room/<%=room.getRenamedFilename() %>" alt="">
                        </div>
                    <%} %>
                    </div>
                </div>
            </div> <!-- 호텔 이미지 end -->
            
           <hr>
          <form action="<%=request.getContextPath()%>/room/searchRoom" name="dateSearchFrm">
            <div id="check-box">
                <div class="checkMain-box">
                    <h3>체크인</h3>
                    <input type="search" class="datepicker" id="checkIn" name="checkIn" value="<%=checkIn.equals("null") ?"" : checkIn %>" placeholder="   날짜 추가">
                </div>
                <div class="checkMain-box">
                    <h3>체크아웃</h3>
                    <input type="search" class="datepicker" id="checkOut" name="checkOut" value="<%=checkOut.equals("null") ?"" : checkOut %>" placeholder="   날짜 추가">
                </div>
                <div id="search-detail-btn">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i><span> 검색</span></button>
                </div>
                <div>
                	<input type="hidden" name="hotelNo" value="<%=hotel.getHotelNo() %>" />
                </div>
            </div>
            </form>

				<% for(Room room : roomList) {%>
            <div id="room-info">
                <div id="main-room-image">
                    <img src="<%=request.getContextPath()%>/upload/room/<%=room.getRenamedFilename() %>" alt="">
                </div>

                <div id="main-room-info">
                    <h2><%=room.getRoomType()%></h2>
                    <div id="price-box2">
                        <p id="price-name"><span><%=decFormat.format(room.getRoomPrice())%>원</span>가격</p>
                        <br />
                        <hr class="color-gray">
              			<br />
                        <div id="reservation-btn">
                            <button type="submit" onclick="reservationBtn('<%=hotel.getHotelName() %>','<%=room.getRoomType() %>','<%=checkIn%>','<%=checkOut%>','<%=room.getRoomPrice()%>','<%=hotel.getHotelNo()%>','<%=room.getRoomNo()%>');">예약</button>
                        </div>
                    </div>
                </div>
            </div>
                <%} %>
                
          <hr>
            <div id="comment-container">
                <h2>리뷰</h2>
                <div id="comment-editor">
                    <form action="<%=request.getContextPath()%>/review/hotelReviewCommentEnroll" method="post" name="hotelReviewCommentFrm">
                        <input type="hidden" name="hotelNo" value="<%=hotel.getHotelNo()%>">
                        <input type="hidden" name="writer" value="<%= loginUser != null ? loginUser.getUserId() : ""%>">
                        <input type="hidden" name="commentLevel" value="1" />
                        <input type="hidden" name="commentRef" value="0" />
                        <textarea class="comment-content" name="content"></textarea>
                        <button type="submit" class="btn-comment-enroll1">등록</button>
                    </form>
                </div>

			<%
				if(!reviewList.isEmpty()){
			%>
            <%
            	for(Review review : reviewList){
            		boolean canRemove = loginUser != null && (loginUser.getUserId().equals(review.getUserId()));
            		if(review.getCommentLevel() == 1){
            	
            %>
         
                <table id="tbl-comment">
            
                    <tr class="level1">
                        <td>
                            <sub class="comment-writer"><%=review.getUserId() %></sub>
                            <sub class="comment-date"><%=review.getRegDate() %></sub>
                            <br>
                            <!-- 댓글내용-->
                           	<%=review.getContent() %>
                        </td>
                        <td>
                            <button class="btn-reply" value="<%=review.getCommentNo()%>">답글</button>
                            <%if(canRemove) {%>
                            <button class="btn-delete" value="<%=review.getCommentNo()%>">삭제</button>
                            <%} %>
                        </td>
                    </tr>
                <%
            		} else {
                %>
                    <tr class="level2">
                        <td>
                            <sub class="comment-writer"><%=review.getUserId() %></sub>
                            <sub class="comment-date"><%=review.getRegDate() %></sub>
                            <br>
                            <!-- 대댓글 -->
                            <%=review.getContent() %>
                        </td>
                        <td>
                            <%if(canRemove) {%>
                            <button class="btn-delete" value="<%=review.getCommentNo()%>">삭제</button>
                            <%} %>
                        </td>
                    </tr>
                <%
            		}// if..else
            	}//for
                %>
                </table>
                <%
					}
                %>
          
            </div>

            <div id="map"></div>

<form 
	action="<%= request.getContextPath() %>/review/HotelReviewCommentDelete" 
	name="hotelReviewCommentDelFrm"
	method="POST">
	<input type="hidden" name="commentNo" />
	<input type="hidden" name="hotelNo" value="<%= hotel.getHotelNo() %>"/>
</form>
<script>
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

$(function () {
    $('.datepicker').datepicker();
});
$(function () {
    $('.datepicker').datepicker();
});
/* 현재 날짜부터 선택 가능 */
$('.datepicker').datepicker({
	  dateFormat: 'yy-mm-dd',
	  minDate: 0
	});
/* 현재 날짜부터 선택 가능  end */

/* 체크아웃 날짜가 체크인 날짜 이전 선택 불가 */
$('#checkIn').datepicker();
$('#checkIn').datepicker("option", "maxDate", $("#checkOut").val());
$('#checkIn').datepicker("option", "onClose", function ( selectedDate ) {
$("#checkOut").datepicker( "option", "minDate", selectedDate );
});

$("#checkOut").datepicker();
$("#checkOut").datepicker("option", "minDate", $('#checkIn').val());
$("#checkOut").datepicker("option", "onClose", function ( selectedDate ) {
$('#checkIn').datepicker( "option", "maxDate", selectedDate );
});
/* 체크아웃 날짜가 체크인 날짜 이전 선택 불가 end */
</script>
  <script>
  
  const reservationBtn = (hotelName,roomType,checkIn,checkOut,price,hotelNo,roomNo) =>{ 
	  
	if(checkIn === 'null' || checkOut==='null'){
		alert("체크인아웃 날짜를 선택 후 검색해주세요.");
		 return false;
	}
	  <% if(loginUser == null){ %>
		loginAlert();
	<% } else {%>
		location.href ="<%=request.getContextPath()%>/reservation/reservationView?hotelName=" + hotelName + "&roomType=" + roomType + "&checkIn=" + checkIn + "&checkOut=" +checkOut + "&price=" +price +"&hotelNo=" + hotelNo + "&roomNo=" +roomNo;  
	
	<% }%>
	  
  };
 
const loginAlert = () => {
		alert("로그인 후 이용할 수 있습니다.");
		location.href = "<%=request.getContextPath()%>/user/userLogin";
};
const check = () =>{
	alert("체크인아웃 날짜를 선택해주세요.");
	return false;
};



// textarea
document.hotelReviewCommentFrm.content.addEventListener('focus', (e) => {
	<% if(loginUser == null){ %>
		loginAlert();
	<% } %>
});

  
document.querySelectorAll(".btn-delete").forEach((button) => {
	button.onclick = (e) => {
		if(confirm("해당 댓글을 삭제하시겠습니까?")){
			const frm = document.hotelReviewCommentDelFrm;
			frm.commentNo.value = e.target.value;
			frm.submit();
		}
	}; 
});	


document.querySelectorAll(".btn-reply").forEach((button) => {
	button.onclick = (e) => {
		console.log(e.target.value);
		
		<% if(loginUser == null){ %>
			loginAlert();
		<% } else { %>
			const tr = `
			<tr>
				<td colspan="2" style="text-align:left">
					<form action="<%=request.getContextPath()%>/review/hotelReviewCommentEnroll" method="post" name="hotelReviewCommentFrm">
                		<input type="hidden" name="hotelNo" value="<%=hotel.getHotelNo()%>">
                		<input type="hidden" name="writer" value="<%= loginUser != null ? loginUser.getUserId() : ""%>">
                		<input type="hidden" name="commentLevel" value="2" />
		                <input type="hidden" name="commentRef" value="\${e.target.value}" />    
						<textarea class="comment-content" id="content2" name="content" cols="70"></textarea>
		                <button type="submit" class="btn-comment-enroll1">등록</button>
		            </form>
		      	</td>
		    </tr>
			`;
			
			const target = e.target.parentElement.parentElement; // tr
			console.log(target);
			target.insertAdjacentHTML('afterend', tr);
			
			button.onclick = null; // 이벤트핸들러 제거
		
		<% } %>
	};
});

/**
 * 이벤트버블링을 통해 부모요소에서 이벤트 핸들링
 */
document.body.addEventListener('submit', (e) => {
	console.log(e.target);
	
	if(e.target.name === 'hotelReviewCommentFrm'){
		
		<% if(loginUser == null){ %>
			loginAlert();
			e.preventDefault();
			return; // 조기리턴
		<% } %>
				
		// 유효성검사
		const content = e.target.content;
		if(!/^(.|\n)+$/.test(content.value)){
			e.preventDefault();
			alert('내용을 작성해주세요');
			content.focus();
		}
	}
	
});


</script>


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
            content: '<div style="width:190px;text-align:center;padding:3px 0;"><%= hotel.getHotelName()%></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>            

<%@ include file="/WEB-INF/views/common/footer.jsp" %>