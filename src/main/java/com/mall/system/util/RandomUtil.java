package com.mall.system.util;

import java.util.Random;

/**
 * Author: Vlan
 * Date: 2019/10/22 9:36
 */
public class RandomUtil {
    
    public static String getRandom(){
        Random rand = new Random();
        String num = "";
        for(int i=0;i<5;i++){
            num += rand.nextInt(10);
        }
        return num;
    }

    public static String getTenRandom(){
        Random rand = new Random();
        StringBuilder num = new StringBuilder();
        for(int i=0;i<10;i++){
            num.append(rand.nextInt(10));
        }
        return num.toString();
    }
}
