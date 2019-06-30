package com.zxc.model;

import org.springframework.stereotype.Component;

public class Teacher {
    private int teaId;
    private String teaName;
    private String teaPass;

    public Teacher(int teaId, String teaName, String teaPass) {
        this.teaId = teaId;
        this.teaName = teaName;
        this.teaPass = teaPass;
    }

    public Teacher() {
    }

    public void setTeaId(int teaId) {
        this.teaId = teaId;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
    }

    public void setTeaPass(String teaPass) {
        this.teaPass = teaPass;
    }

    public int getTeaId() {
        return teaId;
    }

    public String getTeaName() {
        return teaName;
    }

    public String getTeaPass() {
        return teaPass;
    }
}
