package com.search.sys.user.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseDAO;
import com.search.entity.SysUser;
import com.search.sys.user.dao.SysUserDao;

@Repository("com.search.sys.user.dao.impl.SysUserDaoImpl")
public class SysUserDaoImpl extends SearchBaseDAO implements SysUserDao {

	@SuppressWarnings("unchecked")
	public List<SysUser> getUserByNoPwd(String userNo, String pwd) {
		String hql = "from SysUser where userNo='" + userNo + "'and passwd='"
				+ pwd + "'";
		List<SysUser> list = this.getSession().createQuery(hql).list();
		String sql = "select USERNO as aaa,PASSWD as ddd,sysdate as ATIME,1 as AInt,1.2 as ADouble from SYS_USER where userNo=? ";
		Query query = this.getSession().createSQLQuery(sql);
		query.setParameter(0, userNo);
		query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		query.setResultTransformer(Transformers.TO_LIST);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<SysUser> queryUser(SysUser sysUser, int pageSize, int startRow) {
		String username = null;
		String userno = null;
		StringBuffer hql = new StringBuffer();
		List<SysUser> list;

		userno = sysUser.getUserno();
		username = sysUser.getUsername();

		hql.append("FROM SysUser  s WHERE 1=1 ");
		if (userno != null && !"".equals(userno)) {
			hql.append(" and s.userno='" + userno + "'");
		}
		if (username != null && !"".equals(username)) {
			hql.append(" and s.username like '%" + username + "%'");
		}
		hql.append(" order by s.isvalid desc");
		Query query = this.getSession().createQuery(hql.toString());

		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);

		list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<SysUser> queryUser(SysUser sysUser) {
		String username = null;
		String userno = null;
		StringBuffer hql = new StringBuffer();
		List<SysUser> list;

		userno = sysUser.getUserno();
		username = sysUser.getUsername();

		hql.append("FROM SysUser  s WHERE 1=1 ");
		if (userno != null && !"".equals(userno)) {
			hql.append(" and s.userno='" + userno + "'");
		}
		if (username != null && !"".equals(username)) {
			hql.append(" and s.username like '%" + username + "%'");
		}

		Query query = this.getSession().createQuery(hql.toString());

		list = query.list();
		return list;
	}

	public String getUserCount(SysUser sysUser) {
		String username = null;
		String userno = null;
		StringBuffer hql = new StringBuffer();
		List<?> count;

		userno = sysUser.getUserno();
		username = sysUser.getUsername();

		hql.append("select COUNT(1) FROM sys_user s WHERE 1=1 ");
		if (userno != null && !"".equals(userno)) {
			hql.append(" and s.userno='" + userno + "'");
		}
		if (username != null && !"".equals(username)) {
			hql.append(" and s.username like '%" + username + "%'");
		}
		count = this.getSession().createSQLQuery(hql.toString()).list();

		return count.get(0).toString();
	}

	public String addUser(SysUser sysuser) throws BaseException {
		if ((sysuser.getUserid() == null) || "".equals(sysuser.getUserid())) {
			sysuser.setUserid(this.dBUtil.generateSysId("SEQ_SYS"));
		}
		return (String) this.getSession().save(sysuser);
	}

	public SysUser updateUser(SysUser sysuser) {
		return (SysUser) this.getSession().merge(sysuser);
	}

	public String updateUserNew(SysUser sysuser) {
		String userid = sysuser.getUserid();
		String username = sysuser.getUsername() == null ? "" : sysuser
				.getUsername();
		String orgid = sysuser.getOrgid() == null ? "" : sysuser.getOrgid();
		String note = sysuser.getNote() == null ? "" : sysuser.getNote();

		String hql = "update SysUser set username='" + username + "',orgid='"
				+ orgid + "',note='" + note + "' where userid='" + userid + "'";
		try {
			Query query = this.getSession().createQuery(hql);
			query.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace(System.err);
			return "修改用户信息失败";
		}
		return "ok";
	}

	@SuppressWarnings("unchecked")
	public List<SysUser> getUserById(String userid) {
		String hql = "from SysUser where userid='" + userid + "'";
		List<SysUser> list = this.getSession().createQuery(hql).list();
		return list;
	}

	public String logoutUser(String userid) {
		String hql = "update SysUser set isvalid='0' where userid='" + userid
				+ "'";
		try {
			Query query = this.getSession().createQuery(hql);
			query.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace(System.err);
			return "注销信息失败";
		}
		return "ok";
	}

	public String enableUser(String userid) {
		String hql = "update SysUser set isvalid='1' where userid='" + userid
				+ "'";
		try {
			Query query = this.getSession().createQuery(hql);
			query.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace(System.err);
			return "操作信息失败";
		}
		return "ok";
	}

	public String resetPwd(String userid, String passwd) {
		String hql = "update SysUser set passwd='" + passwd
				+ "' where userid='" + userid + "'";
		try {
			Query query = this.getSession().createQuery(hql);
			query.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace(System.err);
			return "操作信息失败";
		}
		return "ok";
	}

	@SuppressWarnings("unchecked")
	public List<String> isExistUserNo(String userNo) {
		String hql = "select userid from SysUser where userno='" + userNo + "'";
		List<String> list = this.getSession().createQuery(hql).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<String> isExistUserNo(String userNo, String userId) {
		String hql = "select userid from SysUser where userno='" + userNo
				+ "'and userid!='" + userId + "'";
		List<String> list = this.getSession().createQuery(hql).list();
		return list;
	}

}
