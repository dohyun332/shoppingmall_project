package com.xexy.app.dao;

import com.xexy.app.domain.ProductDetailDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDetailDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.xexy.app.dao.ProductDetailMapper.";
/*  상품, 재고*/

    public List<ProductDetailDto> productDetail(String p_serialNo) throws Exception {
        return session.selectList(namespace + "productDetail", p_serialNo);
    }
/*    public String productDetailThumbnail(String p_serialNo) throws Exception {

        return session.selectOne(namespace + "productThumbnail", p_serialNo);
    }
    public List<ProductDetailDto> productDetailImg(String p_serialNo) throws Exception {
        return session.selectList(namespace + "productDetailImg", p_serialNo);
    }*/
    public int increaseViewCnt(String p_serialNo) throws Exception{
        return session.update(namespace+"increaseViewCnt",p_serialNo);
    }
}
