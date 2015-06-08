package com.weixin.course.util;


public class Test {
	//生成编码后的认证页面
	public static void main(String[] args) {
//		String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6350ba04eff526f5&redirect_uri=";
//		String abc = "http://115.28.128.212/drivingsearch/oauthServlet";
//		
//		url=url+CommonUtil.urlEncodeUTF8(abc)+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
//		System.out.println(url);
		SignUtil a =new SignUtil();
		String sjh = "绑定#13953106666";
		String jk[] = sjh.split("#");
		System.out.println(jk.length);
		if(jk.length!=2){
			System.out.println("你输入的格式存在问题，请输入如下格式：绑定：19953139999 或者 变更：19953139999");
		}else{
			if(a.isMobile(jk[1])){
				System.out.println("您输入的手机号为："+jk[1]);
			}else{
				System.out.println("您输入的手机号格式不正确");
			}
		}
//		isMobile

	}

}
