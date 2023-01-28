<%@page import="com.sh.airbnb.reservation.model.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%  
		Reservation rev = (Reservation)session.getAttribute("resevation");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reservation/completeReservationView.css" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    	<!--  호텔이름 /  룸타입 / 박 / 체크인 체크아웃 /예약번호/ 예약자 이름 / 총가격 /  -->
    <div class="reBox">
        <h2 style="padding:10px;">예약이 완료되었습니다.</h2> 
        <hr>
        <div style ="margin-top :13px"><h2>결제내역</h2></div>

        <table class="reTable">
            <tr style="width:70px ;">
                <td class="name" colspan="2"><%=rev.getHotelName() %></td>
            </tr> 
            <tr>
                <td class="name"colspan="2"><%=rev.getRoomType() %>/<%=rev.getReDay() %>박</td>
            </tr> 
            <tr>
            </tr> 
            <tr>
                <td> </td>
            </tr> 
            <tr>
                <td class="td1">체크인</td>
                <td class="td2"><%=rev.getStartDate() %></td>
            </tr>
            <tr>
                <td class="td1">체크아웃</td>
                <td class="td2" ><%=rev.getEndDate() %></td>
            </tr>
            <tr>
                <td colspan="2"><hr> </td>
            </tr>
            <tr>
                <td class="td1">예약번호</td>
                <td class="td2"> <%=rev.getReNo() %></td>
            </tr>
            <tr>
                <td class="td1">예약자 이름</td>
                <td class="td2"><%=rev.getReName() %> </td>
            </tr>
            <tr>
                <td class="td1">총인원수</td>
                <td class="td2"><%=rev.getPeople() %> 명</td>
            </tr>
            <tr>
                <td colspan="2"><hr></td>
            </tr>
        </table>
        
        <h3>결제정보</h3>
        <h2 class="price"><%=rev.getRePrice() %>원</h2> 
        <span><button class="mainbtn" id="btn-kakao-pay">카카오 페이</button> <button class="mainbtn" id="btn-toss-pay">토스 페이</button> <button class="mainbtn" id="btn-smile-pay">스마일 페이</button></span>
        
        <p></p>
        <p></p>
    </div>
    <script>
    document.querySelector("#btn-kakao-pay").addEventListener('click',()=>{
    	var IMP = window.IMP; // 생략 가능
        IMP.init("imp83164386"); 
    	IMP.request_pay({
    	   	pg : "kakaopay.TC0ONETIME", 
            pay_method : 'card',
            merchant_uid : 'alpha' + new Date().getTime(),
            name : '<%=rev.getHotelName()%> , <%=rev.getStartDate()%>일 ~ <%=rev.getEndDate()%>일',
    	    amount : <%=rev.getRePrice() %>,
    	    buyer_email : '',
    	    buyer_name : '<%=rev.getReName()%>',
    	    buyer_tel : '010-1234-5678',
    	    buyer_addr : '서울특별시 강남구 역삼동',
    	    buyer_postcode : '<%=rev.getReNo()%>'
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
    		    		revReNo : "<%=rev.getReNo()%>",
    		    		price :  "<%=rev.getRePrice()%>",
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
      });
    
    
    document.querySelector("#btn-toss-pay").addEventListener('click',()=>{
    	var IMP = window.IMP; // 생략 가능
        IMP.init("imp83164386"); 
    	IMP.request_pay({
    	   	pg : "toss.tosstest", 
            pay_method : 'card',
            merchant_uid : 'alpha' + new Date().getTime(),
            name : '<%=rev.getHotelName()%> , <%=rev.getStartDate()%>일 ~ <%=rev.getEndDate()%>일',
    	    amount : <%=rev.getRePrice() %>,
    	    buyer_email : '',
    	    buyer_name : '<%=rev.getReName()%>',
    	    buyer_tel : '010-1234-5678',
    	    buyer_addr : '서울특별시 강남구 역삼동',
    	    buyer_postcode : '<%=rev.getReNo()%>'
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
    		    		revReNo : "<%=rev.getReNo()%>",
    		    		price :  "<%=rev.getRePrice()%>",
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
      });
    
    document.querySelector("#btn-smile-pay").addEventListener('click',()=>{
    	var IMP = window.IMP; // 생략 가능
        IMP.init("imp83164386"); 
    	IMP.request_pay({
    	   	pg : "smilepay.cnstest25m", 
            pay_method : 'card',
            merchant_uid : 'alpha' + new Date().getTime(),
            name : '<%=rev.getHotelName()%> , <%=rev.getStartDate()%>일 ~ <%=rev.getEndDate()%>일',
    	    amount : <%=rev.getRePrice() %>,
    	    buyer_email : '',
    	    buyer_name : '<%=rev.getReName()%>',
    	    buyer_tel : '010-1234-5678',
    	    buyer_addr : '서울특별시 강남구 역삼동',
    	    buyer_postcode : '<%=rev.getReNo()%>'
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
    		    		revReNo : "<%=rev.getReNo()%>",
    		    		price :  "<%=rev.getRePrice()%>",
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
      });
    </script>
    
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>