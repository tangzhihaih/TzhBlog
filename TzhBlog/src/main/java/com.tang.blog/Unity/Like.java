package com.tang.blog.Unity;

/**
 * @author tangzhihai
 * @date 2019/3/10
 */
public class Like {
    private int id;
    private int likecount;
    private int likeid;
    private String likeuser;
    private String byuser;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLikecount() {
        return likecount;
    }

    public void setLikecount(int likecount) {
        this.likecount = likecount;
    }

    public int getLikeid() {
        return likeid;
    }

    public void setLikeid(int likeid) {
        this.likeid = likeid;
    }

    public String getLikeuser() {
        return likeuser;
    }

    public void setLikeuser(String likeuser) {
        this.likeuser = likeuser;
    }

    public String getByuser() {
        return byuser;
    }

    public void setByuser(String byuser) {
        this.byuser = byuser;
    }
}
