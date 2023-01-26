<%@page import="com.sh.airbnb.user.model.dto.UserRole"%>
<%@page import="java.util.List"%>
<%@page import="com.sh.airbnb.board.model.dto.InquiyBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<%
	List<InquiyBoard> inquiyBoardList = (List<InquiyBoard>)request.getAttribute("inquiyBoardList");
%>

<style>
		#inquiy-content {
            width: 1024px;
            height: 100%;
            margin: auto;
        }
        .wrap {
            padding: 54px 0 50px 0;
        }
        .board-menu {
            width: 210px;
            margin: 0;
            display: block;
            float: left;
        }
        .board-menu-list {
            list-style: none;
            margin: 0;
        }
        .board-menu-list li {
            margin-bottom: 24px;
        }
        #inquiy-content>nav>ul>li>a {
            color: rgba(0,0,0,0.60);
            text-decoration: none;
            /* display: block; */
            font-size: 18px;
        }
        .inquriy {
            width: 770px; 
            height: 100%;
            float: right;
        }
        .inquriy-board {
            width: 770px;
            height: 100%;
        }
        .inquriy-head {
            font-size: 18px;
            border-bottom: rgba(0,0,0,0.3) solid 1px;
            height: 41px;
            margin: 0;
            padding: 0;
        }
        .tab-btn {
            margin-right: 22px;
            color: rgba(0,0,0,0.6);
            height: 40px;
            line-height: normal;
        }
        .non-inquriy-list {
            padding-top: 120px;
            text-align: center;
            height: 373px;
        }
</style>
    <div id="inquiy-content" class="wrap">
        <nav class="board-menu">
            <ul class="board-menu-list">
                <li><a href="<%= request.getContextPath() %>/board/noticeBoardList">공지사항</a></li>
                <li><a href="">이벤트</a></li>
                <li><a href="">자주 묻는 질문</a></li>
                <li><a href="<%= request.getContextPath() %>/board/inquiyBoardList" style="color: #f7323f; font-weight: bold;">1:1 문의</a></li>
                <li><a href="">약관 및 정책</a></li>
                <li><a href="">채용 약관</a></li>
            </ul>
        </nav>
        <div class="inquriy">
            <div class="inquriy-board">
                <div class="inquriy-head">
                    <span class="tab-btn" style="color: #f7323f; font-weight: bold;">나의 문의 내역</span>
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyEnroll'">새 문의 작성</span>
                </div>
                <!-- 문의가 없을때 -->
                
                <div>
           
                    <ul class="notice-show">
                    <% if(loginUser != null) { %>
                    <% for(InquiyBoard inquiyBoards : inquiyBoardList) { %>
                    
                    
	                 <% if(loginUser != null && 
	                    (loginUser.getUserId().equals(inquiyBoards.getWriter())) || loginUser.getUserRole() == UserRole.A) { %>
                        <li class="notice-list" style="border-bottom: 1px solid rgba(0,0,0,0.4);">
                            <div style="padding: 35px 0 35px 0; display: block;" class="menu">
                                <p style="margin: 0;">[문의] <%= inquiyBoards.getContent().substring(0, 1) %>
                                    <svg xmlns="http://www.w3.org/2000/svg" style="float: right;" width="20" height="20" fill="currentColor" class="bi bi-chevron-expand" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zm0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708z"/>
                                    </svg>
                                </p>
                                <span><%= inquiyBoards.getRegDate() %></span>
                            </div>
                            <div class="content" style="display: none; background: #fafafa; padding: 12px 16px; margin-bottom: 12px ;">
                            		<%= inquiyBoards.getContent() %>
                            		<br />
                            		<br />
                            		<hr />
                            		<br />
	                            <input type="button" value="수정" onclick="updateInquiy(<%= inquiyBoards.getInquiyNo() %>)" />
	                            <input type="button" value="삭제" onclick="deleteInquiy(<%= inquiyBoards.getInquiyNo() %>)" />
                            </div>
                         </li>
                         <% }
                     }   %>
                   <% } else {%>
                    </ul>
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