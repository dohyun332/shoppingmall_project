package com.xexy.app.domain;

public class ProductDetailDto {

    private String p_serialNo;
    private String p_product;
    private String p_productCategory;
    private String p_price;
    private String p_saleDate;
    private String p_hits;
    private String p_saleCount;
    private String p_displayChk;

    private String sp_serialNo;
    private String p_color;
    private String p_size;
    private String p_storage;
    private int p_no;
    private String p_explainImg;
    private String p_productiImg;
    private String p_productImg_DM;
    public ProductDetailDto(){}

    public ProductDetailDto(String p_serialNo, String p_product, String p_productCategory, String p_price, String p_saleDate, String p_hits, String p_saleCount, String p_displayChk, String sp_serialNo, String p_color, String p_size, String p_storage, int p_no, String p_explainImg, String p_productiImg, String p_productImg_DM) {
        this.p_serialNo = p_serialNo;
        this.p_product = p_product;
        this.p_productCategory = p_productCategory;
        this.p_price = p_price;
        this.p_saleDate = p_saleDate;
        this.p_hits = p_hits;
        this.p_saleCount = p_saleCount;
        this.p_displayChk = p_displayChk;
        this.sp_serialNo = sp_serialNo;
        this.p_color = p_color;
        this.p_size = p_size;
        this.p_storage = p_storage;
        this.p_no = p_no;
        this.p_explainImg = p_explainImg;
        this.p_productiImg = p_productiImg;
        this.p_productImg_DM = p_productImg_DM;
    }

    @Override
    public String toString() {
        return "ProductDetailDto{" +
                "p_serialNo='" + p_serialNo + '\'' +
                ", p_product='" + p_product + '\'' +
                ", p_productCategory='" + p_productCategory + '\'' +
                ", p_price='" + p_price + '\'' +
                ", p_saleDate='" + p_saleDate + '\'' +
                ", p_hits='" + p_hits + '\'' +
                ", p_saleCount='" + p_saleCount + '\'' +
                ", p_displayChk='" + p_displayChk + '\'' +
                ", sp_serialNo='" + sp_serialNo + '\'' +
                ", p_color='" + p_color + '\'' +
                ", p_size='" + p_size + '\'' +
                ", p_storage='" + p_storage + '\'' +
                ", p_no=" + p_no +
                ", p_explainImg='" + p_explainImg + '\'' +
                ", p_productiImg='" + p_productiImg + '\'' +
                ", p_productImg_DM='" + p_productImg_DM + '\'' +
                '}';
    }

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

    public String getP_color() {
        return p_color;
    }

    public void setP_color(String p_color) {
        this.p_color = p_color;
    }

    public String getP_size() {
        return p_size;
    }

    public void setP_size(String p_size) {
        this.p_size = p_size;
    }

    public String getP_storage() {
        return p_storage;
    }

    public void setP_storage(String p_storage) {
        this.p_storage = p_storage;
    }

    public String getSp_serialNo() {
        return sp_serialNo;
    }

    public void setSp_serialNo(String sp_serialNo) {
        this.sp_serialNo = sp_serialNo;
    }

    public int getP_no() {
        return p_no;
    }

    public void setP_no(int p_no) {
        this.p_no = p_no;
    }

    public String getP_explainImg() {
        return p_explainImg;
    }

    public void setP_explainImg(String p_explainImg) {
        this.p_explainImg = p_explainImg;
    }

    public String getP_productiImg() {
        return p_productiImg;
    }

    public void setP_productiImg(String p_productiImg) {
        this.p_productiImg = p_productiImg;
    }

    public String getP_productImg_DM() {
        return p_productImg_DM;
    }

    public void setP_productImg_DM(String p_productImg_DM) {
        this.p_productImg_DM = p_productImg_DM;
    }
}
