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
    <script src="/js/1.12.4.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%--    <script src="/js/join.js"></script>--%>
    <script src="/js/join2.js"></script>

    <c:set var="phone1_010" value="${ memberDto.phone1==null || memberDto.phone1.equals('010') ?'selected':''  }" />
    <c:set var="phone1_011" value="${ memberDto.phone1.equals('011') ?'selected':''  }" />
    <c:set var="phone1_016" value="${ memberDto.phone1.equals('016') ?'selected':''  }" />
    <c:set var="phone1_018" value="${ memberDto.phone1.equals('018') ?'selected':''  }" />
    <c:set var="phone1_019" value="${ memberDto.phone1.equals('019') ?'selected':''  }" />

    <c:set var="male" value="${memberDto.m_gender==1 ? 'checked':''}" />
    <c:set var="female" value="${memberDto.m_gender==2 ? 'checked':''}" />



</head>
<body>
<c:if test="${ not empty param.msg }">
    <script>
        alert("${param.msg}");
    </script>
</c:if>

<jsp:include page="header.jsp" flush="false"/>

<div class="join_main">
    <h2>회원가입</h2>
    <form method="post" action="<c:url value="/login/join" />" id="join" name="join">
        <table>
            <tr class="id_tr">
                <th>
                    <div>아이디</div>
                </th>
                <td>
                    <input type="text" id="joinid" name="m_id" placeholder="(영문 소문자/숫자, 4~16자)" value="${memberDto.m_id}">
                    <button type="button" id="id_chk" name="id_chk" onclick="fn_idChk();" value="N">중복확인</button>
                </td>
            </tr>
            <tr>
                <th>
                    <div>비밀번호</div>
                </th>
                <td>
                    <input type="password" id="joinpw" name="m_pw" placeholder="(특수문자 포함한 영문 대소문자/숫자 조합, 8자~16자)" value="${memberDto.m_pw}">
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
                    <input type="text" id="joinname" name="m_name" value="${memberDto.m_name}">
                </td>
            </tr>
            <tr>
                <th class="post">
                    <div>주소</div>
                </th>
                <td>
                    <input type="text" id="post_num" name="m_zipCode" placeholder="우편번호" value="${memberDto.m_zipCode}" readonly>
                    <input type="button" id="post_btn" value="우편번호" onclick="xexyPostcode()"><br>
                    <input type="text" id="post_address" name="m_addr1"  placeholder="기본주소" value="${memberDto.m_addr1}" readonly><br>
                    <input type="text" id="post_detailAddress" name="m_addr2" placeholder="상세주소" value="${memberDto.m_addr2}">
                </td>
            </tr>
            <tr>
                <th>
                    <div>휴대전화</div>
                </th>
                <td>
                    <select id="Phone1" name="Phone1">
                        <option value="010" ${phone1_010}>010</option>
                        <option value="011" ${phone1_011}>011</option>
                        <option value="016" ${phone1_016}>017</option>
                        <option value="018" ${phone1_018}>018</option>
                        <option value="019" ${phone1_019}>019</option>
                    </select>-
                    <input type="tel" id="Phone2" name="Phone2" value="${memberDto.phone2}" size="4" minlength="3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />-
                    <input type="tel" id="Phone3" name="Phone3" value="${memberDto.phone3}" size="4" minlength="4" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                </td>
            </tr>
            <tr>
                <th>
                    <div>이메일</div>
                </th>
                <td class="email">
                    <input type="text" id="email_id" name="email_id" value="${memberDto.email_id}" placeholder="이메일" maxlength="18" /> @
                    <input type="text" id="email_domain" name="email_domain" value="${memberDto.email_domain}" placeholder="도메인" maxlength="18"/>
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
                        <input type="radio" id="gender_m" name="m_gender" value="1" ${male}>남
                    </label>
                    <label for="gender_w">
                        <input type="radio" id="gender_w" name="m_gender" value="2" ${female}>여
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

<jsp:include page="footer.jsp" flush="false"/>

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

    $(document).ready(function () {

        let now = new Date();
        let year = now.getFullYear();
        let mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
        let day = (now.getDate()) > 9 ? '' + (now.getDate()) : '0' + (now.getDate());
        //생년월일
        let a = document.querySelector('#year_city');
        let b=  document.querySelector('.years');
        var targetSel = document.getElementById('year_city')
        //  for (let i = 1900; i <= year; i++) {
        //  let b =  <option id="'+i+'" value="' + i + '">' + i + '년</option>
        // b += b
        //};
        //년도 selectbox만들기
        if(${memberDto.m_year == null}) {
            for (let i = 1900; i <= year; i++) {
                $('#select_year').append('<option id="'+i+'" value="' + i + '">' + i + '년</option>');
                // a.append(b);
                // a.insertAdjacentHTML("beforeend",b);
            }
        } else {
            for (let i = 1900; i <= year; i++) {
                if((${memberDto.m_year == null ? 'a':memberDto.m_year}) != i) {
                    $('#select_year').append('<option id="'+i+'" value="' + i + '">' + i + '년</option>');
                } else {
                    $('#select_year').append('<option id="'+i+'" value="' + i + '" selected>' + i + '년</option>');
                }
                // a.append(b);
                // a.insertAdjacentHTML("beforeend",b);
            }
        }


        // 월별 selectbox 만들기
        if(${memberDto.m_month != null}) {
            for (let i = 1; i <= 12; i++) {
                let mm = i > 9 ? i : "0" + i;
                if(${memberDto.m_month == null ? 'a':memberDto.m_month} != i) {
                    $("#select_month").append('<option id="'+i+'" value="' + i + '">' + i + '월</option>');
                } else {
                    $("#select_month").append('<option id="'+i+'" value="' + i + '" selected>' + i + '월</option>');
                }
            }
        }
        $("#select_year").change(function(){
            //값 초기화 후 다시 재실행
            $("#select_month").children("option:not(:first)").remove();

            if(${memberDto.m_month == null}) {
                for (let i = 1; i <= 12; i++) {
                    let mm = i > 9 ? i : "0" + i;

                    $("#select_month").append('<option id="'+i+'" value="' + i + '">' + i + '월</option>');
                }
            } else {
                for (let i = 1; i <= 12; i++) {
                    let mm = i > 9 ? i : "0" + i;
                    if(${memberDto.m_month == null ? 'a':memberDto.m_month} != i) {
                        $("#select_month").append('<option id="'+i+'" value="' + i + '">' + i + '월</option>');
                    } else {
                        $("#select_month").append('<option id="'+i+'" value="' + i + '" selected>' + i + '월</option>');
                    }
                }
            }

        });

        // 일별 selectbox 만들기
        let lastDate = new Date($("#select_year option:selected").val(),$("#select_month option:selected").val(),0)
        if(${memberDto.m_day != null}) {
            for (let i = 1; i <= lastDate.getDate(); i++) {
                let dd = i > 9 ? i : "0" + i;
                if(${memberDto.m_day==null?'a':memberDto.m_day} != i) {
                    $("#select_day").append('<option id="'+i+'" value="' + dd + '">' + dd + '일</option>');
                } else {
                    $("#select_day").append('<option id="'+i+'" value="' + dd + '" selected>' + dd + '일</option>');
                }
            }
        }

        $("#select_month,#select_year").change(function(){
            lastDate = new Date($("#select_year option:selected").val(),$("#select_month option:selected").val(),0)
            console.log(lastDate.getDate())

            console.log( $("#select_year option:selected").val())
            console.log( $("#select_month option:selected").val())
            console.log($("#select_day > option").length+"길이얼마");
            //값 초기화 후 다시 재실행
            $("#select_day").children('option:not(:first)').remove();

            if(${memberDto.m_day == null}) {
                for (let i = 1; i <= lastDate.getDate(); i++) {
                    let dd = i > 9 ? i : "0" + i;
                    $("#select_day").append('<option id="'+i+'" value="' + dd + '">' + dd + '일</option>');
                }
            } else {
                for (let i = 1; i <= lastDate.getDate(); i++) {
                    let dd = i > 9 ? i : "0" + i;
                    if(${memberDto.m_day==null?'a':memberDto.m_day} != i) {
                        $("#select_day").append('<option id="'+i+'" value="' + dd + '">' + dd + '일</option>');
                    } else {
                        $("#select_day").append('<option id="'+i+'" value="' + dd + '" selected>' + dd + '일</option>');
                    }
                }
            }
        });
    });

    ////////////////////////////////////////////////////////////

    /////////////////이용약관 체크박스 전체선택/해제///////////////////////

    $(document).ready(function() {
        $("#agreeall").click(function() {
            if($("#agreeall").is(":checked")) $("input[name=agree]").prop("checked", true);
            else $("input[name=agree]").prop("checked", false);
        });

        $("input[name=agree]").click(function() {
            var total = $("input[name=agree]").length;
            var checked = $("input[name=agree]:checked").length;

            if(total != checked) $("#agreeall").prop("checked", false);
            else $("#agreeall").prop("checked", true);
        });
    });
</script>
</body>
</html>