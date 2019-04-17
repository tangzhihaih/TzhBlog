package main.java;

import java.util.HashMap;

/**
 * @author tangzhihai
 * @date 2019/3/16
 */
public class Map {
    public static void main(String[] args) {
        java.util.Map<String,String> map=new HashMap<>();
        map.put("1","a");
        map.put("2","q");
        map.put("3","w");
        map.put("4","e");
        map.put("5","r");
        map.put("6","t");
        map.put("7","y");
        map.put("8","i");
        map.put("9","l");
        for(String key:map.keySet()){
            System.out.println("________________"+key);
        }

    }
}
