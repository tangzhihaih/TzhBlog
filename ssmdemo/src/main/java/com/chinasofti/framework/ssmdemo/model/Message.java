package com.chinasofti.framework.ssmdemo.model;

/**
 * Created by Administrator on 2018/7/11/011.
 */
public class Message {
    private int id;
    private String message;
    private String date;

    public Message(){}
    public Message(String message,String date){
        this.date=date;
        this.message=message;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
