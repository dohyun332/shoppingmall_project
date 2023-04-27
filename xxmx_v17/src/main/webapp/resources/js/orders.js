$(document).ready(function() {
    // 가격계산
    let price = $(".pd_price");
    let price_cnt = $(".pd_price").length;
    let total=0;
    for(let i=0; i<price_cnt; i++) {
        total += +(price.eq(i).text().replace(",", "").replace("원", ""));
    }
    $("#total_price1").text((total).toLocaleString("ko") + "원");
    $("#total_price2").text((total+2500).toLocaleString("ko") + "원");
    $("#total_price3").text((total+2500).toLocaleString("ko") + "원");


    // 이메일 도메인 입력
    $("#mailProvider").on("change", function() {
        $("#email2").val($(this).val());
    })

    // 전화번호 유효성검사
    $("#p_cell1").change(function() {
        let val = $("#p_cell1").val();
        if(val.length>=5) {
            alert("휴대전화는 5자리 이상이 될수 없습니다.");
            $("#p_cell1").val("");
        }
        else if(isNaN(+val)) {
            alert("휴대전화는 숫자만 입력가능합니다.");
            $("#p_cell1").val("");
        }
    })
    $("#p_cell2").change(function() {
        let val = $("#p_cell2").val();
        if(val.length>=5) {
            alert("휴대전화는 5자리 이상이 될수 없습니다.");
            $("#p_cell2").val("");
        }
        else if(isNaN(+val)) {
            alert("휴대전화는 숫자만 입력가능합니다.");
            $("#p_cell2").val("");
        }
    })
    $("#p_deliveryCell1_1").change(function() {
        let val = $("#p_deliveryCell1_1").val();
        if(val.length>=5) {
            alert("휴대전화는 5자리 이상이 될수 없습니다.");
            $("#p_deliveryCell1_1").val("");
        }
        else if(isNaN(+val)) {
            alert("휴대전화는 숫자만 입력가능합니다.");
            $("#p_deliveryCell1_1").val("");
        }
    })
    $("#p_deliveryCell1_2").change(function() {
        let val = $("#p_deliveryCell1_2").val();
        if(val.length>=5) {
            alert("휴대전화는 5자리 이상이 될수 없습니다.");
            $("#p_deliveryCell1_2").val("");
        }
        else if(isNaN(+val)) {
            alert("휴대전화는 숫자만 입력가능합니다.");
            $("#p_deliveryCell1_2").val("");
        }
    })
    $("#p_deliveryCell2_1").change(function() {
        let val = $("#p_deliveryCell2_1").val();
        if(val.length>=5) {
            alert("휴대전화는 5자리 이상이 될수 없습니다.");
            $("#p_deliveryCell2_1").val("");
        }
        else if(isNaN(+val)) {
            alert("휴대전화는 숫자만 입력가능합니다.");
            $("#p_deliveryCell2_1").val("");
        }
    })
    $("#p_deliveryCell2_2").change(function() {
        let val = $("#p_deliveryCell2_2").val();
        if(val.length>=5) {
            alert("휴대전화는 5자리 이상이 될수 없습니다.");
            $("#p_deliveryCell2_2").val("");
        }
        else if(isNaN(+val)) {
            alert("휴대전화는 숫자만 입력가능합니다.");
            $("#p_deliveryCell2_2").val("");
        }
    })
    // 배송메세지 100자 이하
    $("#p_deliveryMessage").change(function() {
        let val = $("#p_deliveryMessage").val();
        if(val.length>100) {
            alert("배송메세지는 100자리를 초과 할 수 없습니다.");
            $("#p_deliveryMessage").val("");
        }
    })

    // 위 정보와 같음
    $("#copy_info").click(function() {
        if($("#copy_info").prop("checked") == true) {
            $("#p_deliveryName").val($("#order_name").text());
            $("#p_deliveryCell1_1").val($("#p_cell1").val());
            $("#p_deliveryCell1_2").val($("#p_cell2").val());
        }
        else {
            $("#p_deliveryName").val("");
            $("#p_deliveryCell1_1").val("");
            $("#p_deliveryCell1_2").val("");
        }
    })

    //최근배송지 가져오기
    $("#desti_recent").change(function() {
        if($("#p_homeAddr2").prop("checked") == true) {
            let value = $("#desti_recent option:selected").val();
            value = value.split(": ");
            let zip = value[0];
            let desti1 = value[1].split(", ");
            let desti2 = desti1[1];
            desti1 = desti1[0];

            $("#p_zipCode").val(zip);
            $("#p_destination1").val(desti1);
            $("#p_destination2").val(desti2);
        }
    })

    $("#p_homeAddr2").click(function() {
        let value = $("#desti_recent option:selected").val();

        if((value != "x") && ($("#p_homeAddr2").prop("checked") == true)) {
            console.log(value);
            value = value.split(": ");
            let zip = value[0];
            let desti1 = value[1].split(", ");
            let desti2 = desti1[1];
            desti1 = desti1[0];

            $("#p_zipCode").val(zip);
            $("#p_destination1").val(desti1);
            $("#p_destination2").val(desti2);
        }
    })

    // 자택주소 입력
    $("#p_homeAddr1").click(function() {
        let home_btn =  $("#p_homeAddr1");
        if(home_btn.prop("checked") == true) {
            let zipCode = $("#m_zipCode").val();
            let m_addr1 = $("#m_addr1").val();
            let m_addr2 = $("#m_addr2").val();
            $("#p_zipCode").val(zipCode);
            $("#p_destination1").val(m_addr1);
            $("#p_destination2").val(m_addr2);
        }
    })

    // 주문동의 유효성 검사
    $("#submit_order").on("click", function() {
        // let frm = $("#frm");
        // if($("#email1").val() == "") {
        //     alert("주문자정보의 이메일을 입력해주세요");
        //     $("#email1").focus();
        // }
        // else if($("#email2").val() == "") {
        //     alert("주문자정보의 이메일의 도메인을 입력해주세요");
        //     $("#email2").focus();
        // }
        // else if($("#p_cell1").val() == "") {
        //     alert("주문자정보의 연락처를 입력해주세요");
        //     $("#p_cell1").focus();
        // }
        // else if($("#p_cell2").val() == "") {
        //     alert("주문자정보의 연락처를 입력해주세요");
        //     $("#p_cell2").focus();
        // }
        // else if($("#p_deliveryName").val() == "") {
        //     alert("배송정보의 이름을 입력해주세요");
        //     $("#p_deliveryName").focus();
        // }
        // else if($("#p_deliveryCell1_1").val() == "") {
        //     alert("배송정보의 연락처1을 입력해주세요");
        //     $("#p_deliveryCell1_1").focus();
        // }
        // else if($("#p_deliveryCell1_2").val() == "") {
        //     alert("배송정보의 연락처1을 입력해주세요");
        //     $("#p_deliveryCell1_2").focus();
        // }
        // else if($("#p_homeAddr1").prop("checked") == false
        //     && $("#p_homeAddr2").prop("checked") == false
        //     && $("#p_homeAddr3").prop("checked") == false
        // ) {
        //     alert("배송지 선택버튼을 체크해주세요");
        //     $("#p_homeAddr1").focus();
        // }
        // else if($("#p_zipCode").val() == "") {
        //     alert("배송정보의 우편번호를 입력해주세요");
        //     $("#p_zipCode").focus();
        // }
        // else if($("#p_destination1").val() == "") {
        //     alert("배송정보의 주소를 입력해주세요");
        //     $("#p_destination1").focus();
        // }
        // else if($("#p_destination2").val() == "") {
        //     alert("배송정보의 주소를 입력해주세요");
        //     $("#p_destination2").focus();
        // }
        // else if($("#p_deliveryMessage").val() == "") {
        //     alert("배송메세지를 입력해주세요");
        //     $("#p_deliveryMessage").focus();
        // }
        // else if($("#p_pay1").prop("checked") == false
        //     && $("#p_pay2").prop("checked") == false
        //     && $("#p_pay3").prop("checked") == false
        // ) {
        //     alert("결제방법 선택버튼을 체크해주세요");
        //     $("#p_pay1").focus();
        // }
        // else if($("#order_agree").prop("checked") == false) {
        //     alert("주문동의하셔야 주문이 가능합니다.");
        //     $("#order_agree").focus();
        // } else {
            frm.attr("action", "/product/orders_submit");
            frm.attr("method", "post");
            frm.submit();
        // }
    })

    $("#cancel_order").on("click", function() {
        let frm = $("#frm");
        frm.attr("action", "/product/cart");
        frm.attr("method", "post");
        frm.submit();
    })

})
