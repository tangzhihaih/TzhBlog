package com.tang.blog.Controller;

import com.tang.blog.Unity.Article;
import com.tang.blog.Unity.Grade;
import com.tang.blog.Unity.Img;
import com.tang.blog.Unity.User;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author tangzhihai
 * @date 2019/3/7
 */
@Controller
@RequestMapping("Admin")
public class AdminController {
    @Autowired
    private com.tang.blog.Service.loginService loginservice;
    @Autowired
    private blogService blogservice;

    @RequestMapping("login")
    public String login(HttpServletRequest request, Model model, HttpServletResponse response)throws  Exception{
        MD5 md5=new MD5();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        User user=loginservice.login(md5.getMD5(name));             //查询用户是否存在
        if (user!=null){                                            //用户登录成功执行的操作
            List<Article> list=blogservice.SelectAll();
            model.addAttribute("users", list);          //查询所有的博客作为集合

            List<Grade> gradeList=blogservice.selectOneGrade(md5.getMD5(name));
            model.addAttribute("gradeList",gradeList);//查询博主的博客等级

            if(user.getPassword().equals(md5.getMD5(password))){
                session.setAttribute("username",name);
                int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
                model.addAttribute("no_img",no_img);
                String img_name=loginservice.selectImageName(user.getId());
                List<Img> imgList = blogservice.seleclAllImg();
                model.addAttribute("img_name",img_name);
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
                        model.addAttribute("img33",gradeList.get(i).getImg().getImg_name());
                        model.addAttribute("nickname3",gradeList.get(i).getUser().getNickname());
                        model.addAttribute("grade3",gradeList.get(i).getGrade());
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
                        model.addAttribute("img6",gradeList.get(i).getImg().getImg_name());
                        model.addAttribute("nickname6",gradeList.get(i).getUser().getNickname());
                        model.addAttribute("grade6",gradeList.get(i).getGrade());
                        model.addAttribute("username6",gradeList.get(i).getUser().getUsername());
                    }

                }
                if (imgList.size() >=2) {
                    for (int i = 0; i < imgList.size(); i++) {
                        if (i==0){
                            model.addAttribute("img1", imgList.get(i).getImg_name());
                        }else if(i==1){
                            model.addAttribute("img2", imgList.get(i).getImg_name());
                        }else if(i==2) {
                            model.addAttribute("img3",  imgList.get(i).getImg_name());
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
                                case 1:
                                    model.addAttribute("img2", imgList.get(i).getImg_name());
                                    break;
                                case 2:
                                    model.addAttribute("img3", imgList.get(i).getImg_name());
                                    break;
                            }
                            m++;
                        }
                    }
                }
                return "HomePage";
            }
            else {
                out.flush();
                out.println("<script>");
                out.println("alert('请重新输入！！');");
                out.println("history.back();");
                out.println("</script>");
                return "popups/login";
            }
        }
        else{
            out.flush();
            out.println("<script>");
            out.println("alert('输入错误，请重新输入！！');");
            out.println("history.back();");
            out.println("</script>");
            return "popups/login";
        }
    }
    @RequestMapping("exit")
    public String exit(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.invalidate();
        return "popups/login";
    }

    @RequestMapping("registerTest")
    public String registerTest(@RequestParam("registermobile") String name, @RequestParam("registerkeyword")String pwd,
                               HttpServletRequest request, HttpServletResponse response)throws Exception{
        MD5 md5=new MD5();
        PrintWriter out=response.getWriter();
        String username=md5.getMD5(name);
        int is_exist=loginservice.selectByName(username);
        if (is_exist < 1) {
            HttpSession session=request.getSession();
            session.setAttribute("username",md5.getMD5(name));
            session.setAttribute("password",md5.getMD5(pwd));
            return "popups/register2";
        } else {
            out.flush();
            out.println("<script>");
            out.println("alert('用户已存在，请重新注册！！');");
            out.println("history.back();");
            out.println("</script>");
            return "../../register";
        }
    }
    @RequestMapping("register3")
    public String register3(HttpServletRequest request, HttpServletResponse response)throws Exception{
        HttpSession session=request.getSession();
        response.setContentType("text/html,charset=UTF-8");
        PrintWriter out=response.getWriter();
        String username=String.valueOf(session.getAttribute("username"));
        int is_exist=loginservice.selectByName(username);
        if(is_exist<1){

            String password=String.valueOf(session.getAttribute("password"));
            int isSuccess=loginservice.registerTest(username,password);
            if (isSuccess>0){
                User user=loginservice.login(String.valueOf(session.getAttribute("username")));
                int id=user.getId();
                int is_insert=loginservice.insertGrade(user.getId(),1,0);/*这是注册成功的用户插入等级数据*/

                String default_name="default.png";                              /*c初始化用户的图片*/
                int isinsert=loginservice.insertImage(user.getId(),default_name);

                session.invalidate();
                return "popups/register3";
            }
            else{
                out.flush();
                out.println("<script>");
                out.println("alert('注册失败！！');");
                out.println("history.back();");
                out.println("</script>");
            }
        }
        else {
            return "../../register";
        }
        return "popups/register3";
    }

    @RequestMapping("changePassword")
    public Object changePassword(HttpServletRequest request, HttpServletResponse response,
                                 HttpSession session)throws  Exception{
        MD5 md5=new MD5();
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int updatePassword=0;
        String oldPassword=request.getParameter("oldPassword");
        String newPassword=request.getParameter("password");
        String repassword=request.getParameter("repassword");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        if(oldPassword==null||oldPassword==""||newPassword==null||newPassword==""||repassword==null||
                repassword==""){
            out.flush();
            out.println("<script>");
            out.println("alert('输入不能为空！！');");
            out.println("history.back();");
            out.println("</script>");
        }else if (!newPassword.equals(repassword)){
            out.flush();
            out.println("<script>");
            out.println("alert('密码前后输入不一致！！');");
            out.println("history.back();");
            out.println("</script>");
        }
        else if (oldPassword.equals(newPassword)){
            out.flush();
            out.println("<script>");
            out.println("alert('旧密码，新密码相同，请重新输入！！');");
            out.println("history.back();");
            out.println("</script>");
        }else {
            User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
            if (!user.getPassword().equals(md5.getMD5(oldPassword))){
                out.flush();
                out.println("<script>");
                out.println("alert('您输入的密码有误！！');");
                out.println("history.back();");
                out.println("</script>");
            }
            else{
                updatePassword=loginservice.updatePassword(md5.getMD5(String.valueOf(session.getAttribute("username")))
                        ,md5.getMD5(newPassword));
                if (updatePassword>0){
                    session.invalidate();
                    return "popups/login";
                }
                else{
                    out.flush();
                    out.println("<script>");
                    out.println("alert('密码更新失败，请重新更改！！');");
                    out.println("history.back();");
                    out.println("</script>");
                    return "account";
                }
            }
        }
        return "account";

    }
    @RequestMapping("/checkLogin")
    @ResponseBody
    public Object checkLogin(HttpSession session){
        Map<String,Object> map=new HashMap<>();
        boolean is_success;
        String name=String.valueOf(session.getAttribute("username"));
        if (name==null||name==""){
            is_success=false;
            map.put("success",is_success);
        }
        else{
            is_success=true;
            map.put("success",is_success);
        }
        return map;
    }
    @RequestMapping("tttt")
    public String tttt(HttpSession session, Model model){
        MD5 md5=new MD5();

        List<Article> list=loginservice.selectlianhe(md5.getMD5
                (String.valueOf(session.getAttribute("username"))));
        model.addAttribute("list",list);
        return "tttt";
    }
}
