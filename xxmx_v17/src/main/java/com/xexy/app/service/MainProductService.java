package com.xexy.app.service;

import com.xexy.app.domain.MainProductDto;

import java.util.List;

public interface MainProductService {
    /* 리뷰수 */
    int loadReviewCnt(String serialNo);

    /* Best10 */
    List<MainProductDto> allBest10();

    List<MainProductDto> cateBest10(String keyword);

    /* 실시간급상승 */
    List<MainProductDto> hitsUP();

    /* 카테고리별 항목 */
    List<MainProductDto> category(String keyword);
}
