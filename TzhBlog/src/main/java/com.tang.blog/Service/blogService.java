package com.tang.blog.Service;

import com.tang.blog.Unity.*;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *功能描述
 * @author tangzhihai
 * @date 2019/2/27
 * @param
 * @return
 */
@Service("blogservice")
public interface blogService {
    List<Article> SelectAllAricle(int article_id);

    int deleteBlogById(int id);

    String SelectOneArticleContent(int id);

    Article SelectAricleOne(int id);

    List<Article> SelectAllAricleByTime(String name);

    List<Article> SelectAll();

    int SelectIsExistFollow(String username, String follow_name);

    int insertFollow(int by_follow_id, int follow_id);

    User selectName(String username);

    List<Follow> seleclHasFollow(int follow_id);

    int deleteHasFollow(String username, String name);

    List<Storage> seleclAllStorage(String username);

    int insertStorage(int article_id, int user_id);

    int seleclOneStorage();

    int deleteStorageById(int id);

    int seleclOneId(int id);

    List<Img>  seleclAllImg();

    List<Grade> selectOneGrade(String username);

    Grade selectGradeOne(String username);

    int insertOneNote(String note_title, String contentHtml, String note_mark,
                      String note_mark2, int publish_score, int note_id);

    int updateScore(int grade, String username);

    int deleteLastNote();

    int updateVisitCount(int article_id);

    int seleclVisitCount(String username);

    int seleclOrginalCount(String username);

    int seleclCount(int username);

    int seleclLikeCount(String username);

    List<Note> seleclPerNote(String username);

    int seleclFinishCount(String username, int finish);

    List<Article> SelectAllAricleByviewCount(String username);

    List<Note> seleclAllNote();

    List<Note> seleclAllNotes(int finish);

    Note selectOneNoteById(int id);

    int insertAnswer(int note_id, int user_id, String content);

    List<Note> seleclAllNoteByName(String username);

    List<Answer> seleclAllAnswerById(int id);

    int selectScoreByGrade(int grade);

    int updateScoreByName(int score, String username);

    int selectMaxGrade(int score);

    int updateGrade(int score, int grade, String username);

    int selectMinGrade(int score);

    int updateFinish(int id);

    int deleteNoteById(int id);

    int selecltStorageId(int article_id, int user_id);

    Storage seleclOneStorageById(int id);

    int SelectIsExistStorage(int article_id, int user_id);

}
