package com.xexy.app.dao;

import com.xexy.app.domain.MainProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MainProductDaoImpl implements MainProductDao {
    @Autowired
    private SqlSession session;

    /* reviewCnt */
    public int reviewCnt(String serialNo) {
        return session.selectOne("productMapper.reviewCnt", serialNo);
    }

    /* Best10 */
    @Override
    public List<MainProductDto> selectAllBest() {
        return session.selectList("productMapper.selectAllBest");
    }

    @Override
    public List<MainProductDto> selectBest(String keyword) {
        return session.selectList("productMapper.selectBest", keyword);
    }

    /* 실시간 급상승 */
    @Override
    public List<MainProductDto> selectAllHits() {
        return session.selectList("productMapper.selectAllHits");
    }

    /* 카테고리별 항목 */
    @Override
    public List<MainProductDto> selectCate(String keyword) {
        return session.selectList("productMapper.selectCate", keyword);
    }
}
