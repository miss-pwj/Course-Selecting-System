package com.zxc.controller.student;

import com.zxc.model.Course;
import com.zxc.model.Student;
import com.zxc.service.CourseService;
import com.zxc.service.PageService;
import com.zxc.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("student")
public class StudentController {
    @Resource
    private UserService userService;
    @Resource
    private PageService pageService;
    @Resource
    private CourseService courseService;

    @RequestMapping("/studentIndex")//进入学生首页
    public String studentIndex() {
        return "student/studentIndex";
    }

    @RequestMapping("/studentInfo")//进入学生个人资料
    public String studentInfo(@RequestParam("stuid") int id, Model model) {
        model.addAttribute("student", userService.getStuInfoById(id));
        return "student/studentInfo";
    }

    @RequestMapping("/editStuPass")//修改学生密码页面
    public String editTeaPass() {
        return "student/editStuPass";
    }

    @RequestMapping("/changeStuPass")//修改学生密码
    public String changPass(@RequestParam("prepass") String prepass, @RequestParam("nowpass") String nowpass, Model model, HttpServletRequest request) {
        int id = (int) request.getSession().getAttribute("stuid");
        if (userService.checkAccount(id, prepass) == 0) {
            model.addAttribute("msg", "原始密码输入错误!");
            return "student/editStuPass";
        } else {
            Student student = new Student();
            student.setStuId(id);
            student.setStuPass(nowpass);
            userService.changeStuPass(student);
            model.addAttribute("student", userService.getStuInfoById(id));//将修改后的信息传入前台
            return "student/studentInfo";
        }
    }

    @RequestMapping("/courseList")//排课的页面
    public String courseList(@Param("page") int page, Model model, HttpServletRequest request) {
        model.addAttribute("paging", pageService.subList(page, courseService.queryAllCourse((int) request.getSession().getAttribute("stuid"))));
        model.addAttribute("teaList", userService.queryAllTeacher());
        model.addAttribute("insList", courseService.queryAllIns());
        return "student/courseList";
    }

    @RequestMapping("/courseDetail")//进行选课操作
    public String courseDetail(@Param("classId") int classId, Model model, HttpServletRequest request) {
        if (courseService.checkStuIns(classId, (int) request.getSession().getAttribute("stuid"))) {
            model.addAttribute("course", courseService.queryCourse(classId));
            return "student/courseDetail";
        } else {
            model.addAttribute("msg", "请注意课程的学院限制");
            model.addAttribute("paging", pageService.subList(1, courseService.queryAllCourse((int) request.getSession().getAttribute("stuid"))));
            model.addAttribute("teaList", userService.queryAllTeacher());
            model.addAttribute("insList", courseService.queryAllIns());
            return "student/courseList";
        }
    }

    @RequestMapping("/chooseSuccess")//选课成工页面跳转回选课页面
    public String chooseSuccess(@Param("stuid") int stuid, @Param("courseid") int courseid, Model model) {
        courseService.chooseSuccess(courseid, stuid);
        model.addAttribute("paging", pageService.subList(1, courseService.queryAllCourse(stuid)));
        model.addAttribute("teaList", userService.queryAllTeacher());
        model.addAttribute("insList", courseService.queryAllIns());
        return "student/courseList";
    }

    @RequestMapping("/deleteCourse")//退选
    public String deleteCourse(@Param("courseid") int courseid, Model model, HttpServletRequest request) {
        courseService.deleteCourseChoose((int) request.getSession().getAttribute("stuid"), courseid);
        model.addAttribute("paging", pageService.subList(1, courseService.queryAllCourse((int) request.getSession().getAttribute("stuid"))));
        model.addAttribute("teaList", userService.queryAllTeacher());
        model.addAttribute("insList", courseService.queryAllIns());
        return "student/courseList";
    }

    @RequestMapping("/checkedCourseList")//查看我的选课
    public String checkedCourseList(Model model, HttpServletRequest request) {
        model.addAttribute("courseList", courseService.queryStuCourse((int) request.getSession().getAttribute("stuid")));
        return "student/checkedCourseList";
    }

    @RequestMapping("/searchCourse")//根据课程编号搜索课程
    public String searchCourse(@Param("courseid") int courseid, Model model) {
        System.err.println("进入搜索课程了哦");
        List<Course> cor_list = new ArrayList<>();
        Course course=courseService.queryCourse(courseid);
        if(course==null){
            System.out.println("该课程不存在");
            model.addAttribute("msg", "该课程不存在");
            return "Z";

        }
        cor_list.add(course);
        model.addAttribute("paging", pageService.subList(1, cor_list));
        model.addAttribute("teaList", userService.queryAllTeacher());
        model.addAttribute("insList", courseService.queryAllIns());
        return "student/courseList";
    }

    @RequestMapping("/searchListByTeaId")//根据老师查询课程
    public String searchListByTeaId(@Param("teaid") int teaid, Model model) {
        List<Course> cor_list = courseService.queryAllById(teaid);
        model.addAttribute("paging", pageService.subList(1, cor_list));
        model.addAttribute("teaList", userService.queryAllTeacher());
        model.addAttribute("insList", courseService.queryAllIns());
        return "student/courseList";
    }

    @RequestMapping("/searchListByInsId")//根据学院查询课程
    public String searchListByInsId(@Param("insid") int insid, Model model) {
        List<Course> cor_list = courseService.queryAllByInsId(insid);
        model.addAttribute("paging", pageService.subList(1, cor_list));
        model.addAttribute("teaList", userService.queryAllTeacher());
        model.addAttribute("insList", courseService.queryAllIns());
        return "student/courseList";
    }
}
