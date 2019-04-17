package com.tang.blog.Unity;

import java.util.Date;

/**
 *功能描述
 * @author tangzhihai
 * @date 2019/3/4
 * @param
 * @return
 */

public class Storage {
    private int id;
    private int article_id;
    private int user_id;
    private int type;
    private Date storage_time;
    private User user;
    private Article article;

    public Date getStorage_time() {
        return storage_time;
    }

    public void setStorage_time(Date storage_time) {
        this.storage_time = storage_time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}
