package com.search.base;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.user.model.UserForBusinessModel;
import com.ldw.frame.base.BaseController;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.exception.AppException;
import com.ldw.frame.common.exception.BusinessException;
import com.ldw.frame.common.exception.FrameException;
import com.ldw.frame.common.paging.PagingModel;

/**
 * Controller层基础类
 */
public class SearchBaseController extends BaseController {

	@Autowired
	protected SearchGlobalNames searchGlobal;

	/**
	 * 日志处理类
	 */
	Logger logger = Logger.getLogger(SearchBaseController.class);

	private String frameErr = "系统罢工啦，请电话联系客服~";
	private String appErr = "系统正在闹情绪，请再试一次~";
	private String otherErr = "系统罢工啦，请电话联系客服~";

	/**
	 * @Description: 获取业务用的用户信息
	 * @param request
	 * @return
	 * @throws BaseException
	 * @return UserModel
	 * @author ldw
	 * @date 2015年1月27日 下午2:32:27
	 */
	protected UserForBusinessModel getUserForBusiness(HttpServletRequest request)
			throws BaseException {
		HttpSession session = request.getSession();
		UserForBusinessModel userModel = (UserForBusinessModel) session
				.getAttribute(SearchSessionNames.userForBusiness);
		return userModel;
	}

	/**
	 * @Description: 根据session中的key获取缓存对象
	 * @param request
	 * @param sessionKey
	 * @return
	 * @throws BaseException
	 * @return Object
	 * @author ldw
	 * @date 2015年1月27日 下午5:28:36
	 */
	protected Object getObjectFromSession(HttpServletRequest request,
			String sessionKey) throws BaseException {
		HttpSession session = request.getSession();
		Object sessionObj = session.getAttribute(sessionKey);
		return sessionObj;
	}

	/**
	 * @Description: 为分页预留的分页方法
	 * @param request
	 * @return
	 * @throws BaseException
	 * @return PagingModel
	 * @author ldw
	 * @date 2015年1月27日 下午10:05:50
	 */
	protected PagingModel getPagingModel(HttpServletRequest request)
			throws BaseException {
		return null;
	}

	/**
	 * BusinessException异常的捕捉和处理
	 * 
	 * @param ex
	 *            BusinessException异常对象
	 * @param request
	 *            request请求对象
	 * @return 返回错误页面
	 */
	@ExceptionHandler(BusinessException.class)
	public String expBusiException(BusinessException ex,
			HttpServletRequest request) {
		request.setAttribute("msg", ex.getMessage());
		return "/error";
	}

	/**
	 * AppException异常的捕捉和处理
	 * 
	 * @param ex
	 *            AppException异常对象
	 * @param request
	 * @return 返回错误页面
	 */
	@ExceptionHandler(AppException.class)
	@ResponseBody
	public String expAppException(AppException ex, HttpServletRequest request) {
		String stackTrace = this.getExpStackTrace(ex);
		ex.printStackTrace();
		logger.error(stackTrace);

		return this.appErr;
	}

	/**
	 * FrameException异常的捕捉和处理
	 * 
	 * @param ex
	 *            FrameException异常对象
	 * @param request
	 * @return 返回错误页面
	 */
	@ExceptionHandler(FrameException.class)
	@ResponseBody
	public String expFrameException(FrameException ex,
			HttpServletRequest request) {
		String stackTrace = this.getExpStackTrace(ex);
		ex.printStackTrace();
		logger.error(stackTrace);
		return this.frameErr;
	}

	/**
	 * BaseException异常的捕捉和处理
	 * 
	 * @param ex
	 *            BaseException异常对象
	 * @param request
	 *            request请求对象
	 * @return 返回错误页面
	 */
	@ExceptionHandler(BaseException.class)
	public String expBaseException(BaseException ex, HttpServletRequest request) {
		String stackTrace = this.getExpStackTrace(ex);
		if (ex instanceof BusinessException) {
			return ex.getMessage();
		} else {
			ex.printStackTrace();
			logger.error(stackTrace);
			return this.frameErr;
		}
	}

	/**
	 * 除"BusinessException、AppException、FrameException、BaseException"之外异常的捕捉和处理
	 * 
	 * @param ex
	 *            Exception异常对象
	 * @param request
	 *            request请求对象
	 * @return 返回错误页面
	 */
	@ExceptionHandler
	public String expException(Exception ex, HttpServletRequest request) {
		String stackTrace = this.getExpStackTrace(ex);
		ex.printStackTrace();
		logger.error(stackTrace);
		return this.otherErr;
	}

	/**
	 * 返回异常信息串
	 * 
	 * @param ex
	 *            异常对象
	 * @return String类型
	 */
	private String getExpStackTrace(Exception ex) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		ex.printStackTrace(pw);
		return sw.toString();
	}
}
