package com.search.sys.org.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.exception.FrameException;
import com.search.entity.SysOrg;

@Repository
public interface SysOrgDao {
    public SysOrg getSysOrg(String orgId);
	
	public List<SysOrg> querySysOrg(SysOrg sysOrg,int pageSize,int startRow);
	
	public String getOrgCount(SysOrg sysOrg);
	
	public List<SysOrg> querySysOrgJson();
	
	public String addSysOrg(SysOrg sysOrg)throws BaseException;
	
	public SysOrg updateSysOrg(SysOrg sysOrg);
	
	public String logoutSysOrg(String orgId);
	
	public String enableSysOrg(String orgId);
	
	public HashMap<String, HashMap<String, String>> loadOrgList() throws FrameException;
	
	public List<SysOrg> isExistOrgNo(String sysOrgNo) ;

	public List<SysOrg> getOrgById(String orgId);
	
	public List<SysOrg> getOrgList() throws FrameException;
}
