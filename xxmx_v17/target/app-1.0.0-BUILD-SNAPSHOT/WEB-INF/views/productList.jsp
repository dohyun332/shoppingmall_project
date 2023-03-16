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
    <title>Document</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/nav.css">
    <link rel="stylesheet" href="/css/list.css">
    <script src="/js/1.12.4.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="/js/list.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&display=swap');
        * {font-family: 'Noto Sans KR', sans-serif;}
    </style>


    <c:set var="outer" value="${fn:substring(param.cate,0,1).equals('G') || fn:substring(param.cate,0,1).equals('K') ?'':'아우터'}"/>
    <c:set var="innerwear" value="${fn:substring(param.cate,0,1).equals('G') || fn:substring(param.cate,0,1).equals('K') ?'':'이너웨어'}"/>
</head>
<body>

<jsp:include page="header.jsp" flush="false"/>

<div class="main">
    <!-- 상품리스트 메인 -->
    <div class="title">
        <c:if test="${fn:substring(param.cate,0,1)!='1' && fn:substring(param.cate,0,1)!='O' }" >
            <a href="/product/productList?cate=${fn:substring(param.cate,0,1)}">전체</a>
            <a href="/product/productList?cate=${fn:substring(param.cate,0,1)}T">상의</a>
            <a href="/product/productList?cate=${fn:substring(param.cate,0,1)}B">하의</a>
        </c:if>
        <c:if test="${fn:substring(param.cate,0,1)=='W' || fn:substring(param.cate,0,1)=='M' }" >
            <a href="/product/productList?cate=${fn:substring(param.cate,0,1)}O">
                ${outer}
            </a>
            <a href="/product/productList?cate=${fn:substring(param.cate,0,1)}I">
                ${innerwear}
            </a>
        </c:if>
    </div>

    <div id="content_area2">
        <div id="wrap">
            <div class="sort_box">
                <div class="sort_result">총 ${product_cnt}개의 상품이 있습니다.</div>
                <div class="sort_form">
                    <form action="/product/productListSort" id="frm" method="get">
                        <select id="sort" name="sort" onchange="listSort()">
                            <option value="" disabled <c:if test="${empty param.sort}">selected</c:if>>상품정렬</option>
                            <option value="new"
                                    <c:if test="${param.sort eq 'new'}">selected</c:if>
                                        >신상품순</option>
                            <option value="sale"
                                    <c:if test="${param.sort eq 'sale'}">selected</c:if>
                            >인기순</option>
                            <option value="low"
                                    <c:if test="${param.sort eq 'low'}">selected</c:if>
                            >낮은 가격순</option>
                            <option value="high"
                                    <c:if test="${param.sort eq 'high'}">selected</c:if>
                            >높은 가격순</option>
                        </select>
                        <input type="hidden" value="${param.cate}" name="cate">
                    </form>
                </div>
            </div>
        </div>

        <ul class="product_list">
            <c:forEach var="productListDto" items="${list}" varStatus="status">
                    <li class="pl_item" >
                        <div class="img_box">
                            <a href="/product/productDetail?p_serialNo=${productListDto.p_serialNo}">
                                <img src="${productListDto.imgSrc}">

                            </a>
                        </div>
                        <div class="txt_box">
                            <div class="txt_box color">
                                <div class="serialNo">${productListDto.p_serialNo}</div>
                                <div class="reviewCnt">리뷰 ${productListDto.reviewCnt}</div>
                            </div>
                            <div class="product">${productListDto.p_product}</div>
                            <div class="price">
                                <fmt:formatNumber value="${productListDto.p_price}" pattern="#,###"/>원
                            </div>
                        </div>
                    </li>
            </c:forEach>
            </ul>
    </div>
    </div>
</div>

<jsp:include page="footer.jsp" flush="false"/>

</body>
</html>