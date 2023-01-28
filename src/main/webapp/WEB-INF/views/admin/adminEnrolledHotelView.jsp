<%@page import="com.sh.airbnb.room.model.dto.Room"%>
<%@page import="java.util.List"%>
<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	List<Hotel>hotelList = (List<Hotel>)request.getAttribute("hotelList");
%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminEnrolledHotelView.css" />

<style>
.rightBox span{
background-color: black;
color : white;
border-radius: 95px 95px 95px 95px;
-moz-border-radius: 95px 95px 95px 95px;
-webkit-border-radius: 95px 95px 95px 95px;
border: 0px solid #000000;
font-size: medium;
}

</style>



<div id="entireBox">
	<div class="adminBox">
		<ul>
			<li><a href="">개인정보 수정</a></li>
			<li><a href="">예약 내역 확인</a></li>
			<li><a
				href="<%=request.getContextPath()%>/admin/adminhotelenroll">호텔
					등록</a></li>
			<li><a
				href="<%=request.getContextPath()%>/admin/adminenrolledhotelview?user_id=<%=loginUser.getUserId() %>">등록된
					호텔 보기</a></li>
		</ul>
	</div>
	
	
	<div  id="rightBox"class="adminBox">
		<%
      if (!hotelList.isEmpty()) {
        for (Hotel hotel : hotelList) {
      %>
		<form action="<%=request.getContextPath()%>/admin/adminhotelDelete"
			name="hotelDeleteFrm" method="POST" >
			<br> 
			<div class="rightBox">
				<table id="enrollTb" style="height: 100%; width: 100%;">
					<tr>
						<td><span>호텔 번호  </span><input type="text" name="hotelNo" class= "put" value=" <%=hotel.getHotelNo() %>" /></td>
					</tr>
					<tr>
						<td><span> 호텔 이름  </span> <input type="text" name="hotelName" class= "put" value=" <%=hotel.getHotelName() %>" /></td>
					</tr>
					<tr>
						<td><span> 호텔 주소  </span><input type="text" name ="hotelAddress" class= "put" value=" <%=hotel.getHotelAddress() %>" /></td>
					</tr>
					<tr>
						<td><span> 호텔 정보  </span><input type="text" name="hotelInfo" class= "put" value=" <%=hotel.getHotelInfo() %>" /></td>
					</tr>
				</table>
				<img class="mainImage"
					src="<%=request.getContextPath() %>/upload/hotel/<%=hotel.getRenamedFilename() %>"
					alt="...">
				<li style ="padding :0px;"><button type="submit" class="roombtn" > 호텔 정보 삭제</button></li>
				<br /><hr /><br />
				<li style ="padding :0px;"><button type="button" class="roombtn" onclick="roomEnroll('<%=hotel.getHotelNo()%>')">룸 등록하기</button></li>
				<br />
				<div id="categoryBox" style="width:100%">
				<div id="img-viewer-container">
					<%
					if (!hotel.getRooms().isEmpty()) {
						for (Room room : hotel.getRooms()) {
					%>
					<img id="img-viewer " class="subImage"src="<%=request.getContextPath()%>/upload/room/<%=room.getRenamedFilename()%>"
						style="width: 300px" alt="...">
					<%
					}
					}else{
					%>
	<h2>등록된 룸이없습니다. 등록을 부탁드립니다</h2>
		<% }%>
				</div>
				</div>
				
		</form>
	<div style="height :250px"></div>

<%
}
} else {
%>
	<h3>등록된 호텔이 없습니다. 등록을 부탁드립니다</h3>
<%
 	}
 	%>
	</div>
</div>
<!-- entireBox end -->
<script>
	const roomEnroll = (hotelNo)=>{
  		const popup =  open ('<%=request.getContextPath()%>/admin/adminRoomEnroll?no=' + hotelNo,'myPopup','_blank','width=400px,height=200px,left=300px,top=300px')
	}
	const hotelDelte =()=>{
						
	}

</script>


