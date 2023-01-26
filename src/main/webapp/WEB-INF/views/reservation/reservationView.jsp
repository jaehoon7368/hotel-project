<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hotelName = (String) request.getAttribute("hotelName");
	String roomType = (String) request.getAttribute("roomType");
	String checkIn = (String) request.getAttribute("checkIn");
	String checkOut = (String) request.getAttribute("checkOut");
	int price = (int) request.getAttribute("price");
	String hotelNo = (String) request.getAttribute("hotelNo");
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
	font-size: 12px;
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

        <div id="leftBox">
            <table class="tb1">
                <tr>
                    <th><h1>예약하기</h1></th>
                </tr>

                <tbody>
                    <tr >
                        <th><pre> </pre>
                            예약자정보</th>
                    </tr>
                    <tr>
                        <th class="name"> 예약자이름 <br>
                            <input class= "put" type="text" name="name" placeholder="체크인시 필요한 정보">
                        </th>
                        </tr>
                    </tr>
                    <tr>
                        <th class="name"> 휴대폰번호
                            <p><input class="put" type="text" name="phone" placeholder="체크인시 필요한 정보입니다."></p>
                            <pre class="phone">  휴대폰번호를 확인해주세요.</pre> 
                        </th>
                    </tr>
                    <tr>
                        <th> 
                            결제수단 선택
                        </th>
                    </tr>
                    <tr>
                        <th><pre> 옵션 카카오 페이 , 계좌이체</pre></th>
                    </tr>
                </tbody>


            </table>
        </div><!-- leftbox -->
        
        <div id="rightBox">
            <table id="tb2">
                <tr>
                    <td class="opa">숙소이름</td>
                </tr>
                <tr>
                    <td><%=hotelName %></td>
                </tr>
                <tr>
                    <td class="opa">객실타입/기간</td>
                </tr>
                <tr>
                    <td><%=roomType %></td>
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
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td><hr /></td>
                </tr>
                <tr>
                    <td style="font-weight: 800;">총결제 금액(VAT포함)</td>
                </tr>
                <tr>
                    <td style=" font-size : 30px;font-weight: 800; color:red"><%=price%>원</td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="re">해당객실가는 세근 봉사료가 포함된 금앱입니다.</td>
                </tr>
                <tr>
                    <td class="re">결제완료후 예약자 이름으로 바로 체크인 하시면 됩니다.</td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: center"><button  class="reservationbtn">결제하기</button></td>
                </tr>


            </table>
        </div> <!-- rightbox -->
    </div>    <!--entirebox  -->



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>