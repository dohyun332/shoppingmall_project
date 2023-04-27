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

</head>
<body>
<script>
    <c:if test="${not empty msg}">
    let a= "${msg}";

    alert(a);
    </c:if>
</script>

<jsp:include page="header.jsp" flush="false"/>

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
            <form action="/product/orders_submit" id="frm" method="post">
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
                            <input type="text" name="p_cell1" id="p_cell1" value="${p_cell1}">
                            -
                            <input type="text" name="p_cell2" id="p_cell2" value="${p_cell2}">
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
                        <td colspan="3" ><input type="text" id="p_deliveryName" name="p_deliveryName" value="${addressDto.p_deliveryName}"></td>
                    </tr>
                    <tr class="row1">
                        <td class="address_menu">연락처1</td>
                        <td class="del_cellBox">
                            <input type="text" value="010" readonly>
                            -
                            <input type="text" name="p_deliveryCell1_1" id="p_deliveryCell1_1" value="${p_deliveryCell1_1}">
                            -
                            <input type="text" name="p_deliveryCell1_2" id="p_deliveryCell1_2" value="${p_deliveryCell1_2}">
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
                                <input type="radio" name="p_homeAddr" id="p_homeAddr1" value="0" ${addressDto.p_homeAddr == 0 ? "checked":""}>자택
                            </label>
                            <label for="p_homeAddr2">
                                <input type="radio" name="p_homeAddr" id="p_homeAddr2" value="1" ${addressDto.p_homeAddr == 1 ? "checked":""}>최근배송지
                            </label>
                            <select id="desti_recent">
                                <option value="x" disabled selected>최근배송지</option>
                                <c:forEach var="odd" items="${destiList}">
                                    <option value="${odd.p_zipCode}: ${odd.p_destination1}, ${odd.p_destination2}">${odd.p_zipCode}: ${odd.p_destination1}, ${odd.p_destination2}</option>
                                </c:forEach>
                            </select>
                            <label for="p_homeAddr3">
                                <input type="radio" name="p_homeAddr" id="p_homeAddr3" value="2" ${addressDto.p_homeAddr == 2 ? "checked":""}>신규배송지
                            </label>
                        </td>
                    </tr>
                    <tr class="row2">
                        <td class="address_menu">주소</td>
                        <td colspan="3">
                            <div class="zipCodeBox">
                                <input type="text" name="p_zipCode" id="p_zipCode" placeholder="우편번호" value="${addressDto.p_zipCode}">
                                <input type="button" onclick="Postcode()" value="우편번호찾기">
                            </div>
                            <div class="destiBox">
                                <input type="text" name="p_destination1" id="p_destination1" placeholder="기본주소" value="${addressDto.p_destination1}">
                                <input type="text" name="p_destination2" id="p_destination2" placeholder="상세주소" value="${addressDto.p_destination2}">
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
                            <textarea name="p_deliveryMessage" id="p_deliveryMessage" cols="80" rows="3">${addressDto.p_deliveryMessage}</textarea>
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
                                <input type="radio" name="p_pay" id="p_pay1" value="0" ${addressDto.p_pay == 0 ? "checked":""}>신용카드
                            </label>
                            <label for="p_pay2">
                                <input type="radio" name="p_pay" id="p_pay2" value="1" ${addressDto.p_pay == 1 ? "checked":""}>휴대폰 결제
                            </label>
                            <label for="p_pay3">
                                <input type="radio" name="p_pay" id="p_pay3" value="2" ${addressDto.p_pay == 2 ? "checked":""}>실시간 계좌이체
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

                            <label for="order_agree">
                                <input type="checkbox" name="agreement" id="order_agree">상기 약관 및 개인정보 수집/이용에 대한 동의 내용과 결제정보를 확인하였으므로 구매진행에 동의합니다.
                            </label>
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
                    <button id="submit_order" type="submit" class="btn">주문하기</button>
                    <button id="cancel_order" type="button" class="btn">취소하기</button>
                </div>
            </form>
        </div>
    </div>
</main>

<jsp:include page="footer.jsp" flush="false"/>

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
<script src="/js/orders.js?ver=1"></script>
</body>
</html>