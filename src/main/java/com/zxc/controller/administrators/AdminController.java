package com.zxc.controller.administrators;

import com.zxc.model.Student;
import com.zxc.model.Teacher;
import com.zxc.service.PageService;
import com.zxc.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author lcl
 * @date 2019/6/27 9:31
 * @Description
 */
@Controller
@RequestMapping("administrators")
public class AdminController {

    @Resource
    private UserService userService;

    @Resource
    private PageService pageService;


    @RequestMapping("addStu")
    public String addStu(){
        return "administrators/addStu";
    }
    @RequestMapping("base")
    public String base(){
        return "administrators/base";
    }
    @RequestMapping("addTea")
    public String addTea(){
        return "administrators/addTea";
    }

    @RequestMapping("delStu")
    public String delStu(){
        return "administrators/delStu";
    }

    @RequestMapping("delTea")
    public String delTea(){
        return "administrators/delTea";
    }

    @RequestMapping(value = "addstudent", method = RequestMethod.POST )
    public String addStudent(@RequestParam("userid") int stuId, @RequestParam("username") String stuName, @RequestParam("userpass") String stuPass, @RequestParam("insid") int insId, Model model) {
        Student student = new Student(stuId,stuName,stuPass,insId);
        System.out.println(student);
        System.out.println("进入增加学生");

        if(userService.getStuInfoById(stuId)!=null){
            model.addAttribute("msg","该学生id已存在，请重新加入");
            return "administrators/main";
        }else{
            userService.addStudent(student);
            model.addAttribute("msg","增加学生成功");
            return "administrators/main";
        }
    }

    //查询所有学生信息
    @RequestMapping(value = "queryAllStudent")//查看我的选课
    public String queryAllStudent(@Param("page") int page, Model model, HttpServletRequest request) {
        model.addAttribute("student", userService.queryAllStudent());
        model.addAttribute("paging", pageService.subList(page, userService.queryAllStudent()));
        return "administrators/stuList";
    }

    //查询所有学生信息
    @RequestMapping(value = "queryAllTeacher")//查看我的选课
    public String queryAllTeacher(@Param("page") int page, Model model, HttpServletRequest request) {
        model.addAttribute("student", userService.queryAllTeacher());
        model.addAttribute("paging", pageService.subList(page, userService.queryAllTeacher()));
        return "administrators/teaList";
    }

    @RequestMapping("/courseList")//排课的页面
    public String courseList(@Param("page") int page, Model model, HttpServletRequest request) {

        return "student/courseList";
    }

    //删除学生
    @RequestMapping(value = "deleteStudent" )
    public String delStudent(@RequestParam("stuId") String stuId, Model model) {

        userService.deleteStudentById(stuId);
        model.addAttribute("msg","删除成功");
        return "administrators/main";
    }
//删除老师
    @RequestMapping(value = "deleteTeacher" )
    public String delTeacher(@RequestParam("teaId")String teaId , Model model) {

        userService.deleteTeacherById(teaId);
        model.addAttribute("msg","删除成功");
        return "administrators/main";
    }

    //增加老师
    @RequestMapping(value = "addteacher",method = RequestMethod.POST)
    public String addTeacher(@RequestParam("userid") int teaId, @RequestParam("username") String teaName, @RequestParam("userpass") String teaPass, Model model) {
        Teacher teacher = new Teacher(teaId,teaName,teaPass);

        if(userService.getTeaInfoById(teaId)!=null){
            model.addAttribute("msg","该老师id已存在，请重新加入");
            return "administrators/main";
        }else{
            userService.addTeacher(teacher);
            model.addAttribute("msg","添加老师成功");
            return "administrators/main";
        }
    }
    //管理员登录
    @RequestMapping(value = "adminLogin",method = RequestMethod.POST)
    public String addStudent(@RequestParam("username") String username, @RequestParam("userpass") String userpass, Model model) {
        if("admin".equals(username)&&"admin".equals(userpass)){
            return "administrators/main";
        }else{
            model.addAttribute("登录失败");
            return "admin";
        }
    }
}
