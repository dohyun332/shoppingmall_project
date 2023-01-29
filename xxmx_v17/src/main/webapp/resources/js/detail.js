/*************탭메뉴 스티키*************** */

$(document).ready(function(){
    let tab_top = $('.info_sec').offset().top;
        
        $(window).scroll(function(){
            let tab_s = $(window).scrollTop();
            console.log(tab_s, tab_top)

            if(tab_s >= tab_top) {
                $('.info_sec').css({
                    position: 'fixed',
                    left: '0',
                    right: '0',
                    margin: '0 auto',
                    top: '60px',
                    maxWidth: '1200px',
                    minWidth: '320px',
                    background: '#fff',
                    zIndex: 998
                })
            }
            else {
                $('.info_sec').css({
                    position: 'absolute',
                    left: '0',
                    top: 'auto',
                    width: '100%',
                    background: '#fff',
                })
            }
        });
})

/**********************실시간인기 슬라이드********************* */
$(document).ready(function(){

    let b_length = $('.now').length;
    for(let i=0; i<b_length; i++) {
        $('.indicator').append('<div class="circle"></div>')
    }
    $('.circle').eq(0).addClass('indi_active')


    $('.now').eq(0).css({ left: 0});
    $('.now').eq(1).css({ right: -2000});
    $('.now').eq(2).css({ left: -2000});

    let index_no = 0;
    let timer = 500;
    
    $('#btn_slide_R').click(function(){
        slide(index_no % b_length, '-100%', (index_no + 1) % b_length, '100%',(index_no+1) % b_length);
    });
    $('#btn_slide_L').click(function(){
        slide(index_no % b_length, '100%', (index_no - 1) % b_length, '-100%',(index_no-1) % b_length ); 
    });

    function slide(o_index, o_pos, c_index, c_pos, next_index) {

        btn_status();

        $('.now').eq(o_index).animate({
            left: o_pos
        }, timer);

        $('.now').eq(c_index).css({
            left: c_pos
        }).animate({
            left: 0
        }, timer);

        index_no=next_index;

            $('.circle').removeClass('indi_active');
            $('.circle').eq(index_no % b_length).addClass('indi_active')
    }

    function btn_status() {
        $('.btn_slide').css({pointerEvents: 'none'})

        setTimeout(() => {
            $('.btn_slide').css({pointerEvents: 'auto'})
        }, timer);
    }

    $('.circle').click(function(){
console.log($(this).index() , $('.indi_active').index())

        let tmp_index = $(this).index()
        if(tmp_index > $('.indi_active').index()) {
            slide(index_no, '-100%', tmp_index, '100%',  tmp_index)
        }
        else if(tmp_index < $('.indi_active').index()) {
            slide(index_no, '100%', tmp_index, '-100%',  tmp_index)
        }




        
        
    });

});

///////////////////위로가기////////////////////////
$(document).ready(function(){

    $(window).scroll(function(){
        if ($(this).scrollTop() > 100) {
            $('.to_top').fadeIn();
        } else {
            $('.to_top').fadeOut();
        }
    });

    $('.to_top').click(function(){
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });

});