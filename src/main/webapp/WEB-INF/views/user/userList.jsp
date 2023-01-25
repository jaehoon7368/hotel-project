<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<User> users = (List<User>) request.getAttribute("users");
	
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
%>   
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 관리자용 admin.css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/admin.css" />
<style>
div#search-container {width: 100%; margin:0 0 10px 0; padding:3px; background-color: rgba(0, 188, 212, 0.3);}
div#search-userId	 {display: <%= searchType == null || "user_id".equals(searchType) ? "inline-block" : "none" %>;}
div#search-userName{display: <%= "user_name".equals(searchType) ? "inline-block" : "none" %>;}
</style>
<script>
window.addEventListener('load', () => {
	document.querySelector("#searchType").addEventListener('change', (e) => {
		console.log(e.target.value); // 
		
		// 모두 숨김
		document.querySelectorAll(".search-type").forEach((div) => {
			div.style.display = "none";
		});
		
		// 현재선택된 값에 상응하는 div만 노출
		let id; 
		switch(e.target.value){
		case "user_id" : id = "search-userId"; break; 
		case "user_name" : id = "search-userName"; break; 
		}
		
		document.querySelector("#" + id).style.display = "inline-block";
	});
});

</script>
<section id="userList-container">
	<h2>회원관리</h2>
	
	<div id="search-container">
	    <label for="searchType">검색타입 :</label> 
	    <select id="searchType">
	        <option value="user_id" <%= "user_id".equals(searchType) ? "selected" : "" %>>아이디</option>		
	        <option value="user_name" <%= "user_name".equals(searchType) ? "selected" : "" %>>회원명</option>
	    </select>
	    <div id="search-userId" class="search-type">
	        <form action="<%=request.getContextPath()%>/user/userFinder">
	            <input type="hidden" name="searchType" value="user_id"/>
	            <input type="text" name="searchKeyword"  size="25" placeholder="검색할 아이디를 입력하세요." 
	            	value="<%= "user_id".equals(searchType) ? searchKeyword : "" %>"/>
	            <button type="submit">검색</button>			
	        </form>	
	    </div>
	    <div id="search-userName" class="search-type">
	        <form action="<%=request.getContextPath()%>/user/userFinder">
	            <input type="hidden" name="searchType" value="user_name"/>
	            <input type="text" name="searchKeyword" size="25" placeholder="검색할 이름을 입력하세요."
	            	value="<%= "user_name".equals(searchType) ? searchKeyword : "" %>" />
	            <button type="submit">검색</button>			
	        </form>	
	    </div>
    </div>
	
	
	<table id="tbl-user">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>회원권한</th>
				<th>이메일</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody>
		<% if(users.isEmpty()){ %>
			<tr>
				<td colspan="10">조회된 회원이 없습니다.</td>
			</tr>
		<% 
		   } else { 
			  for(User user : users){
		%>
				<tr>
					<td><%= user.getUserId() %></td>
					<td><%= user.getUserName() %></td>
					<td>
						<select class="user-role" data-user-id="<%= user.getUserId() %>">
							<option value="<%= UserRole.U %>" <%= user.getUserRole() == UserRole.U ? "selected" : "" %>>일반사용자</option>
							<option value="<%= UserRole.A %>" <%= user.getUserRole() == UserRole.A ? "selected" : "" %>>숙소관리자</option>
						</select>
					</td>	
					<td><%= user.getEmail() != null ? user.getEmail() : "" %></td>
					<td><%= user.getPhone() %></td>
					
				</tr>
		<%
			  }			
			} 
		%>
		</tbody>
	</table>
	<div id="pagebar">
		<%= request.getAttribute("pagebar") %>
	</div>
	
</section>
<form action="<%= request.getContextPath() %>/user/updateUserRole" name="userRoleUpdateFrm" method="POST">
	<input type="hidden" name="userId" />
	<input type="hidden" name="userRole" />
</form>
<script>
document.querySelectorAll(".user-role").forEach((select) => {
	select.addEventListener('change', (e) => {
		console.log(e.target.value);
		console.log(e.target.dataset.userId);
		const userId = e.target.dataset.userId;
		const userRole = e.target.value;
		
		// js template string문법 jsp에서 사용시 주의사항 : \${}이스케이핑 처리해야 한다.
		if(confirm(`[\${userId}]회원의 권한을 \${userRole}로 변경하시겠습니까?`)){			
			const frm = document.userRoleUpdateFrm;
			frm.userId.value = userId;
			frm.userRole.value = userRole;
			frm.submit();
		}
		else {
			// e.target(select)하위의 selected 속성이 있는 option태그
			e.target.querySelector("option[selected]").selected = true;
		}
		
		
		
	});
});

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>







