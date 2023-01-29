package com.xexy.app.dao;

import com.xexy.app.domain.*;

import java.util.List;

public interface OrderDao {
    //  주문페이지 상품정보 불러오기
    List<CartProductDto> orderPd(String id);

    //  주문페이지 이름, 이메일 불러오기
    OrderNameMailDto selNameMail(String id);

    //  주문페이지 배송지목록 불러오기
    List<OrderDestinationDto> selDestination(String id);

    //  마지막 송장번호 불러오기
    int selInvo();

    //    주문페이지 주문내역TB 저장하기
    int insertOrder(OrdersDto ordersDto);

    //    주문페이지 배송지TB 저장하기
    int insertAddress(AddressDto addressDto);
}
