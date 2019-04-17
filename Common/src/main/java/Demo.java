package main.java;
/**
 * @author tangzhihai
 * @date 2019/3/15
 */
public class Demo extends Test {
    public void first(){
        System.out.println(":::::::::::::::::::");
    }



    public double  second(double a){
        System.out.println("::::::1111111111111111111111");
        System.out.println(a);
        return a;
    }

    public static void main(String[] args) {
        new Demo().first();
        Demo test=new Demo();
        test.first();
        test.second(1);
    }
}
