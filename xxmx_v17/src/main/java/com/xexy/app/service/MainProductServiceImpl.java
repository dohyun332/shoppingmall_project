package com.xexy.app.service;

import com.xexy.app.dao.MainProductDao;
import com.xexy.app.domain.MainProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainProductServiceImpl implements MainProductService {

    @Autowired
    MainProductDao mainProductDao;
    /* 리뷰수 */
    @Override
    public int loadReviewCnt(String serialNo) {
        return mainProductDao.reviewCnt(serialNo);
    }

    /* Best10 */
    @Override
    public List<MainProductDto> allBest10() {
        return mainProductDao.selectAllBest();
    }
    @Override
    public List<MainProductDto> cateBest10(String keyword) {
        return mainProductDao.selectBest(keyword);
    }

    /* 실시간급상승 */
    @Override
    public List<MainProductDto> hitsUP() {
        return mainProductDao.selectAllHits();
    }

    /* 카테고리별 항목 */
    @Override
    public List<MainProductDto> category(String keyword) {
        return mainProductDao.selectCate(keyword);
    }
}
