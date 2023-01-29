package com.xexy.app.dao;

import com.xexy.app.domain.CartProductDto;

import java.util.List;
import java.util.Map;

public interface CartProductDao {
    //    장바구니 담기
    int cartAddi(CartProductDto cartProductDto);

    //    장바구니 해당id 가져오기
    List<CartProductDto> cartGet(String id);

    //    장바구니 해당id의 동일상품, 동일옵션 가져오기
    CartProductDto cartGetOne(CartProductDto cartProductDto);

    //    장바구니 해당pk의 상품 하나 가져오기
    public CartProductDto cartGetP(int p_cartNo);

    //    사이즈변경
    int sizeChange(CartProductDto cartProductDto);

    //    수량변경
    int countChange(CartProductDto cartProductDto);

    //    수량추가
    int countAddi(CartProductDto cartProductDto);

    //    장바구니 비우기
    int deleteAllCart(String id);

    //    장바구니 비우기
    int deleteOneCart(Map map);
}
