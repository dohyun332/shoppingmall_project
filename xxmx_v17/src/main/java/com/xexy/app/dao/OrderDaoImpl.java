package com.xexy.app.dao;

import com.xexy.app.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    SqlSession session;

    //  주문페이지 상품정보 불러오기
    @Override
    public List<CartProductDto> orderPd(String id) {
        return session.selectList("orderMapper.orderPd", id);
    }

    //  주문페이지 이름, 이메일 불러오기
    @Override
    public OrderNameMailDto selNameMail(String id) {
        return session.selectOne("orderMapper.selNameMail", id);
    }

    //  주문페이지 배송지목록 불러오기
    @Override
    public List<OrderDestinationDto> selDestination(String id) {
        return session.selectList("orderMapper.selDestination", id);
    }

    //  마지막 송장번호 불러오기
    @Override
    public int selInvo() {
        return session.selectOne("orderMapper.selInvo");
    }

    //    주문페이지 주문내역TB 저장하기
    @Override
    public int insertOrder(OrdersDto ordersDto) {
        return session.insert("orderMapper.insertOrder", ordersDto);
    }

    //    주문페이지 배송지TB 저장하기
    @Override
    public int insertAddress(AddressDto addressDto) {
        return session.insert("orderMapper.insertAddress", addressDto);
    }
}
