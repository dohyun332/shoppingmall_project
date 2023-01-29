package com.xexy.app.domain;

public class OrdersDto {
    private int p_orderNo;
    private int p_invoice;
    private String m_id;
    private String orderDate;
    private String p_serialNo;
    private String p_orderStatus;
    private int p_buyQuantity;
    private String p_buyColor;
    private String p_buySize;
    private int p_price;
    private int p_buySubtotal;

    public OrdersDto() {}
    public OrdersDto(int p_invoice, String m_id) {
        this.p_invoice = p_invoice;
        this.m_id = m_id;
    }


    public int getP_orderNo() {
        return p_orderNo;
    }

    public void setP_orderNo(int p_orderNo) {
        this.p_orderNo = p_orderNo;
    }

    public int getP_invoice() {
        return p_invoice;
    }

    public void setP_invoice(int p_invoice) {
        this.p_invoice = p_invoice;
    }

    public String getM_id() {
        return m_id;
    }

    public void setM_id(String m_id) {
        this.m_id = m_id;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getP_serialNo() {
        return p_serialNo;
    }

    public void setP_serialNo(String p_serialNo) {
        this.p_serialNo = p_serialNo;
    }

    public String getP_orderStatus() {
        return p_orderStatus;
    }

    public void setP_orderStatus(String p_orderStatus) {
        this.p_orderStatus = p_orderStatus;
    }

    public int getP_buyQuantity() {
        return p_buyQuantity;
    }

    public void setP_buyQuantity(int p_buyQuantity) {
        this.p_buyQuantity = p_buyQuantity;
    }

    public String getP_buyColor() {
        return p_buyColor;
    }

    public void setP_buyColor(String p_buyColor) {
        this.p_buyColor = p_buyColor;
    }

    public String getP_buySize() {
        return p_buySize;
    }

    public void setP_buySize(String p_buySize) {
        this.p_buySize = p_buySize;
    }

    public int getP_price() {
        return p_price;
    }

    public void setP_price(int p_price) {
        this.p_price = p_price;
    }

    public int getP_buySubtotal() {
        return p_buySubtotal;
    }

    public void setP_buySubtotal(int p_buySubtotal) {
        this.p_buySubtotal = p_buySubtotal;
    }

    @Override
    public String toString() {
        return "OrdersDto{" +
                "p_orderNo=" + p_orderNo +
                ", p_invoice=" + p_invoice +
                ", m_id='" + m_id + '\'' +
                ", orderDate='" + orderDate + '\'' +
                ", p_serialNo='" + p_serialNo + '\'' +
                ", p_orderStatus='" + p_orderStatus + '\'' +
                ", p_buyQuantity=" + p_buyQuantity +
                ", p_buyColor='" + p_buyColor + '\'' +
                ", p_buySize='" + p_buySize + '\'' +
                ", p_price=" + p_price +
                ", p_buySubtotal=" + p_buySubtotal +
                '}';
    }
}
