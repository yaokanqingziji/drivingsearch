package com.search.logon.controller;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.exception.BusinessException;
import com.ldw.frame.refer.global.FrameGlobalNames;
import com.search.base.SearchBaseController;
import com.search.logon.model.LogonUser;
import com.search.logon.service.LogonService;

@Controller
@RequestMapping("/logon")
public class LogonController<T> extends SearchBaseController {
	@Autowired
	private LogonService logonService;

	@Autowired
	private FrameGlobalNames globalNames;

	/**
	 * 登录执行方法
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 * @throws BaseException
	 */
	@RequestMapping("/dologon")
	@ResponseBody
    public String doLogon(@RequestParam("userno") String userNo,
            @RequestParam("password") String password,
			HttpServletRequest request) throws BaseException {
		String oldUserNo;
		LogonUser user;
		HttpSession session = request.getSession(true);
		try {
			// 检查用户名为空
			if (userNo == null || "".equals(userNo)) {
				throw new BusinessException("用户名不能为空！");
			}
			if (password == null || "".equals(password)) {
				throw new BusinessException("密码不能为空！");
			}


			// 检查是否有其他登入用户
			user = (LogonUser) session.getAttribute(FrameGlobalNames.LOGON_USER);

			if (user != null) {
				oldUserNo = user.getUserNo();
				if (!userNo.equals(oldUserNo)) {
					throw new BusinessException("已经登录了一个其他用户，请选退出再登录该用户");
				}
			}
			// 判断此用户是否存在
			user = this.logonService.getUserByNoPwd(userNo, password);
			if (user == null) {
				throw new BusinessException("您输入的用户名和密码不匹配，请重试！");
			}
			user.setIp(request.getRemoteAddr());
			session.setAttribute(FrameGlobalNames.LOGON_USER, user);
			session.setAttribute(FrameGlobalNames.LOGON_USER_NAME, user.getUserNo());
		} catch (Exception e) {
			if (e instanceof BusinessException) {
				return e.getMessage();
			}

			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			return "登录时出错：" + sw.toString();
		}
		return "true";
	}


	/**
	 * 登出系统执行的方法
	 * 
	 * @param session
	 *            HttpSession
	 * @return String
	 */
	@RequestMapping("/logout")
	public String doLogOut(HttpSession session) {
		session.removeAttribute(FrameGlobalNames.LOGON_USER);
        return "redirect:/login.jsp";
	}
}