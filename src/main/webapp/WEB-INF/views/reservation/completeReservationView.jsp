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
    
    

    
    </script>
    
    
       
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>