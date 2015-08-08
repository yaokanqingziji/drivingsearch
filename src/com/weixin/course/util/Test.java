package com.weixin.course.util;

import java.util.HashMap;

import net.sf.json.JSONObject;

import com.weixin.course.pojo.Token;


public class Test {
	
	// 获取参数二维码（POST）
	public final static String erweima_create_url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=TOKEN";
	//生成编码后的认证页面
	public static void main(String[] args) {
//		String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6350ba04eff526f5&redirect_uri=";
//		String abc = "http://115.28.128.212/drivingsearch/oauthServlet";
//		
//		url=url+CommonUtil.urlEncodeUTF8(abc)+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
////		System.out.println(url);
//		SignUtil a =new SignUtil();
//		String sjh = "绑定#13953106666";
//		String jk[] = sjh.split("#");
//		System.out.println(jk.length);
//		if(jk.length!=2){
//			System.out.println("你输入的格式存在问题，请输入如下格式：绑定：19953139999 或者 变更：19953139999");
//		}else{
//			if(a.isMobile(jk[1])){
//				System.out.println("您输入的手机号为："+jk[1]);
//			}else{
//				System.out.println("您输入的手机号格式不正确");
//			}
//		}
//		isMobile
		String appId = "wx6350ba04eff526f5";
		// 第三方用户唯一凭证密钥
		String appSecret = "6fc66c0c5b9488bc8d38b6d08443935b";

		// 调用接口获取凭证
		Token token = CommonUtil.getToken(appId, appSecret);
		String accessToken = token.getAccessToken();
		System.out.println("accessToken:"+accessToken);
		String url = erweima_create_url.replace("ACCESS_TOKEN", accessToken);
		
		//组织json字符串
		HashMap scene = new HashMap();
		scene.put("scene_id", 1000);
		
		HashMap action_info = new HashMap();
		action_info.put("scene", scene);
		
		HashMap menu = new HashMap();
		menu.put("expire_seconds", 36000);
		menu.put("action_name", "QR_SCENE");
		menu.put("action_info", action_info);
		
		
		
		
		String jsonMenu = JSONObject.fromObject(menu).toString();
		System.out.println("jsonMenu:"+jsonMenu);
		// 发起POST请求创建菜单
		JSONObject jsonObject = CommonUtil.httpsRequest(url, "POST", jsonMenu);
		System.out.println("jsonObject"+jsonObject);
	}

}
