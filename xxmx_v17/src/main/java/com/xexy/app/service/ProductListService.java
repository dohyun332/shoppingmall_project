package com.xexy.app.service;

import com.xexy.app.domain.ProductListDto;

import java.util.List;
import java.util.Map;

public interface ProductListService {
    List<ProductListDto> category(String cate);

    List<ProductListDto> categorySale(String cate);

    List<ProductListDto> categoryPrice(String cate);

    List<ProductListDto> categoryPriceDesc(String cate);

    List<ProductListDto> categoryPlus(Map map);

    List<ProductListDto> categoryPlusSale();

    List<ProductListDto> categoryPlusPrice();

    List<ProductListDto> categoryPlusPriceDesc();

    List<ProductListDto> categoryOut();

    List<ProductListDto> categoryOut(Map map);

    List<ProductListDto> categoryOutSale();

    List<ProductListDto> categoryOutPrice();

    List<ProductListDto> categoryOutPriceDesc();

}
