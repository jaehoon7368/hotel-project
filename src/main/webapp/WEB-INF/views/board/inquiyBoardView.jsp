<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<style>
#inquiy-main {
            width: 1024px;
            height: 1000px;
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
        #inquiy-main>nav>ul>li>a {
            color: rgba(0,0,0,0.60);
            text-decoration: none;
            font-size: 18px;
        }
        .inquriy {
            width: 770px; 
            height: 300px;
            float: right;
        }
        .inquriy-board {
            width: 770px;
            height: 500px;
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
        .inquiry-content {padding-bottom: 10px;}
</style>
<div id="inquiy-main" class="wrap">
        <nav class="board-menu">
            <ul class="board-menu-list">
                <li><a href="">공지사항</a></li>
                <li><a href="">이벤트</a></li>
                <li><a href="">자주 묻는 질문</a></li>
                <li><a href="" style="color: #f7323f; font-weight: bold;">1:1 문의</a></li>
                <li><a href="">약관 및 정책</a></li>
                <li><a href="">채용 약관</a></li>
            </ul>
        </nav>
        <div class="inquriy">
            <div class="inquriy-board">
                <div class="inquriy-head">
                    <span class="tab-btn" style="color: #f7323f; font-weight: bold;">나의 문의 내역</span>
                    <span class="tab-btn">새 문의 작성</span>
                </div>
                <!-- 문의가 없을때 -->
                <!-- <div class="inquriy-list"> -->
                    <div class="non-inquriy-list" style="display: none;" >
                       <div><b>등록된 1:1 문의가 없습니다.</b></div> 
                        <p>회원님들의 소중한 의견에 귀기울여<br>신속하고 정확하게 답변하겠습니다.</p>
                    </div>
                <!-- </div> -->
                <div>
                    <ul class="notice-show" style="text-decoration: none; padding: 0;">
                        <li class="notice-list" style="border-bottom: 1px solid rgba(0,0,0,0.4); list-style: none; ">
                            <div style="padding: 35px 0 35px 0; display: block;" class="menu">
                                <p style="margin: 0;">[이용문의] 서비스 점검 안내
                                   
                                </p>
                                <span>2023.01.12</span>
                            </div>
                        
                            <div class="content" style="background: #f8f5f5; padding: 35px 35px; margin-bottom: 0px ;">
                                <div>
                                    <div class="inquiry-content">숙소유형 : 호텔</div>
                                    <div class="inquiry-content">문의유형 : 예약/결제</div>
                                    <div class="inquiry-content">휴대폰 번호 : 01012347890</div>
                                    <div class="inquiry-content">이메일 : qwerty@naver.com</div>
                                    <div class="inquiry-content">문의내용</div>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                    Facere, fugiat officia. Tenetur, qui.
                                    Numquam ipsum voluptatibus nam, nihil reprehenderit id saepe,
                                    quia distinctio necessitatibus, molestias quaerat voluptatem consequatur odio! Dicta!
                                </div>
                                <div>
                                    <div style="margin-top: 50px; padding-left: 25px; margin-bottom: 8px;">
                                        <svg xmlns="http://www.w3.org/2000/svg"width="20" height="20" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                        <b>답변</b> 작성일 2023.01.25
                                    </div>
                                    <div style="padding-left: 50px; margin-bottom: 30px;">
                                        답변내용kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk <br>
                                        답변내용kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk <br>
                                        답변내용kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk <br>
                                    </div>
                                </div>
                                <div>
                                    <form action="" method="post" name="" style="padding-left: 50px; margin: 30px 0 30px 0;">
                                        <input type="hidden" name="inquiyCommentNo" value="" />
                                        <input type="hidden" name="writer" value="" />
                                        <input type="hidden" name="inquiyCommentLevel" value="1" />    
                                        <textarea name="content" cols="70" rows="5" style="resize: vertical;"></textarea>
                                        <button type="submit" id="btn-comment-enroll1">답변등록</button>
                                    </form>
                                </div>
                            </div>
                         </li>
                    </ul>
                </div>
        	</div>
    	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
