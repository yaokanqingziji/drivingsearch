package com.weixin.course.util;


public class Test {
	//生成编码后的认证页面
	public static void main(String[] args) {
		String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6350ba04eff526f5&redirect_uri=";
		String abc = "http://115.28.128.212/drivingsearch/oauthServlet";
		
		url=url+CommonUtil.urlEncodeUTF8(abc)+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
		System.out.println(url);
		

	}

}
