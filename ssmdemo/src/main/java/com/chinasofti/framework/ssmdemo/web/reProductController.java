package com.chinasofti.framework.ssmdemo.web;
import com.chinasofti.framework.ssmdemo.model.Booka;
import com.chinasofti.framework.ssmdemo.model.Message;
import com.chinasofti.framework.ssmdemo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
/**
 * Created by Administrator on 2018/7/10/010.
 */
@Controller
@RequestMapping("readmin")
public class reProductController {
    @Autowired
    private ProductService productService;
    @RequestMapping("toRemoveProduct")
    public String productList(HttpServletRequest httpServletRequest, Model model) {
        String p = httpServletRequest.getParameter("page");
        int page;
        try {
            //当前页数
            page=Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page=1;
        }
        List<Booka> list;
        list=productService.findUpProductList();
        int re_id=1;
        int k=productService.fingTotalCount(re_id);
        int totalUsers = k;
        int usersPerPage = 5;
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        int beginIndex = (page - 1) * usersPerPage;
        int endIndex=beginIndex+usersPerPage;
        if (endIndex>totalUsers)
            endIndex=totalUsers;
        model.addAttribute("totalUsers",totalUsers);
        model.addAttribute("usersPerPage", usersPerPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("beginIndex", beginIndex);
        model.addAttribute("endIndex", endIndex);
        model.addAttribute("page", page);
        model.addAttribute("users", list);
        return "toRemoveProduct";
    }
    @RequestMapping("updateRemoveProduct")
    public String updateRemoveProduct(@RequestParam("id") int id,HttpServletRequest seq,Model model){
        reProductController controller=new reProductController();
        System.out.println("=============="+id);
        try {
              productService.updateRemoveOpreate(id);
              controller.productList(seq,model);
           return "toRemoveProduct";
        }catch (Exception e){
            e.printStackTrace();

        }
        return "toRemoveProduct";
    }
    @RequestMapping("toPublishMessages")
    public String toPublishMessages(HttpServletRequest httpServletRequest){
        String textMessage=httpServletRequest.getParameter("textname");
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowDate = sdf.format(date);


        if (textMessage!=null){
            int k=productService.PublishMessage(textMessage,nowDate);
                if (k>0){
                    return "page";
                }
        }
        return  null;
    }

    @RequestMapping("updateAddProduct")
    public String updateAddProduct(@RequestParam("id") int id,HttpServletRequest seq,Model model){
        ProductController productController=new ProductController();

        try {
            productService.updateAddOpreation(id);
            productController.productList(seq,model);

        }catch (Exception e){
            e.printStackTrace();
        }

        return "toAddProduct";
    }
}
