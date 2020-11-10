package com.daishi.ssm.pojo;

/*
 * 此类为查询大致课时所需返回映射类(课时统计管理)
 * */
public class Class_record_resultMap {
    //教师id
    int tId;
    //教师名
    String tName;
    //总课时
    int allHour;
    //已完成课时
    int doneHour;
    //值班
    int onDuty;

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public int getAllHour() {
        return allHour;
    }

    public void setAllHour(int allHour) {
        this.allHour = allHour;
    }

    public int getDoneHour() {
        return doneHour;
    }

    public void setDoneHour(int doneHour) {
        this.doneHour = doneHour;
    }

    public int getOnDuty() {
        return onDuty;
    }

    public void setOnDuty(int onDuty) {
        this.onDuty = onDuty;
    }

}
