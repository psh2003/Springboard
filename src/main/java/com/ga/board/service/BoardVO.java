package com.ga.board.service;
 
public class BoardVO {
    
    private int code;
    private String title = "";
    private String content = "";
    private String writer = "";
    private String reg_datetime = "";
    
    public int getCode() {
        return code;
    }
    public void setCode(int code) {
        this.code = code;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }
    public String getReg_datetime() {
        return reg_datetime;
    }
    public void setReg_datetime(String reg_datetime) {
        this.reg_datetime = reg_datetime;
    }
 
}