package com.xexy.app.dao;

import com.xexy.app.domain.MainProductDto;

import java.util.List;

public interface MainProductDao {
    /* 리류 수 */
    int reviewCnt(String serialNo);

    /* Best10 */
    List<MainProductDto> selectAllBest();

    List<MainProductDto> selectBest(String keyword);

    /* 실시간 급상승 */
    List<MainProductDto> selectAllHits();

    /* 카테고리별 항목 */
    List<MainProductDto> selectCate(String keyword);
}
