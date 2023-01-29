package com.xexy.app.domain;

public class CartProductDto {
    private int p_cartNo;
    private String m_id;
    private String p_serialNo;
    private int p_choiceQuantity;
    private String p_choiceSize;
    private String p_choiceColor;
    private String p_product;
    private int p_price;
    private String p_productImg_DM;
    private int subtotal;

    public CartProductDto() {}
    public CartProductDto(String m_id, String p_serialNo, String p_choiceSize) {
        this.m_id = m_id;
        this.p_serialNo = p_serialNo;
        this.p_choiceSize = p_choiceSize;
    }

    public CartProductDto(String m_id, String p_serialNo, int p_choiceQuantity, String p_choiceSize) {
        this.m_id = m_id;
        this.p_serialNo = p_serialNo;
        this.p_choiceQuantity = p_choiceQuantity;
        this.p_choiceSize = p_choiceSize;
    }

    // 수량변경용
    public CartProductDto(int p_cartNo, String m_id, String p_serialNo, int p_choiceQuantity, String p_choiceSize) {
        this.p_cartNo = p_cartNo;
        this.m_id = m_id;
        this.p_serialNo = p_serialNo;
        this.p_choiceQuantity = p_choiceQuantity;
        this.p_choiceSize = p_choiceSize;
    }

    public int getP_cartNo() {
        return p_cartNo;
    }

    public void setP_cartNo(int p_cartNo) {
        this.p_cartNo = p_cartNo;
    }

    public String getM_id() {
        return m_id;
    }

    public void setM_id(String m_id) {
        this.m_id = m_id;
    }

    public String getP_serialNo() {
        return p_serialNo;
    }

    public void setP_serialNo(String p_serialNo) {
        this.p_serialNo = p_serialNo;
    }

    public int getP_choiceQuantity() {
        return p_choiceQuantity;
    }

    public void setP_choiceQuantity(int p_choiceQuantity) {
        this.p_choiceQuantity = p_choiceQuantity;
    }

    public String getP_choiceSize() {
        return p_choiceSize;
    }

    public void setP_choiceSize(String p_choiceSize) {
        this.p_choiceSize = p_choiceSize;
    }

    public String getP_choiceColor() {
        return p_choiceColor;
    }

    public void setP_choiceColor(String p_choiceColor) {
        this.p_choiceColor = p_choiceColor;
    }

    public String getP_product() {
        return p_product;
    }

    public void setP_product(String p_product) {
        this.p_product = p_product;
    }

    public int getP_price() {
        return p_price;
    }

    public void setP_price(int p_price) {
        this.p_price = p_price;
    }

    public String getP_productImg_DM() {
        return p_productImg_DM;
    }

    public void setP_productImg_DM(String p_productImg_DM) {
        this.p_productImg_DM = p_productImg_DM;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "CartProductDto{" +
                "p_cartNo=" + p_cartNo +
                ", m_id='" + m_id + '\'' +
                ", p_serialNo='" + p_serialNo + '\'' +
                ", p_choiceQuantity=" + p_choiceQuantity +
                ", p_choiceSize='" + p_choiceSize + '\'' +
                ", p_choiceColor='" + p_choiceColor + '\'' +
                ", p_product='" + p_product + '\'' +
                ", p_price=" + p_price +
                ", p_productImg_DM='" + p_productImg_DM + '\'' +
                ", subtotal=" + subtotal +
                '}';
    }
}
