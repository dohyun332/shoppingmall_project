package com.xexy.app.domain;

public class AddressDto {
    private int p_invoice;
    private String m_id;
    private String p_name;
    private String p_cell;
    private String p_email;
    private int p_homeAddr;
    private String p_deliveryName;
    private String p_deliveryCell1;
    private String p_deliveryCell2;
    private int p_zipCode;
    private String p_destination1;
    private String p_destination2;
    private String p_deliveryMessage;
    private int p_totalPrice;
    private int p_deliveryPrice;
    private int p_pay;
    private String p_buyDate;

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

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_cell() {
        return p_cell;
    }

    public void setP_cell(String p_cell) {
        this.p_cell = p_cell;
    }

    public String getP_email() {
        return p_email;
    }

    public void setP_email(String p_email) {
        this.p_email = p_email;
    }

    public int getP_homeAddr() {
        return p_homeAddr;
    }

    public void setP_homeAddr(int p_homeAddr) {
        this.p_homeAddr = p_homeAddr;
    }

    public String getP_deliveryName() {
        return p_deliveryName;
    }

    public void setP_deliveryName(String p_deliveryName) {
        this.p_deliveryName = p_deliveryName;
    }

    public String getP_deliveryCell1() {
        return p_deliveryCell1;
    }

    public void setP_deliveryCell1(String p_deliveryCell1) {
        this.p_deliveryCell1 = p_deliveryCell1;
    }

    public String getP_deliveryCell2() {
        return p_deliveryCell2;
    }

    public void setP_deliveryCell2(String p_deliveryCell2) {
        this.p_deliveryCell2 = p_deliveryCell2;
    }

    public int getP_zipCode() {
        return p_zipCode;
    }

    public void setP_zipCode(int p_zipCode) {
        this.p_zipCode = p_zipCode;
    }

    public String getP_destination1() {
        return p_destination1;
    }

    public void setP_destination1(String p_destination1) {
        this.p_destination1 = p_destination1;
    }

    public String getP_destination2() {
        return p_destination2;
    }

    public void setP_destination2(String p_destination2) {
        this.p_destination2 = p_destination2;
    }

    public String getP_deliveryMessage() {
        return p_deliveryMessage;
    }

    public void setP_deliveryMessage(String p_deliveryMessage) {
        this.p_deliveryMessage = p_deliveryMessage;
    }

    public int getP_totalPrice() {
        return p_totalPrice;
    }

    public void setP_totalPrice(int p_totalPrice) {
        this.p_totalPrice = p_totalPrice;
    }

    public int getP_deliveryPrice() {
        return p_deliveryPrice;
    }

    public void setP_deliveryPrice(int p_deliveryPrice) {
        this.p_deliveryPrice = p_deliveryPrice;
    }

    public int getP_pay() {
        return p_pay;
    }

    public void setP_pay(int p_pay) {
        this.p_pay = p_pay;
    }

    public String getP_buyDate() {
        return p_buyDate;
    }

    public void setP_buyDate(String p_buyDate) {
        this.p_buyDate = p_buyDate;
    }

    @Override
    public String toString() {
        return "AddressDto{" +
                "p_invoice=" + p_invoice +
                ", m_id='" + m_id + '\'' +
                ", p_name='" + p_name + '\'' +
                ", p_cell='" + p_cell + '\'' +
                ", p_email='" + p_email + '\'' +
                ", p_homeAddr=" + p_homeAddr +
                ", p_deliveryName='" + p_deliveryName + '\'' +
                ", p_deliveryCell1='" + p_deliveryCell1 + '\'' +
                ", p_deliveryCell2='" + p_deliveryCell2 + '\'' +
                ", p_zipCode=" + p_zipCode +
                ", p_destination1='" + p_destination1 + '\'' +
                ", p_destination2='" + p_destination2 + '\'' +
                ", p_deliveryMessage='" + p_deliveryMessage + '\'' +
                ", p_totalPrice=" + p_totalPrice +
                ", p_deliveryPrice=" + p_deliveryPrice +
                ", p_pay=" + p_pay +
                ", p_buyDate='" + p_buyDate + '\'' +
                '}';
    }
}
