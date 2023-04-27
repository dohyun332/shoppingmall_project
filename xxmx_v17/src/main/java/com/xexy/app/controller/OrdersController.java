package com.xexy.app.controller;

import com.xexy.app.domain.*;
import com.xexy.app.service.CartProductService;
import com.xexy.app.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.logging.Logger;


@Controller
@RequestMapping("/product")
public class OrdersController {

    Logger logger = Logger.getLogger(OrdersController.class.getName());

    @Autowired
    OrdersService ordersService;
    @Autowired
    CartProductService cartProductService;

    @RequestMapping("/orders")
    public String orders(HttpSession session, Model m, String p_serialNo, int[] p_choiceQuantity, String[] p_choiceSize) {
        String id = (String)session.getAttribute("id");
        if(id == null || id.equals("null")) {
            return "redirect:/login/login";
        }

        // 구매목록 불러오기
        String serialNo = p_serialNo;
        if(p_choiceQuantity != null) {
            int arr_cnt = p_choiceQuantity.length;
            for(int i=0; i<arr_cnt; i++) {
                int choiceQuantity = p_choiceQuantity[i];
                String choiceSize = p_choiceSize[i];

                CartProductDto cartProductDto = new CartProductDto(id, serialNo, choiceQuantity, choiceSize);

                if(cartProductService.cartOne(cartProductDto) != null) {
                    cartProductService.countAdd(cartProductDto);
                } else {
                    cartProductService.cartAdd(cartProductDto);
                }
            }
        }
        List<CartProductDto> orderList = cartProductService.cartAll(id);
        for(CartProductDto ol:orderList) {
            int quantity = ol.getP_choiceQuantity();
            int price = ol.getP_price();
            ol.setSubtotal(quantity * price);
        }
        m.addAttribute("orderList", orderList);

        // 이름, 이메일, 집주소 불러오기
        OrderNameMailDto orderNameMailDto = ordersService.getNameMail(id);
        String[] email = orderNameMailDto.getM_email().split("@");
        String email1 = "";
        if(email.length >= 2) {
            email1 = email[0];
            String email2 = email[1];
            m.addAttribute("email1", email1);
            m.addAttribute("email2", email2);
            m.addAttribute("orderNameMailDto", orderNameMailDto);
        } else {
            email1 = email[0];
            m.addAttribute("email1", email1);
            m.addAttribute("orderNameMailDto", orderNameMailDto);
        }

        // 배송지목록 불러오기
        List<OrderDestinationDto> destiList = ordersService.getDestination(id);
        m.addAttribute("destiList", destiList);


        return "orders";
    }
    @RequestMapping("/orders_submit")
    public String order_sub(HttpSession session, String email1, String email2, String p_cell1, String p_cell2,
                            AddressDto addressDto,String p_deliveryCell1_1, String p_deliveryCell1_2,
                            String p_deliveryCell2_1, String p_deliveryCell2_2, String agreement, Model m) {
// 주문내역tb 저장하기
        String id = (String) session.getAttribute("id");

System.out.println("agreement = " + agreement);
        String msg = null;
        if(email1 == null) {
            msg = "주문자정보의 이메일을 입력해주세요";
        } else if (email2.equals("")) {
            msg = "주문자정보의 이메일의 도메인을 입력해주세요";
        }
        else if(p_cell1.equals("") || p_cell2.equals("")) {
            msg = "주문자정보의 연락처를 입력해주세요";
        }
        else if(addressDto.getP_deliveryName().equals("")) {
            msg = "배송정보의 이름을 입력해주세요";
        }
        else if(p_deliveryCell1_1.equals("") || p_deliveryCell1_2.equals("")) {
            msg = "배송정보의 연락처1을 입력해주세요";
        } else if(addressDto.getP_homeAddr() == null) {
            msg = "배송정보의 배송지를 자택, 최근배송지, 신규배송지 중 체크해주세요";
        }
        else if(addressDto.getP_zipCode() == null) {
            msg = "배송정보의 우편번호를 입력해주세요";
        }
        else if(addressDto.getP_destination1().equals("")) {
            msg = "배송정보의 주소를 입력해주세요";
        }
        else if(addressDto.getP_destination2().equals("")) {
            msg = "배송정보의 상세주소를 입력해주세요";
        }
        else if(addressDto.getP_deliveryMessage().equals("")) {
            msg = "배송메세지를 입력해주세요";
        }
        else if(addressDto.getP_pay() == null) {
            msg = "결제방법을 선택해주세요";
        }
        else if(agreement == null) {
            msg = "구매진행에 동의해주세요";
        }

        if(msg != null) {
            m.addAttribute("email1", email1);
            m.addAttribute("email2", email2);
            m.addAttribute("p_cell1", p_cell1);
            m.addAttribute("p_cell2", p_cell2);
            m.addAttribute("addressDto", addressDto);
            m.addAttribute("p_deliveryCell1_1", p_deliveryCell1_1);
            m.addAttribute("p_deliveryCell1_2", p_deliveryCell1_2);
            m.addAttribute("msg", msg);

            return "forward:/product/orders";
        }

        // 주문내역 tb에 송장번호 계산하여 넣기
        int p_invoice = ordersService.getInvo() + 1;
        List<CartProductDto> cartList = cartProductService.cartAll(id);
        OrdersDto ordersDto = new OrdersDto(p_invoice, id);
        int totalPrice = 0;
        for(CartProductDto cl:cartList) {
            int Quantity = cl.getP_choiceQuantity();
            int price = cl.getP_price();
            int subtotal = Quantity * price;
            totalPrice += subtotal;
            ordersDto.setP_serialNo(cl.getP_serialNo());
            ordersDto.setP_buyQuantity(Quantity);
            ordersDto.setP_buySize(cl.getP_choiceSize());
            ordersDto.setP_price(price);
            ordersDto.setP_buySubtotal(subtotal);

            ordersService.writeOrder(ordersDto);
        }

// 배송지tb 저장하기
        // 이름가져오기
        OrderNameMailDto orderNameMailDto = ordersService.getNameMail(id);
        String p_name = orderNameMailDto.getM_name();
        // 주문자 이메일, 전화번호 가져오기
        String p_email = email1 + email2;
        String p_cell = "010-"+ p_cell1+"-"+p_cell2;
        String p_deliveryCell1 = "010-"+ p_deliveryCell1_1+"-"+p_deliveryCell1_2;
        String p_deliveryCell2 = "010-"+ p_deliveryCell2_1+"-"+p_deliveryCell2_2;

        addressDto.setM_id(id);
        addressDto.setP_name(p_name);
        addressDto.setP_cell(p_cell);
        addressDto.setP_email(p_email);
        addressDto.setP_deliveryCell1(p_deliveryCell1);
        addressDto.setP_deliveryCell2(p_deliveryCell2);
        addressDto.setP_totalPrice(totalPrice);

        if(addressDto.getP_homeAddr() == 2) addressDto.setP_homeAddr(1);
        ordersService.writeAddress(addressDto);

        // 주문완료 이후 장바구니 비우기
        cartProductService.deleteAll(id);

        return "redirect:/product/cart";
    }

}
