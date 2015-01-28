package com.search.sys.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ldw.frame.base.BaseException;
import com.search.entity.SysUser;

@Repository
public interface SysUserDao {
	public List<SysUser> getUserByNoPwd(String userNo,String pwd);
	
	public List<SysUser> queryUser(SysUser sysuser,int pageSize,int startRow);
	
	public List<SysUser> queryUser(SysUser sysuser);
	
	public String getUserCount(SysUser sysUser);
	
	public String addUser(SysUser sysuser)throws BaseException ;
	
	public SysUser updateUser(SysUser sysuser);
	
	public List<SysUser> getUserById(String userid);
	
	public String logoutUser(String userid);
	
	public String enableUser(String userid);
	
	public String resetPwd(String userid,String passwd);
	
	public List<String> isExistUserNo(String userNo);
	
	public List<String> isExistUserNo(String userNo,String userId);

	public String updateUserNew(SysUser sysuser);
	
}
