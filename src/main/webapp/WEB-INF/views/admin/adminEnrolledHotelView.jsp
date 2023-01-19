<%@page import="java.util.List"%>
<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<Hotel>hotelList = (List<Hotel>)request.getAttribute("hotelList");

%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.js"></script>

<style>
/* content start*/
#content {
    width: 100%;
    height: 100%;
}

#hotel-info{
    width: 830px;
    height: 450px;
    margin: 30px auto;
}

#total-image{
    display: flex;
    justify-content: space-around;
}

#hotel-image{
    width: 400px;
    height: 400px;
    border-radius: 15px;
    outline: none;
}

#room-image-box{
    width: 410px;
    height: 410px;
}
.room-image{
    display: inline-block;
    margin: 0 0 3px 3px;
    width: 195px;
    height: 195px;
    border-radius: 15px;
    outline: none;
}
</style>
	
	


            
<%@ include file="/WEB-INF/views/common/footer.jsp"%>