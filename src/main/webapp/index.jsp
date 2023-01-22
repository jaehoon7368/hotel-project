<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Hotel> hotelList = (List<Hotel>) request.getAttribute("hotelList"); 
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- 최상단 검색 및 필터-->
            <div id="search-box"> 
                <div id="icon-box">
                    <div>
                        <a href="" class="hotel-icon"><i class="fa-solid fa-hotel"></i></a>
                        <p>호텔</p>
                    </div>
                    <div>
                        <a href="" class="hotel-icon"><i class="fa-regular fa-building"></i></a>
                        <p>모텔</p>
                    </div>
                    <div>
                        <a href="" class="hotel-icon"><i class="fa-solid fa-shop"></i></a>
                        <p>펜션</p>
                    </div>
                </div>

                <div id="subsearch-box">
                    <div id="search-main" class="search-main">
                        <form action="">
                            <input type="text" name="searchKeyword" value="" />
                            <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                    </div>
                    <div id="filter-box">
                        <a href=""><i class="fa-solid fa-bars-staggered"></i><span> 필터</span></a>
                    </div>
                </div>
                
            </div> 
            <!--최상단 검색 및 필터 끝-->
            
            <!-- 숙소 목록 -->
            <div id="content-area"></div>
            
<script>
window.addEventListener('load', () => {
	
	$.ajax({
		url:"<%=request.getContextPath()%>/hotel/hotelView",
		dataType : "json",
		success(data){
			console.log(data);
			/*
				<div class="hotel-box">
					<a href="<%= request.getContextPath()%>/hotel/roomView">
                    	<img src="" alt="">
                    	<p class="font-bold" name="hotelName"></p>
                    	<p class="color-gray" name="hotelAddress"></p>
                    	<p class="color-gray" name="hotelPrice">₩ ~ /박</p>
                    <a>
                </div>
			*/
			const contentArea = document.querySelector("#content-area");
			
			data.forEach((hotel) =>{
				console.log(hotel);
				console.log(hotel.renamedFilename);
				console.log(hotel.hotelNo);
				const div = document.createElement("div");
				div.classList.add("hotel-box");
				
				const a = document.createElement("a");
				a.href = `<%= request.getContextPath()%>/room/roomView?hotelNo=\${hotel.hotelNo}`;
				const img = document.createElement("img");
				img.src = `<%= request.getContextPath() %>/upload/hotel/\${hotel.renamedFilename}`;
				
				const name = document.createElement("p");
				name.classList.add("font-bold");
				name.append(hotel.hotelName);
				
				const address = document.createElement("p");
				address.classList.add("color-gray");
				address.append(hotel.hotelAddress);
				
				const price = document.createElement("p");
				price.classList.add("color-gray");
				price.append("₩" +  hotel.price + " ~ / 박");
				
				a.append(img,name,price,address);
				div.append(a);
				contentArea.append(div);
			});
			
		},
		error: console.log
		
	})
});
</script>				
<%@ include file="/WEB-INF/views/common/footer.jsp" %>