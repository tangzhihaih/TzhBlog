package com.chinasofti.framework.ssmdemo.service.impl;

import com.chinasofti.framework.ssmdemo.dao.ProductDAO;
import com.chinasofti.framework.ssmdemo.model.Book;
import com.chinasofti.framework.ssmdemo.model.Booka;
import com.chinasofti.framework.ssmdemo.model.Message;
import com.chinasofti.framework.ssmdemo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/7/9/009.
 */
@Service("productService")
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductDAO productDAO;

    @Override
    public int add(Book book){
        return productDAO.insert(book);
    }

    @Override
    public List<Booka> findProductList(){
        return productDAO.findProductList();

    }
    @Override
    public List<Booka> findUpProductList() {
        return productDAO.findUpProductList();
    }

    @Override
    public int updateRemove(int bool_id)throws  Exception{
        return productDAO.updateRemove(bool_id);
    }

    @Override
    public int SortAddProduct(String category)throws Exception{
        return productDAO.SortAdProduct(category);
    }

    @Override
    public int updateRemoveOpreate(int id){
        return  productDAO.updateRemoveOpreatio(id);
    }
    @Override
    public int updateAddOpreation(int add_id){
        return productDAO.updateAddOpreatio(add_id);
    }

    @Override
    public  int PublishMessage(String message,String nowDate){
        return productDAO.PublishM(message,nowDate);
    }
    @Override
    public int fingTotalCount(int id){
        return productDAO.fingTotalCount(id);
    }
}
