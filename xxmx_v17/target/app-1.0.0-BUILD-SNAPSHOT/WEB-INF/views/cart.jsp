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
    <title>장바구니</title>
    <link rel="stylesheet" href="/css/common.css?ver=1">
    <link rel="stylesheet" href="/css/cart.css?ver=1">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="/js/1.12.4.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="/js/cart.js"></script>
    <style>
    </style>

</head>
<body>
    <jsp:include page="header.jsp" flush="false"/>

    <main>
        <h2>장바구니</h2>
        <div id="wrap">
            <div class="contents_area">
                <form action="" id="frm">
                    <table class="cart_tb">
                        <colgroup>
                            <col style="width:20px;">
                            <col style="width:780px;">
                            <col style="width:200px;">
                            <col style="width:200px;">
                            <col style="width:200px;">
                            <col style="width:200px;">
                        </colgroup>
                        <tr class="tb_menu">
                            <td>
                                <input type="checkBox" class="chk_all">
                            </td>
                            <td>상품명</td>
                            <td>가격</td>
                            <td>수량</td>
                            <td>배송비</td>
                            <td>합계</td>
                        </tr>
                        <c:choose>
                            <c:when test="${empty cartAll}">
                                <tr class="tb_content">
                                    <td colspan="6" style="text-align: center; font-size: 20px;">
                                        장바구니에 담긴 상품이 없습니다.
                                    </td>
                                </tr>
                            </c:when>

                            <c:otherwise>
                                <c:forEach var="cartProductDto" items="${cartAll}">
                                    <c:set var="S_selected" value="${ cartProductDto.p_choiceSize.equals('S')?'selected':''}" />
                                    <c:set var="M_selected" value="${ cartProductDto.p_choiceSize.equals('M')?'selected':''}" />
                                    <c:set var="L_selected" value="${ cartProductDto.p_choiceSize.equals('L')?'selected':''}" />
                                    <c:set var="XL_selected" value="${ cartProductDto.p_choiceSize.equals('XL')?'selected':''}" />

                                    <tr class="tb_content">
                                        <td class="chk_col">
                                            <input type="checkBox" class="chk_cart" name="chk" value="${cartProductDto.p_cartNo}">
                                        </td>
                                        <td class="pd_info">
                                            <div class="pd_img">
                                                <img src="../img/product_detail/${cartProductDto.p_productImg_DM}" alt=""></div>
                                            <div class="pd_txt">
                                                <div class="pd_name">${cartProductDto.p_product}</div>
                                                <div class="pd_opt">
                                                    <select name="c_choiceSize" style="width:50px; height:25px;">
                                                        <option value="S" ${S_selected}>S</option>
                                                        <option value="M" ${M_selected}>M</option>
                                                        <option value="L" ${L_selected}>L</option>
                                                        <option value="XL" ${XL_selected}>XL</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="pd_price txt">
                                            <fmt:formatNumber value="${cartProductDto.p_price}" pattern="#,###" />원
                                        </td>
                                        <td class="pd_cntBox txt">
                                            <div class="cntBtn_box">
                                                <div class="plus btn_pm">+</div>
                                                <input type="text" class="pd_cnt" name="c_choiceQuantity" value="${cartProductDto.p_choiceQuantity}" readonly>
                                                <div class="minus btn_pm">-</div>
                                            </div>
                                            <button class="btn_modify" type="button">수량/옵션 수정</button>
                                        </td>
                                        <td class="pd_deliverPrice txt">
                                            기본조건
                                            <input type="hidden" name="c_cartNo" value="${cartProductDto.p_cartNo}">
                                        </td>
                                        <td class="pd_subTotal txt">
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </table>
                    <div class="total_area">
                        <div class="alarm">● 젝시믹스 제품은 우체국 택배로 배송됩니다.</div>
                        <div class="sum_product_box">
                            <div>총 구매금액</div>
                            <div class="sum_product"> 0 원</div>
                        </div>
                        <div class="sum_total_box">
                            <div>결제 예정금액</div>
                            <div class="sum_total"> 0 원</div>
                        </div>
                    </div>
                    <div class="btn_box">
                        <div class="delete_btn">
                            <button class="delete_part" type="button">선택삭제</button>
                            <button class="delete_all" type="button">전체삭제</button>
                        </div>
                        <div class="page_btn">
                            <button class="shopping" type="button">쇼핑하기</button>
                            <button class="orders" type="button">주문하기</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" flush="false"/>

</body>
</html>