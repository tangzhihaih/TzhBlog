package com.tang.blog.Dao;

import com.tang.blog.Unity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/11/28.
 */

public interface loginDao {
    User login(String name);
    int register(@Param("name") String name, @Param("truename") String truename, @Param("age") String age,
                 @Param("password") String password, @Param("job") String job, @Param("sex") String sex,
                 @Param("birthday") String birthday, @Param("work") String work, @Param("place") String place,
                 @Param("remark") String remark);

    int registerTest(@Param("name") String name, @Param("password") String password);

    int selectByName(String name);
    String selectNickname(String nickname);
    List<User> SelectByPhone(String phone);
    int updateMessage(@Param("nickname") String nickname, @Param("name") String name, @Param("job") String job, @Param("remark") String remark,
                      @Param("truename") String truename, @Param("birthday") String birthday,
                      @Param("place") String place, @Param("sex") String sex, @Param("work") String work);

    int selectUserByName(String name);

    int insertImage(@Param("img_id") int img_id, @Param("img_name") String img_name);

    int insertImageByName(@Param("username") String user_name, @Param("img_name") String image_name);

    String selectImageName(int img_id);

    int InsertArticle(@Param("article_id") int article_id, @Param("article_name") String article_name,
                      @Param("content") String content, @Param("label") String label, @Param("sort") String sort,
                      @Param("blog_sort") String blog_sort, @Param("is_private") String is_private);

    List<Follow> selectMyFollow(int follow_id);

    int selectFansCount(String username);

    int selectFollowCount(String username);

    int insertGrade(@Param("grade_id") int grade_id, @Param("grade") int grade, @Param("score") int score);

    int updateVisitInit(int id, String username);

    int selectMaxId();

    int initLikeCount(@Param("likeid") int likeid, @Param("byuser") String byuser);

    int initUserGrade(String username);

    int updatePassword(@Param("username") String username, @Param("password") String password);

    List<Article> selectlianhe(String username);

    User selectUserByArticleId(int article_id);

    User selectUserByNoteId(int note_id);

}
