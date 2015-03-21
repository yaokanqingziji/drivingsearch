package com.search.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.user.model.TempUserModel;
import com.core.user.model.UserForBusinessModel;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseController;
import com.search.base.SearchCodeNames;
import com.search.base.SearchSessionNames;
import com.search.login.model.LoginModel;
import com.search.login.model.TempUserLoginModel;

/**
 * @Description: 用户登陆Controller， 包括会员登陆与临时用户登陆
 * @author ldw
 * @date 2015年1月27日 下午8:41:43
 */
@Controller
@RequestMapping("/login")
public class LoginController extends SearchBaseController {

	/**
	 * @Description: 会员登陆
	 * @return
	 * @throws BaseException
	 * @return String
	 * @author ldw
	 * @date 2015年1月27日 下午4:43:41
	 */
	@RequestMapping("/doLogin")
	@ResponseBody
	// TODO 会员用户登录实现
	public String doLogin(HttpServletRequest request, LoginModel loginModel)
			throws BaseException {
		// 验证登陆参数
		// 验证登陆
		// 登陆成功后，如果存在临时用户 需要设置会员与临时用户对应关系，
		// 登陆成功后，需要设置session。 清空tempUser以及指定usertype
		this.dealSessionForLoginUser();
		return "ok";
	}

	/**
	 * @Description:为会员登陆处理session
	 * @return void
	 * @author ldw
	 * @date 2015年1月27日 下午5:10:08
	 */
	// TODO 会员登陆Session处理
	private void dealSessionForLoginUser() {
		// 添加会员用户
		// 清空tempUser
		// 指定usertype
		// 添加会员用户与临时用户对应关系
		// 添加业务用用户
	}

	/**
	 * @Description: 临时用户登录
	 * @param request
	 * @return
	 * @throws BaseException
	 * @return String
	 * @author ldw
	 * @date 2015年1月27日 下午8:33:43
	 */
	@RequestMapping("/tempUserLogin")
	@ResponseBody
	public String tempUserLogin(HttpServletRequest request,
			TempUserLoginModel tempUserLoginModel) throws BaseException {
		TempUserModel tempUserModel = null;
		// TODO 临时用户登陆 校验临时用户信息
		// TODO 保存临时用户信息并返回TempUserModel
		{ // FIXME 测试用代码段,后续要删除
			tempUserModel = new TempUserModel();
			tempUserModel.setPhoneNo("18615206630");
			tempUserModel.setUserId("1234567890");
			tempUserModel.setYhly("1");// 需要维护code表
		}
		/*
		 * if(tempUserModel == null){ throw new AppException("临时用户信息为空"); }
		 */
		// 处理Session
		this.dealSessionForTempUser(request, tempUserModel);
		return "ok";
	}

	/**
	 * @Description: 临时用户登陆，session处理
	 * @param request
	 * @param tempUserModel
	 * @return void
	 * @author ldw
	 * @date 2015年1月27日 下午8:53:57
	 */
	private void dealSessionForTempUser(HttpServletRequest request,
			TempUserModel tempUserModel) {
		HttpSession session = request.getSession();
		// 添加临时用户
		session.setAttribute(SearchSessionNames.tempUser, tempUserModel);
		// 指定usertype
		session.setAttribute(SearchSessionNames.userType,
				SearchCodeNames.UserType.tempUser);
		// 添加业务用用户
		session.setAttribute(SearchSessionNames.userForBusiness,
				this.initBusinessUser(tempUserModel));
	}

	/**
	 * @Description: 根据临时用户信息初始化业务用的用户信息
	 * @param tempUserModel
	 * @return
	 * @return UserForBusinessModel
	 * @author ldw
	 * @date 2015年1月27日 下午8:54:16
	 */
	private UserForBusinessModel initBusinessUser(TempUserModel tempUserModel) {
		UserForBusinessModel userForBusinessModel = new UserForBusinessModel();
		userForBusinessModel.setUserId(tempUserModel.getUserId());
		return userForBusinessModel;
	}
}