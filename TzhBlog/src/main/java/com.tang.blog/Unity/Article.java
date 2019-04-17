package com.tang.blog.Unity;
import java.util.Date;

/**
 *功能描述
 * @author tangzhihai
 * @date 2019/3/3
 * @param
 * @return
 */
public class Article {
    private int article_id;
    private int id;
    private int follow_type;
    private Date write_time;
    private String content;
    private String article_name;
    private String label;
    private String sort;
    private String type;
    private String blog_sort;
    private String is_private;
    private int visit_count;
    private User user;

    public int getVisit_count() {
        return visit_count;
    }

    public void setVisit_count(int visit_count) {
        this.visit_count = visit_count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBlog_sort() {
        return blog_sort;
    }

    public void setBlog_sort(String blog_sort) {
        this.blog_sort = blog_sort;
    }

    public String getIs_private() {
        return is_private;
    }

    public void setIs_private(String is_private) {
        this.is_private = is_private;
    }

    public String getArticle_name() {
        return article_name;
    }

    public void setArticle_name(String article_name) {
        this.article_name = article_name;
    }

    public Date getWrite_time() {return write_time;}

    public void setWrite_time(Date write_time) {this.write_time = write_time;}


    public int getFollow_type() {
        return follow_type;
    }

    public void setFollow_type(int follow_type) {
        this.follow_type = follow_type;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }
}
