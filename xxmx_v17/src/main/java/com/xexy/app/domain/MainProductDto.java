package com.xexy.app.domain;

public class MainProductDto {

    private String p_serialNo;
    private String p_product;
    private int p_productCategory;
    private int p_price;
    private String p_saleDate;
    private int p_hits;
    private int p_saleCount;
    private int displayChk;
    private Integer reviewCnt;
    private String src;
    private String covered_src;

    public String getP_serialNo() {
        return p_serialNo;
    }

    public void setP_serialNo(String p_serialNo) {
        this.p_serialNo = p_serialNo;
    }

    public String getP_product() {
        return p_product;
    }

    public void setP_product(String p_product) {
        this.p_product = p_product;
    }

    public int getP_productCategory() {
        return p_productCategory;
    }

    public void setP_productCategory(int p_productCategory) {
        this.p_productCategory = p_productCategory;
    }

    public int getP_price() {
        return p_price;
    }

    public void setP_price(int p_price) {
        this.p_price = p_price;
    }

    public String getP_saleDate() {
        return p_saleDate;
    }

    public void setP_saleDate(String p_saleDate) {
        this.p_saleDate = p_saleDate;
    }

    public int getP_hits() {
        return p_hits;
    }

    public void setP_hits(int p_hits) {
        this.p_hits = p_hits;
    }

    public int getP_saleCount() {
        return p_saleCount;
    }

    public void setP_saleCount(int p_saleCount) {
        this.p_saleCount = p_saleCount;
    }

    public int getDisplayChk() {
        return displayChk;
    }

    public void setDisplayChk(int displayChk) {
        this.displayChk = displayChk;
    }

    public Integer getReviewCnt() {
        return reviewCnt;
    }

    public void setReviewCnt(Integer reviewCnt) {
        if(reviewCnt == null) { reviewCnt=0; }
        this.reviewCnt = reviewCnt;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getCovered_src() {
        return covered_src;
    }

    public void setCovered_src(String covered_src) {
        this.covered_src = covered_src;
    }

    @Override
    public String toString() {
        return "MainProductDto{" +
                "p_serialNo='" + p_serialNo + '\'' +
                ", p_product='" + p_product + '\'' +
                ", p_productCategory=" + p_productCategory +
                ", p_price=" + p_price +
                ", p_saleDate='" + p_saleDate + '\'' +
                ", p_hits=" + p_hits +
                ", p_saleCount=" + p_saleCount +
                ", displayChk=" + displayChk +
                ", reviewCnt=" + reviewCnt +
                ", src='" + src + '\'' +
                ", covered_src='" + covered_src + '\'' +
                '}';
    }
}
