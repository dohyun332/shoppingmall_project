package com.xexy.app.domain;

public class OrderNameMailDto {
    private String m_name;
    private String m_email;
    private String m_zipCode;
    private String m_addr1;
    private String m_addr2;

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public String getM_email() {
        return m_email;
    }

    public void setM_email(String m_email) {
        this.m_email = m_email;
    }

    public String getM_zipCode() {
        return m_zipCode;
    }

    public void setM_zipCode(String m_zipCode) {
        this.m_zipCode = m_zipCode;
    }

    public String getM_addr1() {
        return m_addr1;
    }

    public void setM_addr1(String m_addr1) {
        this.m_addr1 = m_addr1;
    }

    public String getM_addr2() {
        return m_addr2;
    }

    public void setM_addr2(String m_addr2) {
        this.m_addr2 = m_addr2;
    }

    @Override
    public String toString() {
        return "OrderNameMailDto{" +
                "m_name='" + m_name + '\'' +
                ", m_email='" + m_email + '\'' +
                ", m_zipCode='" + m_zipCode + '\'' +
                ", m_addr1='" + m_addr1 + '\'' +
                ", m_addr2='" + m_addr2 + '\'' +
                '}';
    }
}
