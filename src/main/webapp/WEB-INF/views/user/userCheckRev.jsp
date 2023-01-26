<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

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
#entireBox {
	width: 100%;
	height: 800px;
	display: flex;
}

#leftBox {
	margin-left :150px;
	width: 50%;
	height: 800px;
}

#rightBox {
	width: 500px;
	height: 800px;
}

.tb1 {
	padding-left: 50px;
	text-align: left;
}

.tb1 tr {
	height: 100px;
}

.phone {
	font-size: 13px;
	color: rgba(255, 0, 0, 0.564);
}

.put {
	border: 1px solid rgba(128, 128, 128, 0.588);
	border-radius: 5px;
	width: 500px;
	height: 33px;
}

.name {
	color: rgba(128, 128, 128, 0.612);
}

#rightBox {
	padding-top: 5%;
	background-color: #fafafa;
	height: 683px;
	width: 296px;
}

#tb2 {
	padding-left: 20px;
	height: 100%;
	width: 100%;
}

.reservationbtn {
	width: 100px;
	height: 40px;
	background-color: red;
	padding: 5px 0;
	border-radius: 15px;
	outline: none;
	font-size: 15px;
	text-align: center;
	color: white;
	border: none;
}
.opa{
 	color : #8080808c;
	font-size  :14px;
	font : bold;
 
}
.re{
	font-size:13px;
	color: gray;

}
</style>


<div id="entireBox">
        <div id="rightBox">
        <form action="<%=request.getContextPath() %>/user/userCheckRev" method ="POST">
            <table id="tb2">
                <tr>
                    <td class="opa">숙소이름</td>
                </tr>
                <tr>
                    <td><%=hotelName %></td>
                </tr>
                <tr>
                	<td class="opa"> 예약자 </td>
                </tr>
                <tr>
                	<td><%=loginUser.getUserName() %></td>
                </tr>
                <tr>
                    <td class="opa">객실타입/기간</td>
                </tr>
                <tr>
                    <td><%=roomType %> / <%=result %>박 </td>
                </tr>
                <tr>
                    <td class="opa">체크인</td>
                </tr>
                <tr>
                    <td><%=checkIn %> 15:00</td>
                </tr>
                <tr>
                    <td class="opa">체크아웃</td>
                </tr>
                <tr>
                    <td><%=checkOut %> 11:00</td>
                </tr>
                <tr>
                    <td style="font-weight: 800;">총결제 금액(VAT포함)</td>
                </tr>
                <tr>
                    <td style=" font-size : 30px;font-weight: 800; color:red"><%=totalPrice%>원</td>
                </tr>
          
                <tr>
                    <td style="text-align: center"><button class="cancelbtn" onclick="cancelRev();">취소하기</button></td>
                </tr>
				</form>

            </table>
        </div> <!-- rightbox -->
    </div>    <!--entirebox  -->

<script>
	


</script>


    
    
    
    
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>