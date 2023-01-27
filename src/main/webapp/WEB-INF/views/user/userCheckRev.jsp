<%@page import="com.sh.airbnb.reservation.model.dto.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
	String hotelName = (String) request.getAttribute("hotelName");
	String roomType = (String) request.getAttribute("roomType");
	String checkIn = (String) request.getAttribute("checkIn");
	String checkOut = (String) request.getAttribute("checkOut");
	Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(checkIn);
	Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(checkOut);
	long dateofAccom = (date2.getTime() -date1.getTime()); //날짜 차이 계산 밀리초
	long result = (dateofAccom/(24*60*60)/1000);   // 일수 계산  = 몇박  
	int price = (int) request.getAttribute("price");
	int totalPrice = price* (int)result;	 // 일수 * 가격
	String hotelNo = (String) request.getAttribute("hotelNo");
	String roomNo = (String) request.getAttribute("roomNo");


%>    
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<style>

</style>


    
    <table id="tbl-user">
		<thead>
			<tr>
				<th>숙소이름</th>
				<th>예약자</th>
				<th>객실타입</th>
				<th>기간</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>총 결제금액</th>
			</tr>
		</thead>
		
	</table>

<script>
	


</script>


    
    
    
    
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>