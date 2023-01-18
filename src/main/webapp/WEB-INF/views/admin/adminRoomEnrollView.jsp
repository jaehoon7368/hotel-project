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
          <h1>룸등록하기 </h1>
        <form action="<%=request.getContextPath()%>/admin/adminRoomEnroll" name="roomEnrollFrm" method="POST"
        enctype= "multipart/form-data" >
          <tr>
            <td>
                <label for="radio-1"></label>
                <input type="radio" name="radio-1" id="radio-1" value="H">
                <label for="radio-2">펜션</label>
                <input type="radio" name="radio-1" id="radio-2" value="P">
                <label for="radio-3">모텔</label>
                <input type="radio" name="radio-1" id="radio-3" value="M">
            </td>
          </tr>
          <table>
            <tr>
              <td><label for="">사용자 아이디</label><input name="userId" type="text"  readonly required"></td>
            </tr>
            <tr>
              <td><label for="">호텔 이름</label><input name="hotelName" type="text" placeholder="숙소이름"  required></td>
            </tr>
            <tr>
              <td><label for="">호텔 주소</label><input name= "hotelAddress" type="text" placeholder="호텔주소"  required></td>
            </tr>
            <tr>
              <td><label for="">숙소 정보</label><textarea name="hotelInfo" type="textarea" placeholder="숙소 정보"  ></textarea></td>
            </tr>
            <tr>
				<th>이미지 보기</th>
					<td>
						<div id="img-viewer-container">
							<img id="img-viewer" width="350px">
						</div>
					</td>
			</tr>
          </table>
          <hr />
          <label for="">룸사진 등록 1 </label>
          <input type="file" id= "upFile1" name ="upFile1" required accept="image/*"/>
		  <label for="">룸사진 등록 2 </label>
          <input type="file" id= "upFile2" name ="upFile2" required accept="image/*"/>
          <label for="">룸사진 등록 3 </label>
          <input type="file" id= "upFile3" name ="upFile3" required accept="image/*"/>
          <label for="">룸사진 등록 4 </label>
          <input type="file" id= "upFile4" name ="upFile4" required accept="image/*"/>
          <label for="">룸사진 등록 5 </label>
          <input type="file" id= "upFile5" name ="upFile5" required accept="image/*"/>
          <label for="">룸사진 등록 6 </label>
          <input type="file" id= "upFile6" name ="upFile6" required accept="image/*"/>
          <br />
       	 <input type="submit" value="제출" />
        </form>
        </section>
        
        <aside >
            <ul>
                <li><a href="">개인정보 수정</a></li>
                <li><a href="">작성 리뷰</a></li>
                <li><a href="">예약 내역 확인</a></li>
                <li><a href="">호텔 등록</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adminenrolledhotelview">등록된 호텔 보기</a></li>
            </ul>
        </aside>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>