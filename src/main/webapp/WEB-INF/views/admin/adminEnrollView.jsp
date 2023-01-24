<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
#tb{
	border: solid 1px gray;
	border-radius: 2%;
	text-align: center;
	width: 600px;
}
td {
	border-bottom: solid 1px gray;
}

.lastTd {
	border: none;
}

.text {
	border: none;
	background: transparent;
	width: 100%;
	height: 50px;
}
#entireBox{
	display : flex;

}
#typeBox{
	padding-left :200px;
	padding-top :50px;
	padding-bottom :10px;
}

div.adminBox{
	width: 500px;
	
}

#entireBox li{
	padding:  20px;
	padding-left :100px;
	list-style: none;
	}

#entireBox a{
	font-size : 20px;
	color : black;
	text-decoration: none;
	
}
#categoryBox img{
	width:70px;
}
#categoryBox{
	width:600px;
	height :200px;
	text-align: center;
}
.entireBox {
	border-radius: 2%;
	border: 1px solid gray;
	width: 800px;
	height: 50%;
	text-align: center
}


</style>
		<div id = "entireBox"> 
		<div class="adminBox">
		       <ul>
		       	<!-- 기훈 수정 시작 -->
                <li><a href="<%= request.getContextPath()%>/user/userView">개인정보 수정</a></li>
                <!-- 기훈 수정 끝 -->
                <li><a href="">작성 리뷰</a></li>
                <li><a href="">예약 내역 확인</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adminhotelenroll">호텔 등록</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adminenrolledhotelview">등록된 호텔 보기</a></li>
            </ul>
         </div>
	<div id="content" class="adminBox">

		<form action="<%=request.getContextPath()%>/admin/adminhotelenroll"
			name="hotelEnrollFrm" method="POST" enctype="multipart/form-data" id="hotelEnrollFrm">
			<br>
			<div class="entireBox">
				<div class="input-group mb-3">
					<span class="input-group-text" >Hotel Name</span> <input
						type="text" class="form-control" placeholder="HotelName"
						aria-label="Username" aria-describedby="basic-addon1" name= "hotelName" id="name" >
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" >Hotel address</span> <input
						type="text" class="form-control" placeholder="HotelAddress"
						aria-label="Username" aria-describedby="basic-addon1" name="hotelAddress" id="address">
				</div>

				<select class="form-select form-select-lg mb-3"
					aria-label=".form-select-lg example" name= "hotelType" id="type"  required>
					<option selected>Hotel Type</option>
					<option value="P">펜션</option>
					<option value="H">호텔</option>
					<option value="Y">모텔</option>
				</select>


				<div class="input-group">
					<span class="input-group-text">Hotel Info</span>
					<textarea id ="info" class="form-control" name="hotelInfo"
						aria-label="With textarea"></textarea>
				</div>

				<div class="input-group mb-3">
					<label class="input-group-text" for="inputGroupFile01">Upload</label>
					<input type="file" class="form-control" id="inputGroupFile01"
						name="upFile">
				</div>
			
				<br />
				<div id="categoryBox" style="margin: auto">

					<label for="checkbox-1"><img
						src="<%=request.getContextPath() %>/image/air-conditioning.png"
						alt="" />에어컨</label> <input type="checkbox" name="checkbox"
						id="checkbox-1" value="c011"> <label for="checkbox-2"><img
						src="<%=request.getContextPath() %>/image/wifi.png" alt="" />와이파이</label>
					<input type="checkbox" name="checkbox" id="checkbox-2" value="c016">
					<label for="checkbox-3"><img
						src="<%=request.getContextPath() %>/image/brand-netflix.png"
						alt="" />넷플릭스</label> <input type="checkbox" name="checkbox"
						id="checkbox-3" value="c01"> <label for="checkbox-4"><img
						src="<%=request.getContextPath() %>/image/pool.png" alt="" />수영장</label>
					<input type="checkbox" name="checkbox" id="checkbox-4" value="c04">
					<label for="checkbox-5"><img
						src="<%=request.getContextPath() %>/image/tools-kitchen.png"
						alt="" />주방</label> <input type="checkbox" name="checkbox"
						id="checkbox-5" value="c014"> <label for="checkbox-6"><img
						src="<%=request.getContextPath() %>/image/dog.png" alt="" />반려견
						동반</label> <input type="checkbox" name="checkbox" id="checkbox-6"
						value="c09"> <label for="checkbox-7"><img
						src="<%=request.getContextPath() %>/image/parking.png" alt="" />무료
						주차장</label> <input type="checkbox" name="checkbox" id="checkbox-7"
						value="c03"> <label for="checkbox-8"><img
						src="<%=request.getContextPath() %>/image/barbell.png" alt="" />피트니스센터</label>
					<input type="checkbox" name="checkbox" id="checkbox-8" value="c012">
					<label for="checkbox-9"><img
						src="<%=request.getContextPath() %>/image/device-desktop.png"
						alt="" />데스크톱</label> <input type="checkbox" name="checkbox"
						id="checkbox-9" value="c015"> <label for="checkbox-10"><img
						src="<%=request.getContextPath() %>/image/wash-machine.png" alt="" />세탁기</label>
					<input type="checkbox" name="checkbox" id="checkbox-10"
						value="c013">
				</div>
			<div id="img-viewer-container">
					<img id="img-viewer" width="500px">
				</div>
				 <button type="submit" class="btn btn-dark"  style="float: center" > 호텔 등록하기</button>
 		</form> 

	</div> <!--  adminBox end -->
        </div>  <!-- entireBox end -->



<script>

document.querySelector("#inputGroupFile01").addEventListener('change',(e)=>{
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


document.hotelEnrollFrm.addEventListener('submit',(e)=>{
	e.preventDefault();
	const \$name = $('#name').val();
	const \$address = $('#address').val();
	const \$info = $('#info').val();
	const \$type = $('#type').val();
	
	
	if(!/^[가-힣]{3,}$/.test(\$name.value)){
		alert('호텔 이름은 3글자 이상 입력해주세요.');
		return false;
	}	
	if(!/^[가-힣0-9]{5,}$/.test(\$address.value)){
		alert('호텔 주소를 정확히 입력해주세요.');
		return false;
	}
	if(!/^[가-힣]{5,}$/.test(\$info.value)){
		alert('호텔 정보를 입력해주세요.');
		return false;
	}
	
})
</script>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>