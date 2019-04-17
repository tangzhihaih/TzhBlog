package com.tang.blog.Unity;

/**
 * @author tangzhihai
 * @date 2019/3/2
 */
public class Follow {
    private int id;
    private int type;
    private int follow_id;
    private int by_follow_id;
    private Img img;
    private User user;

    public Img getImg() {
        return img;
    }

    public void setImg(Img img) {
        this.img = img;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFollow_id() {
        return follow_id;
    }

    public void setFollow_id(int follow_id) {
        this.follow_id = follow_id;
    }

    public int getBy_follow_id() {
        return by_follow_id;
    }

    public void setBy_follow_id(int by_follow_id) {
        this.by_follow_id = by_follow_id;
    }
}
