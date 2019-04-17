package com.chinasofti.framework.ssmdemo.service;
import com.chinasofti.framework.ssmdemo.model.Book;
import com.chinasofti.framework.ssmdemo.model.Booka;
import com.chinasofti.framework.ssmdemo.model.Category;
import com.chinasofti.framework.ssmdemo.model.Message;

import java.util.Date;
import java.util.List;


/**
 * Created by Administrator on 2018/7/9/009.
 */

public interface ProductService {
   List<Booka> findProductList();
   List<Booka> findUpProductList();
   int updateRemove(int bool_id) throws Exception;
   int add(Book book);
   int SortAddProduct(String name)throws Exception;
   int updateRemoveOpreate(int id);
   int updateAddOpreation(int add_id);
   int PublishMessage(String message,String noeDate);
   int fingTotalCount(int id);

}
