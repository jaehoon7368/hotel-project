<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


   <style>
        .reBox{
            width: 636px;
            height: 640px;
            margin: auto;
            padding-top: 70px;
            padding-left: 40px;
            text-align: center;

        }
        .reTable{
            margin-left: 80px;
            margin-top: 60px;
        }
        .reTable td{
            height: 30px;
            width: 250px;
        }
        .td1{
            color: gray;
            font-weight: 400;
        }
        .td2{
            font-family: Arial, Helvetica, sans-serif;
        }
        .name{
            font-size: larger;
            font-weight: 800;
            color: gray;            
        }
        .price{
            color: red;
        }
        .mainbtn{
        width: 100px;
        height: 40px;
        background-color: black;
        padding: 5px 0;
        border-radius: 15px;
        outline: none;
        font-size: 15px;
        text-align: center;
        color: white;
	    border : none;
	    margin-top: 17px;
}

    </style>
    
    <div class="reBox">
        <h2 style="padding:10px;">예약이 완료되었습니다.</h2> 
        <hr>
        <div style ="margin-top :13px"><h2>결제내역</h2></div>

        <table class="reTable">
            <tr style="width:70px ;">
                <td class="name" colspan="2">강릉 크리스탈 풀빌라</td>
            </tr> 
            <tr>
                <td class="name"colspan="2">스파오션부 (룸타입) /1박</td>
            </tr> 
            <tr>
            </tr> 
            <tr>
                <td> </td>
            </tr> 
            <tr>
                <td class="td1">체크인</td>
                <td class="td2">2022 .01</td>
            </tr>
            <tr>
                <td class="td1">체크아웃</td>
                <td class="td2" >2022 .01</td>
            </tr>
            <tr>
                <td colspan="2"><hr> </td>
            </tr>
            <tr>
                <td class="td1">예약번호</td>
                <td class="td2"> 10123213214</td>
            </tr>
            <tr>
                <td class="td1">예약자 이름</td>
                <td class="td2"> 홍길동으 </td>
            </tr>
            <tr>
                <td class="td1">안심번호</td>
                <td class="td2">05120312301230</td>
            </tr>
            <tr>
                <td colspan="2"><hr></td>
            </tr>
        </table>
        
        <h3>결제정보</h3>
        <h2 class="price">270000원</h2>
        <button class="mainbtn" id="btn-kakao-pay">결제하기 </button>
    </div>
    
    <!-- TC0ONETIME -->
    <script>
    
    
    $("#btn-kakao-pay").click(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('TC0ONETIME'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'alpha 숙박 결제 시스템 ',
            amount : <%=totalPrice%>,
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                    	msg = "결제에 실패하였습니다."
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='<%=request.getContextPath()%>/?msg='+msg;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/";
                alert(msg);
            }
        });
        
    });
    
    
    
    
    </script>
    
    
       
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>