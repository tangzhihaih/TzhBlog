package main.java.com.sort;

/**
 * @author tangzhihai
 * @date 4/1/2019
 * 选择排序是先把第一个当做最小的数，然后记录它的index，然后后面的数与之相比较
 * 如果比那个记录的数小，就把它的index赋值给前面的index，如果大于就不交换，
 * 比较到最后的时候结束循环将那个最小的数赋值给第i+1个数。
 * 这样一共执行n-1次就可以排序完成。
 *
 */
public class SelectSort {
    public static void main(String[] args) {
        int[] ins = {2, 3, 5, 1, 23, 6, 78, 34, 23, 4, 5, 78, 34, 65, 32, 65, 76, 32, 76, 1, 9};
        int[] ins2 = sort(ins);
        for (int in : ins2) {
            System.out.println(in);
        }
    }
    public static int[] sort(int arr[]){
        for (int i = 0; i <arr.length ; i++) {
            int min_index=i;
            for (int j = i; j < arr.length-1; j++) {
                if (arr[j+1]<arr[min_index]){
                    min_index=j+1;
                }
            }
            if (min_index>i){
                int temp=arr[min_index];
                arr[min_index]=arr[i];
                arr[i]=temp;
            }
        }
        return arr;
    }
}
