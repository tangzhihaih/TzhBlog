package com.tang.blog.Controller;

import com.tang.blog.Unity.*;
import com.tang.blog.Security.MD5;
import com.tang.blog.Service.blogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *功能描述
 * @author tangzhihai
 * @date 2019/2/27
 * @param
 * @return
 */

@Controller
@RequestMapping("Blog")
public class BlogContrller {
    @Autowired
    private blogService blogservice;
    @Autowired
    private com.tang.blog.Service.loginService loginservice;
    private  String url="E:\\software\\Java_project\\ssmdemo\\src\\main\\webapp\\hp_images\\";

    @RequestMapping("default")
    public String defaul(HttpServletRequest request, Model model, int page){
        HttpSession session=request.getSession();
        MD5 md5=new MD5();
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        List<Article> list=blogservice.SelectAllAricle(user.getId());

        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        Object k=list.size()>0?model.addAttribute("is_zero",1):model.addAttribute("is_zero",0);
        int totalUsers = list.size();
        int usersPerPage = 5;
        String defaul="default";
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        int pag;
        try {
            //当前页数
            pag=Integer.valueOf(page);
        } catch (NumberFormatException e) {
            pag=1;
        }
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        int beginIndex = (pag - 1) * usersPerPage;
        int endIndex=beginIndex+usersPerPage;
        if (endIndex>totalUsers)
            endIndex=totalUsers;
        model.addAttribute("totalUsers",totalUsers);
        model.addAttribute("def",defaul);
        model.addAttribute("usersPerPage", usersPerPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("beginIndex", beginIndex);
        model.addAttribute("endIndex", endIndex);
        model.addAttribute("page", page);
        model.addAttribute("users", list);
        return "blog";
    }
    @RequestMapping("updateTime")
    public String updateTime(HttpServletRequest request, Model model, String page){
        MD5 md5=new MD5();

        int usersPerPage = 5;
        int pag;
        String defaul="updateTime";
        HttpSession session=request.getSession();
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());

        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        List<Article> list=blogservice.SelectAllAricleByTime(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        Object k=list.size()>0?model.addAttribute("is_zero",1):model.addAttribute("is_zero",0);
        int totalUsers = list.size();
        try {
            //当前页数
            pag=Integer.valueOf(page);
        } catch (NumberFormatException e) {
            pag=1;
        }
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        int beginIndex = (pag - 1) * usersPerPage;
        int endIndex=beginIndex+usersPerPage;
        if (endIndex>totalUsers)
            endIndex=totalUsers;
        model.addAttribute("img_name",img_name);
        model.addAttribute("totalUsers",totalUsers);
        model.addAttribute("def",defaul);
        model.addAttribute("usersPerPage", usersPerPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("beginIndex", beginIndex);
        model.addAttribute("endIndex", endIndex);
        model.addAttribute("page", page);
        model.addAttribute("users", list);
        return "blog";
    }
    @RequestMapping("viewCount")
    public String viewCount(HttpSession session, Model model, int page){
        MD5 md5 =new MD5();

        List<Article> articles=blogservice.SelectAllAricleByviewCount(
                md5.getMD5(String.valueOf(session.getAttribute("username"))));
        int is_zero=articles.size()>0?1:0;
        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        model.addAttribute("is_zero",is_zero);
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        if (articles.size()>0){
            int totalUsers = articles.size();
            int usersPerPage = 5;
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(page);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("page", 1);
            model.addAttribute("users", articles);
        }
        return "blog";
    }
    @RequestMapping("view_blog")
    public String viewBlog(@RequestParam("id") String id, Model model, HttpServletRequest request,
                           String username){
        HttpSession session=request.getSession();
        MD5 md5=new MD5();
        Article article=blogservice.SelectAricleOne(Integer.valueOf(id));
        User user=loginservice.selectUserByArticleId(article.getArticle_id());
        int is_zero=0;
        int is_exists=blogservice.SelectIsExistStorage(Integer.valueOf(id),user.getId());
        if (!username.equals(md5.getMD5(String.valueOf(session.getAttribute("username"))))){
             is_zero=is_exists>0?2:1;
        }
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy:MM:dd ");

        String content=blogservice.SelectOneArticleContent(Integer.valueOf(id));
        model.addAttribute("content",content);
        String dat=simpleDateFormat.format(article.getWrite_time());
        model.addAttribute("dat",dat);
        model.addAttribute("article",article);

        User user2=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user2.getId());
        model.addAttribute("img_name",img_name);
        if (is_exists==1){
            int present_id=blogservice.selecltStorageId(Integer.valueOf(id),user2.getId());
            model.addAttribute("present_id",present_id);
        }

        model.addAttribute("is_zero",is_zero);
        if(!username.equals(String.valueOf(session.getAttribute("username")))){
            int update_visit=blogservice.updateVisitCount(Integer.valueOf(id));
        }
        return "show_article";
    }

    @RequestMapping("storage_article")
    public String storage_article(int id, Model model, HttpServletRequest request){
        HttpSession session=request.getSession();
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        Article article=blogservice.SelectAricleOne(id);
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        int is_storage_success=blogservice.insertStorage(article.getId(),user.getId());
        String content=blogservice.SelectOneArticleContent(Integer.valueOf(id));
        model.addAttribute("content",content);
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);

        model.addAttribute("is_zero",2);

        int present_id=blogservice.selecltStorageId(article.getId(),user.getId());

        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy:MM:dd");
        String dat=simpleDateFormat.format(article.getWrite_time());
        model.addAttribute("dat",dat);
        model.addAttribute("article",article);

        model.addAttribute("present_id",present_id);
        return "show_article";
    }

    @RequestMapping("can_storage")
    public String can_storage(int id, Model model, HttpServletRequest request){
        Storage storage=blogservice.seleclOneStorageById(id);
        int article_id=storage.getArticle_id();
        int is_delete_has_storage_success=blogservice.deleteStorageById(id);
        HttpSession session=request.getSession();
        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        MD5 md5=new MD5();
        if (is_delete_has_storage_success>0){
            String content=blogservice.SelectOneArticleContent(storage.getArticle_id());
            model.addAttribute("content",content);
            User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
            String img_name=loginservice.selectImageName(user.getId());
            model.addAttribute("img_name",img_name);
            model.addAttribute("is_zero",1);
            Article article=blogservice.SelectAricleOne(storage.getArticle_id());

            model.addAttribute("article",article);
            model.addAttribute("dat",article.getWrite_time());
        }
        return "show_article";
    }

    @RequestMapping("delete_blog")
    public Object deleteBlog(String id, Model model, HttpServletRequest request){
        Map<String,Object> map=new HashMap<>();
        MD5 md5=new MD5();
        HttpSession session=request.getSession();
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        int is_delete_success=blogservice.deleteBlogById(Integer.valueOf(id));
        if (is_delete_success>0){
            map.put("success",true);
        }
        else {
            map.put("success",false);
        }
        return map;
    }

    @RequestMapping("storage")
    public String storage(HttpServletRequest request, Model model, int page, HttpSession session){
        HttpSession sessionS=request.getSession();
        MD5 md5=new MD5();
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());

        List<Storage> list=blogservice.seleclAllStorage(md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        model.addAttribute("img_name",img_name);
        int is_zero=list.size()>0?1:0;
        model.addAttribute("is_zero",is_zero);
        String string=String.valueOf(sessionS.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        if (list.size()>0){
            int totalUsers = list.size();
            int usersPerPage = 5;
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(page);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("page", 1);
            model.addAttribute("users", list);

            model.addAttribute("img_name",img_name);
        }
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setType(1);
        }
        return "storage";
    }

    @RequestMapping("Community")
    public String Community(Model model, HttpServletRequest request, String page, HttpServletResponse response)
    throws Exception{
        List<Article> list=blogservice.SelectAll();
        MD5 md5=new MD5();
        HttpSession session=request.getSession();
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }else{
            int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
            model.addAttribute("no_img",no_img);
            int totalUsers = list.size();
            int usersPerPage = 5;
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(page);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            if (endIndex>totalUsers)
                endIndex=totalUsers;

            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("page", pag);
            User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
            Object k=list.size()>0?model.addAttribute("is_zero",1):model.addAttribute("is_zero",0);
            List<Follow> follows=blogservice.seleclHasFollow(user.getId());

            String img_name=loginservice.selectImageName(user.getId());
            model.addAttribute("img_name",img_name);
            List<Follow> followList=loginservice.selectMyFollow(user.getId());
            String m=list.get(0).getUser().getUsername();
            for (int i = 0; i <list.size() ; i++) {
                if (list.get(i).getUser().getUsername().equals(md5.getMD5(String.valueOf(session.getAttribute("username"))))) {
                    list.get(i).setFollow_type(3);
                }
                else {
                    for (int j = 0; j < followList.size(); j++) {
                        if (!list.get(i).getUser().getNickname().equals(followList.get(j).getUser().getNickname())) {
                            list.get(i).setFollow_type(0);
                        } else {
                            list.get(i).setFollow_type(1);
                        }
                    }
                }
            }


            /*for (int i = 0; i <list.size() ; i++) {
                for (int j = 0; j < follows.size(); j++) {
                    if (list.get(i).getUser().getUsername().equals(follows.get(j).getUser().getUsername())){
                        list.get(i).setFollow_type(1);
                    }
                }
            }*/

            model.addAttribute("follow",list.get(1).getFollow_type());
            model.addAttribute("users", list);
            model.addAttribute("username",String .valueOf(session.getAttribute("username")));
        }
        return "community";
    }

    @RequestMapping("followcal")
    public String followcal(@RequestParam("username") String username, HttpServletRequest request, Model model, @RequestParam("page") int page){
        HttpSession session=request.getSession();
        MD5 md5=new MD5();
        User article1=blogservice.selectName(username);
        int is_exist_follow=blogservice.SelectIsExistFollow(username,md5.getMD5(String.valueOf(session.getAttribute("username"))));
        if (is_exist_follow>0){
            int is_delete_success=blogservice.deleteHasFollow(username,md5.getMD5(String.valueOf(session.getAttribute("username"))));
        }
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        List<Article> list=blogservice.SelectAll();
        int totalUsers = list.size();
        int usersPerPage = 5;
        int pag;
        try {
            //当前页数
            pag=Integer.valueOf(page);
        } catch (NumberFormatException e) {
            pag=1;
        }
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        int beginIndex = (pag - 1) * usersPerPage;
        int endIndex=beginIndex+usersPerPage;
        if (endIndex>totalUsers)
            endIndex=totalUsers;

        model.addAttribute("totalUsers",totalUsers);
        model.addAttribute("usersPerPage", usersPerPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("beginIndex", beginIndex);
        model.addAttribute("endIndex", endIndex);
        model.addAttribute("page", pag);
        Object k=list.size()>0?model.addAttribute("is_zero",1):model.addAttribute("is_zero",0);
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        List<Follow> followList=loginservice.selectMyFollow(user.getId());
        List<Follow> follows=blogservice.seleclHasFollow(user.getId());
        for (int i = 0; i <list.size() ; i++) {
            if (list.get(i).getUser().getUsername().equals(md5.getMD5(String.valueOf(session.getAttribute("username"))))) {
                list.get(i).setFollow_type(3);
            }
            else {
                for (int j = 0; j < followList.size(); j++) {
                    if(followList.get(j).getUser().getNickname().equals(list.get(i).getUser().getNickname())){
                        list.get(i).setFollow_type(1);
                    }
                    else {
                        list.get(i).setFollow_type(0);
                    }
                }
            }
        }
        for (int i = 0; i <list.size() ; i++) {
            for (int j = 0; j < follows.size(); j++) {
                if (list.get(i).getUser().getUsername().equals(article1.getUsername())){
                    list.get(i).setFollow_type(0);
                }
            }
        }
        model.addAttribute("follow",list.get(1).getFollow_type());
        model.addAttribute("users", list);
        model.addAttribute("username",String .valueOf(session.getAttribute("username")));


        return "community";
    }
    @RequestMapping("follow")
    public String follow(@RequestParam("username") String username, HttpServletRequest request, Model model, @RequestParam("page") int page){
        HttpSession session=request.getSession();
        MD5 md5=new MD5();
        User user1=blogservice.selectName(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        User user=blogservice.selectName(username);
        String nickname=user1.getNickname() ;
        int is_exist_follow=blogservice.SelectIsExistFollow(username,md5.getMD5(String.valueOf(session.getAttribute("username"))));
        if (is_exist_follow<0.5){
            int is_insert_follow=blogservice.insertFollow(user.getId(),user1.getId());
        }
        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        List<Article> list=blogservice.SelectAll();
        int totalUsers = list.size();
        int usersPerPage = 5;
        int pag;
        try {
            //当前页数
            pag=Integer.valueOf(page);
        } catch (NumberFormatException e) {
            pag=1;
        }
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        int beginIndex = (pag - 1) * usersPerPage;
        int endIndex=beginIndex+usersPerPage;
        if (endIndex>totalUsers)
            endIndex=totalUsers;

        model.addAttribute("totalUsers",totalUsers);
        model.addAttribute("usersPerPage", usersPerPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("beginIndex", beginIndex);
        model.addAttribute("endIndex", endIndex);
        model.addAttribute("page", pag);
        Object k=list.size()>0?model.addAttribute("is_zero",1):model.addAttribute("is_zero",0);

        String img_name=loginservice.selectImageName(user1.getId());
        model.addAttribute("img_name",img_name);
        List<Follow> followList=loginservice.selectMyFollow(user1.getId());
        for (int K = 0; K <list.size() ; K++) {
            if (((md5.getMD5(String.valueOf(session.getAttribute("username")))).equals(list.get(K).getUser().getUsername()))) {
                list.get(K).setFollow_type(3);
            }
            else {
                for (int j = 0; j < followList.size(); j++) {
                    if(followList.get(j).getUser().getNickname()==list.get(K).getUser().getNickname()){
                        list.get(K).setFollow_type(1);
                    }
                    else {
                        list.get(K).setFollow_type(0);
                    }
                }
            }
        }
        for (int i = 0; i <list.size() ; i++) {
                if (list.get(i).getUser().getUsername().equals(user.getUsername())){
                    list.get(i).setFollow_type(1);
            }
        }
        model.addAttribute("users", list);
        model.addAttribute("username",String .valueOf(session.getAttribute("username")));
        return "community";
    }

    @RequestMapping("attention")
    public String attention(HttpServletRequest request, Model model, int page){
        MD5 md5=new MD5();
        HttpSession sessionS=request.getSession();
        Object name=sessionS.getAttribute("username");
        User user=loginservice.login(md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        String string=String.valueOf(sessionS.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }

        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        model.addAttribute("username",String .valueOf(sessionS.getAttribute("username")));
        List<Follow> followList=blogservice.seleclHasFollow(user.getId());
        String nickname=followList.get(0).getUser().getNickname();

        int is_zero=followList.size()>0?1:0;
        model.addAttribute("is_zero",is_zero);
        if (followList.size()>0){
            int totalUsers = followList.size();
            int usersPerPage = 5;
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(page);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("page", page);

            model.addAttribute("users", followList);
        }
        for (int i = 0; i <followList.size(); i++) {
            followList.get(i).setType(1);
        }
        model.addAttribute("img_name",img_name);
        return "attention";
    }
    @RequestMapping("att_canfollow")
    public String att_canfollow(@RequestParam("username") String username, Model model, HttpServletRequest request, @RequestParam("page") int page){
        HttpSession sessionS=request.getSession();
        MD5 md5=new MD5();
        User user=blogservice.selectName(username);
        String string=String.valueOf(sessionS.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        Object name=sessionS.getAttribute("username");
        String img_name=loginservice.selectImageName(user.getId());
        User user1=loginservice.login(md5.getMD5(string));
        model.addAttribute("username",String .valueOf(sessionS.getAttribute("username")));
        List<Follow> followList=blogservice.seleclHasFollow(user1.getId());
        int is_delete_success=blogservice.deleteHasFollow(username,md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        int is_zero=followList.size()>0?1:0;
        if (followList.size()>0){
            int totalUsers = followList.size();
            int pag;
            int usersPerPage = 5;
            try {
                //当前页数
                pag=Integer.valueOf(1);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            if (endIndex>totalUsers)
                endIndex=totalUsers;

            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("page", 1);
            model.addAttribute("is_zero",is_zero);
            model.addAttribute("users", followList);
        }
        for (int i = 0; i <followList.size(); i++) {
            if (followList.get(i).getUser().getUsername().equals(username)){
                followList.get(i).setType(0);
            }
            else {
                followList.get(i).setType(1);
            }

        }
        model.addAttribute("img_name",img_name);
        return "attention";
    }
    @RequestMapping("follow_again")
    public String follow_again(@RequestParam("username") String username, HttpServletRequest request, Model model, @RequestParam("page") int page){
        MD5 md5=new MD5();
        HttpSession sessionS=request.getSession();
        Object name=sessionS.getAttribute("username");
        User user=blogservice.selectName(username);
        String img_name=loginservice.selectImageName(user.getId());
        User user1=blogservice.selectName(md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        model.addAttribute("username",String .valueOf(sessionS.getAttribute("username")));
        List<Follow> followList=blogservice.seleclHasFollow(user1.getId());
        String string=String.valueOf(sessionS.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        String imgname=loginservice.selectImageName(user.getId());

        String nickname=user1.getNickname() ;

        int is_insert_follow=blogservice.insertFollow(user.getId(),user1.getId());

        List<Follow> list=blogservice.seleclHasFollow(user1.getId());
        int is_zero=list.size()>0?1:0;
        if (list.size()>0){
            int totalUsers = list.size();
            int usersPerPage = 5;
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(page);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("page", pag);
            model.addAttribute("is_zero",is_zero);
            model.addAttribute("users", list);
        }
        for (int i = 0; i <list.size(); i++) {
            if (list.get(i).getUser().getUsername().equals(username)){
                list.get(i).setType(1);
            }
        }
        model.addAttribute("img_name",img_name);
        return "attention";
    }

    @RequestMapping("fans")
    public String fans(HttpServletRequest request, Model model){
        MD5 md5=new MD5();
        HttpSession session=request.getSession();
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        List<Follow> list=blogservice.seleclHasFollow(user.getId());
        int is_zero=list.size()>0?1:0;
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        model.addAttribute("is_zero",is_zero);
        if (list.size()>0){
            int totalUsers = list.size();
            int usersPerPage = 5;
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(1);
            } catch (NumberFormatException e) {
                pag=1;
            }

            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("page", 1);
            model.addAttribute("users", list);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("img_name",img_name);
        }
        return "fans";
    }

    @RequestMapping("deleteById")
    public String deleteById(int id, Model model, HttpServletRequest request){
        MD5 md5=new MD5();
        HttpSession session=request.getSession();
        List<Storage> list=blogservice.seleclAllStorage(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        int is_delete_success=blogservice.deleteStorageById(id);
        int is_zero=list.size()>0?1:0;
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        if (list.size()>0&&is_delete_success>0){
            int totalUsers = list.size();
            int usersPerPage = 5;
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(1);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("page", 1);
            model.addAttribute("users", list);
            model.addAttribute("is_zero",is_zero);
            User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
            String img_name=loginservice.selectImageName(user.getId());
            model.addAttribute("img_name",img_name);
        }
        for (int i = 0; i < list.size(); i++) {
            if(list.get(i).getArticle().getId()==id){
                list.get(i).setType(0);
            }
            else {
                list.get(i).setType(1);
            }
        }
        return "storage";
    }
    @RequestMapping("storageById")
    public String storageById(int id, Model model, HttpServletRequest request){
        Article article=blogservice.SelectAricleOne(id);
        HttpSession session=request.getSession();
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        User user=loginservice.login(md5.getMD5(string));
        int is_insert_success=blogservice.insertStorage(article.getId(),user.getId());
        List<Storage> list=blogservice.seleclAllStorage(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        int is_zero=list.size()>0?1:0;
        if (is_insert_success>0){
            int totalUsers = list.size();
            int usersPerPage = 5;
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(1);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("page", 1);
            model.addAttribute("users", list);
            model.addAttribute("is_zero",is_zero);
            String img_name=loginservice.selectImageName(user.getId());
            model.addAttribute("img_name",img_name);
        }
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setType(1);
        }
        return "storage";
    }

    @RequestMapping("HomePage")
    public String Homepage(Model model, HttpSession session){
        MD5 md5=new MD5();
        String name= md5.getMD5(String.valueOf(session.getAttribute("username")));
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        List<Img> imgList = blogservice.seleclAllImg();
        if (imgList.size() >=2) {
            for (int i = 0; i < imgList.size(); i++) {
                if (i==1){
                    model.addAttribute("img1", imgList.get(i).getImg_name());
                }else if(i==2){
                    model.addAttribute("img2", imgList.get(i).getImg_name());
                }else if(i==0) {
                    model.addAttribute("img3", imgList.get(i).getImg_name());
                }
            }
        }
        else{
            int m=0;
            for (int k=0;k<Math.floor(6/imgList.size());k++){
                for (int i = 0; i <imgList.size(); i++) {
                    switch (m){
                        case 0:
                            model.addAttribute("img1", imgList.get(i).getImg_name());
                            break;
                        case 2:
                            model.addAttribute("img3", imgList.get(i).getImg_name());
                            break;
                        case 1:
                            model.addAttribute("img2", imgList.get(i).getImg_name());
                            break;
                    }
                    m++;
                }
            }
        }
        List<Grade> gradeList=blogservice.selectOneGrade(name);
        for (int i = 0; i < gradeList.size(); i++) {
            if (i==0){
                model.addAttribute("img11",gradeList.get(i).getImg().getImg_name());
                model.addAttribute("nickname1",gradeList.get(i).getUser().getNickname());
                model.addAttribute("grade1",gradeList.get(i).getGrade());
                model.addAttribute("username1",gradeList.get(i).getUser().getUsername());
            }else if(i==1){
                model.addAttribute("img22",gradeList.get(i).getImg().getImg_name());
                model.addAttribute("nickname2",gradeList.get(i).getUser().getNickname());
                model.addAttribute("grade2",gradeList.get(i).getGrade());
                model.addAttribute("username2",gradeList.get(i).getUser().getUsername());
            }else if(i==2){
                model.addAttribute("nickname3",gradeList.get(i).getUser().getNickname());
                model.addAttribute("grade3",gradeList.get(i).getGrade());
                model.addAttribute("img33",gradeList.get(i).getImg().getImg_name());
                model.addAttribute("username3",gradeList.get(i).getUser().getUsername());
            }else if(i==3){
                model.addAttribute("img4",gradeList.get(i).getImg().getImg_name());
                model.addAttribute("nickname4",gradeList.get(i).getUser().getNickname());
                model.addAttribute("grade4",gradeList.get(i).getGrade());
                model.addAttribute("username4",gradeList.get(i).getUser().getUsername());
            }else if(i==4){
                model.addAttribute("img5",gradeList.get(i).getImg().getImg_name());
                model.addAttribute("nickname5",gradeList.get(i).getUser().getNickname());
                model.addAttribute("grade5",gradeList.get(i).getGrade());
                model.addAttribute("username5",gradeList.get(i).getUser().getUsername());
            }else if(i==5){
                model.addAttribute("grade6",gradeList.get(i).getGrade());
                model.addAttribute("username6",gradeList.get(i).getUser().getUsername());
                model.addAttribute("img6",gradeList.get(i).getImg().getImg_name());
                model.addAttribute("nickname6",gradeList.get(i).getUser().getNickname());
            }
        }

        List<Article> list=blogservice.SelectAll();
        model.addAttribute("users", list);
        return "HomePage";
    }
    @RequestMapping("writeNote")
    public String writeNote(HttpServletRequest request, Model model){
        HttpSession session=request.getSession();
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        String username=String.valueOf(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        Grade grade=blogservice.selectGradeOne(username);
        model.addAttribute("can_use_scores",grade.getScore());
        return "writeNote";
    }

    @RequestMapping("Note")
    @ResponseBody
    public Object Note(HttpServletRequest request, @RequestParam("content-editormd-html-code") String contentHtml,
                       HttpServletResponse response, Model model) throws Exception{
        MD5 md5=new MD5();
        response.setContentType("text/html; charset=UTF-8"); //转码
        PrintWriter out = response.getWriter();
        String title=request.getParameter("title");
        String note_mark=request.getParameter("province");
        String note_markt=request.getParameter("city");
        String score=request.getParameter("modules");
        if (title.length()==0||note_mark.length()==0||note_markt.length()==0||Integer.valueOf(score)==0
                ||contentHtml.length()==0){
            out.flush();
            out.println("<script>");
            out.println("alert('帖子请填写完成！');");
            out.println("history.back();");
            out.println("</script>");
        }
        else{
            int publish_score=Integer.valueOf(request.getParameter("modules"));
            HttpSession session=request.getSession();
            String username=md5.getMD5(String.valueOf(session.getAttribute("username")));
            Grade grade=blogservice.selectGradeOne(username);
            String string=String.valueOf(session.getAttribute("username"));
            if (string.length()<=4){
                return "popups/login";
            }
            int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
            model.addAttribute("no_img",no_img);
            if (grade.getScore()<publish_score){
                out.flush();
                out.println("<script>");
                out.println("alert('分数重新调整！');");
                out.println("history.back();");
                out.println("</script>");
            }else{
                User user=loginservice.login(username);
                int is_success=blogservice.insertOneNote(title,contentHtml,note_mark,note_markt,publish_score,user.getId());
                if (is_success>0){
                    int opreat_success=blogservice.updateScore(grade.getScore()-Integer.valueOf(score),
                            md5.getMD5(String.valueOf(session.getAttribute("username"))));
                    if (opreat_success>0){
                        out.flush();
                        out.println("<script>");
                        out.println("alert('发布帖子成功！');");
                        out.println("history.back();");
                        out.println("</script>");
                    }else{
                        int error_delete=blogservice.deleteLastNote();
                        if (error_delete>0){
                            out.flush();
                            out.println("<script>");
                            out.println("alert('发布帖子失败！');");
                            out.println("history.back();");
                            out.println("</script>");
                        }
                    }
                }
            }
        }
        return "writeNote";
    }
    @RequestMapping("home")
    public String home(String type){
        return "SortType";
    }

    @RequestMapping("view_User")
    public String view_User(@RequestParam("username") String username, Model model,
                            HttpSession session, @RequestParam("page") int page){
        MD5 md5=new MD5();
        int visit_count,orginal_count,count,zero,is_zero;
        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        /*点击博客时候显示的内容,这是博客等级*/
        Grade grade=blogservice.selectGradeOne(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        model.addAttribute("grade",grade.getGrade());
        /*博客访问量的查询*/
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        visit_count=blogservice.seleclVisitCount(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        model.addAttribute("visit_count",visit_count);
        /*博客里面原创的数量*/

        orginal_count=blogservice.seleclOrginalCount(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        model.addAttribute("orginal_count",orginal_count);

        /*这是博主的排名*/
        count=blogservice.seleclCount(user.getId());
        model.addAttribute("count",count);
        /*这是博主获得的赞数*/
        int like_count=blogservice.seleclLikeCount(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        model.addAttribute("like_count",like_count);
        model.addAttribute("username",username);
        /*这是当前博主的所有博客*/
        List<Article> list=blogservice.SelectAllAricle(user.getId());
        zero=list.size()>0?1:0;
        int totalUsers = list.size();
        int usersPerPage = 7;
        int pag;
        try {
            //当前页数
            pag=Integer.valueOf(page);
        } catch (NumberFormatException e) {
            pag=1;
        }
        int beginIndex = (pag - 1) * usersPerPage;
        int endIndex=beginIndex+usersPerPage;
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        if (endIndex>totalUsers)
            endIndex=totalUsers;
        model.addAttribute("totalUsers",totalUsers);
        model.addAttribute("usersPerPage", usersPerPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("beginIndex", beginIndex);
        model.addAttribute("endIndex", endIndex);
        model.addAttribute("pa", pag);
        model.addAttribute("users", list);
        model.addAttribute("zero", zero);

        /*这是帖子的内容*/
        List<Note> noteList=blogservice.seleclPerNote(username);
        is_zero=noteList.size()>0?1:0;
        model.addAttribute("is_zero",is_zero);
        if(noteList.size()>0){
            /*这是帖子的数量*/
            int note_count=noteList.size();
            model.addAttribute("note_count",note_count);
            /*这是回帖的数量*/
            int back_note=1;
            model.addAttribute("back_note",back_note);
            /*这是结帖率*/
            int finish_count=blogservice.seleclFinishCount(username,1);
            NumberFormat nt=NumberFormat.getPercentInstance();
            nt.setMaximumFractionDigits(0);
            model.addAttribute("finish_note",nt.format(finish_count/noteList.size()));
            int totalUser = list.size();
            int usersPerPag = 7;
            int pa;
            try {
                //当前页数
                pa=1;
            } catch (NumberFormatException e) {
                pa=1;
            }
            int beginInde = (pa - 1) * usersPerPag;
            int endInde=beginInde+usersPerPag;
            int totalPage = totalUser % usersPerPag == 0 ? totalUser / usersPerPag : totalUser / usersPerPag + 1;
            if (endInde>totalUser)
                endInde=totalUser;
            model.addAttribute("totalUser",totalUser);
            model.addAttribute("usersPerPag", usersPerPag);
            model.addAttribute("totalPage", totalPage);
            model.addAttribute("beginInde", beginInde);
            model.addAttribute("endInde", endInde);
            model.addAttribute("page", pa);
            model.addAttribute("noteList", noteList);
        }
        return "personHP";
    }
    @RequestMapping("answers")
    public String answers(HttpSession session, Model model){
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        List<Note> noteList=blogservice.seleclAllNote();
        if ((noteList.size()>0)){
            int totalUsers = noteList.size();
            int usersPerPage = noteList.size();
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(1);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("page", 1);
            model.addAttribute("users", noteList);
        }
        return "AllNote";
    }

    @RequestMapping("hasWork")
    public String hasWork(HttpSession session, Model model){
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        List<Note> noteList=blogservice.seleclAllNotes(1);
        if ((noteList.size()>0)){
            int totalUsers = noteList.size();
            int usersPerPage = noteList.size();
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(1);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("page", 1);
            model.addAttribute("users", noteList);
        }
        return "hasWork";
    }

    @RequestMapping("NoWork")
    public String NoWork(HttpSession session, Model model){
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        List<Note> noteList=blogservice.seleclAllNotes(0);
        if ((noteList.size()>0)){
            int totalUsers = noteList.size();
            int usersPerPage = noteList.size();
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(1);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("page", 1);
            model.addAttribute("users", noteList);
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
        }
        return "NoWork";
    }

    @RequestMapping("answerNote")
    public String answerNote(int id, Model model, HttpSession session){
        Note note=blogservice.selectOneNoteById(id);
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        model.addAttribute("note",note);
        User user1=loginservice.selectUserByNoteId(note.getNote_id());
        int is_zero;
        if (user1.getUsername().equals(md5.getMD5(String.valueOf(session.getAttribute("username"))))){
            is_zero=1;
        }else{
            is_zero=0;
        }
        model.addAttribute("is_zero",is_zero);
        return "answerNote";
    }

    @RequestMapping("WantAnswer")
    public String WantAnswer(HttpServletRequest request, HttpServletResponse response
    , HttpSession session, @RequestParam("content-editormd-html-code") String contentHtml, Model model)throws Exception {
        String content = request.getParameter("content-editormd-markdown-doc");
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        int id=Integer.valueOf(request.getParameter("id"));

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (contentHtml==null||contentHtml=="") {
            out.flush();
            out.println("<script>");
            out.println("alert('请填写内容!');");
            out.println("history.back();");
            out.println("</script>");
        } else {
            MD5 md5 = new MD5();
            User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));

            int is_success = blogservice.insertAnswer(id,user.getId(),contentHtml);
            if (is_success > 0) {

                out.flush();
                out.println("<script>");
                out.println("alert('回答成功!');");
                out.println("history.back();");
                out.println("</script>");
            }
        }

        return "answerNote";
    }

    @RequestMapping("Mynote")
    public String Mynote(HttpSession session, Model model, int id){
        MD5 md5=new MD5();
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        Note note=blogservice.selectOneNoteById(id);
        model.addAttribute("note",note);
        int finish=note.getFinish();
        model.addAttribute("finish",finish);
        List<Answer> answerList=blogservice.seleclAllAnswerById(id);

        int is_zero=answerList.size()>0?1:0;
        model.addAttribute("is_zero",is_zero);
        if (is_zero>0){
            model.addAttribute("answerList", answerList);
        }
        return "MyNote";
    }
    @RequestMapping("MyAllNote")
    public String MyAllNote(HttpSession session, Model model, int page){
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);

        List<Note> noteList=blogservice.seleclAllNoteByName(md5.getMD5(String.valueOf(session.getAttribute("username"))));

        int is_zero=noteList.size()>0?1:0;
        model.addAttribute("is_zero",is_zero);
        if (noteList.size()>0){
            int totalUsers = noteList.size();
            int usersPerPage = 5;
            int pag;
            try {
                //当前页数
                pag=Integer.valueOf(page);
            } catch (NumberFormatException e) {
                pag=1;
            }
            int beginIndex = (pag - 1) * usersPerPage;
            int endIndex=beginIndex+usersPerPage;
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
            if (endIndex>totalUsers)
                endIndex=totalUsers;
            model.addAttribute("totalUsers",totalUsers);
            model.addAttribute("usersPerPage", usersPerPage);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("beginIndex", beginIndex);
            model.addAttribute("endIndex", endIndex);
            model.addAttribute("page", pag);
            model.addAttribute("users", noteList);
        }

        return "MyAllNote";
    }

    @RequestMapping("finishNote")
    public String finishNote(String username, int id, HttpSession session, HttpServletResponse response,
                             Model model)throws  Exception{
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        Grade pre_grade=blogservice.selectGradeOne(username);
        Grade grade=blogservice.selectGradeOne(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        Note note=blogservice.selectOneNoteById(id);
        int score=note.getNote_score();
        int max_grade=blogservice.selectMaxGrade(pre_grade.getScore()+score);
        if (!username.equals(md5.getMD5(String.valueOf(session.getAttribute("username"))))){
            int is_success=blogservice.updateGrade(pre_grade.getScore()+score,max_grade,username);
            int min_grade=blogservice.selectMinGrade(grade.getScore()-score);
            int i_success=blogservice.updateGrade(grade.getScore()-score,min_grade,
                    md5.getMD5(String.valueOf(session.getAttribute("username"))));
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        int finish_success=blogservice.updateFinish(id);
        Note note1=blogservice.selectOneNoteById(id);
        model.addAttribute("note",note1);
        if (finish_success>0){
            int finish=note1.getFinish();
            model.addAttribute("finish",finish);
            List<Answer> answerList=blogservice.seleclAllAnswerById(id);
            int is_zero=answerList.size()>0?1:0;
            model.addAttribute("is_zero",is_zero);
            if (is_zero>0){
                model.addAttribute("answerList", answerList);
            }
            out.flush();
            out.println("<script>");
            out.println("alert('结帖成功!');");
            out.println("history.back();");
            out.println("</script>");
            return "MNote";
        }
        return "MyNote";
    }

    @RequestMapping("delete_note")
    public Object delete_note(int id,HttpSession session){
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        Map<String,Object> map=new HashMap<>();
        int is_delete_success=blogservice.deleteNoteById(id);
        if (is_delete_success>0){
            map.put("success",true);
        }else{
            map.put("success",false);
        }
        return map;
    }
}

