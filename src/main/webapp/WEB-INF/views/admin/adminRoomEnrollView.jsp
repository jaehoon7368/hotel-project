<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


<style>
.entireBox {
	margin: auto;
	border: 1px solid gray;
	width: 800px;
	border-radius: 2%;
}

</style>

<form action="<%=request.getContextPath()%>/admin/adminRoomEnroll" 
method="POST" enctype="multipart/form-data" name="roomEnrollFrm">

	<div class="entireBox">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Room Type</span>
  <input type="text" class="form-control" placeholder="Room Type" aria-label="Username" name="type" aria-describedby="basic-addon1">
</div>

		</select> <select class="form-select form-select-lg mb-3"
			aria-label=".form-select-lg example" required name="people">
			<option value="" selected>Limit People</option>
			<option value="2">2인</option>
			<option value="4">4인</option>
			<option value="6">6인</option>
			<option value="8">8인</option>
			<option value="12">12인</option>
			<option value="16">16인</option>
		</select>

		<div class="input-group mb-3">
			<span class="input-group-text">Room Pirce</span> 
			<input type="text" class="form-control" name="price" required
				aria-label="Amount (to the nearest dollar)"> <span
				class="input-group-text">원(won)</span>
		</div>

		<div class="input-group">
			<span class="input-group-text">Room info</span>
			<textarea class="form-control" name="info" aria-label="With textarea"
				required></textarea>
		</div>

		<div class="input-group mb-3">
			<label class="input-group-text" for="inputGroupFile01">Upload</label>
			<input type="file" class="form-control" id="inputGroupFile01"
				name="upFile" required>
		</div>
		<div  id="img-viewer-container">
			<img style="margin :auto" id="img-viewer" width="500px"> 
			<div style="text-align: center; margin-top:30px"><input type="submit" class="btn btn-dark"  value="룸등록 "  /></div>
			
</div>
</form>



<script>

document.roomEnrollFrm.onsubmit=(e) =>{
	const price = e.target.price;
	const info = e.target.info ;
	
	
	if(!/^[0-9]{4,}$/.test(price.value)){
		alert("가격을 10000원이상 입력하세요.");
		return false;
	}
	
	if(!/^(.|n)/.test(info.value)){
		alert("내용을 작성해주세요.");
		return false;
	}
	e.target.close();
	
}

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
			document.querySelector("#img-viewer").style = "width:100% ;height :50%;"
		}
	}else{ //파일 선택 취소한경우
		document.querySelector("#img-viewer").src = "";
	}
})




</script>

