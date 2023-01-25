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
                        <a href="" class="hotel-icon">
                        <i class="fa-solid fa-hotel"></i>
                        <p>호텔</p>
                        </a>
                    </div>
                    <div>
                        <a href="" class="hotel-icon">
                        <i class="fa-regular fa-building"></i>
                        <p>모텔</p>
                        </a>
                    </div>
                    <div>
                        <a href="" class="hotel-icon">
                        <i class="fa-solid fa-shop"></i>
                        <p>펜션</p>
                        </a>
                    </div>
                </div>
                <div id="subsearch-box">
                    
                    <!-- 버튼 클릭 전 -->
                    
                    <div id="search-main" class="search-main">
                        <form action="" name="searchFrm">
                            <button type="button" id="search-btn">
                                <div id="where-box">
                                    <p>어디든지</p>
                                </div>
                                <div>
                                    <span id="search-btn-span">|</span>
                                </div>
                                <div id="when-box">
                                    <p>언제든</p>
                                </div>
                                <p id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></p>
                            </button>
                        </form>
                    </div>
                    <!-- 버튼 클릭 전 end -->
                    
                    <!--  버튼 클릭 후 modal -->
                    <div class="modal">
                        <form action="<%=request.getContextPath()%>/hotel/searchHotel">
                        <div id="search-detail">
                            <div id="search-location">
                                <p>여행지</p>
                                <input type="search" name="searchLocation" id="searchLocation" placeholder="여행지검색"> 
                            </div>
                            <div class="checkInOut-box">
                                <p>체크인</p>
                                <input type="search" class="datepicker"  id="checkIn" name="checkIn" placeholder="날짜추가">
                            </div>
                            <div class="checkInOut-box">
                                <p>체크아웃</p>
                                <input type="search" class="datepicker" id="checkOut" name="checkOut" placeholder="날짜추가">
                            </div>
                            <div id="search-detail-btn">
                                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i><span> 검색</span></button>
                            </div>
                        </div>
                    </form>
                    </div> <!-- modal end-->
                    
                    <div id="filter-box">
                        <a href=""><i class="fa-solid fa-bars-staggered"></i><span> 필터</span></a>
                    </div>
                </div>
                
            </div> 
            <!--최상단 검색 및 필터 끝-->
            
            <!-- 숙소 목록 -->
            <div id="content-area">
            	
            </div>
  <script>
    /* search-modal */
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const searchBtn = document.querySelector("#search-btn");
    
    searchBtn.addEventListener('click',()=>{
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
        }
    });

    modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                modal.classList.toggle('show');

                if (!modal.classList.contains('show')) {
                    body.style.overflow = 'auto';
                }
            }
    });
    /* search-modal end*/

    /* ckeckInOut 캘린더 한글 */
        $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd',
                prevText: '이전 달',
                nextText: '다음 달',
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                dayNames: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                showMonthAfterYear: true,
                yearSuffix: '년'
            });

            $(function () {
                $('.datepicker').datepicker();
            });
        $(function () {
            $('.datepicker').datepicker();
        });
        /* ckeckInOut 캘린더 한글 end */
      
    </script>     
<script>

window.addEventListener('load', () => {
	hotelTotalView();	
});

/* 비동기 호텔 정보 불러오기 */
const hotelTotalView = () =>{
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
				name.classList.add("font-bold","text-dark","font-18");
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
		
	});
}

/* 비동기 호텔 정보 불러오기 end */

</script>				
<%@ include file="/WEB-INF/views/common/footer.jsp" %>