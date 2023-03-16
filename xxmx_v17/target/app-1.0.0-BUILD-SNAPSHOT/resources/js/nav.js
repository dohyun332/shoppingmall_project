$(document).ready(function() {

    /*     햄버거 버튼    */

    $('.ham_btn').click(function(){
        if(!$('.ham_btn').hasClass('ham_active')) {
            ham($('.ham_btn div:nth-child(1)'), 'translateY(8px)' , 'translateY(8px) rotate(45deg)');
            ham($('.ham_btn div:nth-child(2)'), -1, 'scale(0)');
            ham($('.ham_btn div:nth-child(3)'), 'translateY(-8px)' , 'translateY(-8px) rotate(-45deg)');
            $('.all_menu').css({display: 'block'})
            if($(window).width() <= 480) {
                $('.m_nav_cate_more').css({
                    height: 0,
                    margin: 0,
                })
            }
        }
        else {
            ham($('.ham_btn div:nth-child(1)'), 'translateY(8px) rotate(0)' , 'translateY(0px) rotate(0)');
            ham($('.ham_btn div:nth-child(2)'), -1, 'scale(1)');
            ham($('.ham_btn div:nth-child(3)'), 'translateY(-8px) rotate(0deg)' , 'translateY(0px)');
            $('.all_menu').css({display: 'none'})
        }
        
        $('.ham_btn').toggleClass('ham_active') ;
    })
    /*     햄버거 버튼 변환 함수    */
    function ham(el, trans, rot) {
        if(trans != -1) {
            el.css({
                transform: trans
            });
        } 
        setTimeout(()=> {
            el.css({
                transform: rot
            })
        }, 300); 
    }
    /*     카테고리 호버시 메뉴 노출    */
    $('.nav_cate_box').parent().mouseenter(function(){
        if($(window).width() >= 1024) {
            $(this).children('.nav_cate_box').css({
                display: 'block'
            })
        }
    })
    $('.nav_cate_box').mouseenter(function() {
        $(this).css({
            display: 'block'
        })
    })

    $('.nav_cate_box').parent().mouseleave(function(){
        $(this).children('.nav_cate_box').css({
            display: 'none'
        })
    })
    $('.nav_cate_box').mouseleave(function() {
        $(this).css({
            display: 'none'
        })
    })
    /*     스크롤 다운시 네비바 픽스드    */
    let h = $('#t_banner').height() + $('nav').height();
    $(window).scroll(function(){
        if($(window).width() >= 1024) {
            let w_top = $(window).scrollTop();
            if(w_top > h) {
                $('.header_wrap').addClass('header_wrap_active')
                $('#t_banner').css({
                    height: 0
                })
                $('.wrap').css({
                    margin: '60px 0 0 0'
                })
            }
            else {
                $('.header_wrap').removeClass('header_wrap_active')
                $('#t_banner').css({
                    height: '30px'
                })
                $('.wrap').css({
                    margin: '120px 0 0 0'
                })
            }
        }
    })

    //          서치버튼 클릭시 서치판 들어오기


    function search_act(no) {
        $('.search_pan').css({
            transform: `translateX(${no})`
        })
        if(no == 0) {
            $('.search_disable').css({
                visibility: 'visible',
                opacity: 1,
            })
        }else {
            $('.search_disable').css({
                visibility: 'hidden',
                opacity: 0,
            })
        }
    }

    $('.search_icon_nav').click(function(){
        search_act(0)
    })
    $('.s_close').click(function(){
        search_act('100%')
    })


    $('.m_nav_cate').click(function(){
        if($(window).width() <= 480) {
            $('.m_nav_cate_more').css({
                height: 0,
                margin: 0,
            })
            $(this).parent().children('.m_nav_cate_more').css({
                height: 'auto',
                margin: '0 0 10px 20px',
            })
        }
    })

    function m_size_footer() {
        for(i=2; i<7; i++) {
            $('.info>.footer_menu').eq(i).toggleClass('dis_n')
        }
    }

    if($(window).width() <= 480) {
        m_size_footer()
    }
    $('.info>.footer_menu').eq(1).click(function(){
        if($(window).width() <= 480) {
            m_size_footer()
        }
    })

});



