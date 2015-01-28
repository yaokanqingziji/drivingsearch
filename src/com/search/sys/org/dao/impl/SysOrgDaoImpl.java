package com.search.sys.org.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.exception.FrameException;
import com.ldw.frame.common.util.DBUtil;
import com.search.base.SearchBaseDAO;
import com.search.entity.SysOrg;
import com.search.sys.org.dao.SysOrgDao;

@Repository("com.search.sys.org.dao.impl.SysOrgDaoImpl")
public class SysOrgDaoImpl extends SearchBaseDAO implements SysOrgDao {
	@Autowired
	DBUtil dBUtil;
	 
	
    @SuppressWarnings("unchecked")
    public SysOrg getSysOrg(String orgId) {
		String hql = "from SysOrg where orgid='" + orgId + "'";
		List<SysOrg> list =  this.getSession().createQuery(hql).list();
		if(list.size()<=0 || list==null){
			return null;
		}
        return list.get(0);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<SysOrg> querySysOrg(SysOrg sysOrg,int pageSize,int startRow) {
		String orgname = null;
		String orgno = null;
		StringBuffer hql = new StringBuffer();
		List<SysOrg> list;

		orgno = sysOrg.getOrgno();
		orgname = sysOrg.getOrgname();

		hql.append("FROM SysOrg as s WHERE 1=1 ");
		if (orgno != null && !"".equals(orgno)) {
			hql.append(" and s.orgno='" + orgno + "'");
		}
		if (orgname != null && !"".equals(orgname)) {
			hql.append(" and s.orgname like '%" + orgname + "%'");
		}
		Query query=  this.getSession().createQuery(hql.toString());
		
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		list=query.list();
		return list;
	}
	
	public String getOrgCount(SysOrg sysOrg){
		String orgname = null;
		String orgno = null;
		StringBuffer hql = new StringBuffer();
		List<?> count;

		orgno = sysOrg.getOrgno();
		orgname = sysOrg.getOrgname();

		hql.append("select COUNT(1) FROM sys_org s WHERE 1=1 ");
		if (orgno != null && !"".equals(orgno)) {
			hql.append(" and s.orgno='" + orgno + "'");
		}
		if (orgname != null && !"".equals(orgname)) {
			hql.append(" and s.orgname like '%" + orgname + "%'");
		}
		count =  this.getSession().createSQLQuery(hql.toString()).list(); 

		return count.get(0).toString();
	}

	@SuppressWarnings("unchecked")
	public List<SysOrg> querySysOrgJson(){
		String hql = "from SysOrg where isvalid='1'";
		List<SysOrg> list =  this.getSession().createQuery(hql).list();
		return list;
	}
	
	public String addSysOrg(SysOrg sysOrg) throws BaseException {
		if((sysOrg.getOrgid()==null)||"".equals(sysOrg.getOrgid())){
			sysOrg.setOrgid(this.dBUtil.generateSysId("SEQ_SYS"));
		}
		return (String)  this.getSession().save(sysOrg);
	}

	public SysOrg updateSysOrg(SysOrg sysOrg) {
		return  (SysOrg) this.getSession().merge(sysOrg);
	}

	public String logoutSysOrg(String orgId) {
		String hql = "update SysOrg set isvalid='0' where orgid='" + orgId
				+ "'";
		try {
			Query query =  this.getSession().createQuery(hql);
			query.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace(System.err);
			return "注销信息失败";
		}
		return "ok";
	}

	public String enableSysOrg(String orgId) {
		String hql = "update SysOrg set isvalid='1' where orgid='" + orgId
				+ "'";
		try {
			Query query =  this.getSession().createQuery(hql);
			query.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace(System.err);
			return "操作信息失败";
		}
		return "ok";
	}
	
	@SuppressWarnings("unchecked")
	public List<SysOrg> isExistOrgNo(String sysOrgNo) {
		String hql = "from SysOrg where orgno='" + sysOrgNo + "'";
		List<SysOrg> list =  this.getSession().createQuery(hql).list();
		return list;
	}
	
	/**
	 * 获取机构所有信息列表
	 * @throws FrameException 
	 */
	@SuppressWarnings("unchecked")
	public List<SysOrg> getOrgList() throws FrameException {
		List<SysOrg> list;
		String hql = "from SysOrg where isvalid='1'";
		list =  this.getSession().createQuery(hql).list();
		return list;
	}
	
	/*
	 * 本方法返回的对象经过处理，并非持久化的对象
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, HashMap<String, String>> loadOrgList() throws FrameException {
		String orgId,orgName;
		String dmlb="ORG";
		List<SysOrg> list;
		HashMap<String, String> codeHashMap;
		HashMap<String, HashMap<String, String>> returnHashMap;
		returnHashMap = new HashMap<String, HashMap<String, String>>();

		String hql = "from SysOrg where isvalid='1'";
		list =  this.getSession().createQuery(hql).list();
		
		if (list == null) {
			return returnHashMap;
		}

		for (SysOrg sysOrg : list) {
			orgId = sysOrg.getOrgid();
			orgName = sysOrg.getOrgname();

			if (returnHashMap.containsKey(dmlb)) {
				returnHashMap.get(dmlb).put(orgId, orgName);
				continue;
			}

			codeHashMap = new HashMap<String, String>();
			codeHashMap.put(orgId, orgName);
			returnHashMap.put(dmlb, codeHashMap);
		}
		return returnHashMap;
	}
	
	@SuppressWarnings("unchecked")
	public List<SysOrg> getOrgById(String orgId) {
		String hql = "from SysOrg where orgid='" + orgId + "'";
		List<SysOrg> list =  this.getSession().createQuery(hql).list();
		return list;
	}

}
