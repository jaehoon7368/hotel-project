<%@page import="com.sh.airbnb.reservation.model.dto.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/user/userCheckRev.css" />
<%

	List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
	Reservation rev = (Reservation) session.getAttribute("resevation");
	System.out.println("reservations = " + reservations);
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
                <td class="name"colspan="2">스파오션부 (룸타입) /1박</td>
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
        <button class="paybtn" id="btn-kakao-pay">결제하기 </button>
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











// const revCancel = () => {
	
//    if (confirm('예약을 취소하시겠습니까?')){
//    	document.userRevCancelFrm.submit();
        
        
//    }else{
//        location.href='<%=request.getContextPath()%>/user/userCheckRev?user_id= <%=loginUser.getUserId()%>';
//    }
// };
    

</script>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>