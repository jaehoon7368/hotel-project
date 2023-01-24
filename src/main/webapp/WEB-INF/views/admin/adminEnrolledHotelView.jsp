<%@page import="com.sh.airbnb.room.model.dto.Room"%>
<%@page import="java.util.List"%>
<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	List<Hotel>hotelList = (List<Hotel>)request.getAttribute("hotelList");
%><link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminEnrollView.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<style>
.mainImage {
	padding : 40px;
	width: 90%;
}
#categoryBox{
	display: flex;
}
.roombtn{
    width: 100px;
    height: 40px;
    background-color: black;
    padding: 5px 0;
    border-radius: 15px;
    outline: none;
    font-size: 15px;
    text-align: center;
    color: white;
	border : none;
}




</style>


<div id="entireBox">
	<div class="adminBox">
		<ul>
			<li><a href="">개인정보 수정</a></li>
			<li><a href="">작성 리뷰</a></li>
			<li><a href="">예약 내역 확인</a></li>
			<li><a
				href="<%=request.getContextPath()%>/admin/adminhotelenroll">호텔
					등록</a></li>
			<li><a
				href="<%=request.getContextPath()%>/admin/adminenrolledhotelview?user_id=<%=loginUser.getUserId() %>">등록된
					호텔 보기</a></li>
		</ul>
	</div>
	<div id="content" class="adminBox">
		<%
      if (hotelList != null) {
        for (Hotel hotel : hotelList) {
      %>
		<form action="<%=request.getContextPath()%>/admin/adminhotelenroll"
			name="hotelEnrollFrm" method="POST" enctype="multipart/form-data">
			<br> <input type="hidden" name="userId"
				value="<%=loginUser.getUserId()%>" />
			<div class="entireBox">
				<table id="enrollTb" style="height: 100%; width: 100%;">
					<tr>
						<td><span>호텔 번호 : </span><%=hotel.getHotelNo() %></td>
					</tr>
					<tr>
						<td><span> 호텔 이름 : </span> <%=hotel.getHotelName() %></td>
					</tr>
					<tr>

						<td><span>호텔 주소 : </span><%=hotel.getHotelAddress() %>
						</td>
					</tr>
					<tr>
						<td><span>호텔 정보 : </span><%=hotel.getHotelInfo() %></td>
					</tr>
				</table>
				<img class="mainImage"
					src="<%=request.getContextPath() %>/upload/hotel/<%=hotel.getRenamedFilename() %>"
					alt="...">
				<li style ="padding :0px;"><button type="button" class="roombtn" onclick="popUp()">룸
						등록하기</button></li>
				<div class="">
				<script>
                  const popUp = ()=>{
                    const popup =  open ('<%=request.getContextPath()%>/admin/adminRoomEnroll?no=<%=hotel.getHotelNo()%>','myPopup','_blank','width=400px,height=200px,left=300px,top=300px')
                  }
                  </script>


				</div>
				<br />
				<div id="categoryBox" style="width:100%">
				<div id="img-viewer-container">
									<%
					if (hotel.getRooms() != null) {
						for (Room room : hotel.getRooms()) {
					%>
					<img id="img-viewer " class="subImage"src="<%=request.getContextPath()%>/upload/room/<%=room.getRenamedFilename()%>"
						style="width: 200px" alt="...">
								<%
		}
		}else{
		%>
		<div class="noEnroll">
	<h2>등록된 룸이없습니다. 등록을 부탁드립니다</h2>
	</div>
		
		
		<% }%>
				</div>
				</div>
				
		</form>

	</div>

<%
}
} else {
%>
<div class="noEnroll">
	<h2>등록된 호텔이 없습니다. 등록을 부탁드립니다</h2>
</div>

<%
 	}
 	%>
</div>
<!-- entireBox end -->



<%@ include file="/WEB-INF/views/common/footer.jsp"%>