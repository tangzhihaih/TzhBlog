package com.tang.blog.Service.impl;

import com.tang.blog.Dao.blogDao;
import com.tang.blog.Unity.Article;
import com.tang.blog.Service.blogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tang.blog.Unity.User;
import com.tang.blog.Unity.Follow;
import com.tang.blog.Unity.Storage;
import com.tang.blog.Unity.Grade;
import com.tang.blog.Unity.Img;
import com.tang.blog.Unity.Note;
import com.tang.blog.Unity.Answer;
import java.util.List;

/**
 * @author tangzhihai
 * @date 2019/2/27
 */
@Service("blogservice")
public class blogServiceImpl implements blogService {

    @Autowired
    private blogDao blogdao;

    @Override
    public List<Article> SelectAllAricle(int article_id){
        return  blogdao.SelectAllAricle(article_id);
    }

    @Override
    public int deleteBlogById(int id) {
        return blogdao.deleteBlogById(id);
    }

    @Override
    public String SelectOneArticleContent(int id) {
        return blogdao.SelectOneArticleContent(id);
    }

    @Override
    public Article SelectAricleOne(int id) {
        return blogdao.SelectAricleOne(id);
    }

    @Override
    public List<Article> SelectAllAricleByTime(String name) {
        return blogdao.SelectAllAricleByTime(name);
    }

    @Override
    public List<Article> SelectAll() {
        return blogdao.SelectAll();
    }

    @Override
    public int SelectIsExistFollow(String username, String follow_name) {
        return blogdao.SelectIsExistFollow(username,follow_name);
    }

    @Override
    public int insertFollow(int by_follow_id,int follow_id) {
        return blogdao.insertFollow(by_follow_id,follow_id);
    }

    @Override
    public User selectName(String username) {
        return blogdao.selectName(username);
    }

    @Override
    public List<Follow> seleclHasFollow(int follow_id) {
        return blogdao.seleclHasFollow(follow_id);
    }

    @Override
    public int deleteHasFollow(String username, String name) {
        return blogdao.deleteHasFollow(username,name);
    }

    @Override
    public List<Storage> seleclAllStorage(String username) {
        return blogdao.seleclAllStorage(username);
    }

    @Override
    public int insertStorage(int article_id, int user_id) {
        return blogdao.insertStorage(article_id,user_id);
    }

    @Override
    public int seleclOneStorage() {
        return blogdao.seleclOneStorage();
    }

    @Override
    public int deleteStorageById(int id) {
        return blogdao.deleteStorageById(id);
    }

    @Override
    public int seleclOneId(int id) {
        return blogdao.seleclOneId(id);
    }

    @Override
    public List<Img> seleclAllImg() {
        return blogdao.seleclAllImg();
    }

    @Override
    public List<Grade> selectOneGrade(String username) {

        return blogdao.selectOneGrade(username);
    }

    @Override
    public Grade selectGradeOne(String username) {
        return blogdao.selectGradeOne(username);
    }

    @Override
    public int insertOneNote(String note_title, String contentHtml, String note_mark, String note_mark2,
                             int publish_score,int note_id) {
        return blogdao.insertOneNote(note_title,contentHtml,note_mark,note_mark2,publish_score,note_id);
    }

    @Override
    public int updateScore(int grade, String username) {
        return blogdao.updateScore(grade,username);
    }

    @Override
    public int deleteLastNote() {
        return blogdao.deleteLastNote();
    }

    @Override
    public int updateVisitCount(int article_id) {
        return blogdao.updateVisitCount(article_id);
    }

    @Override
    public int seleclVisitCount(String username) {
        return blogdao.seleclVisitCount(username);
    }

    @Override
    public int seleclOrginalCount(String username) {
        return blogdao.seleclOrginalCount(username);
    }

    @Override
    public int seleclCount(int username) {
        return blogdao.seleclCount(username);
    }

    @Override
    public int seleclLikeCount(String username) {
        return blogdao.seleclLikeCount(username);
    }

    @Override
    public List<Note> seleclPerNote(String username) {
        return blogdao.seleclPerNote(username);
    }

    @Override
    public int seleclFinishCount(String username, int finish) {
        return blogdao.seleclFinishCount(username,finish);
    }

    @Override
    public List<Article> SelectAllAricleByviewCount(String username) {
        return blogdao.SelectAllAricleByviewCount(username);
    }

    @Override
    public List<Note> seleclAllNote() {
        return blogdao.seleclAllNote();
    }

    @Override
    public List<Note> seleclAllNotes(int finish) {
        return blogdao.seleclAllNotes(finish);
    }

    @Override
    public Note selectOneNoteById(int id) {
        return blogdao.selectOneNoteById(id);
    }

    @Override
    public int insertAnswer(int note_id,int user_id,String content) {
        return blogdao.insertAnswer(note_id,user_id,content);
    }

    @Override
    public List<Note> seleclAllNoteByName(String username) {
        return blogdao.seleclAllNoteByName(username);
    }

    @Override
    public List<Answer> seleclAllAnswerById(int id) {
        return blogdao.seleclAllAnswerById(id);
    }

    @Override
    public int selectScoreByGrade(int grade) {
        return blogdao.selectScoreByGrade(grade);
    }

    @Override
    public int updateScoreByName(int score, String username) {
        return blogdao.updateScoreByName(score,username);
    }

    @Override
    public int selectMaxGrade(int score) {
        return blogdao.selectMaxGrade(score);
    }

    @Override
    public int updateGrade(int score, int grade, String username) {
        return blogdao.updateGrade(score,grade,username);
    }

    @Override
    public int selectMinGrade(int score) {
        return blogdao.selectMinGrade(score);
    }

    @Override
    public int updateFinish(int id) {
        return blogdao.updateFinish(id);
    }

    @Override
    public int deleteNoteById(int id) {
        return blogdao.deleteNoteById(id);
    }

    @Override
    public int selecltStorageId(int article_id, int user_id) {
        return blogdao.selecltStorageId(article_id,user_id);
    }

    @Override
    public Storage seleclOneStorageById(int id) {
        return blogdao.seleclOneStorageById(id);
    }

    @Override
    public int SelectIsExistStorage(int article_id, int user_id) {
        return blogdao.SelectIsExistStorage(article_id,user_id);
    }
}
