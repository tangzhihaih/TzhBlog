package main.java;

import java.util.TreeSet;

/**
 * @author tangzhihai
 * @date 2019/3/16
 */

public class Demo4 {
    public static void main(String[] args) {
        TreeSet ts = new TreeSet();
        ts.add(new Person("aa", 20, "男"));
        ts.add(new Person("bb", 18, "女"));
        ts.add(new Person("cc", 17, "男"));
        ts.add(new Person("dd", 17, "女"));
        ts.add(new Person("dd", 15, "女"));
        ts.add(new Person("dd", 15, "女"));


        System.out.println(ts);
        System.out.println(ts.size()); // 5

    }
}
