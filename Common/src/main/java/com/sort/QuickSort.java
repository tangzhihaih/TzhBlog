package main.java.com.sort;

/**
 * @author tangzhihai
 * @date 4/2/2019
 */
public class QuickSort {
    /*public static void quickSort(int[] arr,int low,int high){
        int i,j,temp,t;
        if(low>high){
            return;
        }
        i=low;
        j=high;
        temp = arr[low];//temp就是基准位
        while (i<j) {
            while (temp<=arr[j]&&i<j) {//先看右边，依次往左递减
                j--;
            }
            while (temp>=arr[i]&&i<j) {//再看左边，依次往右递增
                i++;
            }
            if (i<j) {//如果满足条件则交换
                t = arr[j];
                arr[j] = arr[i];
                arr[i] = t;
            }
        }
        arr[low] = arr[i];//最后将基准为与i和j相等位置的数字交换
        arr[i] = temp;
        quickSort(arr, low, j-1);//递归调用左半数组
        quickSort(arr, j+1, high);//递归调用右半数组
    }*/
    public static void main(String[] args){
        int[] arr = {10,7,2,4,7,62,3,4,2,1,8,9,19};
        quickSort(arr, 0, arr.length-1);
        for (int i = 0; i < arr.length; i++) {
            System.out.println(arr[i]);
        }

    }
    public static void  quickSort(int arr[],int low,int high){
        int temp,i,j,t;
        i=low;
        j=high;
        while (low >= high) {
            return;
        }
        temp=arr[low];
        while (i<j){
            while (temp<=arr[j]&&i<j){
                j--;
            }
            while (temp>=arr[i]&&i<j){
                i++;
            }
            if (i<j){
                t=arr[i];
                arr[i]=arr[j];
                arr[j]=t;
            }
        }
        arr[low]=arr[i];
        arr[i]=temp;
        quickSort(arr,low,j-1);
        quickSort(arr,j+1,high);

    }
}
