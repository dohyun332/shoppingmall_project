package com.xexy.app.service;

import com.xexy.app.domain.CartProductDto;

import java.util.List;
import java.util.Map;

public interface CartProductService {
    //    장바구니 담기
    int cartAdd(CartProductDto cartProductDto);

    //    장바구니 해당id 전체상품 가져오기
    List<CartProductDto> cartAll(String id);

    //    장바구니 해당id의 동일상품, 동일옵션 가져오기
    CartProductDto cartOne(CartProductDto cartProductDto);

    //    장바구니 해당pk의 상품하나 가져오기
    public CartProductDto cartGetPk(int p_cartNo);

    //    사이즈변경
    int sizeChg(CartProductDto cartProductDto);

    //    수량변경
    int countChg(CartProductDto cartProductDto);

    // 수량 추가
    public int countAdd(CartProductDto cartProductDto);

    //    장바구니 비우기
    int deleteAll(String id);

    //    장바구니 개별 삭제
    int deleteOne(Map map);
}
