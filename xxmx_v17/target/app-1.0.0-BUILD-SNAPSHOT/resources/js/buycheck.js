//////////////유효성////////////////////////
$(document).ready(function () {
    $(".buy").click(function () {
        if ($(".opt_selected").children(".sel_color_box").length == 0) {
            alert('[사이즈]의 옵션은 필수선택 항목입니다. 옵션을 반드시 선택하세요.'); return false;
        } else {
            alert('장바구니에 담겨 있는, 상품도 함께 주문됩니다. 원치 않으실 경우 장바구니를 비워주세요.');
        }

        let frm = $("#itembuy");
        frm.attr("action", "/product/orders");
        frm.attr("method", "post");
        frm.submit();
    });

    $(".cart").click(function () {
        if ($(".opt_selected").children(".sel_color_box").length == 0) {
            alert('[사이즈]의 옵션은 필수선택 항목입니다. 옵션을 반드시 선택하세요.'); return false;
        }

        let p_serialNo = $("#p_serialNo").val();
        let p_choiceSize = new Array();
        let p_choiceQuantity = new Array();
        for(let i=0;i<$(".p_choiceSize").length;i++) {
            p_choiceSize[i] = $(".p_choiceSize").eq(i).val();
        }
        for(let i=0;i<$(".txt_qty").length;i++) {
            p_choiceQuantity[i] = $(".txt_qty").eq(i).val();
        }
        // alert("ajax");
        $.ajax({
            type:"GET", // 요청메서드
            url: "/product/cartAdd",
            traditional: true,
            data: {
                p_serialNo : p_serialNo,
                p_choiceSize : p_choiceSize,
                p_choiceQuantity : p_choiceQuantity
            },
            success : function(result) {
                if(result == "id") {
                    alert("장바구니는 로그인 이후에 이용해주세요");
                } else if(result == "ok") {
                    openPop();
                } else if(result == "fail") {
                    alert("일부 상품담기에 실패했습니다. 잠시후 다시 시도해주세요");
                }
            }
        })

        // let frm = $("#itembuy");
        // frm.attr("action", "/product/cart");
        // frm.attr("method", "post");
        // frm.submit();
    });
});
///////////////////////////장바구니 팝업

// 팝업 띄우기
function openPop() {
    document.getElementById("popup").style.display = "block";
}

// 팝업 닫기
function closePop() {
    document.getElementById("popup").style.display = "none";
}

////////////////////////////////////////////////