<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminEnrollView.css" />
    <script>
        $( function() {
          $( "input" ).checkboxradio({
            icon: false
          });
        } );
        </script>
        
        <section id="content" >
          <h1>숙소등록하기</h1>
        <form action="<%=request.getContextPath()%>/admin/adminhotelenroll" name="hotelEnrollFrm" method="POST" >
          <tr>
            <td>
                <label for="radio-1">호텔</label>
                <input type="radio" name="radio-1" id="radio-1" value="H">
                <label for="radio-2">펜션</label>
                <input type="radio" name="radio-1" id="radio-2" value="P">
                <label for="radio-3">모텔</label>
                <input type="radio" name="radio-1" id="radio-3" value="M">
            </td>
          </tr>
          <table>
            <tr>
              <td><label for="">호텔 이름</label><input name="hotelName" type="text" placeholder="숙소이름" ></td>
            </tr>
            <tr>
              <td><label for="">호텔 주소</label><input name= "hotelAddress" type="text" placeholder="호텔주소" ></td>
            </tr>
            <tr>
              <td><label for="">숙소 정보</label><textarea name="hotelInfo" type="textarea" placeholder="숙소 정보" ></textarea></td>
            </tr>
          </table>
          <hr />
          <input type="file" name ="upFile1" />
          
       	 <input type="submit" value="제출" />
        </form>
        </section>
        
        <aside >
            <ul>
                <li><a href="">개인정보 수정</a></li>
                <li><a href="">작성 리뷰</a></li>
                <li><a href="">예약 내역 확인</a></li>
                <li><a href="">숙소 등록</a></li>
                <li><a href="">숙소 변경</a></li>
                <li><a href="">등록 숙소 정보 </a></li>
            </ul>
        </aside>

    </div>

	<script>
		
	
	</script>
	





<%@ include file="/WEB-INF/views/common/footer.jsp"%>