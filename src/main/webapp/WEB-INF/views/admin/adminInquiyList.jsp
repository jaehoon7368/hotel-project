<%@page import="com.sh.airbnb.common.HelloMvcUtils"%>
<%@page import="com.sh.airbnb.board.model.dto.InquiyBoardComment"%>
<%@page import="com.sh.airbnb.user.model.dto.UserRole"%>
<%@page import="java.util.List"%>
<%@page import="com.sh.airbnb.board.model.dto.InquiyBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<%
	List<InquiyBoard> inquiyBoardList = (List<InquiyBoard>)request.getAttribute("inquiyBoardList");
	List<InquiyBoardComment> inquiyBoardCommentList = (List<InquiyBoardComment>)request.getAttribute("inquiyBoardCommentList");
%>
<style>
#inquiy-main {width: 100%; height: 100%; min-height: 800px; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.board-menu {width: 210px; margin: 0; display: block; float: left;}
.board-menu-list {list-style: none; margin: 0;}
.board-menu-list li {margin-bottom: 24px;}
#inquiy-main>nav>ul>li>a {color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.inquriy {width: 800px; height: 100%; margin: auto;}
.inquriy-board {width: 800px; height: 100%;}
.inquriy-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.tab-btn {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal; cursor: pointer;}
.non-inquriy-list {padding-top: 120px; text-align: center; height: 373px;}
/* 사이드바 */
.sidebar li:hover {background-color: rgb(233, 227, 227); border-radius: 10px;}
.sidebar {position:absolute; width: 15%; height: 100%; font-size: 15px; border-right: solid rgb(236, 231, 231) 1px;}
.userView-nav {position: relative; margin: 0 15%; text-align: right; top: 18%; transform: translateY(-50%); font-weight: bold;}
.userView-nav ul {list-style: none;}
.userView-nav li {position: relative; margin: 2.2em 0;}   
.userView-nav a {line-height: 20px; text-transform: uppercase; text-decoration: none; letter-spacing: 0.4em; display: block; transition: all ease-out 300ms; color: black;}
</style>
    <div id="inquiy-main" class="wrap">
        <content>
    		<div class="sidebar">
        		<nav class="userView-nav">
          			<ul>
			            <li><a href="<%= request.getContextPath() %>/board/noticeBoardList">공지사항</a></li>
			            <hr>
			            <li><a href="<%= request.getContextPath()%>/board/faqBoardList">자주 묻는 질문</a></li>
			            <hr>
			            <li ><a href="<%= request.getContextPath()%>/board/inquiyBoardList">1:1 문의</a></li>
			            <hr>
			            <% boolean canAdmin = loginUser != null && 
								(loginUser.getUserRole() == UserRole.A); 
							if(canAdmin) {
						%>
			            <li class="active"><a href="<%= request.getContextPath() %>/board/admininquiyList">1:1 답변</a></li>
			            <hr />
			            <% } %>
		           </ul>
        		</nav>
    	   </div>
		</content>
        <div class="inquriy">
            <div class="inquriy-board">
                <div class="inquriy-head">
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyBoardList'" style="color: #f7323f; font-weight: bold;">문의 내역</span>
                    <% if(loginUser != null) { %>
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyEnroll'">새 문의 작성</span>
                    <% } %>
                </div>
                <!-- 사용자가 문의를 볼수 없을때 -->
                
                <div>
           
                    <ul class="notice-show">
                    <% if(!inquiyBoardList.isEmpty()){ %>
	                <% for(InquiyBoard inquiyBoards : inquiyBoardList) { %>
	                <%-- <% if(inquiyBoards.getWriter().equals(loginUser.getUserId()) || loginUser.getUserRole() == UserRole.A) %> --%>
	                 
                        <li class="notice-list" style="border-bottom: 1px solid rgba(0,0,0,0.4); list-style: none;">
                            <div style="padding: 35px 0 35px 0; display: block;" class="menu">
                            	<% inquiyBoards.setContent(HelloMvcUtils.convertLineFeedToBr(HelloMvcUtils.escapeHtml(inquiyBoards.getContent()))); %>
                                <p style="margin: 0;"><b>[이용문의]</b> <%= inquiyBoards.getContent().substring(0, 1) %>
                                
                                	<!-- 아이콘  -->
                                    <svg xmlns="http://www.w3.org/2000/svg" style="float: right;" width="20" height="20" fill="currentColor" class="bi bi-chevron-expand" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zm0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708z"/>
                                    </svg>
                                </p>
                                <span>작성일 <%= inquiyBoards.getRegDate() %></span>
                            </div>
                            <div class="content" style="display: none; background: #fafafa; padding: 35px 32px 50px; margin-bottom: 0px ;">
	                            <div style="margin-bottom: 8px;">
	                            	<b>문의</b>
	                            	<span style="float: right;">
	                            	<% if(loginUser != null && inquiyBoards.getWriter().equals(loginUser.getUserId())) { %>
			                            <input type="button" value="수정" onclick="updateInquiy(<%= inquiyBoards.getInquiyNo() %>)" />
			                            <input type="button" value="삭제" onclick="deleteInquiy(<%= inquiyBoards.getInquiyNo() %>)" />
	                            	<% } %>
	                            	</span>
	                            </div>
	                            <!-- 문의내용 -->
	                            <div><%= inquiyBoards.getContent() %></div>
	                            
	                            <!-- 답변시작 -->
	                  			<% for(InquiyBoardComment Comments : inquiyBoards.getListComment()) { %>
	                            <div>
                                    <div style="margin-top: 50px; padding-left: 25px; margin-bottom: 8px;">
                                        <svg xmlns="http://www.w3.org/2000/svg"width="20" height="20" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                        <b>답변</b> 작성일 <%= Comments.getRegDate() %>
                                    </div>
                                    <div style="padding-left: 50px; margin-bottom: 30px;">
                                        <%= Comments.getContent() %>
                                    </div>
                                </div>
                                 <% } %>
                                	<!-- 답변등록폼 관리자만 보이게 -->
                                	<% if(canAdmin) { %>
                                <div>
                                    <form action="<%= request.getContextPath() %>/board/inquiyBoardCommentEnroll" method="post" name="inquiyBoardCommentEnrollFrm" style="padding-left: 50px; margin: 30px 0 30px 0;">
                                    	<input type="hidden" name="inquiyCommentNo" value="" />
                                    	<input type="hidden" name="inquiyNo" value="<%= inquiyBoards.getInquiyNo()%>" />
                                        <input type="hidden" name="writer" value="<%= loginUser.getUserId() %>" />
                                        <input type="hidden" name="inquiyCommentLevel" value="1" />    
                                        <textarea name="content" cols="70" rows="5" style="resize: vertical;"></textarea>
                                        <button type="submit" id="btn-comment-enroll1">답변등록</button>
                                    </form>
                                </div>
                                	<% } %>
                            		
                            </div>
                         </li>
                    </ul>
	                     <% } %>
	                            
                    <% } else { %>
	                    <div class="non-inquriy-list" >
	                    <div><b>등록된 1:1 문의가 없습니다.</b></div> 
	                    <p>회원님들의 소중한 의견에 귀기울여<br>신속하고 정확하게 답변하겠습니다.</p>
                		</div>
                		<% } %>
                </div>
            </div>
        </div>
    </div>
    <form action="<%= request.getContextPath() %>/board/inquiyBoardDelete" name="inquiyBoardDeleteFrm" method="POST">
    	<input type="hidden" name="inquiyNo" value=""  />
    </form>
    
    <form action="<%= request.getContextPath() %>/board/inquiyBoardUpdate" name="updateInquiyFrm" method="GET">
    	<input type="hidden" name="inquiyNo" value="" />
    </form>
    <script>
    const deleteInquiy = (inquiyNo) => {
    	document.inquiyBoardDeleteFrm.inquiyNo.value = inquiyNo;
    	document.inquiyBoardDeleteFrm.submit();
    }
    const updateInquiy = (inquiyNo) => {
    	console.log(inquiyNo);
    	document.updateInquiyFrm.inquiyNo.value = inquiyNo;
    	document.updateInquiyFrm.submit();
    }
    
    </script>
    <script>
        $(".menu").click((e) => {
             console.log(e.target);
             console.log(e.target.tagName);
                 
             let div = e.target;
             if(e.target.tagName == 'P' || e.target.tagName == 'svg') {
                 div = e.target.parentElement;
             }
             $(div).next("div").slideToggle();
         });
    </script>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>