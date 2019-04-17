package main.java;

import java.util.Arrays;

/**
 * @author tangzhihai
 * @date 2019/4/10
 */
/*public class MyStack<E> {
    private Object[] stack;
    private int size;//数组中存储元素的个数
    public MyStack(){
        stack = new Object[10];//数组初始元素为10个
}
    //判断数组中是否为空
    public boolean isEmpty(){
        return size == 0;
    }
    //查看栈顶的元素
    public E peek(){
        if(isEmpty()){
            return null;
        }
        return(E)stack[size-1];
    }
    //取出栈顶的元素
    public E pop(){
        E e = peek();
        stack[size-1] = null;
        size --;
        return e;
    }
    //新增元素
    public E push(E item){
        ensureCapacity(size+1);
        stack[size++] = item;
        return item;
    }
    //检查数组的容量是否已满
    public void ensureCapacity(int size){
        int len = stack.length;
        if(size > len){
            int newLen = 10;//每次数组容量扩展10个
            stack = Arrays.copyOf(stack, 10);
        }
    }
    //测试main方法
    public static void main(String[] args) {
        MyStack<Integer> s = new MyStack<Integer>();
        s.push(3);
        s.push(2);
        System.out.println("栈中总个数:"+s.size);
        System.out.println("栈顶的元素为:"+s.peek());
        System.out.println("取出栈顶的元素:"+s.pop());
        System.out.println("栈中总个数:"+s.size);
想·
    }

}*/
public class MyStack<T> {
    private Object[] stack;
    private int size;
    public MyStack(){
        stack=new Object[10];
    }

    public boolean isEmpty(){
        return size==0;
    }

    public T over(){
        if (isEmpty()){
            return null;
        }
        return (T)stack[size-1];
    }

    public T pop(){
        T over=over();
        if (over==null){
            System.out.println("当前没有元素，不能进行出栈");
            return (T)"当前没有元素，不能进行出栈";
        }
        System.out.println("出栈元素为："+stack[size-1]);
        stack[size-1]=null;
        size--;
        return over;
    }

    public T push(T value){
        boolean can=check();
        if (can){
            stack[size++]=value;
            System.out.println("当前入栈的值为"+value);
        }
        else {
            System.out.println("栈已满不能入栈");
            return null;
        }
        return value;
    }

    public boolean check(){
        if (size>9){
            return false;
        }
        return true;
    }
    public static void main(String[] args) {
        MyStack<Integer> myStack=new MyStack<Integer>();
        myStack.pop();
        myStack.push(10);
        myStack.push(20);
        myStack.push(10);
        myStack.push(20);
        myStack.push(10);
        myStack.push(20);
        myStack.push(10);
        myStack.push(20);
        myStack.push(10);
        myStack.push(20);
        myStack.push(10);
        myStack.push(20);
        myStack.pop();
        System.out.println("栈顶的元素为："+myStack.over());
    }
}
/*public class MyStack<E> {
private Object[] stack; 
private int size;//数组中存储元素的个数
public MyStack(){
stack = new Object[10];//数组初始元素为10个
} 
//判断数组中是否为空
public boolean isEmpty(){
return size == 0;
}
//查看栈顶的元素
public E peek(){
if(isEmpty()){
return null;
}
return(E)stack[size-1];
}
//取出栈顶的元素
public E pop(){
E e = peek();
stack[size-1] = null;
size --;
return e;
}
//新增元素
public E push(E item){
ensureCapacity(size+1);
stack[size++] = item;
return item;
}
//检查数组的容量是否已满
public void ensureCapacity(int size){
int len = stack.length;
if(size > len){
int newLen = 10;//每次数组容量扩展10个
stack = Arrays.copyOf(stack, 10);
}
}
//测试main方法
public static void main(String[] args) {
MyStack<Integer> s = new MyStack<Integer>();
s.push(3);
s.push(2);
System.out.println("栈中总个数:"+s.size);
System.out.println("栈顶的元素为:"+s.peek());
System.out.println("取出栈顶的元素:"+s.pop());
System.out.println("栈中总个数:"+s.size);

}

}
*/