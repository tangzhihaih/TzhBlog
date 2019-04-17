package main.java;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;

/**
 * @author tangzhihai
 * @date 2019/3/15
 */
public class Switch {
    public static void main(String[] args) throws Exception {
        BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(System.in));

        int score[]={6,4,2,4,3,8,1,9};

        java.util.Arrays.parallelSort(score,0,7);
        for(int a:score)
        System.out.println("++++++++++++"+a);
        /**/

        System.out.println("___________"+Arrays.toString(score));

        for (int i = 0; i <10 ; i++) {
            String s=bufferedReader.readLine();
            int k=Integer.valueOf(s);
            switch (k){
                case 0:
                    case 1:
                        case 3:
                    System.out.println("++++++++++++++++++");
                    break;
                case 20:
                    System.out.println("__________________");
                    break;
                default:
                    System.out.println("11111111111111111");
            }
        }

    }
}
