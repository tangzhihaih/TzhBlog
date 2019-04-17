package com.tang.blog.Service;
import com.tang.blog.Unity.Article;
import com.tang.blog.Unity.Follow;
import com.tang.blog.Unity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/11/28.
 */
@Service("loginservice")
public interface loginService {
    User login(String name);
    int register(String name, String truename, String age, String password, String
            job, String sex, String birthday, String work, String place, String remark);

    int registerTest(String username, String password);

    int selectByName(String username);
    List<User> SelectByPhone(String phone);
    int updateMessage(String nickname, String name, String job, String remark, String truename, String birthday,
                      String place, String sex, String work);
    int selectUserByName(String name);

    int insertImage(int img_id, String image_name);
    int insertImageByName(String user_name, String image_name);
    String selectImageName(int img_id);

    int InsertArticle(int article_id, String article_name, String contentHtml, String contect_article_type, String article_type, String
            blog_sort, String is_private);

    String selectNickname(String nickname);

    int selectFansCount(String username);

    List<Follow> selectMyFollow(int follow_id);

    int selectFollowCount(String username);

    int insertGrade(int grade_id, int grade, int score);

    int updateVisitInit(int id, String username);

    int selectMaxId();

    int initLikeCount(int id, String username);

    int initUserGrade(String username);

    int updatePassword(String username, String password);

    List<Article> selectlianhe(String username);

    User selectUserByArticleId(int article_id);

    User selectUserByNoteId(int note_id);

}
