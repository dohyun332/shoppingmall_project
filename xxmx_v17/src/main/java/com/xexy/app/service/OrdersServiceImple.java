package com.xexy.app.service;

import com.xexy.app.dao.OrderDao;
import com.xexy.app.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImple implements OrdersService {
    @Autowired
    OrderDao orderDao;
    //  주문페이지 상품정보 불러오기
    @Override
    public List<CartProductDto> getPd(String id) {
        return orderDao.orderPd(id);
    }

    //  주문페이지 이름, 이메일 불러오기
    @Override
    public OrderNameMailDto getNameMail(String id) {
        return orderDao.selNameMail(id);
    }

    //  주문페이지 배송지목록 불러오기
    @Override
    public List<OrderDestinationDto> getDestination(String id) {
        return orderDao.selDestination(id);
    }

    //  마지막 송장번호 불러오기
    @Override
    public int getInvo() {
        return orderDao.selInvo();
    }

    //  주문페이지 주문내역TB 저장하기
    @Override
    public int writeOrder(OrdersDto ordersDto) {
        return orderDao.insertOrder(ordersDto);
    }

    //    주문페이지 배송지TB 저장하기
    @Override
    public int writeAddress(AddressDto addressDto) {
        return orderDao.insertAddress(addressDto);
    }
}
