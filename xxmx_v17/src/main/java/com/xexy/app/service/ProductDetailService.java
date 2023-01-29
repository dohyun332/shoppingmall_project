package com.xexy.app.service;

import com.xexy.app.dao.ProductDetailDao;
import com.xexy.app.domain.ProductDetailDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductDetailService  {
    @Autowired
    ProductDetailDao productDetailDao;


    public List<ProductDetailDto> productDetail(String p_serialNo) throws Exception {
        return productDetailDao.productDetail(p_serialNo);
    }
   /* public String productDetailThumbnail(String p_serialNo) throws  Exception{
        return  productDetailDao.productDetailThumbnail(p_serialNo);
    }
    public List<ProductDetailDto> productDetailImg(String p_serialNo) throws Exception {
        return productDetailDao.productDetailImg(p_serialNo);
    }*/
    public int increaseViewCnt(String p_serialNo) throws Exception{
        return productDetailDao.increaseViewCnt(p_serialNo);
    }
}
