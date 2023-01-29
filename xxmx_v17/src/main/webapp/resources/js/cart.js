$(document).ready(function() {
    // 가격 소계, 합계 작업
    if($(".pd_price").length != 0) {
        let p_length = $(".pd_price").length;

        // 배송비 제외 상품금액합계
        let p_total=0;
        // 배송비 포함 상품금액합계
        let a_total=0;
        for(let i=0; i<p_length; i++) {
            let price = $(".pd_price").eq(i).text();
            price = price.replace(",", "").replace("원", "");

            let count = $(".pd_cnt").eq(i).val();
            let subTotal = +count * +price;
            console.log(subTotal);
            //  소계
            $(".pd_subTotal").eq(i).prepend((subTotal).toLocaleString("ko") + "원");

            // 배송비 제외 상품금액
            p_total += subTotal;
            // 배송비 포함예정 상품금액
            a_total += subTotal;
        }
        $(".sum_product").text((p_total).toLocaleString("ko") + "원");
        $(".sum_total").text((a_total+2500).toLocaleString("ko") + "원");
    }

    $(".chk_all").on("click", function() {
        if($(".chk_all").is(":checked")) {
            $(".chk_cart").prop("checked", true);
        }
        else {
            $(".chk_cart").prop("checked", false);
        }
    })

    // 체크박스 전체선택 버튼
    $(".chk_cart").click(function() {
        let total = $(".chk_cart").length;
        let total_chk = $(".chk_cart:checked").length;
        if(total == total_chk) {
            $(".chk_all").prop("checked", true);
        }
        else {
            $(".chk_all").prop("checked", false);
        }
    })

    $(".plus").on("click", function() {
        let pd_cnt = $(this).next(".pd_cnt");
        pd_cnt.val(+pd_cnt.val()+1);

        let price = $(this).parent().parent().prev(".pd_price").text();
        price = price.replace(",", "").replace("원", "");
        $(this).parent().parent().nextAll(".pd_subTotal").text((+pd_cnt.val() * +price).toLocaleString("ko") + "원");
    })
    $(".minus").on("click", function() {
        let pd_cnt = $(this).prev(".pd_cnt");
        if(pd_cnt.val() <= 1) {
            alert("수량은 1미만으로 입력할수 없습니다.");
            pd_cnt.val(1);
            return;
        }
        pd_cnt.val(+pd_cnt.val()-1);

        let price = $(this).parent().parent().prev(".pd_price").text();
        price = price.replace(",", "").replace("원", "");
        console.log(price);
        $(this).parent().parent().nextAll(".pd_subTotal").text((+pd_cnt.val() * +price).toLocaleString("ko") + "원");
    })

    $(".btn_modify").on("click", function() {
        $(".chk_cart").prop("checked", false);
        $(this).parent().prevAll(".chk_col").children('.chk_cart').prop("checked", true);
        let frm = $("#frm");
        frm.attr("action", "/product/cartChg");
        frm.attr("method", "post");
        frm.submit();
    })
    $(".delete_part").on("click", function() {
        let cartCnt = $(".tb_content").length;
        let chkCnt = 0;
        for(let i=0; i<cartCnt; i++) {
            if($(".chk_cart").eq(i).prop("checked")) {
                chkCnt+=1;
            }
        }
        if(cartCnt == 0) {
            alert("장바구니에 상품을 담아주세요");
        } else if(chkCnt == 0) {
            alert("장바구니의 상품을 선택해주세요");
        }
        else {
            let frm = $("#frm");
            frm.attr("action", "/product/cartDeletePart");
            frm.attr("method", "post");
            frm.submit();
        }
    })
    $(".delete_all").on("click", function() {
        if(!confirm("전체삭제 하시겠습니까?")) {
        } else {
            let frm = $("#frm");
            frm.attr("action", "/product/cartDeleteAll");
            frm.attr("method", "post");
            frm.submit();
        }
    })
    $(".shopping").on("click", function() {
        let frm = $("#frm");
        frm.attr("action", "/");
        frm.attr("method", "post");
        frm.submit();
    })
    $(".orders").on("click", function() {
        // 장바구니 항목 없을때 막기
        if($(".tb_content").length == 0) {
            alert("장바구니에 담긴 품목이 없습니다.");
            return;
        }
        let frm = $("#frm");
        frm.attr("action", "/product/orders");
        frm.attr("method", "post");
        frm.submit();
    })
});
