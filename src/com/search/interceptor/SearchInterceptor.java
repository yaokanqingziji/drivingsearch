package com.search.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ldw.frame.base.BaseException;

public class SearchInterceptor implements HandlerInterceptor {
	/**
	 * 访问之前执行 在preHandle中，可以进行编码、安全控制等处理； 访问前进行拦截，允许通过返回true，否则返回false
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws BaseException {
//		HandlerMethod handlerMethod = (HandlerMethod) handler;
//		Method method = handlerMethod.getMethod();
//		// 获取session中的用户信息， 如果用户信息未获取到，说明超时，否则继续
//		//获取调用的controller方法信息
//		String methodName = method.getName();
//		String classStr = method.getDeclaringClass().getName();
//		//过滤掉不需要拦截的方法
//		if ("com.search.logon.controller.LogonController"
//				.equals(classStr)) {
//			if ("doLogon".equals(methodName) || "doLogOut".equals(methodName)) {
//				return true;
//			}
//		}
//		// ... return false;
		return true;
	}

	/**
	 * 生成视图之前执行
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler, ModelAndView view)
			throws Exception {
	}

	/**
	 * 最后执行，可用于释放资源，可以根据ex是否为null判断是否发生了异常，进行controller层的异常日志记录。
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
