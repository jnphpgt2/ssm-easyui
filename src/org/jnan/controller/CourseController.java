package org.jnan.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.jnan.po.Course;
import org.jnan.po.Stu;
import org.jnan.service.AdminService;
import org.jnan.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("course")
public class CourseController {
	@Autowired
	private CourseService  courseService;
	
	@RequestMapping("/list")
	public void list(HttpServletResponse response,int page,int rows) throws IOException{
		int count=courseService.getListCount();
		List<Stu> list = courseService.getList(page,rows);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total",count);
		map.put("rows",list);
		response.getWriter().print(new ObjectMapper().writeValueAsString(map));
	}
	@RequestMapping("/add")
	public void add(HttpServletResponse response,Course course) throws IOException{
		int a=0;
		if(course.getCid()==null){
			a=courseService.add(course);
		}else{
			a=courseService.update(course);
		}
		boolean b=false;
		if(a>0){
			b=true;
		}
		response.getWriter().print(b);
	}
	@RequestMapping("/delete")
	public void delete(HttpServletResponse response,Integer cid) throws IOException{
		int a=courseService.delete(cid);
		boolean b=false;
		if(a>0){
			b=true;
		}
		response.getWriter().print(b);
	}
}
