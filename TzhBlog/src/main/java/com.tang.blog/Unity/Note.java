package com.tang.blog.Unity;

import java.util.Date;

/**
 * @author tangzhihai
 * @date 2019/3/8
 */
public class Note {
    private int id;
    private int note_id;
    private int finish;
    private int note_score;
    private String note_title;
    private String note_content;
    private String note_mark;
    private String note_markt;
    private Date write_time;
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getNote_id() {
        return note_id;
    }

    public void setNote_id(int note_id) {
        this.note_id = note_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNote_title() {
        return note_title;
    }

    public void setNote_title(String note_title) {
        this.note_title = note_title;
    }

    public String getNote_content() {
        return note_content;
    }

    public void setNote_content(String note_content) {
        this.note_content = note_content;
    }

    public String getNote_mark() {
        return note_mark;
    }

    public void setNote_mark(String note_mark) {
        this.note_mark = note_mark;
    }

    public String getNote_markt() {
        return note_markt;
    }

    public void setNote_markt(String note_markt) {
        this.note_markt = note_markt;
    }



    public int getFinish() {
        return finish;
    }

    public void setFinish(int finish) {
        this.finish = finish;
    }

    public int getNote_score() {
        return note_score;
    }

    public void setNote_score(int note_score) {
        this.note_score = note_score;
    }

    public Date getWrite_time() {
        return write_time;
    }

    public void setWrite_time(Date write_time) {
        this.write_time = write_time;
    }

}
