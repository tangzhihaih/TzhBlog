package com.chinasofti.framework.ssmdemo.dao;

import com.chinasofti.framework.ssmdemo.model.Book;
import com.chinasofti.framework.ssmdemo.model.Booka;
import com.chinasofti.framework.ssmdemo.model.Message;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/7/9/009.
 */
public interface ProductDAO {

    int insert(Book book);

    List<Booka> findProductList();
    List<Booka> findUpProductList();
    int updateRemove(int boo_id);
    int SortAdProduct(String category);
    int updateRemoveOpreatio(int id);
    int updateAddOpreatio(int add_id);
    int PublishM(String message,String nowDate);
    int fingTotalCount(int id);
}
