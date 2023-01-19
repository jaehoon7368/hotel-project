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
#hotelMain {
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
	width :1000px;
	

}
div.adminBox{
	width: 500px;
	border : solid 1px black ;
	
}

#entireBox li{
	padding:  20px;
	padding-left :100px;
	list-style: none;
	}
#entireBox a{
	font-size : 20px;

	
}
	
</style>
		
		<div id = "entireBox"> 
		<div class="adminBox">
		       <ul>
                <li><a href="">개인정보 수정</a></li>
                <li><a href="">작성 리뷰</a></li>
                <li><a href="">예약 내역 확인</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adminhotelenroll">">호텔 등록</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adminenrolledhotelview">등록된 호텔 보기</a></li>
            </ul>
         </div>
        <div id="content" class="adminBox" >
         
        <form action="<%=request.getContextPath()%>/admin/adminhotelenroll" name="hotelEnrollFrm" method="POST"
        enctype= "multipart/form-data" >
            <br>
            <h2>인원수</h2><br />
            <div >
                <label for="radio-1">2명</label>
                <input type="radio" name="radio-1" id="radio-1" value="2">
                <label for="radio-2">4명</label>
                <input type="radio" name="radio-1" id="radio-2" value="4">
                <label for="radio-3">6명</label>
                <input type="radio" name="radio-1" id="radio-3" value="6">
                <label for="radio-4">8명</label>
                <input type="radio" name="radio-1" id="radio-4" value="8">
                <label for="radio-5">10명</label>
                <input type="radio" name="radio-1" id="radio-5" value="10">
            </div>
          
          
            <h2>Checkbox</h2>
  			<fieldset>
    		<legend>Hotel Ratings: </legend>
    		<label for="checkbox-1"><img src="<%=request.getContextPath() %>/image/bath.png" alt="" /></label>
    		<input type="checkbox" name="checkbox-1" id="checkbox-1" ">
    		<label for="checkbox-2">3 Star</label>
    		<input type="checkbox" name="checkbox-2" id="checkbox-2">
    		<label for="checkbox-3">4 Star</label>
    		<input type="checkbox" name="checkbox-3" id="checkbox-3">
    		<label for="checkbox-4">5 Star</label>
    		<input type="checkbox" name="checkbox-4" id="checkbox-4">
  			</fieldset>
 
     	   <label for="">호텔 룸사진 등록 하기 </label> <input type="file" id= "upFile" name ="upFile" required accept="image/*"/>
			<div id="img-viewer-container">
			<img id="img-viewer" width="350px">
          <h2>편의시설 정보 추가하기</h2>
       	 <input type="submit" value="등록하기" />
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


</script>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>