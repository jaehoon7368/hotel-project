<%@page import="com.sh.airbnb.room.model.dto.Room"%>
<%@page import="java.util.List"%>
<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Hotel>hotelList = (List<Hotel>)request.getAttribute("hotelList");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
#entireBox{
	display : flex;

}
#typeBox{
	padding-left :200px;
	padding-top :50px;
	padding-bottom :10px;
}

div.adminBox{
	width: 500px;
	
}

#entireBox li{
	padding:  20px;
	padding-left :100px;
	list-style: none;
	}

#entireBox a{
	font-size : 20px;
	text-decoration: none;
	color:black;
	
}


</style>
		<div id = "entireBox"> 
		<div class="adminBox">
		       <ul>
                <li><a href="">개인정보 수정</a></li>
                <li><a href="">작성 리뷰</a></li>
                <li><a href="">예약 내역 확인</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adminhotelenroll">호텔 등록</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adminenrolledhotelview">등록된 호텔 보기</a></li>
            </ul>
         </div>
        <div id="rightBox" class="adminBox" >
         <%
if (hotelList != null) {
	for (Hotel hotel : hotelList) {
%>

	<div class="card" style="width: 45rem;">
  <img src="<%=request.getContextPath() %>/upload/hotel/<%=hotel.getRenamedFilename() %>" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title"></h5>
    <p class="card-text"></p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><%=hotel.getHotelName() %></li>
    <li class="list-group-item"><%=hotel.getHotelNo() %></li>
    <li class="list-group-item"><%=hotel.getHotelAddress() %></li>
    <li class="list-group-item"><%=hotel.getHotelInfo() %></li>
  </ul>
  <div class="card-body text-center">
  <img src="" class="card-img-top"  alt="" />
   <button type="button" class="btn btn-dark" onclick ="popUp()">룸 등록하기</button>
  </div>
</div>
	<%if(hotel.getRooms()!=null){ %>
<div class="row row-cols-1 row-cols-md-2 g-4">
	<% for(Room room : hotel.getRooms()){ %>
  <div class="col">
    <div class="card" >
      <img src="<%=request.getContextPath() %>/upload/room/<%=room.getRenamedFilename() %>" class="card-img-top" alt="...">
      <div class="card-body">
      </div>
    </div>
  </div>
  
  <script>
const popUp = ()=>{
	const popup =  open ('<%=request.getContextPath()%>/admin/adminRoomEnroll?no=<%=hotel.getHotelNo() %>','myPopup','_blank','width=500px,height=200px,left=300px,top=300px')
	
}

</script>
<%
	} 
}
%>
</div>
<%}
 	} else {%>
	 <h2>등록된 호텔이 없습니다.</h2>
<%} %>
            
        </div> <!--  adminBox end -->
        </div>  <!-- entireBox end -->
        



            
<%@ include file="/WEB-INF/views/common/footer.jsp"%>