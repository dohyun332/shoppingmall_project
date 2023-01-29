

//////////로그인 유효성검사///////////////

function submit_chk() {

    var id = document.getElementById("userid");
    var pw = document.getElementById("userpw");

    if(id.value == "") {
        alert("회원 ID를 입력하세요.");
        id.focus();
        return false;
    } else if (pw.value == "") {
        alert("회원 비밀번호를 입력하세요.");
        pw.focus();
        return false;
    } else {
        submit();
    }





};