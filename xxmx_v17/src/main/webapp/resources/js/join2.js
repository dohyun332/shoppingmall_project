
function joinform_check() {
    //변수
    var joinid = document.getElementById("joinid");
    var joinpw = document.getElementById("joinpw");
    var joinpw_chk = document.getElementById("joinpw_chk");
    var joinname = document.getElementById("joinname");
    var post = document.getElementById("post_detailAddress");
    var phone1 = document.getElementById("Phone1");
    var phone2 = document.getElementById("Phone2");
    var phone3 = document.getElementById("Phone3");
    var email_id = document.getElementById("email_id");
    var email_domain = document.getElementById("email_domain")
    var email_chk = document.getElementById("email_chk")
    var gender_m = document.getElementById("gender_m");
    var gender_w = document.getElementById("gender_w");
    var select_year = document.getElementById("select_year");
    var select_month = document.getElementById("select_month");
    var select_day = document.getElementById("select_day");
    var agree_1 = document.getElementById("agree_1");
    var agree_2 = document.getElementById("agree_2");

    if (joinid.value == "") {
        alert("아이디를 입력해주세요.");
        joinid.focus();
        return false;
    };
    if(id_chk.value=="N"){
        alert("아이디 중복 확인하세요");
        id_chk.focus();
        return false;
    }
    //아이디 정규식
    var id = /^[a-z0-9]{4,16}$/;

    if (!id.test(joinid.value)) {
        alert("아이디는 4~16자의 영문 소문자와 숫자로만 입력해주세요.")
        return false;
    }

    if (joinpw.value == "") {
        alert("비밀번호를 입력해주세요.");
        joinpw.focus();
        return false;
    };

    //비밀번호 정규식
    var pw = $("#joinpw").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if(pw.length < 8 || pw.length > 16){
        alert("비밀번호는 8자리 ~ 16자리 이내로 입력해주세요.");
        return false;
        }else if(pw.search(/\s/) != -1){
        alert("비밀번호는 공백 없이 입력해주세요.");
        return false;
        }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
        alert("비밀번호는 영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
        return false;
    };

    //비밀번호 불일치
    if (joinpw_chk.value !== joinpw.value) {
        alert("비밀번호가 일치하지 않습니다.");
        joinpw_chk.focus();
        return false;
    };

    //이름
    if (joinname.value == "") {
        alert("이름을 입력해주세요.");
        joinname.focus();
        return false;
    };

    //주소 (api 실행후 입력값 안뜰 시 html에서 readonly 삭제)
    if (post.value == "") {
        alert("주소를 입력해주세요.");
        post.focus();
        return false;
    }

    //전화번호
    if (phone1.value == "") {
        alert("전화번호를 선택해주세요.");
        phone1.focus();
        return false;
    }
    if (phone2.value == "") {
        alert("전화번호를 입력해주세요.");
        phone2.focus();
        return false;
    }
    if (phone3.value == "") {
        alert("전화번호를 입력해주세요.");
        phone3.focus();
        return false;
    }

    //이메일
    if (email_id.value == "") {
        alert("이메일 주소를 입력해주세요.");
        email_id.focus();
        return false;
    }

    if (email_domain.value == "") {
        alert("도메인을 입력해주세요.");
        email_domain.focus();
        return false;
    }
    if(email_chk.value=="N"){
        alert("이메일 중복 확인하세요");
        email_chk.focus();
        return false;
    }


    //성별 체크
   if (!gender_m.checked && !gender_w.checked) { //둘다 미체크시
        alert("성별을 선택해주세요.");
        gender_m.focus();
        return false;
    }

    //생년월일
    if (select_year.value == "년") {
        alert("생년월일을 선택해주세요.");
        select.year.focus();
        return false;
    }
    if (select_month.value == "월") {
        alert("생년월일을 선택해주세요.");
        select_month.focus();
        return false;
    }
    if (select_day.value == "일") {
        alert("생년월일을 선택해주세요.");
        select_day.focus();
        return false;
    }

    //약관동의
    if (!agree_1.checked) { //체크박스 미체크시
        alert("약관 동의를 체크해주세요.");
        agree_1.focus();
        return false;
    }

    if (!agree_2.checked) { //체크박스 미체크시
        alert("약관 동의를 체크해주세요.");
        agree_2.focus();
        return false;
    }

    //입력 값 전송
    document.join.submit(); //유효성 검사의 포인트   
}

