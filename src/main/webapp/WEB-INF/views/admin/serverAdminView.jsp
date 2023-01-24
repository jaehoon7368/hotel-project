<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
.entireBox{
	display :flex;
	width:100%;
	height:100% ;
	margin-top :50px;
}
.rightBox{
	width:100%;
}
.leftBox{
	width:400px
}
.entireBox li{
	padding:  20px;
	padding-left :100px;
	list-style: none;
}
.entireBox a{
	font-size : 20px;
	color : black;
	text-decoration: none;
}
</style>

	<div class= "entireBox">
	<div class="leftBox">
		       <ul>
                <li><a href="">개인정보 수정</a></li>
            	<li><a href="">회원정보 리스트</a></li>
            </ul>
</div>

	<div class= "rightBox">

<nav >
  <div class="menuSelect">
    <form >
      <select name="searchType"  required >
  		<option value=""selected >메뉴 선택</option>
  		<option value="user_name">회원 이름</option>
  		<option value="user_id">회원 아이디</option>
  		<option value="user_role">회원 권한 (A,U,S)</option>
	  </select>
      
      <input  id="searchKeyword" name ="searchKeyword" type="search" placeholder="Search"  required>
      <button  id="btn5"type="submit">Search</button>
    </form>
  </div>
</nav>


<table id="searchTable">
  <thead>
    <tr>
      <th >No</th>   
      <th>UserID</th>
      <th>Name</th>
      <th>Phone</th>
      <th>NickName</th>
      <th>Status</th>
      <th>Role</th>     <!-- 7개  -->
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
    </tr>
    
    <tr>
      <td style = "text-align: center"colspan ="7">검색된 회원이 없습니다. 검색 해주세요.</td>
    </tr>
  </tbody>
</table>
	</div> <!-- rightbox end -->
</div> <!--  entirebox end -->


<script>
	document.querySelector("#btn5").addEventListener('click',()=>{
		findUser();
	});
	
const findUser = () =>{
		const searchType = $("select[name='searchType']").val();
		const searchKeyword = $("#searchKeyword").val();
		
		$.ajax({
			url: "<%=request.getContextPath() %>/admin/userSearchFind",
			data : {
				"searchType" :searchType ,
				"searchKeyword":searchKeyword
			},
			method : "GET",
			dataType : "json",
			success(data){
			
			console.log("데이터 확인 ")	
			const tbody = document.querySelector("#searchTable tbody");
			tbody.innerHTML = "";
			data.forEach((user,index)=>{
				console.log(user);
				console.log(user);
				console.log(user);
				
				const th = document.createElement("th");
				const td1 = document.createElement("td");
				const td2 = document.createElement("td");
				const td3 = document.createElement("td");
				const td4 = document.createElement("td");
				const td5 = document.createElement("td");
				const td6 = document.createElement("td");
				const td7 = document.createElement("td");
			
			
			
			
				})
			},
			error : console.log,
			
		})
		
	}



</script>








<%@ include file="/WEB-INF/views/common/footer.jsp"%>