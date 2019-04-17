package com.chinasofti.framework.ssmdemo.model;

import java.util.Date;
import java.util.zip.DataFormatException;

/**
 * Created by Administrator on 2018/7/9/009.
 */
public class Booka {
    private int id;
    private String name;
    private String subTitle;
    private double originalPrice;
    private double promotePrice;
    private int stock;
    private int cid;
    private Date createDate;
    private int boo_id;


    public Booka(){}
    public Booka(String name,String subTitle,double originalPrice,int stock){
        super();
        this.name=name;
        this.subTitle=subTitle;
        this.originalPrice=originalPrice;
        this.stock=stock;
    }

    public int getBoo_id() {
        return boo_id;
    }

    public void setBoo_id(int boo_id) {
        this.boo_id = boo_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTite) {
        this.subTitle = subTitle;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public double getPromotePrice() {
        return promotePrice;
    }

    public void setPromotePrice(double promotePrice) {
        this.promotePrice = promotePrice;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    @Override
    public String toString(){
        return "Product [id="+id+",name="+name+",subTitle="+subTitle+",originalPrice="+originalPrice+",promotePrice="+promotePrice+"" +
                ",stock="+stock+",cid="+cid+",createDate="+createDate+",boo_id="+boo_id+"]";
    }
}
