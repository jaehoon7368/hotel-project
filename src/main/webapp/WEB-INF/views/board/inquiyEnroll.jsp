<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/inquiry/inquiryEnroll.css" />

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
			            <!-- 관리자만 -->
			            <% boolean canAdmin = loginUser != null && (loginUser.getUserRole() == UserRole.A); 
							if(canAdmin) {
						%>
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
                    <% if(loginUser != null) {%>
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyEnroll'" style="color: #f7323f; font-weight: bold;">새 문의 작성</span>
                    <% } %>
                </div>
                <!-- 문의리스트 -->
                <div class="inquriy-list">
                    <div class="non-inquriy-list">
                       

                    </div>
                </div>
                <!-- 문의 작성 -->
                <div>
                    <form action="<%= request.getContextPath() %>/board/inquiyEnroll" method="post" name="inquiyEnrollFrm">
                        <div>
                            <div class="form-top">서비스 이용중 불편사항을 문의주시면 최대한 빠른시일내에 답변 드리겠습니다.</div>
                            <table>
	                             <input type="hidden" name="writer" value="<%= loginUser.getUserId() %>" />
	                             <!--<div class="inquiy-enroll">카테고리</div>
                                 <div class="inquiy-enroll">
                                     <select name="productType" id="" class="user-input" style="height: 30px; width: 725px; font-size: 16px; color: rgba(0,0,0,0.60);">
                                         <option value="">카테고리 유형을 선택하세요</option>
                                         <option value="호텔">호텔</option>
                                         <option value="모텔">모텔</option>
                                         <option value="펜션">펜션</option>
                                     </select>
                                 </div>	 -->
                                 <div class="inquiy-enroll">문의유형</div>
								 <div class="inquiy-enroll">
                                     <select name="inquiyType" id="" class="user-input" style="height: 30px; width: 725px; font-size: 16px; color: rgba(0,0,0,0.60);">
                                         <option value="">문의유형을 선택하세요.</option>
                                         <option value="예약/결제">예약/결제</option>
                                         <option value="취소/환불">취소/환불</option>
                                         <option value="이용문의">이용문의</option>
                                         <option value="회원정보">회원정보</option>
                                         <option value="판매자신청">판매자신청</option>
                                     </select>
								 </div>
								 <div class="inquiy-enroll">휴대폰 번호</div>             
								 <div class="inquiy-enroll"><input type="tel" name="phone" class="user-input" placeholder="선택사항 입니다." style="height: 30px; width: 700px; font-size: 16px;"></div>                   
                                 <div class="inquiy-enroll">이메일</div>
                                 <div class="inquiy-enroll"><input type="email" name="email" class="user-input" placeholder="선택사항 입니다." style="height: 30px; width: 700px; font-size: 16px;"></div>
                                 <div class="inquiy-enroll">문의내용</div>
                                 <div class="inquiy-enroll"><textarea name="content" id="" cols="80" rows="10" style="resize: vertical;  font-size: 16px;"  placeholder="문의하실 내용을 입력해주세요"></textarea></div>
                                 <div class="inquiy-enroll">
		                            <input type="submit" value="작성하기" class="enroll-btn" style="width: 100px; height: 50px; font-size: 18px;">
		                            <input type="button" value="취소하기" class="cancel-btn" onclick="history.go(-1);" style="width: 100px; height: 50px; font-size: 18px;"/>
                                 </div>
                            </table>
                        </div>
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