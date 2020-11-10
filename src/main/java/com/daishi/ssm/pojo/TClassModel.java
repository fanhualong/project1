package com.daishi.ssm.pojo;

import java.util.Date;

public class TClassModel {
    private Integer id;

    private String tname;

    private Integer enable = 1;

    private Date createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        return "TClassModel [id=" + id + ", tname=" + tname + ", enable="
                + enable + ", createtime=" + createtime + "]";
    }


}