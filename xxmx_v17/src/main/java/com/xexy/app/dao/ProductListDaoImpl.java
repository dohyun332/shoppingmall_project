package com.xexy.app.dao;

import com.xexy.app.domain.ProductListDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductListDaoImpl implements ProductListDao {

    @Autowired
    SqlSession session;

//    카테고리별 전체불러오기 신상품순
    @Override
    public List<ProductListDto> selectCate(String cate) {
        return session.selectList("productListMapper.selectCate", cate);
    }

//    카테고리별 전체불러오기 인기순
    @Override
    public List<ProductListDto> selectCateSale(String cate) {
        return session.selectList("productListMapper.selectCateSale", cate);
    }

    //    카테고리별 전체불러오기 낮은가격순
    @Override
    public List<ProductListDto> selectCatePrice(String cate) {
        return session.selectList("productListMapper.selectCatePrice", cate);
    }

//    카테고리별 전체불러오기 높은가격순
    @Override
    public List<ProductListDto> selectCatePriceDesc(String cate) {
        return session.selectList("productListMapper.selectCatePriceDesc", cate);
    }

//    1+1 전체불러오기 신상품순
    @Override
    public List<ProductListDto> selectCatePlus(Map map) {
        System.out.println("map 다오: " + map);
        return session.selectList("productListMapper.selectCatePlus", map);
}

    //    1+1 전체불러오기 인기순
    @Override
    public List<ProductListDto> selectCatePlusSale() {
        return session.selectList("productListMapper.selectCatePlusSale");
    }

    //    1+1 전체불러오기 낮은가격순
    @Override
    public List<ProductListDto> selectCatePlusPrice() {
        return session.selectList("productListMapper.selectCatePlusPrice");
    }

    //    1+1 전체불러오기 높은가격순
    @Override
    public List<ProductListDto> selectCatePlusPriceDesc() {
        return session.selectList("productListMapper.selectCatePlusPriceDesc");
    }

    //    아울렛 전체불러오기 신상품순
    @Override
    public List<ProductListDto> selectCateOut(Map map) {
        System.out.println(map);
        return session.selectList("productListMapper.selectCateOut", map);
    }

    //    아울렛 전체불러오기 인기순
    @Override
    public List<ProductListDto> selectCateOutSale() {
        return session.selectList("productListMapper.selectCateOutSale");
    }

    //    아울렛 전체불러오기 낮은가격순
    @Override
    public List<ProductListDto> selectCateOutPrice() {
        return session.selectList("productListMapper.selectCateOutPrice");
    }

    //    아울렛 전체불러오기 높은가격순
    @Override
    public List<ProductListDto> selectCateOutPriceDesc() {
        return session.selectList("productListMapper.selectCateOutPriceDesc");
    }

}
