package com.xexy.app.service;

import com.xexy.app.domain.*;

import java.util.List;

public interface OrdersService {
    //  주문페이지 상품정보 불러오기
    List<CartProductDto> getPd(String id);

    //  주문페이지 이름, 이메일 불러오기
    OrderNameMailDto getNameMail(String id);

    //  주문페이지 배송지목록 불러오기
    List<OrderDestinationDto> getDestination(String id);

    //  마지막 송장번호 불러오기
    int getInvo();

    //  주문페이지 주문내역TB 저장하기
    int writeOrder(OrdersDto ordersDto);

    //    주문페이지 배송지TB 저장하기
    int writeAddress(AddressDto addressDto);
}
