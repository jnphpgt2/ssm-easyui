package org.jnan.service;

import javax.servlet.http.HttpServletRequest;

import org.jnan.mapper.AdminMapper;
import org.jnan.mapper.StuMapper;
import org.jnan.po.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public Admin checkLogin(Admin admin) {
		Admin adminn = adminMapper.checkLogin(admin);
		if(adminn==null){
			//没有此用户，没有登录
			return null;
		}else{
			if(adminn.getApwd().equals(admin.getApwd())){
				//登陆成功
				return adminn;
			}else{
				//用户名存在，但是密码错误
				return null;
			}
		}
	}

}
