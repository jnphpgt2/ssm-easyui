package org.jnan.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.jnan.po.Course;
import org.jnan.po.Grade;
import org.jnan.po.Stu;
import org.jnan.service.AdminService;
import org.jnan.service.CourseService;
import org.jnan.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("grade")
public class GradeController {
	@Autowired
	private GradeService  gradeService;
	
	@RequestMapping("/list")
	public void list(HttpServletResponse response,int page,int rows) throws IOException{
		int count=gradeService.getListCount();
		List<Stu> list = gradeService.getList(page,rows);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total",count);
		map.put("rows",list);
		response.getWriter().print(new ObjectMapper().writeValueAsString(map));
	}
	@RequestMapping("/add")
	public void add(HttpServletResponse response,Grade grade) throws IOException{
		int a=0;
		if(grade.getGid()==null){
			a=gradeService.add(grade);
		}else{
			a=gradeService.update(grade);
		}
		boolean b=false;
		if(a>0){
			b=true;
		}
		response.getWriter().print(b);
	}
	@RequestMapping("/delete")
	public void delete(HttpServletResponse response,Integer gid) throws IOException{
		int a=gradeService.delete(gid);
		boolean b=false;
		if(a>0){
			b=true;
		}
		response.getWriter().print(b);
	}
	@RequestMapping("/getGradeTypeList")
	public void getGradeTypeList(HttpServletResponse response) throws IOException{
		List<Grade> list=gradeService.getGradeTypeList();
		response.getWriter().print(new ObjectMapper().writeValueAsString(list));
	}
}
