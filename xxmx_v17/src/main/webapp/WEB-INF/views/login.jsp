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
    <title>젝시믹스 - 로그인</title>

    <script defer src="/js/login.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/common.css">
</head>
<body>
<script>
<c:if test="${not empty param.msg}">
let a= "${URLDecoder.decode(param.msg)}";

    alert(a);
</c:if>
</script>
    <div class="log_main">
        <div class="log_wrap">
            <div class="log_header">
                <div class="backbtn" onclick="history.back();">뒤로가기</div>
                <div class="log_logo">
                    <img src="/img/loginlogo.png">
                </div>
            </div>
            <div>
                <h2>로그인</h2>
                <form action="<c:url value='/login/login' />" id="log_form"  method="post" onsubmit="return submit_chk();">
                    <input type="hidden" name="toURL" value="${param.toURL}">

                    <div>
                        <input type="text" id="userid" name="m_id" value="${ cookie.id.value }" placeholder="아이디">
                        <input type="password" id="userpw" name="m_pw" placeholder="비밀번호" value="wprtlalrtm1!">
                    </div>
                    <label for="remember_chk">
                        <input type="checkbox" id="remember_chk" name="rememberId"${empty cookie.id.value?"":"checked" }>아이디 저장
                    </label>
                    <button>기존회원 로그인</button>

                </form>
            </div>

            <div class="log_ft">
                <a href="#">아이디/비밀번호 찾기</a>
                <a href="<c:url value='/login/join' />" class="right">가입하기</a>
            </div>
        </div>
    </div>



</body>
</html>
