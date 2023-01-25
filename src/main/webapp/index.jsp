<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Hotel> hotelList = (List<Hotel>) request.getAttribute("hotelList");
 	String searchLocation = (String) request.getAttribute("searchLocation");
	String checkIn = (String) request.getAttribute("checkIn");
	String checkOut = (String) request.getAttribute("checkOut");
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
                        <form action="">
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
                                <button type="submit" onclick="checkForm(this)"><i class="fa-solid fa-magnifying-glass"></i><span> 검색</span></button>
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
            <%for(Hotel hotel : hotelList) {%>
            	<div class="hotel-box">
					<a href="<%= request.getContextPath()%>/room/roomView?hotelNo=<%=hotel.getHotelNo()%>&checkIn=<%=checkIn%>&checkOut=<%=checkOut%>">
                    	<img src="<%=request.getContextPath()%>/upload/hotel/<%=hotel.getRenamedFilename() %>" alt="">
                    	<p class="font-bold" name="hotelName"><%=hotel.getHotelName()%></p>
                    	<p class="color-gray" name="hotelAddress"><%=hotel.getHotelAddress() %></p>
                    	<p class="color-gray" name="hotelPrice">₩<%=hotel.getPrice() %> ~ / 박</p>
                    <a>
                </div>
            <%} %>
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


</script>				
<%@ include file="/WEB-INF/views/common/footer.jsp" %>