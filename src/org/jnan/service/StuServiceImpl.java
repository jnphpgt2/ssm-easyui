package org.jnan.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jnan.mapper.StuMapper;
import org.jnan.po.Course;
import org.jnan.po.Grade;
import org.jnan.po.Stu;
import org.jnan.po.StuCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("stuService")
public class StuServiceImpl implements StuService {
	@Autowired
	private StuMapper stuMapper;

	@Override
	public List getList(int page,int rows) {
		Map<String,Integer> fy=new HashMap<String,Integer>();
		fy.put("index",(page-1)*rows);
		fy.put("rows",rows);
		List<Stu> list = stuMapper.getList(fy);
		List<Stu> stuAcou = stuMapper.getStuAcou();
		for (Stu stu : stuAcou) {
			int count=0;
			int cptime=0;
			Set<Course> courses = stu.getCourses();
			for (Stu stu1: list) {
				if(stu1.getId()==stu.getId()){
					stu1.setCourses(courses);
					Set<Course> courses2 = stu1.getCourses();
					for (Course course : courses2) {
						cptime+=course.getPtime();
						count++;
					}
					stu1.setCount(count);
					stu1.setCptime(cptime);
				}
				
			}
		}
		
		return list;
	}

	@Override
	public int getListCount() {
		return stuMapper.getListCount();
	}

	@Override
	public List<Grade> getGrade() {
		return stuMapper.getGrade();
	}

	@Override
	public List<Course> getCourse() {
		return stuMapper.getCourse();
	}

	@Override
	public int add(Stu stu,Integer[] cid) {
		int add = stuMapper.add(stu);
		int b=0;
		if(add>0){
			Stu stuu=stuMapper.getStuByName(stu.getName());
			for (int i = 0; i < cid.length; i++) {
				Map<String,Integer> map=new HashMap<String,Integer>();
				map.put("cid",cid[i]);
				map.put("id", stuu.getId());
				b=stuMapper.addCourse(map);
			}
		}
		return b;
	}

	@Override
	public int delete(Integer id) {
		int a=0;
		a=stuMapper.delete(id);
		return a;
	}

	@Override
	public int update(Stu stu, Integer[] cid) {
		int add = stuMapper.update(stu);
		int b=0;
		if(add>0){
		//	Stu stuu=stuMapper.getStuByName(stu.getName());
			stuMapper.deleteCourse(stu.getId());
			for (int i = 0; i < cid.length; i++) {
				Map<String,Integer> map=new HashMap<String,Integer>();
				map.put("cid",cid[i]);
				map.put("id", stu.getId());
				b=stuMapper.addCourse(map);
			}
		}
		return b;
	}
}
