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
    for (let i = 1900; i <= year; i++) {
        $('#select_year').append('<option id="'+i+'" value="' + i + '">' + i + '년</option>');
        // a.append(b);
        // a.insertAdjacentHTML("beforeend",b);

    }

    // 월별 selectbox 만들기

    $("#select_year").change(function(){
        //값 초기화 후 다시 재실행
        $("#select_month").children("option:not(:first)").remove();
        for (let i = 1; i <= 12; i++) {
            let mm = i > 9 ? i : "0" + i;


            $("#select_month").append('<option id="'+i+'" value="' + i + '">' + i + '월</option>');
        }
    });

    // 일별 selectbox 만들기
    $("#select_month,#select_year").change(function(){
        let lastDate = new Date($("#select_year option:selected").val(),$("#select_month option:selected").val(),0)
        console.log(lastDate.getDate())

        console.log( $("#select_year option:selected").val())
        console.log( $("#select_month option:selected").val())
        console.log($("#select_day > option").length+"길이얼마");
        //값 초기화 후 다시 재실행
        $("#select_day").children('option:not(:first)').remove();


        for (let i = 1; i <= lastDate.getDate(); i++) {
            let dd = i > 9 ? i : "0" + i;

            $("#select_day").append('<option id="'+i+'" value="' + dd + '">' + dd + '일</option>');

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