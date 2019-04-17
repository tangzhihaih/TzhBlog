package com.tang.blog.Service.impl;

import com.tang.blog.Dao.loginDao;
import com.tang.blog.Unity.Article;
import com.tang.blog.Unity.Follow;
import com.tang.blog.Unity.User;
import com.tang.blog.Service.loginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/11/28.
 */
@Service("loginservice")
public class loginServiceImpl implements loginService {
    @Autowired
    private loginDao logindao;
    @Override

    public User login(String name) {
        return logindao.login(name);
    }


    @Override
    public int register(String name, String truename, String age, String password, String job, String sex,
                        String birthday, String work, String place, String remark) {
        return logindao.register(name,truename,age,password,job,sex,birthday,work,place,remark);
    }

    @Override
    public int registerTest(String username, String password) {
        return logindao.registerTest(username,password);
    }

    @Override
    public int selectByName(String username) {
        return logindao.selectByName(username);
    }

    @Override
    public List<User> SelectByPhone(String phone) {
        return logindao.SelectByPhone(phone);
    }

    @Override
    public int updateMessage(String nickname,String name,String job,String remark,String truename,String birthday,String place,String sex,String work) {
        return logindao.updateMessage(nickname,name,job,remark,truename,birthday,place,sex,work);
    }

    @Override
    public int selectUserByName(String name) {
        return logindao.selectUserByName(name);
    }

    @Override
    public int insertImage(int img_id, String image_name) {
        return logindao.insertImage(img_id,image_name);
    }

    @Override
    public int insertImageByName(String user_name, String image_name) {
        return logindao.insertImageByName(user_name,image_name);
    }

    @Override
    public String selectImageName(int img_id) {
        return logindao.selectImageName(img_id);
    }

    @Override
    public int InsertArticle(int article_id, String article_name,String contentHtml, String contect_article_type,
                             String article_type, String blog_sort, String is_private) {
        return logindao.InsertArticle(article_id,article_name,contentHtml,contect_article_type,
                article_type,blog_sort,is_private);
    }

    @Override
    public String selectNickname(String nickname) {
        return logindao.selectNickname(nickname);
    }

    @Override
    public List<Follow> selectMyFollow(int follow_id) {
        return logindao.selectMyFollow(follow_id);
    }

    @Override
    public int selectFansCount(String username) {
        return logindao.selectFansCount(username);
    }

    @Override
    public int selectFollowCount(String username) {
        return logindao.selectFollowCount(username);
    }

    @Override
    public int insertGrade(int grade_id, int grade, int score) {
        return logindao.insertGrade(grade_id,grade,score);
    }

    @Override
    public int updateVisitInit(int id,String username) {
        return logindao.updateVisitInit(id,username);
    }

    @Override
    public int selectMaxId() {
        return logindao.selectMaxId();
    }

    @Override
    public int initLikeCount(int id, String username) {
        return logindao.initLikeCount(id,username);
    }

    @Override
    public int initUserGrade(String username) {
        return logindao.initUserGrade(username);
    }

    @Override
    public int updatePassword(String username, String password) {
        return logindao.updatePassword(username,password);
    }

    @Override
    public List<Article> selectlianhe(String username) {
        return logindao.selectlianhe(username);
    }

    @Override
    public User selectUserByArticleId(int article_id) {
        return logindao.selectUserByArticleId(article_id);
    }

    @Override
    public User selectUserByNoteId(int note_id) {
        return logindao.selectUserByNoteId(note_id);
    }
}
