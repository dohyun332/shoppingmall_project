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
    
    
            /* 인디케이터 색 이동
                -순서
                1) 모든 circle에 indi_active 클래스 삭제
                2) 현재 번째꺼 하나에 indi_active 추가
            */
            // setTimeout(function(){
                $('.circle').removeClass('indi_active');
                $('.circle').eq(index_no % b_length).addClass('indi_active')
            // }, timer / 2)
        }
    
        function btn_status() {
            // 버튼 막기
            $('.btn_slide').css({pointerEvents: 'none'})
    
            // 일정시간 후에 버튼 다시 살리기
            setTimeout(() => {
                $('.btn_slide').css({pointerEvents: 'auto'})
            }, timer);
        }
    
    
    // 1) circle 클릭 감지
    // 2) 몇번째 circle이 눌렸는지 감지
    // 3) banner 중에 2번에서 구한 번째꺼 가운데로 가져오기
        // 인디케이터 클릭
        $('.circle').click(function(){
     console.log($(this).index() , $('.indi_active').index())
    
            let tmp_index = $(this).index()
            // 현재 보고있는것보다 클릭한게 우측
            // $(this).index() - 현재 몇번째꺼 눌렀는지 감지
            // $('.indi_active').index() - 현재 indi_active를 가지고있는 요소가 몇번째 요소인지 확인
            // if(tmp_index > index_no)
            if(tmp_index > $('.indi_active').index()) {
                slide(index_no, '-100%', tmp_index, '100%',  tmp_index)
            }
            // 좌측
            else if(tmp_index < $('.indi_active').index()) {
                slide(index_no, '100%', tmp_index, '-100%',  tmp_index)
            }
    
    
    
    
            
            
        });
    
    });