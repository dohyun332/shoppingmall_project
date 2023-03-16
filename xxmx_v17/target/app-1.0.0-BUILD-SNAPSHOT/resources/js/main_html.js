$(document).ready(function() {
    /* 메인 배너 생성 */
    //최소 4개 이상
    const m_banner_lengtn = 5;

    //메인배너 텍스트 배열
    let m_banner_text = [
    '<div class="banner_text"><p class="b_txt_tit">필드 위에서도 추위 걱정 없이<br>포근하게 감싸주는</p><p class="b_txt_des">소프트 플리스 랩 블랭킷</p></div>',
    '<div class="banner_text"><p class="b_txt_tit">필드 위에서도 추위 걱정 없이<br>포근하게 감싸주는</p><p class="b_txt_des">소프트 플리스 랩 블랭킷</p></div>',
    '<div class="banner_text"><p class="b_txt_tit">필드 위에서도 추위 걱정 없이<br>포근하게 감싸주는</p><p class="b_txt_des">소프트 플리스 랩 블랭킷</p></div>',
    '<div class="banner_text"><p class="b_txt_tit">필드 위에서도 추위 걱정 없이<br>포근하게 감싸주는</p><p class="b_txt_des">소프트 플리스 랩 블랭킷</p></div>',
    '<div class="banner_text"><p class="b_txt_tit">필드 위에서도 추위 걱정 없이<br>포근하게 감싸주는</p><p class="b_txt_des">소프트 플리스 랩 블랭킷</p></div>'
    ]
    
    let m_banner_add = function() {
        let m_banner = $('.main_banner')
        for(i = 0; i < m_banner_lengtn; i++) {
            m_banner.append(`
            <div class="main_banner_img">
                <a href="">
                    <img src="./img/banner/main_banner_${i+1}.jpg" alt="">
                    ${m_banner_text[i]}
                </a>
            </div>
            `)
        }
        if($(window).width() <= 480){
            $('.main_banner_img').eq(0).css({left: 0})
            $('.main_banner_img').eq(1).css({left: '100%'})
            $('.main_banner_img').eq(m_banner_lengtn-1).css({left: '-100%'})
            $('.banner_text').eq(0).addClass('m_b_txt_active')
        }
        else{
            $('.main_banner_img').eq(0).css({left: 0})
            $('.main_banner_img').eq(1).css({left: 'calc(50% + 10px)'})
            $('.main_banner_img').eq(m_banner_lengtn-1).css({left: 'calc(-50% - 10px)'})
            $('.banner_text').eq(0).addClass('m_b_txt_active')
        }
    }
    m_banner_add();

//    메인배너 슬라이드 함수
//   +1넣으면 오른쪽 -1넣으면 왼쪽
    let m_banner_index_no = 0;
    function m_banner_slide(b) {
        $('.banner_text').removeClass('m_b_txt_active')
        if($(window).width() >= 1024) {
            $('.main_banner_img').eq(m_banner_index_no%m_banner_lengtn).animate({
                left: (b * -51) + '%'
            }, 1000)
            $('.main_banner_img').eq((m_banner_index_no + (1 * b))%m_banner_lengtn).animate({
                left: 0
            }, 1000).find('.banner_text').addClass('m_b_txt_active')
            $('.main_banner_img').eq((m_banner_index_no + (2 * b))%m_banner_lengtn).css({
                left: (b * 102) + '%'
            }).animate({
                left: (b * 51) + '%'
            }, 1000)
            $('.main_banner_img').eq((m_banner_index_no - (1 * b))%m_banner_lengtn).animate({
                left: (b * -102) + '%'
            }, 1000)
        }else if($(window).width() <= 480) {
            $('.main_banner_img').eq(m_banner_index_no%m_banner_lengtn).animate({
                left: (b * -100) + '%'
            }, 1000)
            $('.main_banner_img').eq((m_banner_index_no + (1 * b))%m_banner_lengtn).css({
                left: (b * 100) + '%'
            }).animate({
                left: 0 + '%'
            }, 1000).find('.banner_text').addClass('m_b_txt_active')
        }


        m_banner_index_no = m_banner_index_no + b
    }

//    메인배너 슬라이드 이벤트
    $('.m_R').click(function() {
        $('.m_R').css({pointerEvents: 'none'})
        setTimeout(() => {
            $('.m_R').css({pointerEvents: 'auto'})
        }, 1000);
        m_banner_slide(1)
    })
    $('.m_L').click(function() {
        $('.m_L').css({pointerEvents: 'none'})
        setTimeout(() => {
            $('.m_L').css({pointerEvents: 'auto'})
        }, 1000);
        m_banner_slide(-1)
    })


//     모바일 화면에서 베스트 아이템 텍스트 변환
    if($(window).width() <= 480) {
        $('.best_title').text('베스트 아이템')
    }

//    베스트 카테고리 선택시 탭 변환 
//    전체 맨즈 우먼 키즈 골프
    $('.cate_box div').click(function() {
        $('.cate_box div').removeClass('active')
        $('.cate_box div .active_c').addClass('dis_n')
        $('.best').css({
            display: 'none'
        })
        $(this).addClass('active')
        $(this).children('.active_c').removeClass('dis_n')
        $('.best').eq($(this).index()).css({
            display: 'flex'
        })
    })


//   베스트 카테고리에 순번 먹이기
    for(i = 0; i < $('.best').length; i++) {
        for(j = 0; j < 10; j++) {
            $('.best').eq(i).find('.best_no').eq(j).text(`${j+1}`)
        }
    }



//    중앙 배너 배치
$('.mid_banner_img').eq(0).css({
    left: 0
})
if($(window).width() > 480) {
    $('.mid_banner_img').eq(1).css({
        left: '50%'
    })
}

//      중앙 배너 슬라이드
//     lr이 1이면 오른쪽 -1이면 왼쪽
    let mid_banner_index_no = 0;
    function mid_banner_slide(lr) {
        let m_b_s_tmp1 = 0;
        let m_b_s_tmp2 = 0;
        if(lr == 1) {
            m_b_s_tmp1 = 150;
            m_b_s_tmp2 = 50;
        }else {
            m_b_s_tmp1 = 50;
            m_b_s_tmp2 = 150;
        }
        if($(window).width()<=480){
            $('.mid_banner_img').eq(mid_banner_index_no%$('.mid_banner_img').length).animate({
                left: (lr * 100) + '%'
            }, 1000)
            $('.mid_banner_img').eq((mid_banner_index_no + 1*lr)%$('.mid_banner_img').length).css({
                left: (lr * -100) + '%'
            }).animate({
                left: '0%'
            }, 1000)
            mid_banner_index_no = mid_banner_index_no + lr
        }else {
            $('.mid_banner_img').eq(mid_banner_index_no%$('.mid_banner_img').length).animate({
                left: (lr * 100) + '%'
            }, 1000)
            $('.mid_banner_img').eq((mid_banner_index_no + 1)%$('.mid_banner_img').length).animate({
                left: (lr * m_b_s_tmp1) + '%'
            }, 1000)
            $('.mid_banner_img').eq((mid_banner_index_no + 2)%$('.mid_banner_img').length).css({
                left: (lr * -100) + '%'
            }).animate({
                left: '0%'
            }, 1000)
            $('.mid_banner_img').eq((mid_banner_index_no + 3)%$('.mid_banner_img').length).css({
                left: (lr * -m_b_s_tmp2) + '%'
            }).animate({
                left: '50%'
            }, 1000)
            mid_banner_index_no = mid_banner_index_no + 2*lr
        }
    }

    //   중앙 배너 모바일 슬라이드


    //    배너 슬라이드 버튼
    $('.mid_L').click(function(){
        $(this).css({pointerEvents: 'none'})
        setTimeout(() => {
            $(this).css({pointerEvents: 'auto'})
        }, 1000);
        mid_banner_slide(1)
    })
    $('.mid_R').click(function(){
        $(this).css({pointerEvents: 'none'})
        setTimeout(() => {
            $(this).css({pointerEvents: 'auto'})
        }, 1000);
        mid_banner_slide(-1)
    })


//    실시간 급상승 모바일시 텍스트 변환
$('.inc_title').html('<b>실시간 급상승</b>')

//           실시간 급상승 드래그

    let slide_click = false;
    let slide_start_point = 0;
    let slide_piont = 0;
    let slide_standard =0;
    $('.inc_slide').mousedown(function(e) {
        slide_click = true;
        slide_start_point = e.pageX;
        slide_standard = Number($('.inc_slide').attr('style').split(':')[1].replace("px;", " "));
    })
    $('.inc_slide').mouseup(function() {
        slide_click = false;
    })
    $('.inc_slide').mouseleave(function() {
        slide_click = false;
    })
    $('.inc_slide').mousemove(function(e) {
        if(slide_click) {
            slide_piont = e.pageX;
            if((slide_standard - (slide_start_point - slide_piont))<=0 && ($('.inc_box').width() - $(this).width()) <= (slide_standard - (slide_start_point - slide_piont))) {
                $(this).attr('style', `left: ${(slide_standard - (slide_start_point - slide_piont))}px;`)
                $('.slider_bar').attr('style', `left: ${(-(slide_standard - (slide_start_point - slide_piont))/2)}px;`)
            }
        }
    })

    //실시간 급상승 스와이프

    $('.inc_slide').on('touchstart', function(e) {
        slide_click = true;
        slide_start_point = e.originalEvent.touches[0].pageX;
        slide_standard = Number($('.inc_slide').attr('style').split(':')[1].replace("px;", " "));
    })
    $('.inc_slide').on('touchend', function() {
        slide_click = false;
    })
    $('.inc_slide').on('touchmove', function(e) {
        if(slide_click) {
            slide_piont = e.originalEvent.touches[0].pageX;
            console.log(slide_click + '+' + slide_start_point + '+' + slide_standard)
            if((slide_standard - (slide_start_point - slide_piont))<=0 && ($('.inc_box').width() - $(this).width()) <= (slide_standard - (slide_start_point - slide_piont))) {
                $(this).attr('style', `left: ${(slide_standard - (slide_start_point - slide_piont))}px;`)
                $('.slider_bar').attr('style', `left: ${(-(slide_standard - (slide_start_point - slide_piont))/7)}px;`)
            }
        }
    })



//  카테고리 이미지 스크롤

$(window).scroll(function() {
    if($(window).width() > 480) {
        scroll(0)
        scroll(1)
        scroll(2)
        scroll(3)
    }
})


// 이미지 스크롤 펑션
function scroll(no) {
        let w_top = $(window).scrollTop();
        let c_with = ($('.cate').eq(0).width())*0.2;
        let c_height = c_with*1.975577146315794;
        if(w_top >= $('.cate').eq(no).offset().top &&
        w_top+c_height <= $('.cate').eq(no).offset().top + $('.cate').eq(no).height()
        ) {
            $('.cate_img').eq(no).css({
                position: 'fixed',
                top: 120,
                width: c_with,
                height: c_height,
            })
        }
        else if(w_top+c_height > ($('.cate').eq(no).offset().top + $('.cate').eq(no).height())) {
            $('.cate_img').eq(no).css({
                position: 'absolute',
                top: ($('.cate').eq(no).height() - c_height),
                width: c_with,
                height: c_height,
            })
        }
        else {
            $('.cate_img').eq(no).css({
                position: 'relative',
                top: 0,
                width: c_with,
                height: c_height,
            })
        }
    }


    //   md  모바일 이미지 변환

    if($(window).width() <= 480) {
        $('.md_pick').eq(0).find('img').attr('src','./img/md_pick_img_m_221124_2.jpg')
        $('.md_pick').eq(1).find('img').attr('src','./img/md_pick_img_m_221124_3.jpg')
    }


//     md   술라이드
let md_count = 0;
let md_length = 2;
function md_slide(a) {
    $('.md_pick').css({
        opacity: 0,
        z_index: 1,
    })
    $('.md_pick').eq(md_count % md_length).css({
        opacity: 1,
        z_index: 10,
    })
    md_count=md_count + a
}

$('.md_pick_btn img:first-child').click(function() {
    $(this).css({pointerEvents: 'none'})
    setTimeout(() => {
        $(this).css({pointerEvents: 'auto'})
    }, 300);
    md_slide(-1)
})
$('.md_pick_btn img:last-child').click(function() {
    $(this).css({pointerEvents: 'none'})
    setTimeout(() => {
        $(this).css({pointerEvents: 'auto'})
    }, 300);
    md_slide(1)
})

//   리뷰  생성

let review_count = 18;
if($(window).width() <= 480) {
    review_count = 9;
}
for(i=0; i<review_count; i++) {
    $('.review_area').append(`
        <div class="review">
            <a href="">
                <img src="./img/banner/main_banner_3.jpg" alt="" class="review_img">
            </a>
        </div>
    `)
    let img_width = $('.review_area:last-child img').width();
    let img_height = $('.review_area:last-child img').height();

    //   리뷰 이미지 사이즈 조절
    if(img_width > img_height) {
        $('.review_area:last-child img').css({
            height: '100%'
        })
    }else {
        $('.review_area:last-child img').css({
            width: '100%'
        })
    }
}
//  모바일 리뷰 텍스트
$('.review_title div:last-child').html('.<img src="./img/icons/btn_more.png" alt="">')



});