package com.zxc.controller.common;

import com.zxc.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.HttpResource;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@SessionAttributes({"username","teaid","stuid"})
public class LoginController {
    //注入Service层的对象
    @Resource
    private UserService userService;
    //页面跳转到login
    @RequestMapping("login")
    public String login(){
        return "login";
    }

    @RequestMapping("admin")
    public String admin(){
        return "admin";
    }

    @RequestMapping(value = "check",method = RequestMethod.POST)
    public String checkAccount(@RequestParam("userid") int id,@RequestParam("userpass") String pass,@RequestParam("sex") String sex, Model model) {
        if ("1" .equals(sex) ) {
            System.err.println("当前对象：学生");
        } else {
            System.err.println("当前对象：老师");
        }
        if ("2".equals(sex)&&userService.checkAccount(id, pass) == 2) { //查询老师成功
            model.addAttribute("username",userService.getTeaNameById(id));
            model.addAttribute("teaid",id);
            return "redirect:teacher/teacherIndex";
        }
        else if("1".equals(sex)&&userService.checkAccount(id, pass) == 1){//查询学生成功
            model.addAttribute("username",userService.getStuNameById(id));
            model.addAttribute("stuid",id);
            return "redirect:student/studentIndex";
        }
        else {
            model.addAttribute("msg","密码错误");
            //这里不加redirect，否则前端el取不到值
            return "login";
        }
    }

    @RequestMapping("exit")
    public String exit(HttpServletRequest request){
        request.getSession().invalidate();
        return "login";
    }

    @RequestMapping("register")
    public String reg(){
        System.out.println("进来");
        return "regis";
    }
    @RequestMapping("CheckCode")
    @ResponseBody
    public void checkCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String resultTip = "static/imgs/wrong.jpg";
        //获取用户输入验证码
        String checkcodeClient =  request.getParameter("checkcode");

        //真实的验证码值
        String checkcodeServer = (String) request.getSession().getAttribute("CKECKCODE");
        if(checkcodeServer.equals(checkcodeClient)){
            resultTip = "static/imgs/right.jpg";
        }
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();//输出流
        writer.write(resultTip);
        writer.flush();
        writer.close();
    }
}
