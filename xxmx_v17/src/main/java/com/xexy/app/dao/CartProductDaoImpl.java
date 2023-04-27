package com.xexy.app.dao;

import com.xexy.app.domain.CartProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CartProductDaoImpl implements CartProductDao {
    @Autowired
    SqlSession session;
//    장바구니 담기
    @Override
    public int cartAddi(CartProductDto cartProductDto) {
        return session.insert("cartMapper.cartAdd", cartProductDto);
    }
//    장바구니 해당id 전체상품 가져오기
    @Override
    public List<CartProductDto> cartGet(String id) {
        return session.selectList("cartMapper.cartGet", id);
    }

//    장바구니 해당id의 동일상품, 동일옵션 가져오기
    @Override
    public CartProductDto cartGetOne(CartProductDto cartProductDto) {
        return session.selectOne("cartMapper.cartGetOne", cartProductDto);
    }

// 장바구니 해당pk의 상품 하나 가져오기
    @Override
    public CartProductDto cartGetP(int p_cartNo) {
        return session.selectOne("cartMapper.cartGetPk", p_cartNo);
    }

//    사이즈, 수량 변경
    @Override
    public int sizeChange(CartProductDto cartProductDto) {
        return session.update("cartMapper.sizeChange", cartProductDto);
    }
//    수량변경
    @Override
    public int countChange(CartProductDto cartProductDto) {
        return session.update("cartMapper.countChange", cartProductDto);
    }
//    수량추가
    @Override
    public int countAddi(CartProductDto cartProductDto) {
        return session.update("cartMapper.countAdd", cartProductDto);
    }

//    장바구니 비우기
    @Override
    public int deleteAllCart(String id) {
        return session.delete("cartMapper.deleteAllCart", id);
    }

//    장바구니 개별 삭제
    @Override
    public int deleteOneCart(Map map) {
        return session.delete("cartMapper.deleteOneCart", map);
    }
}
