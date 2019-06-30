package com.zxc.service.impl;

import com.zxc.dao.CourseDao;
import com.zxc.dao.UserDao;
import com.zxc.model.Student;
import com.zxc.model.Teacher;
import com.zxc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private CourseDao courseDao;
    //判断用户权限
    @Override
    public int checkAccount(int id, String pass) {

        if(Integer.toString(id).charAt(4)=='1'){
            if(userDao.selectTeaById(id).getTeaPass().equals(pass))
                return 2;
            else
                return 0;
        }
        else{
            if(userDao.selectStuById(id).getStuPass().equals(pass))
                return 1;
            else
                return 0;
        }
    }

    @Override
    public String getStuNameById(int id) {
        return userDao.selectStuById(id).getStuName();
    }

    @Override
    public String getTeaNameById(int id) {
        return userDao.selectTeaById(id).getTeaName();
    }

    @Override
    public Student getStuInfoById(int id) {
        return userDao.selectStuById(id);
    }

    @Override
    public Teacher getTeaInfoById(int id) {
        return userDao.selectTeaById(id);
    }

    @Override
    public void changeStuPass(Student student) {
        userDao.updateStuPass(student);
    }

    @Override
    public void changeTeaPass(Teacher teacher) {
        userDao.updateTeaPass(teacher);
    }

    @Override
    public List<Teacher> queryAllTeacher() {
        return userDao.queryAllTeacher();
    }

    @Override
    public List<Student> queryAllStudent() {
        return userDao.queryAllStudent();
    }

    @Override
    public void addStudent(Student student) {
        student.setInsName(courseDao.selectNameByInsId(student.getInsId()));
        userDao.addStudent(student);
    }

    @Override
    public void addTeacher(Teacher teacher) {
        userDao.addTeacher(teacher);
    }

    @Override
    public void deleteStudentById(String Id) {
        System.err.println("进入删除学生");
        userDao.deleteStudentById(Id);
        List<Integer> ints = userDao.querryAllChooseIdByStuId(Id);
        System.out.println(ints.size());
        for (int i:ints){
            System.err.println("课程编号"+i);
            userDao.deleteAllCourseByChooseId(i);
        }

    }
    
    public static void main(String[] args){
        UserServiceImpl userService = new UserServiceImpl();
        userService.deleteStudentById("2018000015");
    }

    @Override
    public void deleteTeacherById(String teaId) {
        userDao.deleteTeacherById(teaId);
      /*  List<Integer> ints =userDao.selectClassIdByTeaId(teaId);
 */
        List<Integer> list = courseDao.queryCourseIdByTeaId(teaId);
        System.err.println("长度"+list.size());
        for (int li:list){
            System.err.println("长度li"+li);
            userDao.deleteCourseByClassId(li);
        }

    }
}
