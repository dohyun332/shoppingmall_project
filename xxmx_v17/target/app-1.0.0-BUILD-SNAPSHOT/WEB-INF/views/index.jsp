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
    <link rel="stylesheet" href="/css/nav.css?ver=1">
    <link rel="stylesheet" href="/css/main.css?ver=1">
    <link rel="stylesheet" href="/css/search.css?ver=1">

    <script src="/js/1.12.4.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="/js/main_html.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&display=swap');
        * {font-family: 'Noto Sans KR', sans-serif;}
    </style>

</head>
<body>
    <jsp:include page="header.jsp" flush="false"/>

    <div class="wrap">
    <div class="main_outer">
        <div class="main_banner">
            <img src="/img/icons/m_banner_next.png" alt="" class="m_R">
            <img src="/img/icons/m_banner_prev.png" alt="" class="m_L">
            <img src="/img/banner/main_banner_1.jpg" alt="" class="none">
        </div>
    </div>

    <div class="main_contents_area">
        <div class="best_item_outer">
            <div class="best_cate">
                <div class="best_title">이유있는 <br> 베스트 아이템</div>
                <div class="cate_box">
                    <div class="active">전체<div class="active_c"></div></div>
                    <div>맨즈<div class="active_c dis_n"></div></div>
                    <div>우먼<div class="active_c dis_n"></div></div>
                    <div>키즈<div class="active_c dis_n"></div></div>
                    <div>골프<div class="active_c dis_n"></div></div>
                </div>
            </div>
            <div class="best_item_box">
                <div class="best all">
                    <c:forEach var="mainProductDto" items="${listAll}">
                    <div class="best_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="best_no"></div>
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count">
                                        <c:choose>
                                            <c:when test="${empty mainProductDto.reviewCnt}">
                                            </c:when>
                                            <c:otherwise>
                                                리뷰:${mainProductDto.reviewCnt}건
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
                <div class="best mens" style="display: none;">
                    <c:forEach var="mainProductDto" items="${listBM}">
                    <div class="best_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="best_no"></div>
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count">
                                        <c:choose>
                                            <c:when test="${empty mainProductDto.reviewCnt}">
                                            </c:when>
                                            <c:otherwise>
                                                리뷰:${mainProductDto.reviewCnt}건
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
                <div class="best women" style="display: none;">
                    <c:forEach var="mainProductDto" items="${listBW}">
                    <div class="best_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="best_no"></div>
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count"><c:choose>
                                        <c:when test="${empty mainProductDto.reviewCnt}">
                                        </c:when>
                                        <c:otherwise>
                                            리뷰:${mainProductDto.reviewCnt}건
                                        </c:otherwise>
                                    </c:choose></span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
                <div class="best kids" style="display: none;">
                    <c:forEach var="mainProductDto" items="${listBK}">
                    <div class="best_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="best_no"></div>
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count">
                                        <c:choose>
                                            <c:when test="${empty mainProductDto.reviewCnt}">
                                            </c:when>
                                            <c:otherwise>
                                                리뷰:${mainProductDto.reviewCnt}건
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>

                </div>
                <div class="best golf" style="display: none;">
                    <c:forEach var="mainProductDto" items="${listBG}">
                    <div class="best_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="best_no"></div>
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count">
                                        <c:choose>
                                            <c:when test="${empty mainProductDto.reviewCnt}">
                                            </c:when>
                                            <c:otherwise>
                                                리뷰:${mainProductDto.reviewCnt}건
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="mid_banner">
            <img src="/img/icons/list_btn_prev.png" alt="prev" class="mid_L">
            <img src="/img/icons/list_btn_next.png" alt="next" class="mid_R">
            <div class="mid_banner_img">
                <a href=""><img src="/img/banner/sub/sub_banner_221014.jpg" alt=""></a>
            </div>
            <div class="mid_banner_img">
                <a href=""><img src="/img/banner/sub/sub_banner_220819.jpg" alt=""></a>
            </div>
            <div class="mid_banner_img">
                <a href=""><img src="/img/banner/sub/sub_banner_221024.jpg" alt=""></a>
            </div>
            <div class="mid_banner_img">
                <a href=""><img src="/img/banner/sub/sub_banner_221123.jpg" alt=""></a>
            </div>
        </div>
        <div class="increase">
            <div class="inc_title">
                <b>실시간 급상승, </b>
                많은 분들이 보고 있어요.
            </div>
            <div class="inc_box">
                <div class="inc_slide" style="left: 0px;">
                <c:forEach var="mainProductDto" items="${listHitsUp}">
                    <div class="inc_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count">
                                        <c:choose>
                                            <c:when test="${empty mainProductDto.reviewCnt}">
                                            </c:when>
                                            <c:otherwise>
                                                리뷰:${mainProductDto.reviewCnt}건
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="slider_box">
                <div class="slider_bar" style="left: 0px;"></div>
            </div>
        </div>

        <div class="category_item_box">
            <div class="cate mens">
                <div class="cate_img">
                    <a href="">
                        <img src="/img/cate_img/title_img_mens.gif" alt="">
                    </a>
                    <div class="cate_title">맨즈</div>
                    <div class="more">더보기</div>
                </div>
                <div class="cate_item_box">
                    <c:forEach var="mainProductDto" items="${listM}">
                    <div class="cate_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count">
                                        <c:choose>
                                            <c:when test="${empty mainProductDto.reviewCnt}">
                                            </c:when>
                                            <c:otherwise>
                                                리뷰:${mainProductDto.reviewCnt}건
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="cate women">

                <div class="cate_img">
                    <a href="">
                        <img src="/img/cate_img/title_img_women.jpg" alt="">
                    </a>
                    <div class="cate_title">우먼</div>
                    <div class="more">더보기</div>
                </div>
                <div class="cate_item_box">
                    <c:forEach var="mainProductDto" items="${listW}">
                    <div class="cate_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count">
                                        <c:choose>
                                            <c:when test="${empty mainProductDto.reviewCnt}">
                                            </c:when>
                                            <c:otherwise>
                                                리뷰:${mainProductDto.reviewCnt}건
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="cate kids">
                <div class="cate_img">
                    <a href="">
                        <img src="/img/cate_img/title_img_kids.jpg" alt="">
                    </a>
                    <div class="cate_title">키즈</div>
                    <div class="more">더보기</div>
                </div>
                <div class="cate_item_box">
                    <c:forEach var="mainProductDto" items="${listK}">
                    <div class="cate_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count">
                                        <c:choose>
                                            <c:when test="${empty mainProductDto.reviewCnt}">
                                            </c:when>
                                            <c:otherwise>
                                                리뷰:${mainProductDto.reviewCnt}건
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="cate golf">
                <div class="cate_img">
                    <a href="">
                        <img src="/img/cate_img/title_img_golf.jpg" alt="">
                    </a>
                    <div class="cate_title">골프</div>
                    <div class="more">더보기</div>
                </div>
                <div class="cate_item_box">
                    <c:forEach var="mainProductDto" items="${listG}">
                    <div class="cate_item">
                        <a href="/product/productDetail?p_serialNo=${mainProductDto.p_serialNo}">
                            <img src="${mainProductDto.src}" alt="" class="item_img">
                            <div class="item_text">
                                <div class="item_info">
                                    <span class="item_code">${mainProductDto.p_serialNo}</span>
                                    <span class="item_review_count">
                                        <c:choose>
                                            <c:when test="${empty mainProductDto.reviewCnt}">
                                            </c:when>
                                            <c:otherwise>
                                                리뷰:${mainProductDto.reviewCnt}건
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="item_name">${mainProductDto.p_product}</div>
                                <div class="item_price"><fmt:formatNumber value="${mainProductDto.p_price}" pattern="#,###"/>원</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div class="md_pick_outer">
        <div class="main_contents_area">
            <div class="md_pick_box">
                <div class="md_m_title">MD 픽은 못참지!</div>
                <div class="md_pick">
                    <a href=""><img src="/img/md_pick_img_221124_2.jpg" alt=""></a>
                </div>
                <div class="md_pick">
                    <a href=""><img src="/img/md_pick_img_221124_3.jpg" alt=""></a>
                </div>
                <div class="md_pick_btn">
                    <img src="/img/icons/mdpick_btn_prev.png" alt="prev">
                    <img src="/img/icons/mdpick_btn_next.png" alt="next">
                </div>
            </div>
        </div>
    </div>

    <div class="review_outer">
        <div class="main_contents_area">
            <div class="review_title">
                <div>실시간 고객리뷰</div>
                <div><a href="">
                    리뷰 더보기
                    <img src="/img/icons/btn_more.png" alt="">
                </a></div>
            </div>
            <div class="review_area">
            </div>
        </div>
    </div>
</div>

    <jsp:include page="footer.jsp" flush="false"/>

</body>
</html>