package com.weixin.course.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;

import net.sf.json.JSONObject;

import com.weixin.course.pojo.Token;


public class Test {
	
	// 获取参数二维码（POST）
	public final static String erweima_create_url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
	//生成编码后的认证页面
	public static void main(String[] args) {
//		String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6350ba04eff526f5&redirect_uri=";
//		String abc = "http://115.28.180.16/drivingsearch/oauthServlet";
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
		
		int scene_id = 1001;//渠道号码

		// 调用接口获取凭证
		Token token = CommonUtil.getToken(appId, appSecret);
		String accessToken = token.getAccessToken();
//		System.out.println("accessToken:"+accessToken);
		String url = erweima_create_url.replace("ACCESS_TOKEN", accessToken);
		
//		System.out.println("url:"+url);
		
		//组织json字符串
		HashMap scene = new HashMap();
		scene.put("scene_id", scene_id);//设置不同的代码代表不同的公司渠道
		
		HashMap action_info = new HashMap();
		action_info.put("scene", scene);
		
		HashMap menu = new HashMap();
		menu.put("expire_seconds", 604800);
		menu.put("action_name", "QR_SCENE");
		menu.put("action_info", action_info);
		
		
		String jsonMenu = JSONObject.fromObject(menu).toString();
		System.out.println("jsonMenu:"+jsonMenu);
		// 发起POST请求创建菜单
		JSONObject jsonObject = CommonUtil.httpsRequest(url, "POST", jsonMenu);
		System.out.println("jsonObject"+jsonObject);
		
		if (null != jsonObject){
			String ticket = jsonObject.getString("ticket");
			String target_url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=";
			try {
				pic(target_url,ticket,String.valueOf(scene_id));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/*
	 * 二维码保存方法
	 */
	public static void pic(String target_url,String ticket,String scene_id) throws IOException{ 
		URL url; 
		try {
			int bytesum = 0; 
			int byteread = 0;
			System.out.println(target_url+ticket);
//			String newurl = URLEncoder.encode(target_url+ticket);
//			url = new URL(newurl);
//			System.out.println("加密后："+url);
//			URLConnection conn = url.openConnection();//获得连接 
//			InputStream inStream = conn.getInputStream();//生成输入流文件 
//			String filename = "d:/test/"+scene_id+".gif";
//			FileOutputStream fs = new FileOutputStream(filename); 
//			byte[] buffer = new byte[30000]; 
//			while ((byteread = inStream.read(buffer)) != -1) { 
//				bytesum += byteread; // 字节数 文件大小 
//				System.out.println(bytesum); 
//				fs.write(buffer, 0, byteread); 
//			} 
//			inStream.close(); 
		}catch (Exception e) { 
			System.out.println("保存失败"); 
			e.printStackTrace(); 
		} 
	}

}
