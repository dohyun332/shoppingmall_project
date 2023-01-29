package com.xexy.app.controller;

import com.xexy.app.domain.*;
import com.xexy.app.service.CartProductService;
import com.xexy.app.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/product")
public class OrdersController {
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
    public String order_sub(HttpSession session, String email1, String email2, String p_cell1, String p_cell2, AddressDto addressDto, String p_deliveryCell1_1, String p_deliveryCell1_2, String p_deliveryCell2_1, String p_deliveryCell2_2) {
// 주문내역tb 저장하기
        String id = (String) session.getAttribute("id");

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
            System.out.println(ordersDto);

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

        ordersService.writeAddress(addressDto);

        // 주문완료 이후 장바구니 비우기
        cartProductService.deleteAll(id);

        return "redirect:/product/cart";
    }

}
