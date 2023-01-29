<%@page import="com.sh.airbnb.room.model.dto.RoomPrice"%>
<%@page import="com.sh.airbnb.hotel.model.dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Hotel> hotelList = (List<Hotel>) request.getAttribute("hotelList");
	RoomPrice roomPrice = (RoomPrice) request.getAttribute("roomPrice");
 	String searchLocation = (String) request.getAttribute("searchLocation");
	String checkIn = (String) request.getAttribute("checkIn");
	String checkOut = (String) request.getAttribute("checkOut");
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- 최상단 검색 및 필터-->
            <div id="search-box"> 
                <div id="icon-box">
                    <div>
                        <a href="<%=request.getContextPath()%>/selectHotel" class="hotel-icon">
                        <i class="fa-solid fa-hotel"></i>
                        <p>호텔</p>
                        </a>
                    </div>
                    <div>
                        <a href="<%=request.getContextPath()%>/selectMotel" class="hotel-icon">
                        <i class="fa-regular fa-building"></i>
                        <p>모텔</p>
                        </a>
                    </div>
                    <div>
                        <a href="<%=request.getContextPath()%>/selectPension" class="hotel-icon">
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
                                <input type="search" name="searchLocation" id="searchLocation" list="searchLocation-list" 
                                autocomplete="off" placeholder="여행지검색"> 
                                <datalist id="searchLocation-list">
                    			<option value="서울"></option>
                    			<option value="경기"></option>
                    			<option value="부산"></option>
                    			<option value="제주"></option>
               					 </datalist>
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
                        <button id="filter-btn"><i class="fa-solid fa-bars-staggered"></i><span> 필터</span></button>
                    </div>
                    
                    <div class="modal2">
                        <form action="<%=request.getContextPath()%>/filterSearch">
                            <div id="filter-main">
                                <div id="filter-header">
                                    <p class="font-bold">필터</p>
                                </div>
                                <div id="price-box">
                                    <h3>가격범위</h3>
                                    <div id="price-text">
                                        <p>평균 1박 요금은 ₩<%=roomPrice.getAvgPrice()%>입니다.</p>
                                    </div>
                                    <div id="range-box">
                                    <div class="middle">
                                        <div class="multi-range-slider">
                                            <input type="range" id="input-left" min="<%=roomPrice.getMinPrice()%>" max="<%=roomPrice.getMaxPrice() %>" value="<%=roomPrice.getMinPrice() %>" oninput="document.getElementById('value1').value=this.value;"/>
                                            <input type="range" id="input-right" min="<%=roomPrice.getMinPrice()%>" max="<%=roomPrice.getMaxPrice() %>" value="<%=roomPrice.getMaxPrice() %>" oninput="document.getElementById('value2').value=this.value;"/>
                                            <div class="slider">
                                                <div class="track"></div>
                                                <div class="range"></div>
                                                <div class="thumb left"><p>|||</p></div>
                                                <div class="thumb right"><p>|||</p></div>
                                            </div>
                                        </div>
                                        <div id="value-box">
                                            <div>
                                                <div class="val-box">
                                                    <p>최저 요금</p>
                                                    <span>₩ </span><input type="text" id="value1" name="min_price" onchange="minPrice(event)" value="<%=roomPrice.getMinPrice() %>">
                                                </div>
                                            </div>
                                            <h3>-</h3>
                                            <div>
                                                <div class="val-box">
                                                    <p>최고 요금</p>
                                                    <span>₩ </span><input type="text" id="value2"  name="max_price" onchange="maxPrice(event)" value="<%=roomPrice.getMaxPrice() %>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- 가격 범위 end -->

                                <div id="category-box">
                                    <h3>편의시설</h3>
                                    <div id="category">
                                        <div>
                                            <label for="checkbox-1">
                                                <p><i class="fa-solid fa-wind"></i></p>
                                            </label>
                                            <span>에어컨 </span><input type="checkbox" name="checkbox" id="checkbox-1" value="c011">
            
                                            <label for="checkbox-2">
                                                <p><i class="fa-solid fa-wifi"></i></p>
                                            </label>
                                            <span>와이파이 </span><input type="checkbox" name="checkbox" id="checkbox-2" value="c016">
                                            
                                            <label for="checkbox-3">
                                                <p><i class="fa-brands fa-neos"></i></p>
                                            </label>
                                            <span>넷플릭스 </span><input type="checkbox" name="checkbox" id="checkbox-3" value="c01"> 
                                            
                                            <label for="checkbox-4">
                                                <p><i class="fa-solid fa-person-swimming"></i></p>
                                            </label>
                                            <span>수영장 </span><input type="checkbox" name="checkbox" id="checkbox-4" value="c04">
                                        </div>
                                        <div>
                                            <label for="checkbox-5">
                                                <p><i class="fa-solid fa-utensils"></i></p>
                                            </label> 
                                            <span>주방 </span><input type="checkbox" name="checkbox" id="checkbox-5" value="c014">
                                            
                                            <label for="checkbox-6">
                                                <p><i class="fa-solid fa-dog"></i></p>
                                            </label> 
                                            <span>반려견동반 </span><input type="checkbox" name="checkbox" id="checkbox-6" value="c09"> 
                                            
                                            <label for="checkbox-7">
                                                <p><i class="fa-solid fa-square-parking"></i></p>
                                            </label> 
                                            <span>주차장 </span><input type="checkbox" name="checkbox" id="checkbox-7" value="c03"> 
                                                
                                                <label for="checkbox-8">
                                                    <p><i class="fa-solid fa-dumbbell"></i></p>
                                                </label>
                                            <span>헬스장 </span><input type="checkbox" name="checkbox" id="checkbox-8" value="c012">
                                        </div>
    
                                        <div>
                                            <label for="checkbox-9">
                                                <p><i class="fa-solid fa-computer"></i></p>
                                            </label> 
                                            <span>데스크톱 </span><input type="checkbox" name="checkbox" id="checkbox-9" value="c015"> 
                                                
                                            <label for="checkbox-10">
                                                <p><i class="fa-solid fa-shirt"></i></p>
                                            </label>
                                            <span>세탁기 </span><input type="checkbox" name="checkbox" id="checkbox-10" value="c013">
                                        </div>
                                    </div>
                                    <div id="filter-main-btn">
                                        <button type="submit">상세검색</button>
                                    </div>
                                </div>

                            </div>
                    
                        </form>
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
  
  /* filter input값 실시간 range 변경 */
  const minPrice = (e) =>{
      document.querySelector("#input-left").value = Number(e.target.value);
      const event = new Event('input');
      document.querySelector("#input-left").dispatchEvent(event);
  };
  const maxPrice = (e) => {
          document.querySelector("#input-right").value = Number(e.target.value);
          const event = new Event('input');
          document.querySelector("#input-right").dispatchEvent(event);
      };
  /* filter input값 실시간 range 변경 end */
  
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
    
    /*filter modal start*/
        const modal2 = document.querySelector('.modal2');
        const filterBtn = document.querySelector("#filter-btn");
        filterBtn.addEventListener('click', () => {
            modal2.classList.toggle('show');

            if (modal2.classList.contains('show')) {
                body.style.overflow = 'hidden';
            }
        });

        modal2.addEventListener('click', (e) => {
            if (e.target === modal2) {
                modal2.classList.toggle('show');

                if (!modal2.classList.contains('show')) {
                    body.style.overflow = 'auto';
                }
            }
        });
    /*filter modal end*/

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
        /* 양방향 range */
        const inputLeft = document.getElementById("input-left");
            const inputRight = document.getElementById("input-right");

            const thumbLeft = document.querySelector(".slider > .thumb.left");
            const thumbRight = document.querySelector(".slider > .thumb.right");
            const range = document.querySelector(".slider > .range");

            const setLeftValue = () => {
                const _this = inputLeft;
                const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
                // 교차되지 않게, 1을 빼준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해.
                _this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1);
                // input, thumb 같이 움직이도록
                const percent = ((_this.value - min) / (max - min)) * 100;
                thumbLeft.style.left = percent + "%";
                range.style.left = percent + "%";
            };

            const setRightValue = () => {
                const _this = inputRight;
                const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
                // 교차되지 않게, 1을 더해준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해.
                _this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1);
                // input, thumb 같이 움직이도록
                const percent = ((_this.value - min) / (max - min)) * 100;
                thumbRight.style.right = 100 - percent + "%";
                range.style.right = 100 - percent + "%";
            };

            inputLeft.addEventListener("input", setLeftValue);
            inputRight.addEventListener("input", setRightValue);
            /* 양방향 range end */
</script>				
<%@ include file="/WEB-INF/views/common/footer.jsp" %>