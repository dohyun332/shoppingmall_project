package com.xexy.app.domain;

public class ProductListDto {

    private String p_serialNo;
    private String p_product;
    private String p_productCategory;
    private String p_price;
    private String p_saleDate;
    private String p_hits;
    private String p_saleCount;
    private String p_displayChk;

    private int reviewCnt;
    private String imgSrc;
    private String covered_imgSrc;

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

    public String getP_productCategory() {
        return p_productCategory;
    }

    public void setP_productCategory(String p_productCategory) {
        this.p_productCategory = p_productCategory;
    }

    public String getP_price() {
        return p_price;
    }

    public void setP_price(String p_price) {
        this.p_price = p_price;
    }

    public String getP_saleDate() {
        return p_saleDate;
    }

    public void setP_saleDate(String p_saleDate) {
        this.p_saleDate = p_saleDate;
    }

    public String getP_hits() {
        return p_hits;
    }

    public void setP_hits(String p_hits) {
        this.p_hits = p_hits;
    }

    public String getP_saleCount() {
        return p_saleCount;
    }

    public void setP_saleCount(String p_saleCount) {
        this.p_saleCount = p_saleCount;
    }

    public String getP_displayChk() {
        return p_displayChk;
    }

    public void setP_displayChk(String p_displayChk) {
        this.p_displayChk = p_displayChk;
    }

    public int getReviewCnt() {
        return reviewCnt;
    }

    public void setReviewCnt(int reviewCnt) {
        this.reviewCnt = reviewCnt;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public String getCovered_imgSrc() {
        return covered_imgSrc;
    }

    public void setCovered_imgSrc(String covered_imgSrc) {
        this.covered_imgSrc = covered_imgSrc;
    }

    @Override
    public String toString() {
        return "ProductListDto{" +
                "p_serialNo='" + p_serialNo + '\'' +
                ", p_product='" + p_product + '\'' +
                ", p_productCategory='" + p_productCategory + '\'' +
                ", p_price='" + p_price + '\'' +
                ", p_saleDate='" + p_saleDate + '\'' +
                ", p_hits='" + p_hits + '\'' +
                ", p_saleCount='" + p_saleCount + '\'' +
                ", p_displayChk='" + p_displayChk + '\'' +
                ", reviewCnt=" + reviewCnt +
                ", imgSrc='" + imgSrc + '\'' +
                ", covered_imgSrc='" + covered_imgSrc + '\'' +
                '}';
    }
}
