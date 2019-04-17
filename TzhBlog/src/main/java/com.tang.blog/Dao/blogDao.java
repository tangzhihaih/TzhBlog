package com.tang.blog.Dao;

import com.tang.blog.Unity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *功能描述
 * @author tangzhihai
 * @date 2019/2/27
 * @param
 * @return
 */

public interface blogDao {
    List<Article> SelectAllAricle(int article_id);

    int deleteBlogById(int id);

    String SelectOneArticleContent(int id);

    Article SelectAricleOne(int id);

    List<Article> SelectAllAricleByTime(String username);

    List<Article> SelectAll();

    int SelectIsExistFollow(@Param("follow_username") String follow_name, @Param("username") String username);

    int insertFollow(@Param("by_follow_id") int by_follow_id, @Param("follow_id") int follow_id);

    User selectName(String username);

    List<Follow> seleclHasFollow(int follow_id);

    int deleteHasFollow(@Param("follow_username") String follow_username, @Param("username") String username);

    List<Storage> seleclAllStorage(String username);

    int insertStorage(@Param("article_id") int article_id, @Param("user_id") int user_id);
    int seleclOneStorage();

    int deleteStorageById(int id);

    int seleclOneId(int id);

    List<Img> seleclAllImg();

    List<Grade> selectOneGrade(String username);

    Grade selectGradeOne(String username);

    int  insertOneNote(@Param("note_title") String note_title, @Param("note_content") String note_content,
                       @Param("note_mark") String note_mark, @Param("note_mark2") String note_mark2,
                       @Param("publish_score") int publish_score, @Param("note_id") int note_id);

    int updateScore(@Param("grade") int grade, @Param("username") String username);

    int deleteLastNote();

    int updateVisitCount(@Param("article_id") int article_id);

    int seleclVisitCount(String username);

    int seleclOrginalCount(String username);

    int seleclCount(int username);

    int seleclLikeCount(String username);

    List<Note> seleclPerNote(String username);

    int seleclFinishCount(@Param("username") String username, @Param("finish") int finish);

    List<Article> SelectAllAricleByviewCount(String username);

    List<Note> seleclAllNote();

    List<Note> seleclAllNotes(int finish);

    Note selectOneNoteById(int id);

    int insertAnswer(@Param("note_id") int note_id, @Param("user_id") int user_id, @Param("content") String content);

    List<Note> seleclAllNoteByName(String username);

    List<Answer> seleclAllAnswerById(int id);

    int selectScoreByGrade(int grade);

    int updateScoreByName(@Param("score") int score, @Param("username") String username);

    int selectMaxGrade(int score);

    int updateGrade(@Param("score") int score, @Param("grade") int grade, @Param("username") String username);

    int selectMinGrade(int score);

    int updateFinish(int id);

    int deleteNoteById(int id);

    int selecltStorageId(@Param("article_id") int article_id, @Param("user_id") int user_id);

    Storage seleclOneStorageById(int id);

    int SelectIsExistStorage(@Param("article_id") int article_id, @Param("user_id") int user_id);
}
