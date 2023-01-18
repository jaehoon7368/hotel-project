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
        <form action="<%=request.getContextPath()%>/admin/adminhotelenroll" name="hotelEnrollFrm" method="POST"
        enctype= "multipart/form-data" >
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
          
          <label for="">호텔 메인 사진 등록 인풋</label>
          <input type="file" id= "upFile" name ="upFile" required accept="image/*"/>
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


<script>
document.querySelector("#upFile").addEventlistener('change',(e)=>{
	const f = e.target;
	console.log(f.files);               //배열
	console.log(f.files[0]);           //보통 0번지에 사진이 들어가있다.

	if(f.files[0]){//파일 선택한 경우
		const fr = new FileReader();
		fr.readAsDataURL(f.files[0]);  //비동기처리  - 백그라운드 작업
		fr.onload = (e) => {
			//읽기 작업 완료시 호출될 load이벤트핸들러
			document.querySelector("#img-viewer").src = e.target.result; // dataUrl		
		
			console.log(e.target.result); //파일2진데이터를 인코딩한 결과
			
		}
		
		
	}else{ //파일 선택 취소한경우
		document.querySelector("#img-viewer").src = "";
		
	}
})


document.hotelEnrollFrm.onsubmit = (e)=>{
	//호텔정보 입력 유효성 검사입니다.
	const type = e.target.radio-1;
	const name = e.target.hotelName;
	const address = e.target.hotelAddress;
	const info = e.target.hotelInfo;
	console.log(type)
	console.log(name)
	console.log(address)
	console.log(info)
	
	if(!/^.+%/.test(type.value)){
		alert('호텔 타입을 선택해주세요.');
		type.select();
		return false;
	}
	if(!/^.+%/.test(name.value)){
		alert('호텔 이름을 입력해주세요.');
		type.select();
		return false;
	}	
	if(!/^.+%/.test(address.value)){
		alert('호텔 주소를 입력해주세요.');
		type.select();
		return false;
	}
	if(!/^.+%/.test(info.value)){
		alert('호텔 정보를 입력해주세요.');
		type.select();
		return false;
	}
	
}

</script>






<%@ include file="/WEB-INF/views/common/footer.jsp"%>