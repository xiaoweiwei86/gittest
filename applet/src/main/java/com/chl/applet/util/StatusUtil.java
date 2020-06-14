package com.chl.applet.util;

import com.chl.applet.entity.Status;

import java.util.ArrayList;
import java.util.List;

public class StatusUtil {
    private static String[] statusString = {"新建", "驳回", "进行中_移交", "进行中_接受", "完成"};
    private static List<Status> statusList;

    static {
        statusList = new ArrayList<Status>();
        for (int i = 0; i < statusString.length; i++) {
            Status status = new Status();
            status.setStatusNo(i);
            status.setStatus(statusString[i]);
            statusList.add(status);
        }
    }

    public static List<Status> getStatusList() {
        return statusList;
    }

    public static String getStatus(Integer statusNo) {
        return statusString[statusNo];
    }

    public static Integer getNo(String status) {
        Integer i;
        for (i = 0; i < statusString.length; i++) {
            if (status.equals(statusString[i])) {
                break;
            }
        }
        return i;
    }
}
