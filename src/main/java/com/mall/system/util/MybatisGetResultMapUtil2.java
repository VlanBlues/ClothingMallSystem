package com.mall.system.util;


import com.mall.system.entity.MallCart;
import com.mall.system.entity.MallUser;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class MybatisGetResultMapUtil2 {
    // 获取bean的属性 根据属性评价 resultMap
    // 并将驼峰修改为'_'
    public static String getResultMap(Class<?> cls) throws Exception {
        String str = "";
        String column = "<sql id=\"" + cls.getSimpleName() + "Column\">\r\n\tselect ";
        String prefix = cls.getSimpleName().toLowerCase().substring(4, 8) + "_";
        String reTableName = cls.getSimpleName().toLowerCase().substring(4, 8);
        // 头部 <resultMap id="BaseResultMap" type="com.huajie.entity.sys.SysMenuinfo">
        str = "<resultMap id=\"" + cls.getSimpleName() + "ResultMap\" type=\"" + cls.getName() + "\"> \r\n";
        //str = str + "\t<id column= \"\""   +  " property= \"\"" +  " />" + " \r\n";
        // 每一行字符串
        String linestr;
        Field[] declaredFields = cls.getDeclaredFields();
        int flag = 0;
        for (Field field : declaredFields) {
            if (field.getName().equals("serialVersionUID")) {
                continue;
            }
            column += "\r\n\t\t" + reTableName + "." + getUpCaseReplace(field.getName()) + " as " + prefix
                    + getUpCaseReplace(field.getName()) + ",";
            if(flag == 0){
                flag = 1;
                str += "\t<id column=\"" + prefix + getUpCaseReplace(field.getName()) + "\" property=\"" + field.getName()
                        + "\" />\r\n";
                continue;
            }
            str += "\t<result column=\"" + prefix + getUpCaseReplace(field.getName()) + "\" property=\"" + field.getName()
                    + "\" />\r\n";
        }
        str += "</resultMap>\n";
        column = column.substring(0, column.length() - 1);
        column += "\n\tfrom " + cls.getSimpleName().toLowerCase() +" "+reTableName+ "\n</sql>\n";
        return str + column;
    }

    public static String getAllField(Class<?> cls) throws Exception {
        String str = "";
//        // 头部 <resultMap id="BaseResultMap" type="com.huajie.entity.sys.SysMenuinfo">
//        str = "<resultMap id=" + cls.getSimpleName() + "ResultMap type=" + cls.getName() + "> \r\n";
//        str = str + "<id column= \"\""   +  " property= \"\"" +  " />" + " \r\n";
        // 每一行字符串
        String linestr = "";
        Field[] declaredFields = cls.getDeclaredFields();
        int i = 0;
        for (Field field : declaredFields) {
            linestr = getUpCaseReplace(field.getName()) + ", ";
            if (i % 4 == 0 && i != 0) {
                linestr += "\r\n";
            }
            str += linestr;
            i++;
        }
        return str.substring(0, str.length() - 2);
    }

    /**
     * 将字符串中的驼峰写法替换成'_'
     *
     * @param str
     * @return
     */
    private static String getUpCaseReplace(String str) {
        List<String> listChar = getUpCaseList(str);
        //先将字原属性加上"_"和原属性的首字母大写
        for (int i = 0; i < listChar.size(); i++) {
            str = str.replace(listChar.get(i), "_" + listChar.get(i).toUpperCase());
        }
        //将字段全部装换为大写
        //String result = getAllUpCaseList(str);
        return str.toLowerCase();
    }

    private static String getAllUpCaseList(String str) {
        // 转为char数组
        char[] ch = str.toCharArray();
        // 得到大写字母
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < ch.length; i++) {
            stringBuffer.append(String.valueOf(ch[i]).toUpperCase());
        }
        return stringBuffer.toString();
    }

    /**
     * @param str
     * @Description: 输出字符串中的大写字母
     */
    private static List<String> getUpCaseList(String str) {
        List<String> listChar = new ArrayList<String>();
        // 转为char数组
        char[] ch = str.toCharArray();
        // 得到大写字母
        for (int i = 0; i < ch.length; i++) {
            if (ch[i] >= 'A' && ch[i] <= 'Z') {
                listChar.add(String.valueOf(ch[i]));
            }
        }
        return listChar;
    }

    public static void main(String[] args) throws Exception {
        //TODO 需要生成的属性
        //BookInfo a = new BookInfo();
        //Notice a = new Notice();
        /*ReaderNotice a = new ReaderNotice();
        System.out.println(getResultMap(a.getClass()));
        //所有属性
        System.out.println("------------------------------------------------------------------------");
        System.out.println(getAllField(a.getClass()));*/
        MallCart a = new MallCart();
        System.out.println(getResultMap(a.getClass()));
    }

}