package com.zxc.service;

import com.zxc.model.Student;
import com.zxc.model.Teacher;

import java.util.List;

public interface UserService {
    public int checkAccount(int id,String pass);
    public String getStuNameById(int id);
    public String getTeaNameById(int id);
    public Student getStuInfoById(int id);
    public Teacher getTeaInfoById(int id);
    public void changeStuPass(Student student);
    public void changeTeaPass(Teacher teacher);
    public List<Teacher> queryAllTeacher();

    public List<Student> queryAllStudent();//查询全部学生

    public void addStudent(Student student);

    public void addTeacher(Teacher teacher);

    public void deleteStudentById(String Id);

    public void deleteTeacherById(String teaId);


}
