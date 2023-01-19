<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        $( function() {
          $( "input" ).checkboxradio({
            icon: false
          });
        } );
        </script>
<style>
#tb{
	border: solid 1px gray;
	border-radius: 5%;
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
	
}
#categoryBox img{
	width:70px;
}
#categoryBox{
	width:600px;
	height :400px;
	
	text-align: center;

}

	
</style>
		
		<div id = "entireBox"> 
		<div class="adminBox">
		       <ul>
                <li><a href="">개인정보 수정</a></li>
                <li><a href="">작성 리뷰</a></li>
                <li><a href="">예약 내역 확인</a></li>
                <li><a href="">호텔 등록</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adminenrolledhotelview">등록된 호텔 보기</a></li>
            </ul>
         </div>
        <div id="content" class="adminBox" >
         
        <form action="<%=request.getContextPath()%>/admin/adminhotelenroll" name="hotelEnrollFrm" method="POST"
        enctype= "multipart/form-data" >
            <br>
            <div id ="typeBox">
                <label for="radio-1">호텔</label>
                <input type="radio" name="radio-1" id="radio-1" value="H">
                <label for="radio-2">펜션</label>
                <input type="radio" name="radio-1" id="radio-2" value="P">
                <label for="radio-3">모텔</label>
                <input type="radio" name="radio-1" id="radio-3" value="Y">
            </div>
          
          <table id="tb">
            <tr>
              <td><input class="text" name="hotelName" type="text" placeholder="호텔이름" style="font-size: 20px;" required></td>
            </tr>
            <tr>
              <td><input class="text" id="address"name= "hotelAddress" type="text" placeholder="호텔주소를 입력하세요" style="font-size: 20px;"  required></td>
            </tr>
            <tr>
              <td><textarea class="text" name="hotelInfo" type="textarea" placeholder="숙소 정보를 입력하세요" style="width: 430px; height: 122px; font-size: 15px; border:none"  ></textarea></td>
            </tr>
			
     
            <tr>
					<td class="lastTd" style="border :none">
						<div id="img-viewer-container">
						 <label for="">호텔 사진을 넣어주세요 </label>
                    <input type="file" id= "upFile" name ="upFile" required accept="image/*"/>
							<img id="img-viewer" width="350px">
						</div>
					</td>
			</tr>
          </table>
				<br /><br /><br />
			<div id ="categoryBox">          
    		
    		<label for="checkbox-1"><img src="<%=request.getContextPath() %>/image/air-conditioning.png" alt="" />에어컨</label>
    		<input type="checkbox" name="checkbox-1" id="checkbox-1" ">
    		<label for="checkbox-2"><img src="<%=request.getContextPath() %>/image/wifi.png" alt="" />와이파이</label>
    		<input type="checkbox" name="checkbox-2" id="checkbox-2">
    		<label for="checkbox-3"><img src="<%=request.getContextPath() %>/image/brand-netflix.png" alt="" />넷플릭스</label>
    		<input type="checkbox" name="checkbox-3" id="checkbox-3">
    		<label for="checkbox-4"><img src="<%=request.getContextPath() %>/image/pool.png" alt="" />수영장</label>
    		<input type="checkbox" name="checkbox-4" id="checkbox-4">
    		<label for="checkbox-5"><img src="<%=request.getContextPath() %>/image/tools-kitchen.png" alt="" />주방</label>
    		<input type="checkbox" name="checkbox-5" id="checkbox-5">
    		<label for="checkbox-6"><img src="<%=request.getContextPath() %>/image/dog.png" alt="" />반려견 동반</label>
    		<input type="checkbox" name="checkbox-6" id="checkbox-6" ">
    		<label for="checkbox-7"><img src="<%=request.getContextPath() %>/image/parking.png" alt="" />무료 주차장</label>
    		<input type="checkbox" name="checkbox-7" id="checkbox-7">
    		<label for="checkbox-8"><img src="<%=request.getContextPath() %>/image/barbell.png" alt="" />피트니스센터</label>
    		<input type="checkbox" name="checkbox-8" id="checkbox-8">
    		<label for="checkbox-9"><img src="<%=request.getContextPath() %>/image/device-desktop.png" alt="" />데스크톱</label>
    		<input type="checkbox" name="checkbox-9" id="checkbox-9">
    		<label for="checkbox-10"><img src="<%=request.getContextPath() %>/image/wash-machine.png" alt="" />세탁기</label>
    		<input type="checkbox" name="checkbox-10" id="checkbox-10">
			</div>  
          
       	 <input type="submit" value="등록하기" style = "float :right">
        </form>
        
        </div> <!--  adminBox end -->
        </div>  <!-- entireBox end -->




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


document.hotelEnrollFrm.onsubmit = (e)=>{
	//호텔정보 입력 유효성 검사입니다.
	const name = e.target.hotelName;
	const address = e.target.hotelAddress;
	const info = e.target.hotelInfo;
	console.log(type)
	console.log(name)
	console.log(address)
	console.log(info)
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