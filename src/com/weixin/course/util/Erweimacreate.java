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


public class Erweimacreate {
	
	// 获取参数二维码（POST）
	public final static String erweima_create_url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
	//生成编码后的认证页面
	public static void main(String[] args) {
		
		//生产环境
		// 第三方用户唯一凭证
		String appId = "wx22133dfb2266f29d";
		// 第三方用户唯一凭证密钥
		String appSecret = "853e4417d6c80d01a7039ee47979a329";
		
		//测试环境
//		String appId = "wx6350ba04eff526f5";
//		// 第三方用户唯一凭证密钥
//		String appSecret = "6fc66c0c5b9488bc8d38b6d08443935b";
		String qdmc = "刘大伟";
		int qddm = 0;
		
		getErweima(appId,appSecret,qdmc,qddm,"1");
		
	}
	
	/**
	 * 获取二维码地址，然后在ie地址栏下载
	 * @param appId 
	 * @param appSecret
	 * @param qdmc 渠道名称 
	 * @param qddm 渠道代码
	 * @param flag 标识 0--临时二维码    1---永久二维码   0时填写渠道代码  1时填写渠道名称
	 */
	public static void getErweima(String appId,String appSecret,String qdmc,int qddm,String flag){
		
		// 调用接口获取凭证
		Token token = CommonUtil.getToken(appId, appSecret);
		String accessToken = token.getAccessToken();
		String url = erweima_create_url.replace("ACCESS_TOKEN", accessToken);
		
		//组织json字符串
		HashMap scene = new HashMap();
		if("0".equals(flag)){
			scene.put("scene_id", qddm);//设置不同的代码代表不同的公司渠道
		}else if("1".equals(flag)){
			scene.put("scene_str", qdmc);//设置不同的代码代表不同的公司渠道
		}
		
		HashMap action_info = new HashMap();
		action_info.put("scene", scene);
		
		HashMap menu = new HashMap();
		//获取临时二维码时放开下面一行的注释
		if("0".equals(flag)){//0---临时二维码  1---永久二维码
			menu.put("expire_seconds", 604800);
			menu.put("action_name", "QR_SCENE");
		}else if ("1".equals(flag)){
			menu.put("action_name", "QR_LIMIT_STR_SCENE");
		}
		
		menu.put("action_info", action_info);
		
		
		String jsonMenu = JSONObject.fromObject(menu).toString();
		System.out.println("jsonMenu:"+jsonMenu);
		// 发起POST请求创建菜单
		JSONObject jsonObject = CommonUtil.httpsRequest(url, "POST", jsonMenu);
		
		if (null != jsonObject){
			String ticket = jsonObject.getString("ticket");
			String target_url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=";
			try {
				pic(target_url,ticket,String.valueOf(qdmc));
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
		}catch (Exception e) { 
			System.out.println("保存失败"); 
			e.printStackTrace(); 
		} 
	}

}
