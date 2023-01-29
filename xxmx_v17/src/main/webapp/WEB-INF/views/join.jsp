<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다는 뜻 --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>젝시믹스 - 회원가입</title>

    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/nav.css">
    <link rel="stylesheet" href="/css/join.css?add1">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <script defer src="/js/join.js"></script>
    <script defer src="/js/join2.js"></script>

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

<div class="join_main">
    <h2>회원가입</h2>
    <form method="post" action="<c:url value="/login/join" />" id="join" name="join">
        <table>
            <tr class="id_tr">
                <th>
                    <div>아이디</div>
                </th>
                <td>
                    <input type="text" id="joinid" name="m_id" placeholder="(영문 소문자/숫자, 4~16자)" value="">
                    <button type="button" id="id_chk" name="id_chk" onclick="fn_idChk();" value="N">중복확인</button>
                </td>
            </tr>
            <tr>
                <th>
                    <div>비밀번호</div>
                </th>
                <td>
                    <input type="password" id="joinpw" name="m_pw" placeholder="(특수문자 포함한 영문 대소문자/숫자 중 2가지 이상 조합, 8자~16자)" value="">
                </td>
            </tr>
            <tr>
                <th>
                    <div>비밀번호 확인</div>
                </th>
                <td>
                    <input type="password" id="joinpw_chk" name="joinpw_chk" value="" placeholder="비밀번호와 동일하게 입력해주세요">
            </tr>
            <tr>
                <th>
                    <div>이름</div>
                </th>
                <td>
                    <input type="text" id="joinname" name="m_name" value="">
                </td>
            </tr>
            <tr>
                <th class="post">
                    <div>주소</div>
                </th>
                <td>
                    <input type="text" id="post_num" name="m_zipCode" placeholder="우편번호" readonly>
                    <input type="button" id="post_btn" value="우편번호" onclick="xexyPostcode()"><br>
                    <input type="text" id="post_address" name="m_addr1"  placeholder="기본주소" readonly><br>
                    <input type="text" id="post_detailAddress" name="m_addr2" placeholder="상세주소">
                </td>
            </tr>
            <tr>
                <th>
                    <div>휴대전화</div>
                </th>
                <td>
                    <select id="Phone1" name="Phone1">
                        <option value="010" selected>010</option>
                        <option value="011">011</option>
                        <option value="016">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>-
                    <input type="tel" id="Phone2" name="Phone2" value="" size="4" minlength="3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />-
                    <input type="tel" id="Phone3" name="Phone3" value="" size="4" minlength="4" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                </td>
            </tr>
            <tr>
                <th>
                    <div>이메일</div>
                </th>
                <td class="email">
                    <input type="text" id="email_id" name="email_id" value="" placeholder="이메일" maxlength="18" /> @
                    <input type="text" id="email_domain" name="email_domain" value="" placeholder="도메인" maxlength="18"/>
                    <select class="select" name="email_click" onchange="this.form.email_domain.value=this[this.selectedIndex].value;">
                        <option value="">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="google.com">google.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="kakao.com">kakao.com</option>>
                    </select>
                    <button type="button" id="email_chk"  name="m_email" onclick="fn_emailChk();" value="N">중복확인</button>
                </td>
            </tr>
            <tr>
                <th>
                    <div>성별</div>
                </th>
                <td>
                    <label for="gender_m">
                        <input type="radio" id="gender_m" name="m_gender" value="1">남
                    </label>
                    <label for="gender_w">
                        <input type="radio" id="gender_w" name="m_gender" value="2">여
                    </label>
                </td>
            </tr>
            <tr>
                <th>
                    <div>생년월일</div>
                </th>
                <td>
                    <select id="select_year" name="m_year">
                        <option value="년">생년</option>
                    </select>
                    <select id="select_month" name="m_month">
                        <option value="월">월</option>
                    </select>
                    <select id="select_day" name="m_day">
                        <option value="일">일</option>
                    </select>
                </td>
            </tr>
        </table>

        <h3>전체 동의</h3>
        <div class="agree_chk">
            <div class="agree_chk1">
                <label for="agreeall">
                    <input type="checkbox" id="agreeall" name="agreeall">
                    이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.
                </label>
            </div>
            <div class="agree_chk2">
                <label for="agree_1">
                    <input type="checkbox" id="agree_1" name="agree">
                    [필수] 이용약관 동의
                </label>
            </div>
            <div class="agree_chk3">
                <label for="agree_2">
                    <input type="checkbox" id="agree_2" name="agree">
                    [필수] 개인정보 수집 및 이용 동의
                </label>
            </div>
            <div class="agree_chk4">
                <label for="agree_3">
                    <input type="checkbox" id="agree_3" name="agree">
                    [선택] SMS(문자, 카카오톡 등)수신을 동의하십니까?
                </label>
                <label for="agree_4">
                    <input type="checkbox" id="agree_4" name="agree">
                    [선택] 이메일 수신을 동의하십니까?
                </label>
            </div>
        </div>
        <div class="foot_btn">
            <div>
                <input type="button" id="reset" name="reset" value="취소" onclick="history.back();">
            </div>
            <div>
                <button type="button" id="join_submit" name="join_submit" onclick="joinform_check();">회원가입</button>
            </div>
        </div>
    </form>
</div>

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
<script>
    function fn_idChk() {

        $.ajax({
            url : "/idCheck",
            type : "POST",
            dataType :"JSON",

            data : {
                "m_id" : $("#joinid").val()
            },
             success : function (data) {
                if(data == false) {

                    $("#id_chk").attr("value","N");

                    alert("사용 불가능한 아이디입니다.");
                } else if (data == true) {
                    $("#id_chk").attr("value", "Y");
                    alert("사용 가능한 아이디입니다.")
                }
            }

        })
    }
    function fn_emailChk() {
      /*  const id = document.getElementById("email_id")?.value;
        if (id !== "test")  return alert("아이디 테스트 아닌대?");*/
        $.ajax({
            url : "/emailCheck",
            type : "POST",
            dataType :"JSON",

            data : {
                "m_email" : $("#email_id").val()+"@"+$("#email_domain").val()
            },
           success : function (data) {
                if(data == false) {

                        $("#email_chk").attr("value","N");

                    alert("사용 불가능한  이메일입니다.");
                } else if (data == true) {
                    $("#email_chk").attr("value", "Y");
                    alert("사용 가능한 이메일입니다.")
                }
            }

        })
    }


    function xexyPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ''; // 주소 변수
                let extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.상세주소 제외
                    //document.getElementById("sample6_extraAddress").value = extraAddr;

                } //else {
                // document.getElementById("sample6_extraAddress").value = '';
                //}

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post_num').value = data.zonecode;
                document.getElementById("post_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("post_detailAddress").focus();
            }
        }).open();
    }

</script>
<script src="/js/nav.js"></script>
</body>
</html>