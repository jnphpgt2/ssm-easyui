package org.jnan.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.ResultMap;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.jnan.po.Stu;
import org.jnan.po.StuCustom;
import org.jnan.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("stu")
public class StuController {
	@Autowired
	private StuService  stuService;
	
	
	@RequestMapping("/list")
	public void list(HttpServletResponse response,int page,int rows) throws IOException{
		int count=stuService.getListCount();
		List<Stu> list = stuService.getList(page,rows);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total",count);
		map.put("rows",list);
		response.getWriter().print(new ObjectMapper().writeValueAsString(map));
	}
	@RequestMapping("/add")
	public void add(HttpServletResponse response,Stu stu,Integer[] cid) throws IOException{
		int a=0;
		if(stu.getId()==null){
			a=stuService.add(stu,cid);
		}else{
			a=stuService.update(stu,cid);
		}
		boolean b=false;
		if(a>0){
			b=true;
		}
		response.getWriter().print(b);
	}
	@RequestMapping("/delete")
	public void delete(HttpServletResponse response,Integer id) throws IOException{
		int a=stuService.delete(id);
		boolean b=false;
		if(a>0){
			b=true;
		}
		response.getWriter().print(b);
	}
	@RequestMapping("/toStuAdd")
	public String toStuAdd(HttpServletResponse response,Integer id) throws IOException{
	return "stu/stu_list_add";
	}
	@RequestMapping("/toStuUpdate")
	public String toStuUpdate(HttpServletResponse response,Integer id) throws IOException{
		return "stu/stu_list_update";
	}
	
}
