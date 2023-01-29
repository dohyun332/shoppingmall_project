package com.xexy.app.service;

import com.xexy.app.dao.ProductListDao;
import com.xexy.app.domain.ProductListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductListServiceImpl implements ProductListService {
    @Autowired
    ProductListDao productListDao;

    @Override
    public List<ProductListDto> category(String cate) {
        return productListDao.selectCate(cate);
    }

    @Override
    public List<ProductListDto> categorySale(String cate) {
        return productListDao.selectCateSale(cate);
    }

    @Override
    public List<ProductListDto> categoryPrice(String cate) {
        return productListDao.selectCatePrice(cate);
    }

    @Override
    public List<ProductListDto> categoryPriceDesc(String cate) {
        return productListDao.selectCatePriceDesc(cate);
    }


    @Override
    public List<ProductListDto> categoryPlus(Map map) {
        System.out.println("map 서비스: " + map);
        return productListDao.selectCatePlus(map);}

    @Override
    public List<ProductListDto> categoryPlusSale() { return productListDao.selectCatePlusSale();}

    @Override
    public List<ProductListDto> categoryPlusPrice() { return productListDao.selectCatePlusPrice();}

    @Override
    public List<ProductListDto> categoryPlusPriceDesc() { return productListDao.selectCatePlusPriceDesc();}

    @Override
    public List<ProductListDto> categoryOut() {
        return null;
    }

    @Override
    public List<ProductListDto> categoryOut(Map map) {return productListDao.selectCateOut(map);}

    @Override
    public List<ProductListDto> categoryOutSale() {
        return productListDao.selectCateOutSale();
    }

    @Override
    public List<ProductListDto> categoryOutPrice() {
        return productListDao.selectCateOutPrice();
    }

    @Override
    public List<ProductListDto> categoryOutPriceDesc() {
        return productListDao.selectCateOutPriceDesc();
    }







}
