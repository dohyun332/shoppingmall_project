<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매/결제</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/nav.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/orders.css">
    <script src="/js/1.12.4.js"></script>
    <script src="/js/nav.js?ver=1"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&display=swap');
        * {font-family: 'Noto Sans KR', sans-serif;}
    </style>

    <c:set var="loginoutLink" value="${ sessionScope.id==null?'/login/login':'/login/logout'  }" />
    <c:set var="loginoutTxt" value="${ sessionScope.id==null?'로그인':'로그아웃'  }" />
    <c:set var="signInTxt" value="${ sessionScope.id==null?'<a href=/login/join>회원가입</a>':''}" />

</head>
<body>
<header>
    <div id="t_banner">
        <div class="contents_area">광고 링크</div>
    </div>
    <div class="search_disable"></div>
    <div class="search_pan">
        <img src="/img/icons/m_close_btn_black.png" alt="" class="s_close">
        <h1>검색</h1>
        <form action="" class="search_box">
            <input type="text" name="search" id="search">
            <input type="submit" value="" id="search_icon">
        </form>
        <div class="search_ads">
            <a href="/product/productList?cate=K">
                <img src="/img/banner/menu_banner_kids.jpg" alt="">
            </a>
            <a href="/product/productList?cate=W">
                <img src="/img/banner/menu_banner_review.jpg" alt="">
            </a>
        </div>
    </div>

    <div class="header_wrap">
        <nav class="contents_area">
            <div class="logo_area">
                <div class="ham_btn">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <a href="/" class="logo_box">
                    <img src="/img/header_logo_bk.png" alt="logo" class="logo">
                </a>
            </div>
            <div class="category">
                <ul>
                    <li>
                        <a href="/product/productList?cate=O">아울렛</a>
                    </li>
                    <li>
                        <a href="/product/productList?cate=W">우먼</a>
                        <div class="nav_cate_box">
                            <a href="/product/productList?cate=WT">상의</a>
                            <a href="/product/productList?cate=WB">하의</a>
                            <a href="/product/productList?cate=WO">아우터</a>
                            <a href="/product/productList?cate=WI">이너웨어</a>
                        </div>
                    </li>
                    <li>
                        <a href="/product/productList?cate=M">맨즈</a>
                        <div class="nav_cate_box">
                            <a href="/product/productList?cate=MT">상의</a>
                            <a href=/product/productList?cate=MB">하의</a>
                            <a href="/product/productList?cate=MO">아우터</a>
                            <a href="/product/productList?cate=MI">이너웨어</a>
                        </div>
                    </li>
                    <li>
                        <a href="/product/productList?cate=K">키즈</a>
                        <div class="nav_cate_box">
                            <a href="/product/productList?cate=KT">상의</a>
                            <a href="/product/productList?cate=KB">하의</a>
                        </div>
                    </li>
                    <li>
                        <a href="/product/productList?cate=G">골프</a>
                        <div class="nav_cate_box">
                            <a href="/product/productList?cate=GT">상의</a>
                            <a href="/product/productList?cate=GB">하의</a>
                        </div>
                    </li>
                    <li>
                        <a href="/product/productList?cate=1">1+1</a>
                    </li>
                    <li>
                        <a href="/">커뮤니티</a>
                        <div class="nav_cate_box">
                            <a href="/">공지사항</a>
                            <a href="/">리뷰</a>
                        </div>
                    </li>
                </ul>
            </div>
            <ul class="icons">
                <li>
                    <img src="/img/icons/menu_view.png" alt="search icon" class="search_icon_nav">
                </li>
                <li>
                    <a href="/product/cart">
                        <img src="/img/icons/menu_cart.png" alt="">
                    </a>
                </li>
                <li>
                    <a href="/login/login">
                        <img src="/img/icons/menu_mypage.png" alt="">
                    </a>
                    <div class="nav_cate_box sub_box">
                        <a href="${loginoutLink}">${loginoutTxt}</a>
                        ${signInTxt}
                        <a href="">주문조회</a>
                        <a href="">배송조회</a>
                        <a href="">고객센터</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="all_menu">
            <div class="contents_area">
                <div class="top_l">
                    <a href="/product/productList?cate=O">아울렛</a>
                    <a href="/product/productList?cate=1">1+1</a>
                </div>
                <ul>
                    <li>
                        <a href="/product/productList?cate=W" class="m_nav_cate">우먼</a>
                        <a href="/product/productList?cate=WT" class="m_nav_cate_more">상의</a>
                        <a href="/product/productList?cate=WB" class="m_nav_cate_more">하의</a>
                        <a href="/product/productList?cate=WO" class="m_nav_cate_more">아우터</a>
                        <a href="/product/productList?cate=WI" class="m_nav_cate_more">이너웨어</a>
                    </li>
                    <li>
                        <a href="/product/productList?cate=M" class="m_nav_cate">맨즈</a>
                        <a href="/product/productList?cate=MT" class="m_nav_cate_more">상의</a>
                        <a href="/product/productList?cate=MB" class="m_nav_cate_more">하의</a>
                        <a href="/product/productList?cate=MO" class="m_nav_cate_more">아우터</a>
                        <a href="/product/productList?cate=MI" class="m_nav_cate_more">이너웨어</a>
                    </li>
                    <li>
                        <a href="/product/productList?cate=K" class="m_nav_cate">키즈</a>
                        <a href="/product/productList?cate=KT" class="m_nav_cate_more">상의</a>
                        <a href="/product/productList?cate=KB" class="m_nav_cate_more">하의</a>
                    </li>
                    <li>
                        <a href="/product/productList?cate=G" class="m_nav_cate">골프</a>
                        <a href="/product/productList?cate=GT" class="m_nav_cate_more">상의</a>
                        <a href="/product/productList?cate=GB" class="m_nav_cate_more">하의</a>
                    </li>
                    <li>
                        <a href="/" class="m_nav_cate">커뮤니티</a>
                        <a href="/" class="m_nav_cate_more">공지사항</a>
                        <a href="/" class="m_nav_cate_more">리뷰</a>
                    </li>
                    <li class="m_mypage">
                        <a href="#none" class="m_nav_cate">마이페이지</a>
                        <a href="/login" class="m_nav_cate_more">로그인</a>
                        <a href="/join" class="m_nav_cate_more">회원가입</a>
                        <a href="" class="m_nav_cate_more">주문조회</a>
                        <a href="" class="m_nav_cate_more">배송조회</a>
                        <a href="" class="m_nav_cate_more">고객센터</a>
                    </li>
                </ul>
                <div class="ads">
                    <a href="/product/productList?cate=K">
                        <img src="/img/banner/menu_banner_kids.jpg" alt="">
                    </a>
                    <a href="/product/productList?cate=W">
                        <img src="/img/banner/menu_banner_review.jpg" alt="">
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>

<main>
    <div class="contents_area">
        <div id="wrap2">
            <h2 class="title">주문 / 결제</h2>
            <table class="ordersPd">
                <colgroup>
                    <col style="width:50%;">
                    <col style="width:25%;">
                    <col style="width:25%;">
                </colgroup>
                <tr class="tb_menu">
                    <td>상품명</td>
                    <td>수량</td>
                    <td>가격</td>
                </tr>
                <c:forEach var="cartProductDto" items="${orderList}">
                <tr class="tb_content">
                    <td class="pd_info">
                        <div class="pd_img">
                            <img src="../img/product_detail/${cartProductDto.p_productImg_DM}" alt=""></div>
                        <div class="pd_txt">
                            <div class="pd_name">${cartProductDto.p_product}</div>
                            <div class="pd_opt">${cartProductDto.p_choiceSize}</div>
                        </div>
                    </td>
                    <td class="pd_cnt">${cartProductDto.p_choiceQuantity}</td>
                    <td class="pd_price">
                        <fmt:formatNumber value="${cartProductDto.p_price}" pattern="#,###" />원
                    </td>
                </tr>
                </c:forEach>
            </table>

            <h3>주문자정보</h3>
            <form action="" id="frm">
                <table class="order_info">
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:85%;">
                    </colgroup>
                    <tr>
                        <td class="order_menu">이름</td>
                        <td id="order_name">${orderNameMailDto.m_name}</td>
                    </tr>
                    <tr>
                        <td class="order_menu">이메일</td>
                        <td class="emailBox">
                            <input type="text" name="email1" id="email1" value="${email1}">
                            @
                            <input type="text" name="email2" id="email2" value="${email2}">
                            <select id="mailProvider">
                                <option value="">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="gmail.com">gmail.com</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="order_menu">연락처</td>
                        <td class="p_cellBox">
                            <input type="text" value="010" readonly>
                            -
                            <input type="text" name="p_cell1" id="p_cell1">
                            -
                            <input type="text" name="p_cell2" id="p_cell2">
                            <input type="hidden" id="m_zipCode" value="${orderNameMailDto.m_zipCode}">
                            <input type="hidden" id="m_addr1" value="${orderNameMailDto.m_addr1}">
                            <input type="hidden" id="m_addr2" value="${orderNameMailDto.m_addr2}">
                        </td>
                    </tr>
                </table>

                <h3>배송정보</h3>
                <input type="checkbox" id="copy_info">위 정보와 같음
                <table class="address_info">
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>

                    <tr class="row1">
                        <td class="address_menu">이름</td>
                        <td colspan="3" ><input type="text" id="p_deliveryName" name="p_deliveryName"></td>
                    </tr>
                    <tr class="row1">
                        <td class="address_menu">연락처1</td>
                        <td class="del_cellBox">
                            <input type="text" value="010" readonly>
                            -
                            <input type="text" name="p_deliveryCell1_1" id="p_deliveryCell1_1">
                            -
                            <input type="text" name="p_deliveryCell1_2" id="p_deliveryCell1_2">
                        </td>
                        <td class="address_menu">연락처2</td>
                        <td class="del_cellBox">
                            <input type="text" value="010" readonly>
                            -
                            <input type="text" name="p_deliveryCell2_1" id="p_deliveryCell2_1">
                            -
                            <input type="text" name="p_deliveryCell2_2" id="p_deliveryCell2_2">
                        </td>
                    </tr>

                    <tr class="row1">
                        <td class="address_menu">배송지선택</td>
                        <td colspan="3">
                            <label for="p_homeAddr1">
                                <input type="radio" name="p_homeAddr" id="p_homeAddr1" value="0">자택
                            </label>
                            <label for="p_homeAddr2">
                                <input type="radio" name="p_homeAddr" id="p_homeAddr2" value="1">최근배송지
                            </label>
                            <select id="desti_recent">
                                <option value="x" disabled selected>최근배송지</option>
                                <c:forEach var="odd" items="${destiList}">
                                    <option value="${odd.p_zipCode}: ${odd.p_destination1}, ${odd.p_destination2}">${odd.p_zipCode}: ${odd.p_destination1}, ${odd.p_destination2}</option>
                                </c:forEach>
                            </select>
                            <label for="p_homeAddr3">
                                <input type="radio" name="p_homeAddr" id="p_homeAddr3" value="1">신규배송지
                            </label>
                        </td>
                    </tr>
                    <tr class="row2">
                        <td class="address_menu">주소</td>
                        <td colspan="3">
                            <div class="zipCodeBox">
                                <input type="text" name="p_zipCode" id="p_zipCode" placeholder="우편번호">
                                <input type="button" onclick="Postcode()" value="우편번호찾기">
                            </div>
                            <div class="destiBox">
                                <input type="text" name="p_destination1" id="p_destination1" placeholder="기본주소">
                                <input type="text" name="p_destination2" id="p_destination2" placeholder="상세주소">
                                <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                                    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="row2">
                        <td class="address_menu">
                            배송메세지
                            <div>(100자)</div>
                        </td>
                        <td colspan="3" class="msgBox">
                            <textarea name="p_deliveryMessage" id="p_deliveryMessage" cols="80" rows="3"></textarea>
                        </td>
                    </tr>
                </table>
                <table class="calc_tb">
                    <colgroup>
                        <col style="width:calc(30%);">
                        <col style="width:calc(5%);">
                        <col style="width:calc(30%);">
                        <col style="width:calc(5%);">
                        <col style="width:calc(30%);">
                    </colgroup>
                    <tr>
                        <td>상품금액</td>
                        <td></td>
                        <td>배송비</td>
                        <td></td>
                        <td>결제예정금액</td>
                    </tr>
                    <tr>
                        <td id="total_price1"></td>
                        <td>+</td>
                        <td>2,500</td>
                        <td>=</td>
                        <td id="total_price2"></td>
                    </tr>
                </table>

                <h3>결제정보</h3>
                <table class="pay_tb">
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:85%;">
                    </colgroup>
                    <tr>
                        <td class="menu_txt">결제방법</td>
                        <td>
                            <label for="p_pay1">
                                <input type="radio" name="p_pay" id="p_pay1" value="0">신용카드
                            </label>
                            <label for="p_pay2">
                                <input type="radio" name="p_pay" id="p_pay2" value="1">휴대폰 결제
                            </label>
                            <label for="p_pay3">
                                <input type="radio" name="p_pay" id="p_pay3" value="2">실시간 계좌이체
                            </label>

                        </td>
                    </tr>
                </table>

                <h3>주문자동의</h3>
                <table class="agree_tb">
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:85%;">
                    </colgroup>
                    <tr>
                        <td class="menu_txt">개인정보 수집/이용</td>
                        <td>
                            <table class="condition_tb" border="1">
                                <colgroup>
                                    <col style="width:calc(100% / 3);">
                                    <col style="width:calc(100% / 3);">
                                    <col style="width:calc(100% / 3);">
                                </colgroup>
                                <tr>
                                    <td>목적</td>
                                    <td>항목</td>
                                    <td>보유기간</td>
                                </tr>
                                <tr>
                                    <td>주문자 정보 확인, 주문 내역 안내, 주문 내역 조회
                                    </td>
                                    <td>주문자 정보(연락처, 이메일)
                                    </td>
                                    <td rowspan="2">주문일로부터 90일까지 보유하며, 관계 법령에 따라 5년간 보관</td>
                                </tr>
                                <tr>
                                    <td>상품 배송(구매/환불/취소/교환)을 위한 수취인 정보
                                    </td>
                                    <td>수취인 정보(이름, 연락처1, 연락처2, 주소)
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="menu_txt">주문동의</td>
                        <td>
                            <input type="checkbox" id="order_agree">상기 약관 및 개인정보 수집/이용에 대한 동의 내용과 결제정보를 확인하였으므로 구매진행에 동의합니다.
                        </td>
                    </tr>
                </table>
                <table class="total_tb">
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:85%;">
                    </colgroup>
                    <tr>
                        <td class="menu_txt">최종결제금액</td>
                        <td id="total_price3"></td>
                    </tr>
                </table>
                <div class="btn_box">
                    <button id="submit_order" class="btn">주문하기</button>
                    <button id="cancel_order" class="btn">취소하기</button>
                </div>
            </form>
        </div>
    </div>
</main>

<footer>
    <div class="contents_area">
        <div class="footer_L">
            <div class="footer_title">
                <a href="#" class="logo_box">
                    <img src="/img/header_logo_bk.png" alt="logo" class="logo">
                </a>
                <span>애슬레저 1위, 브랜드 고객충성도 애슬레저룩 부문 2년 연속 대상 [2021. 2022]</span>
            </div>
            <div class="info">
                <ul class="footer_menu">
                    <li><a href="">브랜드 스토리</a></li>
                    <li><a href="">회사 소개</a></li>
                    <li><a href="">이용 약관</a></li>
                    <li><a href="">개인정보처리방침</a></li>
                    <li><a href="">고객센터</a></li>
                </ul>
                <ul class="footer_menu">
                    <li>사업자명 : (주)브랜드엑스코퍼레이션</li>
                    <li> 대표자명 : 이수연,강민준</li>
                    <li>팩스 : 02-2179-9410</li>
                </ul>
                <ul class="footer_menu">
                    <li>주소 : 서울시 성동구 뚝섬로1길 63 영창디지탈타워 B2F,4F,6F,12F,16F</li>
                    <li>대표전화 : 1661-2811</li>
                </ul>
                <ul class="footer_menu">
                    <li>반품주소지 : 경기도 의정부시 산단로98번길 65 3층 젝시믹스</li>
                </ul>
                <ul class="footer_menu">
                    <li>사업자등록번호 : 550-86-00867 [사업자정보확인] </li>
                    <li>통신판매업신고번호 : 2019-서울성동-01148</li>
                </ul>
                <ul class="footer_menu">
                    <li>제안/제휴문의 : 온라인 brx_brmkt@brandxcorp.com / 오프라인 brxoffline@brandxcorp.com / 해외 xexybiz@brandxcorp.com</li>
                </ul>
                <ul class="footer_menu">
                    <li>개인정보보호책임자 : 강교혁 (asitakak@brandxcorp.com)</li>
                </ul>
                <div class="copyright">
                    <ul class="footer_menu">
                        <li>젝시믹스 마케팅은 <a href="">이루다마케팅</a>이 함께합니다.</li>
                        <li>호스팅사 : (주)코리아센터</li>
                    </ul>
                    <ul class="footer_menu">
                        <li>Copyright 2015 Xexymix All Rights Reserved.</li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="footer_R">
            <ul class="R_L">
                <li>1611-2811</li>
                <li>평일   10:00 - 17:00</li>
                <li>점심   12:30 - 14:00</li>
                <li>휴일   토/일/공휴일</li>
                <li><a href="">고객만족센터 <span>></span></a></li>
            </ul>
            <ul class="R_M">
                <li>BANK INFO</li>
                <li>우리은행   1005-703-294024</li>
                <li>국민은행   431801-01-213327</li>
                <li>농       협   301-0259-9190-41</li>
                <li>(주)브랜드엑스코퍼레이션</li>
                <li>입금자명 불일치시 자동연동이 되지않습니다.</li>
                <li>고객센터 또는 Q&A 문의주세요.</li>
            </ul>
            <ul class="R_R">
                <li>SHOP MENU</li>
                <li><a href="">공지사항</a></li>
                <li><a href="">회원정책</a></li>
                <li><a href="">전국매장안내</a></li>
                <li><a href="">강사회원</a></li>
                <li><a href="">기업회원</a></li>
            </ul>
            <div class="B_R">
                <div class="con"></div>
                <div>젝시믹스는 정보보호 관리체계 인증을 받은 안전한 쇼핑몰입니다.</div>
            </div>
        </div>
        <div class="footer_B">
            <div class="B_L">고객님은 안전거래를 위해 현금 등으로 결제하실 때 저희 쇼핑몰에서 가입한 토스페이먼츠(02-006-00059)의 구매안전서비스를 이용하실 수 있습니다. [서비스가입사실확인]</div>

        </div>
    </div>
</footer>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("p_destination2").value = extraAddr;

                } else {
                    document.getElementById("p_destination2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('p_zipCode').value = data.zonecode;
                document.getElementById("p_destination1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("p_destination2").focus();
            }
        }).open();
    }
</script>
<script src="/js/orders.js"></script>
</body>
</html>