package com.chinasofti.framework.ssmdemo.web;

import com.chinasofti.framework.ssmdemo.model.Book;
import com.chinasofti.framework.ssmdemo.model.Booka;
import com.chinasofti.framework.ssmdemo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 *功能描述
 * @author tangzhihai
 * @date 2019/3/7
 * @param
 * @return
 */

@Controller
@RequestMapping("admin")
public class ProductController {
    public int page=1;
    @Autowired
    private ProductService productService;

    @RequestMapping("addSort")
    public String addSortBook(HttpServletRequest hsr,HttpServletRequest hr) {
        String name = hsr.getParameter("name");
        String subTitle = hsr.getParameter("subTitle");
        String ori = hr.getParameter("originalPrice");
        Double originalPrice = Double.parseDouble(ori);
        String stoc = hr.getParameter("stock");
        Integer stock = Integer.parseInt(stoc);
        Book book = new Book(name, subTitle, originalPrice, stock);
        int flag=productService.add(book);
        System.out.print("fkaw");
        if (flag<=0) {
            System.out.print("00000");
            return "login";
        }
        else
            return "page";
    }
    @RequestMapping("toAddProduct")
    public String productList(HttpServletRequest req, Model model){
        String p = req.getParameter("page");
        int page;
        try {
            //当前页数
            page=Integer.valueOf(p);
        } catch (NumberFormatException e) {
                page=1;
        }
        List<Booka> list;
        list=productService.findProductList();
        int id=0;
        int k=productService.fingTotalCount(id);
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
        return "toAddProduct";
    }


    @RequestMapping("AddProductSort")
    public String AddProductSort(HttpServletRequest httpServletRequest) {
        String sortname = httpServletRequest.getParameter("sortname");
        System.out.println("=======================================" + sortname + "===========================");
        int bool;
        try {
            HttpSession session = httpServletRequest.getSession();
            String name = String.valueOf(session.getAttribute("username"));
            System.out.println("+++++++++++++++++" + name);
            if (sortname != null) {
                bool = productService.SortAddProduct(sortname);
                if (bool < 0) {
                    return "page";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "addSortSuccess";
    }
    @RequestMapping("AddSort")
    public String AddSort(HttpServletRequest request){
        HttpSession session=request.getSession();
        String name=String.valueOf(session.getAttribute("username"));
        System.out.println("+++++++++++++++++"+name);
        return "AddSort";
    }
    @RequestMapping("SortRelation")
    public String SortRelation(){
        return "SortRelation";
    }
    @RequestMapping("toOpreateLog")
    public String OpreateLog(){
        return "toOpreateLog";
    }
    @RequestMapping("toPublish")
    public String tPublish(){
        return "toPublishMessage";
    }

}
