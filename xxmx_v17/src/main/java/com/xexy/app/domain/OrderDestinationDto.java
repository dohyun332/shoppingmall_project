package com.xexy.app.domain;

public class OrderDestinationDto {
    private String p_destination1;
    private String p_destination2;
    private String p_zipCode;

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

    public String getP_zipCode() {
        return p_zipCode;
    }

    public void setP_zipCode(String p_zipCode) {
        this.p_zipCode = p_zipCode;
    }

    @Override
    public String toString() {
        return "OrderDestinationDto{" +
                "p_destination1='" + p_destination1 + '\'' +
                ", p_destination2='" + p_destination2 + '\'' +
                ", p_zipCode='" + p_zipCode + '\'' +
                '}';
    }
}
