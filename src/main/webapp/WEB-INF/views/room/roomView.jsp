<%@page import="com.sh.airbnb.room.model.dto.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Room> roomList = (List<Room>) request.getAttribute("roomList");
%>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>