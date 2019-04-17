package com.tang.blog.Controller;


import com.tang.blog.Unity.User;
import com.tang.blog.Security.DESUtil;
import com.tang.blog.Security.MD5;
import com.tang.blog.Service.loginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("User")
public class  UserController {

    @Autowired
    private loginService loginservice;

    private final static String pic_path_base="d:/photo";
    private static final String SUCCESS = "success";
    FileOutputStream fileOutputStream;
    FileInputStream fileInputStream;
    MD5 md5=new MD5();
    DESUtil desUtil=new DESUtil();

    @RequestMapping(value = "publishArticle")
    public String publishArticle(@RequestParam("content-editormd-html-code") String contentHtml, Model model,
                                 HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        StringBuffer contect_article_type=new StringBuffer(".");
        String java=request.getParameter("java");
        String c=request.getParameter("c");
        String php=request.getParameter("php");
        String mysql=request.getParameter("mysql");
        String linux=request.getParameter("linux");
        String blog_sort= request.getParameter("blog_sort");
        String is_private= request.getParameter("is_private");
        String article_type=request.getParameter("article_type");
        String article_name=request.getParameter("article_name");
        User user=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        if(((c==null&&java==null&&php==null&&mysql==null &&linux==null)||article_name==null)||article_type==null){
            out.flush();
            out.println("<script>");
            out.println("alert('请填写完整！！');");
            out.println("history.back();");
            out.println("</script>");
            return "test3";
        }
        else {
            String[] strings=new String[]{java,c,php,mysql,linux};
            for (int i = 0; i < 5; i++) {
                if (!(strings[i]==null||strings[i].length()==0)){
                    contect_article_type=contect_article_type.append(strings[i]).append(".");
                }
            }
            String nickanem=loginservice.selectNickname(md5.getMD5(String.valueOf(session.getAttribute("username"))));
            String str=new String(contect_article_type);
            int is_publish_success=loginservice.InsertArticle(user.getId(), article_name,contentHtml,str,article_type,blog_sort,is_private);
            if (is_publish_success>0){
                    out.flush();
                    out.println("<script>");
                    out.println("alert('发布成功！！');");
                    out.println("history.back();");
                    out.println("</script>");
            }
            else{
                out.flush();
                out.println("<script>");
                out.println("alert('发布失败！！');");
                out.println("history.back();");
                out.println("</script>");
            }

        }

        return "test3";
    }

    @RequestMapping("/subPhoto")
    @ResponseBody
    public String subPhoto(HttpServletRequest request, @RequestParam("photo") MultipartFile multipartFile
    , HttpSession session) throws IOException {
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }

        if (!multipartFile.isEmpty()){
            System.out.println(""+multipartFile.getOriginalFilename());
            String rootFile=request.getSession().getServletContext().getRealPath("images");
            File file=new File(rootFile);
            if (file.exists()){
                File file1=new File(rootFile+File.separator+multipartFile.getOriginalFilename());
                if(!file1.exists()){
                    file1.getParentFile().mkdir();
                    file1.createNewFile();

                }
                FileOutputStream fileOutputStream=new FileOutputStream(file1);
                fileOutputStream.write(multipartFile.getBytes());
                fileOutputStream.flush();
                fileOutputStream.close();
            }
            else {
                file.createNewFile();
                file.mkdirs();
                String na = file.getAbsolutePath();
            }
        }
        return "";
    }
    @RequestMapping("writeBlog")
    public String writeBlog(HttpServletRequest request, Model model){
        HttpSession sessionS=request.getSession();
        String string=String.valueOf(sessionS.getAttribute("username"));

        if (string.length()<=4){
            return "popups/login";
        }
        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        Object name=sessionS.getAttribute("username");
        User user=loginservice.login(md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        return "test3";
    }
    @RequestMapping("download")
    public String download(HttpServletRequest request, Model model){
        HttpSession sessionS=request.getSession();
        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        String string=String.valueOf(sessionS.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        Object name=sessionS.getAttribute("username");
        User user=loginservice.login(md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        return "download";}
    @RequestMapping("blog")
    public String blog(HttpServletRequest request, Model model){
        HttpSession sessionS=request.getSession();
        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        String string=String.valueOf(sessionS.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        Object name=sessionS.getAttribute("username");
        User user=loginservice.login(md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        return "blog";
    }
    @RequestMapping("upLoad")
    public String upLoad(HttpServletRequest request, Model model){
        HttpSession sessionS=request.getSession();
        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        String string=String.valueOf(sessionS.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        Object name=sessionS.getAttribute("username");
        User user=loginservice.login(md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        return "upLoad";
    }
    @RequestMapping("forum")
    public String forum(HttpServletRequest request, Model model){
        HttpSession sessionS=request.getSession();
        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        String string=String.valueOf(sessionS.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        Object name=sessionS.getAttribute("username");
        User user=loginservice.login(md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        return "forum";
    }
    @RequestMapping("student")
    public String student(HttpServletRequest request, Model model){
        HttpSession sessionS=request.getSession();
        int no_img=String.valueOf(sessionS.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        String string=String.valueOf(sessionS.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        Object name=sessionS.getAttribute("username");
        User user=loginservice.login(md5.getMD5(String.valueOf(sessionS.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user.getId());
        model.addAttribute("img_name",img_name);
        return "student";
    }

    @RequestMapping("leftModel")
    public String leftModel(Model model, HttpServletRequest request){
        Object name;
        HttpSession session=request.getSession();
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        model.addAttribute("no_img",no_img);
        String string=String.valueOf(session.getAttribute("username"));
        name=session.getAttribute("username");
        int fans_count=loginservice.selectFansCount(md5.getMD5(String.valueOf(name)));

        int follow__count=loginservice.selectFollowCount(md5.getMD5(String.valueOf(name)));

        List<User> list=loginservice.SelectByPhone(md5.getMD5(String.valueOf(name)));
        User user1=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        String img_name=loginservice.selectImageName(user1.getId());
        model.addAttribute("img_name",img_name);
        if (list.size()>0){
            User user=list.get(0);
            model.addAttribute("username",md5.getMD5(String.valueOf(name)));
            model.addAttribute("truename",user.getTruename());
            model.addAttribute("work",user.getWork());
            model.addAttribute("name",user.getNickname());
            model.addAttribute("sex",user.getSex());
            model.addAttribute("birthday",user.getBirthday());
            model.addAttribute("place",user.getPlace());
            model.addAttribute("job",user.getJob());
            model.addAttribute("remark",user.getRemark());
            model.addAttribute("fans_count",fans_count);
            model.addAttribute("follow__count",follow__count);
        }
        return "leftModel";
    }

    @RequestMapping("changMessage")
    public String changeMessage(HttpServletRequest request, Model modell){
        Object name;
        HttpSession session=request.getSession();
        int no_img=String.valueOf(session.getAttribute("username")).length()<=4?0:1;
        modell.addAttribute("no_img",no_img);
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        name=session.getAttribute("username");
        List<User> li=loginservice.SelectByPhone(md5.getMD5(String.valueOf(name)));
        if (li.size()>0){
            User user=li.get(0);
            modell.addAttribute("nickname",user.getNickname());
            modell.addAttribute("sex",user.getSex());
            modell.addAttribute("place",user.getPlace());
            modell.addAttribute("work",user.getWork());
            modell.addAttribute("truename",user.getTruename());
            modell.addAttribute("birthday",user.getBirthday());
            modell.addAttribute("job",user.getJob());
            modell.addAttribute("remark",user.getRemark());
            modell.addAttribute("name",name);

        }
        return "popups/changMessage";
    }
    @RequestMapping(value = "updateMessage",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object updateMessage(@RequestParam("nickname") String nickname, @RequestParam("job") String job,
                                @RequestParam("sex") String sex, @RequestParam("remark") String remark, @RequestParam("truename") String truename,
                                @RequestParam("birthday") String birthday, @RequestParam("place") String place,
                                @RequestParam("work") String work, HttpServletRequest request){
        Map<String,Object> map=new HashMap<>();
        HttpSession session=request.getSession();

        String string=String.valueOf(session.getAttribute("username"));
        int len=string.length();
        if (string.length()<=4){
            return "popups/login";
        }
        String sname=md5.getMD5(String.valueOf(session.getAttribute("username")));
        int isUpdate_success=loginservice.updateMessage(nickname,sname,job,remark,truename,birthday,place,sex,work);
        if (isUpdate_success>0){
            map.put("success",true);
        }
        else{
            map.put("success",false);
        }
        return map;
    }
    @RequestMapping(value = "upLoadImage",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object upLoadImage(@RequestParam("file_path") String file_path, HttpServletRequest request, HttpSession session    ){
        String string=String.valueOf(session.getAttribute("username"));
        if (string.length()<=4){
            return "popups/login";
        }
        String[] image_names;
        boolean insert;
        String new_image_name;
        String old_image_name;
        int is_insert;
        User user1=loginservice.login(md5.getMD5(String.valueOf(session.getAttribute("username"))));
        old_image_name=loginservice.selectImageName(user1.getId());
        image_names=file_path.split("\\\\");//将获取的图片地址以\\进行分割
        new_image_name=image_names[image_names.length-1];//获取图片的名称
        String total_path=pic_path_base+File.separator+new_image_name;
        try {
            File file_IMG=new File(pic_path_base+File.separator+old_image_name);
            if (file_IMG.exists()){
                file_IMG.delete();
            }
            File file=new File(total_path);
            if (!file.exists()){
                file.getParentFile().mkdir();
                file.createNewFile();
            }
            fileInputStream=new FileInputStream(new File(file_path));//创建输入流
            fileOutputStream=new FileOutputStream(new File(total_path));//创建输出流
            byte[] bytes=new byte[1024];
            int len=0;
            while ((len=fileInputStream.read(bytes))!=-1){
                fileOutputStream.write(bytes,0,len);//将图片以字节的形式读取
            }
            fileOutputStream.flush();//刷新缓冲区
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            try {
                fileInputStream.close();
                fileOutputStream.close();//关闭流
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
        Map<String,Object> map=new HashMap<>();
        Object name=session.getAttribute("username");
        int is_has_user=loginservice.selectUserByName(md5.getMD5(String.valueOf(name)));
        if (is_has_user==0){
            User user=loginservice.login(md5.getMD5(String.valueOf(name)));
            is_insert=loginservice.insertImage(user.getId(),new_image_name);
        }
        else{
            is_insert=loginservice.insertImageByName(md5.getMD5(String.valueOf(name)),new_image_name);
        }
        insert=is_insert>0?true:false;
        map.put("success",insert);
        return map;
    }

    @RequestMapping("account")
    public String account(HttpSession session, Model model){
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
        return "account";
    }
}
