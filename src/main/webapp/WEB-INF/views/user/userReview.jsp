<%@page import="com.sh.airbnb.review.model.dto.Review"%>
<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% 
	User user = (User) request.getAttribute("user");
	Hotel hotel = (Hotel) request.getAttribute("hotel");
	Review review = (Review) request.getAttribute("review");
%>
<body>
	<form name="userReviewFrm" method="post" action="<%= request.getContextPath() %>/user/userReview">
		<table id="tbl-comment">
			<thead>
				<tr>
					<th>호텔</th>
					<th>작성내용</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
	
					<tr>
						<td><%= hotel.getHotelName() %></td>
						<td><%= review.getContent() %></td>
						<td><%= review.getRegDate() %></td>
					</tr>
			</tbody>
		</table>
	</form>




</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>