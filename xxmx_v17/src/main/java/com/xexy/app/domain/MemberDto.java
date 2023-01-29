package com.xexy.app.domain;

public class MemberDto {
    private int m_idx;
    private String m_id;
    private String m_pw;
    private String m_name;
    private String m_cell;
    private String m_email;
    private String m_zipCode;
    private String m_addr;
    private int m_gender;
    private String m_birthday;
    private String m_joinDate;
    private String m_lastLogin;
    private int m_joinChk;
    private int m_height;
    private int m_weight;

    private boolean rememberId;
    /*폰합치기*/
    private String phone1;
    private String phone2;
    private String phone3;
    /*이메일 합치기*/
    private String email_id;
    private String email_domain;
    /*생년월일 합치기*/
    private  String m_year;
    private  String m_month;
    private  String m_day;

    /*주소 합치기*/
    private String m_addr1;
    private String m_addr2;
    public MemberDto(){}

    public MemberDto(int m_idx, String m_id, String m_pw, String m_name, String m_cell, String m_email, String m_zipCode, String m_addr, int m_gender, String m_birthday, String m_joinDate, String m_lastLogin, int m_joinChk, int m_height, int m_weight) {
        this.m_idx = m_idx;
        this.m_id = m_id;
        this.m_pw = m_pw;
        this.m_name = m_name;
        this.m_cell = m_cell;
        this.m_email = m_email;
        this.m_zipCode = m_zipCode;
        this.m_addr = m_addr;
        this.m_gender = m_gender;
        this.m_birthday = m_birthday;
        this.m_joinDate = m_joinDate;
        this.m_lastLogin = m_lastLogin;
        this.m_joinChk = m_joinChk;
        this.m_height = m_height;
        this.m_weight = m_weight;
        this.rememberId = rememberId;

    }

    @Override
    public String toString() {
        return "MemberDto{" +
                "m_idx=" + m_idx +
                ", m_id='" + m_id + '\'' +
                ", m_pw='" + m_pw + '\'' +
                ", m_name='" + m_name + '\'' +
                ", m_cell='" + m_cell + '\'' +
                ", m_email='" + m_email + '\'' +
                ", m_zipCode=" + m_zipCode +
                ", m_addr='" + m_addr + '\'' +
                ", m_gender=" + m_gender +
                ", m_birthday='" + m_birthday + '\'' +
                ", m_joinDate='" + m_joinDate + '\'' +
                ", m_lastLogin='" + m_lastLogin + '\'' +
                ", m_joinChk=" + m_joinChk +
                ", m_height=" + m_height +
                ", m_weight=" + m_weight +
                '}';
    }

    public int getM_idx() {
        return m_idx;
    }

    public void setM_idx(int m_idx) {
        this.m_idx = m_idx;
    }

    public String getM_id() {
        return m_id;
    }

    public void setM_id(String m_id) {
        this.m_id = m_id;
    }

    public String getM_pw() {
        return m_pw;
    }

    public void setM_pw(String m_pw) {
        this.m_pw = m_pw;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public String getM_cell() {
        return m_cell;
    }

    public void setM_cell(String m_cell) {
        this.m_cell = m_cell;
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

    public String getM_addr() {
        return m_addr;
    }

    public void setM_addr(String m_addr) {
        this.m_addr = m_addr;
    }

    public int getM_gender() {
        return m_gender;
    }

    public void setM_gender(int m_gender) {
        this.m_gender = m_gender;
    }

    public String getM_birthday() {
        return m_birthday;
    }

    public void setM_birthday(String m_birthday) {
        this.m_birthday = m_birthday;
    }

    public String getM_joinDate() {
        return m_joinDate;
    }

    public void setM_joinDate(String m_joinDate) {
        this.m_joinDate = m_joinDate;
    }

    public String getM_lastLogin() {
        return m_lastLogin;
    }

    public void setM_lastLogin(String m_lastLogin) {
        this.m_lastLogin = m_lastLogin;
    }

    public int getM_joinChk() {
        return m_joinChk;
    }

    public void setM_joinChk(int m_joinChk) {
        this.m_joinChk = m_joinChk;
    }

    public int getM_height() {
        return m_height;
    }

    public void setM_height(int m_height) {
        this.m_height = m_height;
    }

    public int getM_weight() {
        return m_weight;
    }

    public void setM_weight(int m_weight) {
        this.m_weight = m_weight;
    }

    public boolean isRememberId() {
        return rememberId;
    }

    public void setRememberId(boolean rememberId) {
        this.rememberId = rememberId;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getPhone3() {
        return phone3;
    }

    public void setPhone3(String phone3) {
        this.phone3 = phone3;
    }

    public String getEmail_id() {
        return email_id;
    }

    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    public String getEmail_domain() {
        return email_domain;
    }

    public void setEmail_domain(String email_domain) {
        this.email_domain = email_domain;
    }

    public String getM_year() {
        return m_year;
    }

    public void setM_year(String m_year) {
        this.m_year = m_year;
    }

    public String getM_month() {
        return m_month;
    }

    public void setM_month(String m_month) {
        this.m_month = m_month;
    }

    public String getM_day() {
        return m_day;
    }

    public void setM_day(String m_day) {
        this.m_day = m_day;
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
}
