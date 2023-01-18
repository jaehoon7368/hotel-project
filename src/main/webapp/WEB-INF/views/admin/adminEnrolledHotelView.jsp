<%@page import="java.util.List"%>
<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Hotel>hotelList = (List<Hotel>)request.getAttribute("hotelList")  ;
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminEnrollView.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<style>
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
table {
    border: 1px #a39485 solid;
    font-size: .9em;
     box-shadow: 0 2px 5px rgba(0,0,0,.25);
     width: 100%;
    border-collapse: collapse;
    border-radius: 5px;
    overflow: hidden;
    border-right: none;
    border-bottom: none;
    height: 100px;
}
th{
    border :1px solid gray;
    border-left: none;
    border-right: none;;
    border-bottom: none;
}
#hotelimage{
	width : 100px;
}
</style>
        
        <section id="content" >
          <h1>등록된 호텔 보기</h1>
		
		<div id="container">
                
        <table>
            <thead>
            <tr>
                <th style="border-bottom: 1px solid white; font-size: 150%;" colspan="8">등록된 호텔목록</th>
            </tr>
            <tr>
                <th style="height:20px;">No</th>   
                <th>호텔이름</th>
                <th>호텔주소</th>
                <th>호텔타입</th>
                <th>호텔사진</th>
                <th>호텔정보</th>
            </tr>
        </thead>
        <tbody id="addTbody">
        <%for(Hotel hotel :hotelList) {%>
        <tr>
			<th><%=hotel.getHotelNo()%></th>
			<th><%=hotel.getHotelName()%></th>
			<th><%=hotel.getHotelAddress()%></th>
			<th><%=hotel.getHotelType() %></th>
			<th><img id ="hotelimage"src="<%=request.getContextPath()%>/upload/hotel/<%=hotel.getRenamedFilename()%>"  alt="" /></th>
			<th><%=hotel.getHotelInfo()%></th>
        	<th><button onclick ="location.href = '<%= request.getContextPath() %>/admin/adminRoomUpdate?no=<%=hotel.getHotelNo() %>'">
        	호텔 정보 변경 </button></th>
        </tr>
        <%} %>
        </tbody>
        </table>
		</div>		
          
        </section>
        <aside >
            <ul>
                <li><a href="">개인정보 수정</a></li>
                <li><a href="">작성 리뷰</a></li>
                <li><a href="">예약 내역 확인</a></li>
                <li><a href="">호텔 등록</a></li>
                <li><a href="">등록된 호텔 보기</a></li>
            </ul>
        </aside>

    </div>

<script>
	const <
				


	
	
</script>
		
	




<%@ include file="/WEB-INF/views/common/footer.jsp"%>