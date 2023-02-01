<%@page import="com.sh.airbnb.board.model.dto.InquiyBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/inquiry/inquiryUpdate.css" />
<%
	InquiyBoard inquiyBoard = (InquiyBoard) request.getAttribute("inquiyBoard");
%>

<div id="content-main" class="wrap">
        <content>
    		<div class="sidebar">
        		<nav class="userView-nav">
          			<ul>
			            <li><a href="<%= request.getContextPath() %>/board/noticeBoardList">공지사항</a></li>
			            <hr>
			            <li><a href="<%= request.getContextPath()%>/board/faqBoardList">자주 묻는 질문</a></li>
			            <hr>
			            <li class="active"><a href="<%= request.getContextPath()%>/board/inquiyBoardList">1:1 문의</a></li>
			            <hr>
			            <% if(loginUser.getUserId() != null && loginUser.getUserRole() == UserRole.A) {%>
			            <li><a href="<%= request.getContextPath() %>/board/admininquiyList">1:1 답변</a></li>
			            <hr />
			            <% } %>
		           </ul>
        		</nav>
    	   </div>
		</content>
	<div class="inquriy">
            <div class="inquriy-board">
                <div class="inquriy-head">
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyBoardList'">나의 문의 내역</span>
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyEnroll'">새 문의 작성</span>
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyBoardUpdate?inquiyNo=<%= inquiyBoard.getInquiyNo() %>'" style="color: #f7323f; font-weight: bold;">문의 수정</span>
                </div>
                <!-- 문의리스트 -->
                <div class="inquriy-list">
                    <div class="non-inquriy-list">
                       

                    </div>
                </div>
                <!-- 문의 작성 -->
                <div>
                    <form action="<%= request.getContextPath() %>/board/inquiyBoardUpdate" method="post" name="inquiyBoardUpdateFrm">
                        <div>
                            <div class="form-top">서비스 이용중 불편사항을 문의주시면 최대한 빠른시일내에 답변 드리겠습니다.</div>
                            <table>
	                             <input type="hidden" name="writer" value="<%= loginUser.getUserId() %>" />
	                             <div class="inquiy-enroll">카테고리</div>
                                 <div class="inquiy-enroll">
                                     <select name="productType" class="product-input">
                                         <option value="<%= inquiyBoard.getProductType() %>"><%= inquiyBoard.getProductType() %></option>
                                         <option value="호텔">호텔</option>
                                         <option value="모텔">모텔</option>
                                         <option value="펜션">펜션</option>
                                     </select>
                                 </div>	
                                 <div class="inquiy-enroll">문의유형</div>
								 <div class="inquiy-enroll">
                                     <select name="inquiyType" class="inquiy-input">
                                         <option value="<%= inquiyBoard.getInquiyType() %>"><%= inquiyBoard.getInquiyType() %></option>
                                         <option value="예약/결제">예약/결제</option>
                                         <option value="취소/환불">취소/환불</option>
                                         <option value="이용문의">이용문의</option>
                                         <option value="이용문의">회원정보</option>
                                     </select>
								 </div>
								 <div class="inquiy-enroll">휴대폰 번호</div>             
								 <div class="inquiy-enroll"><input type="tel" name="phone" value="<%= inquiyBoard.getPhone() %>" class="phone-input" placeholder="선택사항 입니다." ></div>                   
                                 <div class="inquiy-enroll">이메일</div>
                                 <div class="inquiy-enroll"><input type="email" name="email" value="<%= inquiyBoard.getEmail() %>" class="email-input" placeholder="선택사항 입니다."></div>
                                 <div class="inquiy-enroll">문의내용</div>
                                 <div class="inquiy-enroll"><textarea name="content" id="" cols="110" rows="10" class="content-input"  placeholder="문의하실 내용을 10자 이상 입력해주세요"><%= inquiyBoard.getContent() %></textarea></div>
                                 <div class="inquiy-enroll">
		                            <input type="submit" value="수정하기" class="enroll-btn">
		                            <input type="button" value="취소하기" class="cancel-btn" onclick="history.go(-1);"/>
                                 </div>
                            </table>
                        </div>
                        <input type="hidden" name="inquiyNo" value="<%= inquiyBoard.getInquiyNo() %>" />
                    </form>
                </div>
                

            </div>

        </div>
 </div>
  <script>
 document.inquiyEnrollFrm.onsubmit = (e) => {
		
		const content = e.target.content;
		console.log(content);
						   
		//내용을 작성하지 않은 경우 폼제출할 수 없음.
		if(!/^(.|\n)+$/.test(content.value)){
			alert("내용을 작성해주세요.");
			content.select();
			return false;
		}
	}
 </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>