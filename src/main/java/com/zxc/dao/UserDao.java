package com.zxc.dao;

import com.zxc.model.Student;
import com.zxc.model.Teacher;

import java.util.List;

public interface UserDao {
    //通过id查询学生
    public Student selectStuById(int id);
    //通过id查询学生
    public Teacher selectTeaById(int id);
    public void updateStuPass(Student student);
    public void updateTeaPass(Teacher teacher);
    public List<Teacher> queryAllTeacher();

    public void addStudent(Student student);

    public void addTeacher(Teacher teacher);

    public List<Student> queryAllStudent();
    public void deleteStudentById(String stuId);

    public void deleteTeacherById(String teaId);


    public void deleteAllCourseByChooseId(int chooseId);
    public List<Integer> querryAllChooseIdByStuId(String stuId);

    public List<Integer> selectClassIdByTeaId(String teaId);
    public void deleteAllCourseByTeaId(String teaId);
    public void deleteCourseByClassId(int classId);
}
