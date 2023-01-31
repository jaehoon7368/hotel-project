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
@font-face{
	font-family: "dohyun";
	src :url("<%=request.getContextPath()%>/css/font/BMDOHYEON_ttf.ttf");
	
}

.nohotel{
	height:500px;	
    display: flex;
   font-family: "dohyun";
   font-size :25px;
}

</style>



	
	<div  id="rightBox"class="adminBox" style="margin:auto">
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
						<td><span>호텔 번호  </span><input type="text" name="hotelNo" class= "put" value="<%=hotel.getHotelNo() %>" /></td>
					</tr>
					<tr>
						<td><span> 호텔 이름  </span> <input type="text" name="hotelName" class= "put" value="<%=hotel.getHotelName() %>" /></td>
					</tr>
					<tr>
						<td><span> 호텔 주소  </span><input type="text" name ="hotelAddress" class= "put" value="<%=hotel.getHotelAddress() %>" /></td>
					</tr>
					<tr>
						<td><span> 호텔 정보  </span><input type="text" name="hotelInfo" class= "put" value="<%=hotel.getHotelInfo() %>" /></td>
					</tr>
				</table>
				<img class="mainImage"
					src="<%=request.getContextPath() %>/upload/hotel/<%=hotel.getRenamedFilename() %>"
					alt="...">
				<li style ="padding :0px; list-style: none;"><button type="submit" class="roombtn " > 호텔 정보 삭제</button></li>
				<br /><hr /><br />
				<li style ="padding :0px;list-style: none;"><button type="button" class="roombtn enrollbtn" onclick="roomEnroll('<%=hotel.getHotelNo()%>')">룸 등록하기</button></li>
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
	<div class="nohotel"><div style="margin:auto; font-family: "dohyun";">등록된 호텔이 없습니다. 등록을 부탁드립니다</div></div>
	
<%
 	}
 	%>
	
	</div>
zz


<script>
	const roomEnroll = (hotelNo)=>{
  		const popup =  open ('<%=request.getContextPath()%>/admin/adminRoomEnroll?no=' + hotelNo,'myPopup','_blank','width=400px,height=200px,left=300px,top=300px')
	}

</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>