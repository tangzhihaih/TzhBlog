package main.java;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * @author tangzhihai
 * @date 3/18/2019
 */
public class Array {
    public void test(int m){
        System.out.println("+");
    }
    private double test(double m){
        double k=m;
        return k;
    }
    public static void main(String[] args) {
        int arr[]={1,4,5};
        int aar_length=arr.length;
        System.out.println("+++++++"+aar_length);

        int n=Integer.valueOf(new Scanner(System.in).nextLine());
        int m=n&(n-1);
        System.out.println("_________"+m);
    }
}
