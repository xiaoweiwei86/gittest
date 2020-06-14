package com.chl.applet.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringToNumberUtil {

    public static Integer  getNumber(String string){
        String regEx="[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(string);
        return Integer.parseInt(m.replaceAll("").trim());
    }

}
