<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% 
	List<User> users = (List<User>) request.getAttribute("users");
	List<Hotel>hotelList = (List<Hotel>)request.getAttribute("hotelList");
%>
<body>
	<form action="">
		<table id="tbl-comment">
			<thead>
				<tr>
					<th>이름</th>
					<th>호텔</th>
					<th>작성내용</th>
				</tr>
			</thead>
			<tbody>
	
					<tr>
						<td><%= loginUser.getUserId() %></td>
						<td><%= member.getMemberName() %></td>
						<td><%= member.getGender() %></td>
					</tr>
			</tbody>
		</table>
	</form>




</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>