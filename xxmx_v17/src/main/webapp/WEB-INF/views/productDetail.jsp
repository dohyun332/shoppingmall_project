<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>젝시믹스</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/nav.css?ver=1">
    <link rel="stylesheet" href="/css/detail.css?after2">
    <link rel="stylesheet" href="/css/info.css">

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

<div class="main">
    <a href="#" class="to_top"><img src="/img/topbtn.png"></a>
    <!-- 상세페이지 메인 -->
    <div class="detail_area">
        <div class="detail_all">
        <c:forEach  items="${product}" var="product">
            <img src="/img/product_detail/${product.p_productImg_DM}" class="detail_img">
            <div class="detail_item">
                <div class="detail_name">${product.p_product}</div>
                <div class="product_code">${product.p_serialNo}</div>
                <table class="item_table">
                    <tbody>
                    <tr>
                        <td class="item_d_name">판매가</td>
                        <td class="item_d_body" id="price"><fmt:formatNumber value="${product.p_price}" pattern="#,###" />원</td>
                    </tr>
                    <tr>
                        <td class="item_d_name">포인트</td>
                        <td class="item_d_body">1% ~ 최대 5%</td>
                    </tr>
                    <tr>
                        <td class="item_d_name">사이즈</td>
                        <td class="item_d_body">
                            <div class="opt_box">
                                <input type="button" value="S" id="S" class="option_btn">
                                <input type="button" value="M" id="M" class="option_btn">
                                <input type="button" value="L" id="L" class="option_btn">
                                <input type="button" value="XL" id="XL" class="option_btn">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <form method="post" action="#" name="itembuy" id="itembuy">
                    <div class="opt_selected">

                    </div>

                    <div class="price_total">
                        <div>
                            <h3>총 합계</h3> <span class="p_tot">0 원</span>
                        </div>
                    </div>

                    <div class="pro_btn">
                        <a id="cart_btn"><input type="button" value="장바구니" class="cart"></a>
                        <a id="buy_btn"><input type="button" value="구매하기" class="buy"></a>
                    </div>
                    <input type="hidden" name="p_serialNo" id="p_serialNo" value="${product.p_serialNo}">
                    <!-----------------------------------장바구니 팝업--------------------------------------------->
                    <div class="popup" id="popup">
                        <div class="popup_box">
                            <div class="popup_in">
                                <a href="javascript:closePop();"><img src="/img/popup_close.gif"
                                                                      class="m_header-banner-close"></a>
                            </div>
                            <!--팝업 컨텐츠 영역-->
                            <div class="popup_cont">
                                <p>상품이 장바구니에 담겼습니다.</p>

                            </div>
                            <!--팝업 버튼 영역-->
                            <div class="popup_btn">
                                <a href="javascript:closePop();"><div class="popup_close">쇼핑 계속하기</div></a>
                                <a href="/product/cart"><div class="popup_chk">장바구니 확인</div></a>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
        </div>

        <!--추천상품-->
        <h3 class="P_add">추천상품</h3>
        <hr>
        <div class="add_product">
            <div class="add_item">
                <div class="add_add">
                    <a href="#">
                        <img src="/img/add_1.jpg" class="add_pic p_1">
                        <div class="add_text">루즈핏 카라 맨투맨 오트밀라떼</div>
                    </a>
                    <span>49,000원</span>
                </div>
                <div class="add_add">
                    <a href="#">
                        <img src="/img/add_2.jpg" class="add_pic p_2">
                        <div class="add_text">베이직 크롭 맨투맨 라이트멜란지</div>
                    </a>
                    <span>34,000원</span>
                </div>
                <div class="add_add">
                    <a href="#">
                        <img src="/img/add_3.jpg" class="add_pic p_3">
                        <div class="add_text">젤라 인텐션 하드플러피 기모 레깅스 차이브카키</div>
                    </a>
                    <span>26,000원</span>
                </div>
                <div class="add_add">
                    <a href="#">
                        <img src="/img/add_4.jpg" class="add_pic p_4">
                        <div class="add_text">젤라 인텐션 하드플러피 기모 레깅스 초코라떼</div>
                    </a>
                    <span>26,000원</span>
                </div>
            </div>
        </div>

        <div class="info_sec">
            <ul class="info_ul">
                <a href="#sec_1">
                    <li class="info_li">상품후기</li>
                </a>
                <a href="#sec_2">
                    <li class="info_li">상세정보</li>
                </a>
                <a href="#sec_3">
                    <li class="info_li">배송/교환/반품</li>
                </a>
                <a href="#sec_4">
                    <li class="info_li">상품문의</li>
                </a>

            </ul>
        </div>

        <div id="sec_1">
            <div class="product_review">
                <div class="review_name">상품후기</div>
                <div class="review_top">
                    <div class="review_top_header">
                        <span class="review_top_L">REVIEW | </span>
                        <span class="review_top_N"> (4,199) </span>
                    </div>
                    <div class="review_top_R"><a href="">전체 상품 리뷰 보기</a></div>
                </div>
                <div class="review_point">
                    <div class="review_star">
                        <div class="review_star_p">★ 4.9</div>
                        <div class="review_star_like">98%의 구매자가 이 상품을 좋아합니다.</div>
                    </div>

                    <div class="review_graph">
                        <ul>
                            <li>
                                <div class="review_graph_com">아주 좋아요</div>
                                <div class="review_graph_gauge">
                                    <div class="review_graph_percent"></div>
                                </div>
                                <div class="review_graph_num_0">3,932</div>
                            </li>
                            <li>
                                <div class="review_graph_com1">맘에 들어요</div>
                                <div class="review_graph_gauge">
                                    <div class="review_graph_percent_1"></div>
                                </div>
                                <div class="review_graph_num">197</div>
                            </li>
                            <li>
                                <div class="review_graph_com1">보통이에요</div>
                                <div class="review_graph_gauge">
                                    <div class="review_graph_percent_2"></div>
                                </div>
                                <div class="review_graph_num">56</div>
                            </li>
                            <li>
                                <div class="review_graph_com1">그냥 그래요</div>
                                <div class="review_graph_gauge"></div>
                                <div class="review_graph_num">7</div>
                            </li>
                            <li>
                                <div class="review_graph_com1">별로에요</div>
                                <div class="review_graph_gauge"></div>
                                <div class="review_graph_num">7</div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="review_photo">
                    <div>
                        <span class="review_photo_title">포토&동영상 (2,463)</span>
                        <div class="review_all"><a href="">전체보기</a></div>
                    </div>
                    <div class="review_media">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </div>
                <div class="review_view">
                    <div class="show_review">
                        <span class="review_tag">브랜드 추천 리뷰</span>
                        <div class="review_s">★★★★★ 아주 좋아요</div>
                        <div class="review_date">2022.12.05</div>

                        <div class="review_comment">역시 젝시믹스...! 항상 믿고 사는 운동복 브랜드입니다! 겨울에도 따뜻하게 운동할수 있어서 좋아요.</div>
                        <div>
                            <ul>
                                <li></li>
                                <li></li>
                            </ul>
                        </div>
                        <div class="review_good">
                            <span class="review_reply">도움돼요 15 | 댓글 1</span>
                        </div>
                    </div>
                    <div class="r_info">
                        <div class="r_info_top">
                            <img src="/img/membericon.gif">
                            <div class="r_info_name">김**님의 리뷰입니다.</div>
                        </div>
                        <div class="r_info_bot">
                            <div class="r_info_body">
                                <span class="r_info_q">키</span>
                                <span class="r_info_a">158cm</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">몸무게</span>
                                <span class="r_info_a">50~54kg</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">평소사이즈</span>
                                <span class="r_info_a">S</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">회원 등급</span>
                                <span class="r_info_a">PREMIUM</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">SIZE</span>
                                <span class="r_info_a">M</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="review_view">
                    <div class="show_review">
                        <span class="review_tag">브랜드 추천 리뷰</span>
                        <div class="review_s">★★★★★ 아주 좋아요</div>
                        <div class="review_date">2022.12.06</div>

                        <div class="review_comment">배송도 빠르고 품질도 좋아서 항상 애용하는 브랜드입니다. 색감도 이쁘고 신축성도 좋아서 운동할때 너무 편해용 강추합니다!</div>
                        <div>
                            <ul>
                                <li></li>
                                <li></li>
                            </ul>
                        </div>
                        <div class="review_good">
                            <span class="review_reply">도움돼요 17 | 댓글 1</span>
                        </div>
                    </div>
                    <div class="r_info">
                        <div class="r_info_top">
                            <img src="/img/membericon.gif">
                            <div class="r_info_name">박**님의 리뷰입니다.</div>
                        </div>
                        <div class="r_info_bot">
                            <div class="r_info_body">
                                <span class="r_info_q">키</span>
                                <span class="r_info_a">165cm</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">몸무게</span>
                                <span class="r_info_a">55~60kg</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">평소사이즈</span>
                                <span class="r_info_a">M</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">회원 등급</span>
                                <span class="r_info_a">PREMIUM</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">SIZE</span>
                                <span class="r_info_a">M</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="review_view">
                    <div class="show_review">
                        <span class="review_tag">브랜드 추천 리뷰</span>
                        <div class="review_s">★★★★★ 아주 좋아요</div>
                        <div class="review_date">2022.12.07</div>

                        <div class="review_comment">추위를 많이 타는 편이라 겨울에 운동할때도 반팔을 싫어했는데 이 옷 덕분에 추운겨울에도 끄떡없어요! 땀이 많이나도 흡수력이 좋아서 걱정없어요</div>
                        <div>
                            <ul>
                                <li></li>
                                <li></li>
                            </ul>
                        </div>
                        <div class="review_good">
                            <span class="review_reply">도움돼요 10 | 댓글 1</span>
                        </div>
                    </div>
                    <div class="r_info">
                        <div class="r_info_top">
                            <img src="/img/membericon.gif">
                            <div class="r_info_name">이**님의 리뷰입니다.</div>
                        </div>
                        <div class="r_info_bot">
                            <div class="r_info_body">
                                <span class="r_info_q">키</span>
                                <span class="r_info_a">170cm</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">몸무게</span>
                                <span class="r_info_a">60~65kg</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">평소사이즈</span>
                                <span class="r_info_a">M</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">회원 등급</span>
                                <span class="r_info_a">PREMIUM</span>
                            </div>
                            <div class="r_info_body">
                                <span class="r_info_q">SIZE</span>
                                <span class="r_info_a">M</span>
                            </div>
                        </div>
                    </div>
                </div>
                <a href=""><div class="more_review">더보기</div></a>
            </div>
        </div>
        <div id="sec_2" class="product_info">
            <div>상세정보</div>
            <c:forTokens var="detailImgUrl" items="${product.p_explainImg}" delims=",">

            <img src="/img/product_detail/${detailImgUrl}">

            </c:forTokens>
            </c:forEach>
            <img src="/img/detail/washing.jpg">
        </div>
        <!--실시간 인기 급상승-->
        <div class="now_title">
            <h3>실시간 인기 급상승</h3>
            <h5>최근 1시간동안 사람들이 가장 많이 조회한 상품</h5>
        </div>
        <div class="product_now">
            <div class="now n1">
                <div class="now_item">
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_1"></div>
                            <div class="now_text">블랙라벨 시그니처 360N 더블플러피 기모 레깅스 1+1</div>
                        </a>
                        <span>48,000원</span>
                    </div>
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_2"></div>
                            <div class="now_text">V업 3D 플러스 레깅스 마지막 1+1</div>
                        </a>
                        <span>32,000원</span>
                    </div>
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_3"></div>
                            <div class="now_text">블랙라벨 시그니처 380N 레깅스 1+1</div>
                        </a>
                        <span>49,000원</span>
                    </div>
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_4"></div>
                            <div class="now_text">블랙라벨 시그니처 360N 기모 부츠컷 팬츠</div>
                        </a>
                        <span>59,000원</span>
                    </div>
                </div>
            </div>
            <div class="now n2">
                <div class="now_item">
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_5"></div>
                            <div class="now_text">젤라 인텐션 하드플러피 기모 레깅스 1+1</div>
                        </a>
                        <span>37,600원</span>
                    </div>
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_6"></div>
                            <div class="now_text">모크넥 슬림핏 롱슬리브 1+1</div>
                        </a>
                        <span>49,000원</span>
                    </div>
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_7"></div>
                            <div class="now_text">블랙라벨 시그니처 360N 레깅스 1+1</div>
                        </a>
                        <span>44,000원</span>
                    </div>
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_8"></div>
                            <div class="now_text">아이스페더 1+1</div>
                        </a>
                        <span>24,000원</span>
                    </div>
                </div>
            </div>
            <div class="now n3">
                <div class="now_item">
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_9"></div>
                            <div class="now_text">스트링 덕다운 패딩 블랙</div>
                        </a>
                        <span>129,000원</span>
                    </div>
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_10"></div>
                            <div class="now_text">소프트쿠션 조거팬츠 1+1</div>
                        </a>
                        <span>78,000원</span>
                    </div>
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_11"></div>
                            <div class="now_text">모크넥 핑거홀 베이직 티셔츠 1+1</div>
                        </a>
                        <span>49,000원</span>
                    </div>
                    <div class="now_now">
                        <a href="#">
                            <div class="now_pic pic_12"></div>
                            <div class="now_text">더블라인 오버니삭스</div>
                        </a>
                        <span>6,900원</span>
                    </div>
                </div>
            </div>
            <input type="button" value="" class="btn_slide" id="btn_slide_L">
            <input type="button" value="" class="btn_slide" id="btn_slide_R">

            <div class="indicator"></div>
        </div>





        <div id="sec_3" class="product_deliver">
            <div>배송/교환/반품</div>
            <div class="deliver">
                <h3>배송정책</h3>
                <table cellspacing="0" cellpadding="0">
                    <colgroup>
                        <col style="width:25%;">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>배송방법</th>
                        <td>우체국 택배 1588-1300</td>
                    </tr>
                    <tr>
                        <th>배송지역</th>
                        <td>전국지역</td>
                    </tr>
                    <tr>
                        <th>배송기간</th>
                        <td> 결제일로부터 1일-7일 (당사 출고일 기준 / 예약 하신 제품은 입고시 순차적으로 출고 됩니다.)
                            <ul>
                                <li>총 결제 금액 5만원 이상구매 시 무료배송, 5만원 미만일 경우 배송비 2,500원이 추가됩니다.</li>
                                <li>주문하신 상품은 입금 확인순으로 순차 배송되기 때문에 상품준비 기간이 소요되는 점 양해 부탁드립니다.</li>
                                <li>결제하신 후 각종 변경사항은 고객센터 1661-2811로 연락주시기 바랍니다.</li>
                                <li>주문하신 상품이 배송 준비 중이거나 이미 배송이 완료된 경우 주문취소가 불가합니다.</li>
                                <li>주소가 정확하지 않거나 연락이 되지 않아 반송되어 오는 제품의 택배 이용은 고객님의 부담이니 꼭 정확한 주소와 연락처를 남겨 주세요.</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>고객센터</th>
                        <td>1661-2811 (월~금 : 10:00 - 17:00 / 점심시간 : 12:30~13:30)</td>
                    </tr>
                    <tr>
                        <th>결제방법</th>
                        <td><ul>
                            <li> 무통장 입금의 경우 주문시 입력한 입금자명과 실제 입금자가 반드시 일치하여야 하며, 입금금액을 필히 확인해 주세요.<br>
                                (입금자와 주문자 / 입금금액과 주문금액이 일치하지 않는 경우에는 꼭 고객센터에 미리 알려주셔야 원활한 입금 확인이 가능합니다.) </li>
                            <li>주문 후 2일 이내로 입금을 하여야 하며 입금자가 동일하지 않을 경우 꼭 고객센터에 알려주셔야 입금 확인 처리가 가능합니다.</li>
                            <li>카드결제의 경우 상품 대금결제 후 부분취소를 원하실 경우 고객센터로 연락을 해 주셔야 처리를 할 수 있습니다.</li>
                        </ul>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="deliver">
                <h3>교환/반품</h3>
                <table cellspacing="0" cellpadding="0">
                    <colgroup>
                        <col style="width:25%;">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>교환 및 반품이 가능한 경우</th>
                        <td>
                            <ul>
                                <li>
                                    상품 수령일로부터 7일 이내 교환 및 반품처리 해드립니다. (단, 제품하자 및 오 배송 등의 사유는 30일 이내 교환 및 반품처리 해드립니다.)<br>
                                    (젝시믹스에 접수되지 않은 상태에서 고객님께서 임의로 발송한 제품이 분실되거나 훼손된 경우에는 젝시믹스에서 책임지지 않습니다.)
                                </li>
                                <li>
                                    교환이나 반품시 반품요청을 해주시고, 교환.반품 내용을 적어 상품과 함께 보내주세요.<br>
                                    (교환.반품 배송비 : 5,000원 / 교환.반품시 기재사항 : 교환/반품(환불)신청서)
                                </li>
                                <li>
                                    교환시에는 왕복 택배비 5,000원을 계좌이체 해주신 후 착불로 보내주세요.<br>
                                    배송비 입금 계좌 : KB국민 431801-01-213327 (주)브랜드엑스 코퍼레이션 *입금시 고객님 성함+핸드폰번호 뒷자리를 기입하여 입금 부탁드립니다.
                                </li>
                                <li>상품 구매하시는 금액이 5만원 이상이실 경우 고객님들께 초기 택배비를 무료로 지원해 드리며, 상품 하자가 아닌 단순변심으로 인해 반품을 요청하실 경우 초기에 지원해 드렸던 택배비 2,500원이 추가 발생 되십니다.</li>
                                <li>제품하자 / 오배송인 경우에는 젝시믹스에서 왕복 택배비를 부담하여 교환 및 반품처리 해드립니다.</li>
                                <li>택배비를 동봉시 분실된 경우 당사에서 책임을 지지않습니다. 가급적 계좌입금을 권장드립니다.</li>
                                <li>클라우드 매트는 일양 택배로 별도 배송되며, 왕복 택배비 10,000원을 고객님께서 부담해 주셔야 합니다.</li>
                                <li>미성년자가 물품을 구매하는 경우, 법정대리인이 동의하지 않으면 미성년자 본인 또는 법정대리인이 구매를 취소 할 수 있습니다.</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>교환 및 반품 접수방법</th>
                        <td>
                            <ul>
                                <li>고객센터 1661-2811 및 교환/반품 게시판으로 반품 접수 해주세요.</li>
                                <li>카카오톡 플러스친구에서 간편하게 반품 접수 해주세요.</li>
                                <li>상품은 손상되지 않게 포장해 주시고, 배송시 함께 보내드린 교환/반품(환불) 신청서를 기재해 주시면 더욱 정확하고 신속하게 도와드릴 수 있습니다.</li>
                                <li>우체국 택배 1588-1300로 수거요청을 하시고 받으셨던 상품 그대로 포장하여 착불로 보내주시면 됩니다.<br>
                                    타택배로 보내주실땐 선불로 보내주셔야 하며, 착불로 발송시 추가 배송비가 발생됩니다.<br>
                                    타택배 접수시 교환 및 반품주소 : 경기도 의정부시 산단로98번길 65 3층 젝시믹스</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>교환 및 반품이 불가한 경우</th>
                        <td>
                            <ul>
                                <li>교환/반품(환불) 기간이 경과된 경우</li>
                                <li>고객이 상품을 사용하거나 고객의 책임 있는 사유로 상품이 훼손된 경우 (ex. 착용 또는 세탁 흔적, 이염, 화장품 또는 향수 냄새)</li>
                                <li>고객이 상품의 라벨을 제거하거나, 구성품을 훼손 또는 분실하여 재판매가 곤란하거나 상품의 가치가 감소한 경우</li>
                                <li>시간의 경과로 인하여 다시 판매하기 곤란할 정도로 상품의 가치가 현저히 감소한 경우</li>
                                <li>코스메틱(화장품)의 경우 제품 특성상 개봉 후 교환, 반품이 불가합니다.</li>
                                <li>이너웨어(속옷) 제품의 경우 착용시 이염 되거나 제품의 변형이 발생할 수 있으며, 이 경우 교환, 반품이 불가합니다.</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>환불 및 환불 지연에 따른 배상</th>
                        <td>
                            <ul>
                                <li>[대금 환불 방법] 마이페이지 내 주문내역을 통하여 환불 신청 및 확인이 가능하며, 결제 수단에 따라 환불이 진행됩니다. </li>
                                <li>[환불 지연에 따른 배상금 지급] 환불을 지연한 때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의 3에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다. 이에 대한 신청은 고객센터를 통해서 가능합니다.</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>기타사항</th>
                        <td>
                            <ul>
                                <li>거래에 관한 약관의 내용은 사이트 하단의 약관을 참고해주세요.</li>
                                <li>젝시믹스는 고객이 제기하는 정당한 의견이나 불만을 반영하고, 그 피해를 보상처리 하기 위하여 노력하고 있습니다.<br>불만, 피해보상 요청 등의 접수는 1:1 문의게시판 및 마이페이지를 통해 가능합니다. </li>
                                <li>전자상거래 분쟁과 관련하여 고객의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시ㆍ도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li>
                            </ul>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="sec_4" class="product_ask">
            <div class="ask_p">상품문의</div>
            <table class="product_qna">
                <thead class="qna_top">
                <tr>
                    <th col width="80">
                        <div>번호</div>
                    </th>
                    <th>
                        <div>제목</div>
                    </th>
                    <th col width="110">
                        <div>작성자</div>
                    </th>
                    <th col width="110">
                        <div>작성일</div>
                    </th>
                    <th col width="110">
                        <div>조회</div>
                    </th>
                </tr>
                </thead>
                <tbody class="qna_mid">
                <tr>
                    <td col width="80">
                        <div class="qna_num">1</div>
                    </td>
                    <td>
                        <a class="qna_topic">
                            <img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                        </a>
                    </td>
                    <td col width="110">
                        <div class="qna_name">이**</div>
                    </td>
                    <td col width="110">
                        <div class="qna_date">2022/12/05</div>
                    </td>
                    <td col width="110">
                        <div class="qna_view">1</div>
                    </td>
                </tr>
                <tr>
                    <td col width="80">
                        <div class="qna_num">2</div>
                    </td>
                    <td>
                        <a class="qna_topic">
                            <img src="/img/reply.gif"><img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                        </a>
                    </td>
                    <td col width="110">
                        <div class="qna_name"><img src="/img/reply_logo.gif"></div>
                    </td>
                    <td col width="110">
                        <div class="qna_date">2022/12/05</div>
                    </td>
                    <td col width="110">
                        <div class="qna_view">1</div>
                    </td>
                </tr>
                <tr>
                    <td col width="80">
                        <div class="qna_num">3</div>
                    </td>
                    <td>
                        <a class="qna_topic">
                            <img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                        </a>
                    </td>
                    <td col width="110">
                        <div class="qna_name">박**</div>
                    </td>
                    <td col width="110">
                        <div class="qna_date">2022/12/04</div>
                    </td>
                    <td col width="110">
                        <div class="qna_view">0</div>
                    </td>
                </tr>
                <tr>
                    <td col width="80">
                        <div class="qna_num">4</div>
                    </td>
                    <td>
                        <a class="qna_topic">
                            <img src="/img/reply.gif"><img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                        </a>
                    </td>
                    <td col width="110">
                        <div class="qna_name"><img src="/img/reply_logo.gif"></div>
                    </td>
                    <td col width="110">
                        <div class="qna_date">2022/12/04</div>
                    </td>
                    <td col width="110">
                        <div class="qna_view">1</div>
                    </td>
                </tr>
                <tr>
                    <td col width="80">
                        <div class="qna_num">5</div>
                    </td>
                    <td>
                        <a class="qna_topic">
                            <img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                        </a>
                    </td>
                    <td col width="110">
                        <div class="qna_name">최**</div>
                    </td>
                    <td col width="110">
                        <div class="qna_date">2022/12/03</div>
                    </td>
                    <td col width="110">
                        <div class="qna_view">2</div>
                    </td>
                </tr>
                <tr>
                    <td col width="80">
                        <div class="qna_num">6</div>
                    </td>
                    <td>
                        <a class="qna_topic">
                            <img src="/img/reply.gif"><img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                        </a>
                    </td>
                    <td col width="110">
                        <div class="qna_name"><img src="/img/reply_logo.gif"></div>
                    </td>
                    <td col width="110">
                        <div class="qna_date">2022/12/03</div>
                    </td>
                    <td col width="110">
                        <div class="qna_view">1</div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="qna_small">
                <div class="qna_small_top">
                    <a class="qna_small_topic" href="#">
                        <img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                    </a>
                </div>
                <div class="qna_small_bot">
                    <div>
                        <img src="/img/membericon.gif">김** | 2022-12-05
                    </div>
                </div>
            </div>
            <div class="qna_small">
                <div class="qna_small_top">
                    <a class="qna_small_topic" href="#">
                        <img src="/img/reply.gif"><img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                    </a>
                </div>
                <div class="qna_small_bot">
                    <div>
                        <span>X******* | 2022-12-05</span>
                    </div>
                </div>
            </div>
            <div class="qna_small">
                <div class="qna_small_top">
                    <a class="qna_small_topic" href="#">
                        <img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                    </a>
                </div>
                <div class="qna_small_bot">
                    <div>
                        <img src="/img/membericon.gif">박** | 2022-12-06
                    </div>
                </div>
            </div>
            <div class="qna_small">
                <div class="qna_small_top">
                    <a class="qna_small_topic" href="#">
                        <img src="/img/reply.gif"><img src="/img/lock.gif">상품관련 문의 드립니다<span>[답변완료]</span>
                    </a>
                </div>
                <div class="qna_small_bot">
                    <div>
                        <span>X******* | 2022-12-06</span>
                    </div>
                </div>
            </div>
            <div class="qna_last">
                <ul class="nextnum">
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                    <li>></li>
                    <li>>></li>
                </ul>
                <div class="qna_bot">
                    <div class="rev_list">목록</div>
                    <div class="rev_write">글쓰기</div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/js/detail.js"></script>
<script src="/js/buy.js?ver=1"></script>
<script src="/js/buycheck.js"></script>
<script src="/js/nav.js"></script>
</body>
</html>
