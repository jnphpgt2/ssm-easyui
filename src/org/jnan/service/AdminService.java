package org.jnan.service;

import javax.servlet.http.HttpServletRequest;

import org.jnan.po.Admin;

public interface AdminService {

	Admin checkLogin(Admin admin);

}
