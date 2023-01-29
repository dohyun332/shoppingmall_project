 /* 무한스크롤 */
 $(document).ready(function () {

     for (let i = 0; i < 10; i++) {
         $('.pl_item').eq(i).css({display: 'block'})
     }

    let count = 1;
    let start_index = 10; //10 개씩 불러올떄 사용
    $(window).scroll(function () {
        let s_bot = $(window).scrollTop() + $(window).height()
        let f_o_top = $('.footer').offset().top + 200;
        console.log(f_o_top);

        if ( s_bot >= f_o_top) {
            console.log("끝")
        
            for (let i = 0; i < 10; i++) {
                // $('.product_list').append(`<li class="pl_item"></li>`)
                // $(`<li class="pl_item"></li>`).appendTo('.product_list')
                $('.pl_item').eq(i+start_index).css({display: 'block'})

            }

            start_index+=10;
            count += 1;
        }
    })

});

/* 선택박스 */
$(document).ready(function (){
    $("#sort").change(function (){
        $("#frm").submit();
    })
})