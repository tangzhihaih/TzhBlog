package main.java;

import javax.security.sasl.SaslServer;
import javax.swing.text.html.HTMLDocument;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/**
 * @author tangzhihai
 * @date 2019/3/16
 */
public class ListDemo {
    public static void main(String[] args) {
        List<String> list=new ArrayList<>();
        list.add("a");
        list.add("a");
        list.add("b");
        list.add("c");
        list.add("a");
        list.add("a");
        list.add("b");
        list.add("c");
        list.add("1");
        list.add("2");
        list.add("3");
        list.add("4");
        list.add("5");

        for(String s:list){
            System.out.println("++++++++++++"+s);
        }

        System.out.println("_____________"+list.contains("a"));

        System.out.println("__________"+list.indexOf("c"));


        System.out.println("++++++++++++++"+list.iterator());


        System.out.println("+++++++++++++++="+list.toArray());

        for(Object O:list.toArray()){
            System.out.println("111111111111111"+O);
        }

        List<String> list1=new ArrayList<>();
        for(String s:list){
            if(Collections.frequency(list,s)<1){
                list1.add(s);
            }
        }
        for(String s:list1){
            System.out.println("+++++++++++++++"+s);
        }
        List<Integer> list2=new ArrayList<>();
        list2.add(1);
        list2.add(2);
        list2.add(3);
        list2.add(4);
        list2.add(5);
        list2.add(6);
        list2.add(7);
        list2.add(8);

         Iterator integer=list2.iterator();
         for(int a:list2){
             System.out.println("++++++++++"+a);
         }
    }
}
