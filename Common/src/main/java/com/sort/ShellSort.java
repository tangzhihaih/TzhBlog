package main.java.com.sort;
/**
 * @author tangzhihai
 * @date 4/1/2019
 * 我们在进行希尔排序的时候，我们采用的是插入排序的思想，将整个序列以一定的间隔分成不同
 * 的序列，然后排序，第一次是序列长度的1/2，第一遍排序完成之后第二遍长度是第一遍长度的1/2
 * 依次循环，直到长度等于零就退出，整个排序就完成了，最后长度等于1的时候就是直接插入排序
 *
 */
public class ShellSort {
    public static void main(String[] args) {
        int[] ins = {2, 3, 5, 1, 23, 6, 78, 34, 23, 4, 5, 78, 34, 65, 32, 65, 76, 32, 76, 1, 9};
        int[] ins2 = sort(ins);
        for (int in : ins2) {
            System.out.println(in);
        }
    }

    public static int[] sort(int arr[]){
        int n=arr.length;
        int pos=n/2;
        while (pos>0){
            for (int j = pos; j < n ; j++) {
                int i=j;
                while (i>=pos&&arr[i-pos]>arr[i]){
                    int temp=arr[i-pos];
                    arr[i-pos]=arr[i];
                    arr[i]=temp;
                    i-=pos;
                }
            }
            pos=pos/2;
        }
        return arr;
    }

    /*public static int[] sort(int[] ins) {

        int n = ins.length;
        int gap = n / 2;
        while (gap > 0) {
            for (int j = gap; j < n; j++) {
                int i = j;
                while (i >= gap && ins[i - gap] > ins[i]) {
                    int temp=ins[i-gap];
                    ins[i-gap]=ins[i];
                    ins[i]=temp;
                    i -= gap;
                }
            }
            gap = gap / 2;
        }
        return ins;
    }*/
}