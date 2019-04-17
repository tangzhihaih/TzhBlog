package main.java;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @author tangzhihai
 * @date 3/29/2019
 */
public class Student  {
    private int id;
    private int age;
    private String name;

    public Student(int id, int age, String name) {
        this.id = id;
        this.age = age;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", age=" + age +
                ", name='" + name + '\'' +
                '}';
    }
    public static void main(String args[]){
        List<Student> list = new ArrayList<>();
        list.add(new Student(1,25,"关羽"));
        list.add(new Student(2,21,"张飞"));
        list.add(new Student(3,18,"刘备"));
        list.add(new Student(4,32,"袁绍"));
        list.add(new Student(5,36,"赵云"));
        list.add(new Student(6,16,"曹操"));
        List<Integer> integerList=new ArrayList<>();
        integerList.add(4);
        integerList.add(1);
        integerList.add(13);
        integerList.add(41);
        integerList.add(14);
        integerList.add(15);
        integerList.add(51);
        integerList.add(11);
        integerList.add(17);


        System.out.println("排序前:");
        for (Student student : list) {
            System.out.println(student.toString());
        }
        //使用默认排序
        Collections.sort(list, new Comparator<Student>() {
            @Override
            public int compare(Student o1, Student o2) {
                return o1.age-o2.age;
            }
        });
        System.out.println("默认排序后:");
        for (Student student : list) {
            System.out.println(student.toString());
        }
        /*Collections.sort(list, new Comparator<Student>() {
            @Override
            public int compare(Student o1, Student o2) {
                return o1.id-o2.id;
            }
        });*/
        list.sort(new Comparator<Student>() {
            @Override
            public int compare(Student o1, Student o2) {
                return o1.name.hashCode()-o2.name.hashCode();
            }
        });
        System.out.println("默认排序后:");
        for (Student student : list) {
            System.out.println(student.toString());
        }

        System.out.println("默认排序后:");
        for (Integer student : integerList) {
            System.out.println(student);
        }

        Collections.sort(integerList);
        System.out.println("默认排序后:");
        for (Integer student : integerList) {
            System.out.println(student);
        }
    }

}

