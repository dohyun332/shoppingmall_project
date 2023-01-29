package com.xexy.app.service;

import com.xexy.app.dao.CartProductDao;
import com.xexy.app.domain.CartProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CartProductServiceImpl implements CartProductService {
    @Autowired
    CartProductDao cartProductDao;

//    장바구니 담기
    @Override
    public int cartAdd(CartProductDto cartProductDto) {
        return cartProductDao.cartAddi(cartProductDto);
    }

//    장바구니 해당id 전체상품 가져오기
    @Override
    public List<CartProductDto> cartAll(String id) {
        return cartProductDao.cartGet(id);
    }

//    장바구니 해당id의 동일상품, 동일옵션 가져오기
    @Override
    public CartProductDto cartOne(CartProductDto cartProductDto) {
        return cartProductDao.cartGetOne(cartProductDto);
    }

//    장바구니 해당pk의 상품하나 가져오기
    @Override
    public CartProductDto cartGetPk(int p_cartNo) {
        return cartProductDao.cartGetP(p_cartNo);
}

//    사이즈변경
    @Override
    public int sizeChg(CartProductDto cartProductDto) {
        return cartProductDao.sizeChange(cartProductDto);
    }

//    수량변경
    @Override
    public int countChg(CartProductDto cartProductDto) {
        return cartProductDao.countChange(cartProductDto);
    }

//    수량추가
    public int countAdd(CartProductDto cartProductDto) {
    return cartProductDao.countAddi(cartProductDto);
}

    //    장바구니 비우기
    @Override
    public int deleteAll(String id) {
        return cartProductDao.deleteAllCart(id);
    }

//    장바구니 개별 삭제
    @Override
    public int deleteOne(Map map) {
        return cartProductDao.deleteOneCart(map);
    }
}
