package main.java.com.sort;
import java.util.Arrays;
/**
 * @author tangzhihai
 * @date 4/1/2019
 * 这是快速排序
 * 先把第一个数当做是有序的，然后后面一个数插入到前面的有序的序列之中
 * 比较的时候，先把第二个数作为记号数
 * 然后再从当前次数减一开始比较，因为当前次数使我们的记号数，使我们要插入到序列之中的数
 * 比较的时候减减比较一直到大于等于0,序号为0的时候就是第一个数
 * 不小于的时候就不用比较了直接结束当前循环
 * 然后将跳出循环的那个位置上的数把我们的记号数辅助给它
 */
public class InsertSort {
    public static void main(String[] args) {
        int arr[]=new int[]{9,7,5,4,2,1};
        for (int i = 1; i < arr.length; i++) {
            int temp=arr[i];
            int j;
            for ( j = i-1;j>=0;j--) {
                if (arr[j]>temp){
                    arr[j+1]=arr[j];
                }else {
                    break;
                }
            }
            arr[j+1]=temp;
        }
        System.out.println( Arrays.toString(arr));
    }
}
