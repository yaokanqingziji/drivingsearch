package com.weixin.course.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.search.base.SearchGlobalNames;
import com.weixin.course.message.resp.Article;
import com.weixin.course.message.resp.NewsMessage;
import com.weixin.course.message.resp.TextMessage;
import com.weixin.course.util.MessageUtil;

/**
 * 核心服务类
 * 
 * @author wuzhe
 * @date 2015-02-28
 */
public class CoreService {
	
	
	private static void httpClientFromGet(String url) throws IOException {
		URL getUrl = new URL(url);
		HttpURLConnection connection = (HttpURLConnection) getUrl
				.openConnection();
		connection.connect();
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				connection.getInputStream()));

		reader.close();
		// 断开连接
		connection.disconnect();
	}

	/**
	 * 处理微信发来的请求
	 * 
	 * @param request
	 * @return xml
	 */
	public static String processRequest(HttpServletRequest request) {
		
		// xml格式的消息数据
		String respContent = null;
		try {
			// 调用parseXml方法解析请求消息
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			// 发送方帐号
			String fromUserName = requestMap.get("FromUserName");
			// 开发者微信号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");

			// 时间
			String CreateTime = requestMap.get("CreateTime");
			
			// 回复文本消息
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			

			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {

				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("十分感谢！小来来已收到您反馈的问题。").append("\n");
				contentMsg.append("如果刚刚不是反馈问题，您可以点击屏幕下方菜单进入更多功能！").append("\n");
				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);

			} else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {// 图片消息

				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是图片消息!").append("\n");
				contentMsg.append("目前系统暂不支持图片消息!").append("\n");

				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);

			} else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {// 语音消息
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是语音消息!").append("\n");
				contentMsg.append("目前系统暂不支持语音消息!").append("\n");

				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);

			} else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VIDEO)) {// 视频消息
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是视频消息!").append("\n");
				contentMsg.append("目前系统暂不支持视频消息!").append("\n");

				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);

			} else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {// 地理位置消息
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是地理位置消息!").append("\n");
				contentMsg.append("目前系统暂不支持地理位置消息!").append("\n");

				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);

			} else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {// 链接消息
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是链接消息!").append("\n");
				contentMsg.append("目前系统暂不支持链接消息!").append("\n");

				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);

			} else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {// 事件推送
				// 事件类型
				String eventType = requestMap.get("Event");
				// 关注
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {

					String date = com.weixin.course.util.SignUtil.formatTime(CreateTime);
					String year = date.substring(0,4);
					String month = date.substring(5,7);
					String day = date.substring(8,10);
					String EventKey = requestMap.get("EventKey");
					
					String url = "http://" + SearchGlobalNames.serverIp + ":"
							+ SearchGlobalNames.serverPort
							+ "/drivingsearch/scene/addScene.do?scene="+EventKey.substring(8)
							+ "&year="+year+"&month="+month+"&day="+day;
					try {
						httpClientFromGet(url);
					} catch (IOException e1) {
						e1.printStackTrace();
					}
					
					//-----------------------------发送关注消息开始
					

					List<Article> articleList1 = new ArrayList<Article>();

					NewsMessage newsMessage1 = new NewsMessage();
					newsMessage1.setToUserName(fromUserName);
					newsMessage1.setFromUserName(toUserName);
					newsMessage1.setCreateTime(new Date().getTime());
					newsMessage1.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);

					Article article3 = new Article();
					article3.setTitle("当前平台仅为内部测试使用，不参与任何商业用途。其中涉及到的代驾公司仅为参考信息。特此声明：该平台不承担任何法律责任");
					article3.setDescription("");
					article3.setPicUrl("");
					article3.setUrl("");
					
					Article article2 = new Article();
					article2.setTitle("特此声明：该平台不承担任何法律责任");
					article2.setDescription("");
					article2.setPicUrl("");
					article2.setUrl("");
					
					Article article41 = new Article();
					article41.setTitle("了解小来来");
					article41.setDescription("本系统为测试系统，所有数据均为伪造，如有雷同，纯属巧合！");
					article41
							.setPicUrl("http://115.28.180.16/drivingsearch/pages/image/first.jpg");
					article41
							.setUrl("http://115.28.180.16/drivingsearch/pages/html/lailai.jsp");

					Article article5 = new Article();
					article5.setTitle("代驾市场现状");
					article5.setDescription("");
					article5.setPicUrl("http://115.28.180.16/drivingsearch/pages/image/second.jpg");
					article5.setUrl("http://115.28.180.16/drivingsearch/pages/html/djxz.jsp");

					Article article6 = new Article();
					article6.setTitle("远离酒驾");
					article6.setDescription("");
					article6.setPicUrl("http://115.28.180.16/drivingsearch/pages/image/third.jpg");
					article6.setUrl("http://115.28.180.16/drivingsearch/pages/html/bkc.jsp");

					articleList1.add(article2);
					articleList1.add(article3);
					articleList1.add(article41);
					articleList1.add(article5);
					articleList1.add(article6);
					newsMessage1.setArticleCount(articleList1.size());
					newsMessage1.setArticles(articleList1);
					respContent = MessageUtil.messageToXml(newsMessage1);
					
					//-----------------------------发送关注消息结束

				} else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {// 取消关注
					// TODO 取消订阅后用户不会再收到公众账号发送的消息，因此不需要回复
				} else if (eventType.equals(MessageUtil.EVENT_TYPE_SCAN)) {// 扫描带参数二维码
					// TODO 处理扫描带参数二维码事件
				} else if (eventType.equals(MessageUtil.EVENT_TYPE_LOCATION)) {// 上报地理位置
					// TODO 处理上报地理位置事件
				} else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {// 自定义菜单
					// 事件KEY值，与创建菜单时的key值对应
					String eventKey = requestMap.get("EventKey");
					// 根据key值判断用户点击的按钮
					if (eventKey.equals("yhhd")) {// 优惠活动返回文本消息

						StringBuffer contentMsg = new StringBuffer();
						contentMsg.append("优惠活动正在筹备中，敬请期待!").append("\n");

						textMessage.setContent(contentMsg.toString());
						// 将文本消息对象转换成xml字符串
						respContent = MessageUtil.messageToXml(textMessage);
					} else if (eventKey.equals("wtfk")) {// 问题反馈返回文本消息

						StringBuffer contentMsg = new StringBuffer();
						contentMsg.append(
								"非常感谢您的关注，请以“反馈”两字开头+您反馈的内容进行问题反馈。例如：").append(
								"\n");
						contentMsg.append("反馈：我觉着需要提供更多的代驾公司以供选择。")
								.append("\n");
						textMessage.setContent(contentMsg.toString());
						// 将文本消息对象转换成xml字符串
						respContent = MessageUtil.messageToXml(textMessage);
					} else if (eventKey.equals("djhz")) {// 代驾合作返回文本消息

						StringBuffer contentMsg = new StringBuffer();
						contentMsg.append("代驾合作规定正在商讨制作中，敬请期待!").append("\n");

						textMessage.setContent(contentMsg.toString());
						// 将文本消息对象转换成xml字符串
						respContent = MessageUtil.messageToXml(textMessage);
					}else if (eventKey.equals("yjjdj")) {// 一键叫代驾

						StringBuffer contentMsg = new StringBuffer();
						contentMsg.append("5公里内请拨打电话:1395310xxxx").append("\n");
						contentMsg.append("5公里外请拨打电话:1395310xxxx").append("\n");

						textMessage.setContent(contentMsg.toString());
						// 将文本消息对象转换成xml字符串
						respContent = MessageUtil.messageToXml(textMessage);
					}else if (eventKey.equals("laigedaijia")) {// 一键叫代驾

						Article article = new Article();
						article.setTitle("点击进入 来个代驾代驾搜索服务平台");
						article.setDescription("");
						article.setPicUrl("");
						article.setUrl("http://115.28.180.16/drivingsearch?uid="+fromUserName);
						List<Article> articleList = new ArrayList<Article>();
						articleList.add(article);
						// 创建图文消息
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage
								.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respContent = MessageUtil.messageToXml(newsMessage);
						
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return respContent;
	}
}
