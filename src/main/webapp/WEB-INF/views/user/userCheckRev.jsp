<%@page import="com.sh.airbnb.reservation.model.dto.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/user/userCheckRev.css" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%

	List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");

%>    
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<content>

    <div class="sidebar">
        <nav class="userView-nav">
          <ul>
            <li class="active"><a href="<%= request.getContextPath() %>/user/userView">개인정보수정</a></li>
            <hr>
            <li><a href="<%= request.getContextPath()%>/user/userCheckRev?user_id=<%=loginUser.getUserId()%>">예약내역확인</a></li>
            <hr>
            <li><a href="<%=request.getContextPath()%>/admin/adminhotelenroll">숙소등록하기</a></li>
            <hr>
            <li><a href="<%=request.getContextPath()%>/admin/adminenrolledhotelview?user_id=<%=loginUser.getUserId() %>">등록숙소확인</a></li>
            <hr>
            <li><a href="<%= request.getContextPath()%>/user/userList">회원관리</a></li>
            <hr>
          </ul>
        </nav>
     </div>
 </content>
    	<!--  호텔이름 /  룸타입 / 박 / 체크인 체크아웃 /예약번호/ 예약자 이름 / 총가격 /  -->
    	<div class="wrapper">
    	<div style ="margin-top :13px"><h2>예약내역</h2></div>
       <% if(reservations.isEmpty()){ %>
			<tr>
				<td colspan="10"><br /><br /><br />조회된 예약내역이 없습니다.</td>
			</tr>
		<% 
		   } else { 
			  for(Reservation reservation : reservations){
		%>
	
    <div class="reBox">
        <table class="reTable">
            <tr style="width:70px ;">
                <td class="name" colspan="2"><%=reservation.getHotelName() %></td>
            </tr> 
            <tr>
                <td class="name"colspan="2"><%= reservation.getRoomType() %> / <%= reservation.getReDay() %></td>
            </tr> 
            <tr>
                <td class="td1">체크인</td>
                <td class="td2"><%= reservation.getStartDate() %></td>
            </tr>
            <tr>
                <td class="td1">체크아웃</td>
                <td class="td2" ><%= reservation.getEndDate() %></td>
            </tr>
            <tr>
                <td colspan="2"><hr> </td>
            </tr>
            <tr>
                <td class="td1">예약자 이름</td>
                <td class="td2"><%= reservation.getReName() %></td>
            </tr>
            <tr>
                <td class="td1">예약 번호</td>
                <td class="td2"><%= reservation.getReNo() %></td>
            </tr>
            <tr>
                <td colspan="2"><hr></td>
            </tr>
        </table>
        <h3>결제금액</h3>
        <h2 class="price"><%= reservation.getRePrice() %>원</h2>
        <% if("Y".equals(reservation.getReservationStatus())) { %>
        <button class="paybtn" id= "btn-kakao-pay" onclick = "kakaopay('<%=reservation.getReNo()%>',
        '<%=reservation.getHotelName() %>','<%=reservation.getStartDate() %>','<%=reservation.getEndDate()%>',
        '<%=reservation.getRePrice() %>', '<%=reservation.getReName() %>')"> 결제하기 </button>
        
        <button class="btn-cancel" value="<%= reservation.getReNo() %>">예약취소</button>
        <% } else { %>
        <button class="btn-canceled" value="<%= reservation.getReNo() %>">취소된 예약</button>
        <% } %>
        
		
    </div> <!-- rebox -->
        <%
			  }			
			} 
		%>
   </div> <!-- wrapper -->

		<form action="<%= request.getContextPath() %>/user/userRevCancel" name="userRevCancelFrm" method="POST">
			<input type="hidden" name="reNo" value="" />
			<input type="hidden" name="userId" value="<%= loginUser.getUserId() %>"/>
		</form>
		
<script>
document.querySelectorAll(".btn-cancel").forEach((button) =>{
	button.onclick = (e) =>{
		if (confirm('예약을 취소하시겠습니까?')){
			const frm = document.userRevCancelFrm;
		    frm.reNo.value = e.target.value;
			frm.submit();
		}
	}
});


const kakaopay =(reNo,hotelName,startDate,endDate,price,reName) => {
	var IMP = window.IMP; // 생략 가능
    IMP.init("imp83164386"); 
	IMP.request_pay({
	   	pg : "kakaopay.TC0ONETIME", 
        pay_method : 'card',
        merchant_uid : 'alpha' + new Date().getTime(),
        name : reNo + startDate +  endDate ,
	    amount :  price,
	    buyer_email : '',
	    buyer_name : reName,
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 역삼동',
	    buyer_postcode : reNo
	}, function(rsp) {
		console.log(rsp)
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$.ajax({
	    		url: "<%=request.getContextPath()%>/reservation/payComplete", //cross-domain error가 발생하지 않도록 주의해주세요//서블릿 url
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid,
		    		revReNo : reNo,
		    		price :  price,
		    		userId : "<%=loginUser.getUserId()%>"
		    		//기타 필요한 데이터가 있으면 추가 전달 전달해서 post로 저장
	    		}
	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    			
	    			alert('결제가 완료 되었습니다. 메인으로 돌아갑니다.');
	    			location.href='<%=request.getContextPath()%>/';
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        alert('결제에 실패하셨습니다. 메인으로 돌아갑니다. 다시 결제 부탁드립니다.');
	        location.href='<%=request.getContextPath()%>/';
	    }
	});
  };


</script>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>