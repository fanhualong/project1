package com.daishi.ssm.pojo;

import java.util.Date;

public class Class_recordModel {
    private Integer id;

    private String rtime;

    private String begintime;

    private String endtime;

    private String classname;

    private String roomname;

    private Integer sectionnumber;

    private Integer onduty;

    private String tname;

    private Integer teacherid;

    private String remark;

    private Date createtime;

    private String timeweek;

    private Integer year;

    private Integer cmonth;

    private Integer day;

    private Integer rtype;

    private Integer enable;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRtime() {
        return rtime;
    }

    public void setRtime(String rtime) {
        this.rtime = rtime == null ? null : rtime.trim();
    }

    public String getBegintime() {
        return begintime;
    }

    public void setBegintime(String begintime) {
        this.begintime = begintime == null ? null : begintime.trim();
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime == null ? null : endtime.trim();
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname == null ? null : roomname.trim();
    }

    public Integer getSectionnumber() {
        return sectionnumber;
    }

    public void setSectionnumber(Integer sectionnumber) {
        this.sectionnumber = sectionnumber;
    }

    public Integer getOnduty() {
        return onduty;
    }

    public void setOnduty(Integer onduty) {
        this.onduty = onduty;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public Integer getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Integer teacherid) {
        this.teacherid = teacherid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getTimeweek() {
        return timeweek;
    }

    public void setTimeweek(String timeweek) {
        this.timeweek = timeweek == null ? null : timeweek.trim();
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getCmonth() {
        return cmonth;
    }

    public void setCmonth(Integer cmonth) {
        this.cmonth = cmonth;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public Integer getRtype() {
        return rtype;
    }

    public void setRtype(Integer rtype) {
        this.rtype = rtype;
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    @Override
    public String toString() {
        return "Class_recordModel [id=" + id + ", rtime=" + rtime
                + ", begintime=" + begintime + ", endtime=" + endtime
                + ", classname=" + classname + ", roomname=" + roomname
                + ", sectionnumber=" + sectionnumber + ", onduty=" + onduty
                + ", tname=" + tname + ", teacherid=" + teacherid + ", remark="
                + remark + ", createtime=" + createtime + ", timeweek="
                + timeweek + ", year=" + year + ", cmonth=" + cmonth + ", day="
                + day + ", rtype=" + rtype + ", enable=" + enable + "]";
    }


}