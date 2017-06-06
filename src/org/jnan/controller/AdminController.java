package org.jnan.controller;

import javax.servlet.http.HttpServletRequest;

import org.jnan.po.Admin;
import org.jnan.service.AdminService;
import org.jnan.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService  adminService;
	
	@RequestMapping("/loginadmin")
	public String loginadmin(Admin admin,HttpServletRequest request){
		Admin adminn=adminService.checkLogin(admin);
		if(adminn==null){
			return "login.jsp";
		}else{
			request.getSession().setAttribute("admins", adminn);
			return "main";
		}
	}
	
	@RequestMapping("/stu_list")
	public String stu_list(){
		return "stu/stu_list";
	}
	@RequestMapping("/grade_list")
	public String grade_list(){
		return "stu/grade_list";
	}
	@RequestMapping("/course_list")
	public String course_list(){
		return "stu/course_list";
	}
}
