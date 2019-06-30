package com.zxc.model;

import org.springframework.stereotype.Component;

public class Student {
    private int stuId;
    private String stuPass;
    private String stuName;
    private int insId;
    private String InsName;
    private int tempScore;

    public Student() {
    }

    public Student(int stuId, String stuName,String stuPass, int insId) {
        this.stuId = stuId;
        this.stuPass = stuPass;
        this.stuName = stuName;
        this.insId = insId;
    }

    public void setStuId(int stuId) {
        this.stuId = stuId;
    }

    public void setStuPass(String stuPass) {
        this.stuPass = stuPass;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public void setInsName(String insName) {
        InsName = insName;
    }

    public void setInsId(int insId) {
        this.insId = insId;
    }

    public void setTempScore(int tempScore) {
        this.tempScore = tempScore;
    }

    public int getStuId() {
        return stuId;
    }

    public String getStuPass() {
        return stuPass;
    }

    public String getStuName() {
        return stuName;
    }

    public String getInsName() {
        return InsName;
    }

    public int getInsId() {
        return insId;
    }

    public int getTempScore() {
        return tempScore;
    }


    @Override
    public String toString() {
        return "学生信息："+this.getStuId()+","+this.getStuName()+","+this.getStuPass();
    }
}
