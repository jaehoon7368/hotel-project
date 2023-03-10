<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%

	String hotelName = (String) request.getAttribute("hotelName");
	String roomType = (String) request.getAttribute("roomType");
	String checkIn = (String) request.getAttribute("checkIn");
	String checkOut = (String) request.getAttribute("checkOut");
	
	Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(checkIn);
	Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(checkOut);
	
	long result = (date2.getTime() -date1.getTime()); //날짜 차이 계산 밀리초
	long reservationDay = (result/(24*60*60)/1000);   // 일수 계산  = 몇박  
	int reDay = (int)reservationDay;  // 일수 int 변환
	
	int price = (int) request.getAttribute("price");
	int totalPrice = price* (int)reservationDay;	 // 일수 * 가격
	
	String hotelNo = (String) request.getAttribute("hotelNo");
	String roomNo = (String) request.getAttribute("roomNo");
	String userId = "";
	userId = loginUser.getUserId()  != null ?  loginUser.getUserId() : "비회원";
	
	DecimalFormat decFormat = new DecimalFormat("###,###");


%>    
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/reservation/reservationView.css" />


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
                    <tr> <form action="<%=request.getContextPath() %>/reservation/reservationView" method ="POST" >
                        <th class="name"> 예약자이름 <br>
                            <input class= "put" type="text" name="reName" placeholder="체크인시 필요한 정보" required>
                        </th>
                        </tr>
                    </tr>
                    <tr>
                        <th class="name"> 휴대폰번호
                            <p><input class="put" type="text" name="phone" placeholder="체크인시 필요한 정보입니다." required></p>
                            <pre class="phone">  휴대폰번호를 확인해주세요.</pre> 
                        </th>
                    </tr>
                    <tr>
                        <th> 	
   	                	<select class="put"  name= "people" id="people"  required> 
						<option value="" selected>인원수를 체크해주세요</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>
						<option value="6">6명</option>
						</select>
                        
                        </th>
                    </tr>
                    <tr>
                        <th><pre> </pre></th>
                    </tr>
                </tbody>


            </table>
        </div><!-- leftbox -->
        
        <input type="hidden" value= "<%=roomType%>" name="roomType"/>
        <input type="hidden" value= "<%=roomNo%>" name="roomNo"/>
        <input type="hidden" value= "<%=hotelNo%>" name ="hotelNo"/>
        <input type="hidden" value= "<%=checkIn%>" name= "checkIn"/>
        <input type="hidden" value= "<%=checkOut%>" name= "checkOut"/>
        <input type="hidden" value= "<%=userId%>" name= "userId"/>
        <input type="hidden" value= "<%=totalPrice%>" name= "totalPrice"/>
        <input type="hidden" value= "<%=reDay%>" name= "reDay"/>
        
        
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
                    <td><%=roomType %> / <%=reservationDay %>박 </td>
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
                    <td style=" font-size : 30px;font-weight: 800; color:red"><%=decFormat.format(totalPrice)%>원</td>
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
                    <td class="re">해당객실가는 세금 봉사료가 포함된 금앱입니다.</td>
                </tr>
                <tr>
                    <td class="re">예약완료후 예약자 이름으로 바로 체크인 하시면 됩니다.</td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: center"><button id="rebtn" class="reservationbtn">예약하기</button></td>
                </tr>
				</form>

            </table>
        </div> <!-- rightbox -->
    </div>    <!--entirebox  -->

<script>

document.querySelector("#rebtn").addEventListener('click',(e)=>{
	const bool =  confirm("정말 예약하시겠습니까? 취소하시면 첫화면으로 돌아갑니다.");
	
	if(bool){
		e.target.submit();
	}else{
		e.target.location.href="<%=request.getContextPath()%>/" ;
	}
	
	
})


</script>


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>