package com.chl.applet.util;

import com.chl.applet.entity.Team;

import java.util.ArrayList;

import java.util.List;


public class TeamUtil {
    private static List<Team> teamList;
    private static String[] teams={"乘用车开发部","商用车开发部","产品验证部","产品试制部","长春华隆","技术管理部","院长办公室","恒隆凯迩必","芜湖恒隆","武汉分院","上海研发中心"};

    static {
        teamList=new ArrayList<Team>();
        for(int i=0;i<teams.length;i++){
            Team team =new Team();
            team.setTeamId(i+1);
            team.setTeamName(teams[i]);
            teamList.add(team);
        }
    }

    public static List<Team> getTeamList() {
        return teamList;
    }

    public static String getTeamNameById(Integer id){
        return teams[id-1];
    }

    public static Integer getTeamIdByName(String name){
        int i=0;
        for(i=0;i<teams.length;i++){
            if(name.equals(teams[i])){
                break;
            }
        }
        return i+1;
    }
}
