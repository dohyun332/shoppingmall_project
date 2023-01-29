package com.xexy.app.dao;

import com.xexy.app.domain.ProductListDto;

import java.util.List;
import java.util.Map;

public interface ProductListDao {
    //    카테고리별 전체불러오기 신상품순
    List<ProductListDto> selectCate(String cate);

    //    카테고리별 전체불러오기 인기순
    List<ProductListDto> selectCateSale(String cate);

    //    카테고리별 전체불러오기 낮은가격순
    List<ProductListDto> selectCatePrice(String cate);

    //    카테고리별 전체불러오기 높은가격순
    List<ProductListDto> selectCatePriceDesc(String cate);

    //    1+1 전체불러오기 신상품순
    List<ProductListDto> selectCatePlus(Map map);

    List<ProductListDto> selectCatePlusSale();

    List<ProductListDto> selectCatePlusPrice();

    List<ProductListDto> selectCatePlusPriceDesc();

    List<ProductListDto> selectCateOut(Map map
    );

    List<ProductListDto> selectCateOutSale();

    List<ProductListDto> selectCateOutPrice();

    List<ProductListDto> selectCateOutPriceDesc();

}

