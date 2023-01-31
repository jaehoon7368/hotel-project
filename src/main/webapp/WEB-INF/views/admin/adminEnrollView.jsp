<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminEnrollView.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>

</style>

	<aside>
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
	</aside> 
	
  <div id="wrapper">
	<div id="content" class="adminBox">

		<form action="<%=request.getContextPath()%>/admin/adminhotelenroll"
			name="hotelEnrollFrm" method="POST" enctype="multipart/form-data" >
			<br>
			<input type="hidden"  name="userId"value="<%=loginUser.getUserId()%>" />
			<div class="entireBox">
			<table id="enrollTb" style="height: 100%; width: 100%;" >
				<tr >
					<td><span>호텔 이름</span> <input type="text" name="hotelName" id="name" class="put"></td>
				</tr>
				<tr >
					<td><span>호텔 주소</span><input type="text"  name="hotelAddress" id="address" class="put"></td>
				</tr>
				<tr>
					
					<td>
						<select style="width:300px; height :50px; font-size:x-large;"  name= "hotelType" id="type"  required>
						<option value="" selected>호텔 타입을 선택해주세요</option>
						<option value="P">펜션</option>
						<option value="H">호텔</option>
						<option value="Y">모텔</option>
					</select>
					</td>
				</tr>
				<tr>
					<td><span>호텔 정보</span><textarea id ="info" name="hotelInfo"class="put"></textarea></td>
				</tr>
			</table>
				<div class="">
					<label >메인 사진 등록</label>
					<input type="file" name="upFile"  id="upFile"  required>
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
				<br /><br /><br /><br />
			<div id="img-viewer-container">
					<img id="img-viewer" width="500px">
				</div>
				 <button type="submit" class= "hotelbtn" style="float: center" > 호텔 등록하기</button>
 		</form> 

	</div> <!--  adminBox end -->
</div> <!--  wrapper -->
 



<script>

document.querySelector("#upFile").addEventListener('change',(e)=>{
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


document.hotelEnrollFrm.onsubmit = (e) => {
	const name = e.target.hotelName;
	const address = e.target.hotelAddress;
	const info = e.target.hotelInfo;
	
	if(!/^.+$/.test(name.value)){
		alert("호텔이름을 작성해주세요.");
		return false;
	}
	if(!/^.+$/.test(address.value)){
		alert("호텔주소를 작성해주세요.");
		return false;
	}
	
	if(!/^(.|n)/.test(info.value)){
		alert("내용을 작성해주세요.");
		return false;
	}
	
}


</script>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>