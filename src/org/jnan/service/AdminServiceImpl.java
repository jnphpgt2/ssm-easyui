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
			//û�д��û���û�е�¼
			return null;
		}else{
			if(adminn.getApwd().equals(admin.getApwd())){
				//��½�ɹ�
				return adminn;
			}else{
				//�û������ڣ������������
				return null;
			}
		}
	}

}
