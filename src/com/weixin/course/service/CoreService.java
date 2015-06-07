package com.weixin.course.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

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

			// 回复文本消息
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			
			List<Article> articleList1 = new ArrayList<Article>();
			
			NewsMessage newsMessage1 = new NewsMessage();
			newsMessage1.setToUserName(fromUserName);
			newsMessage1.setFromUserName(toUserName);
			newsMessage1.setCreateTime(new Date().getTime());
			newsMessage1.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
			
			Article article41 = new Article();
			article41.setTitle("了解小来来");
			article41.setDescription("");
			article41.setPicUrl("http://115.28.128.212/drivingsearch/pages/image/first.jpg");
			article41.setUrl("http://115.28.128.212/drivingsearch/pages/html/lailai.jsp");

			Article article5 = new Article();
			article5.setTitle("代驾市场现状");
			article5.setDescription("");
			article5.setPicUrl("http://115.28.128.212/drivingsearch/pages/image/second.jpg");
			article5.setUrl("http://115.28.128.212/drivingsearch/pages/html/djxz.jsp");

			Article article6 = new Article();
			article6.setTitle("远离酒驾");
			article6.setDescription("");
			article6.setPicUrl("http://115.28.128.212/drivingsearch/pages/image/third.jpg");
			article6.setUrl("http://115.28.128.212/drivingsearch/pages/html/bkc.jsp");

			articleList1.add(article41);
			articleList1.add(article5);
			articleList1.add(article6);
			newsMessage1.setArticleCount(articleList1.size());
			newsMessage1.setArticles(articleList1);
			respContent = MessageUtil.messageToXml(newsMessage1);
			
			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				
				// 接收用户发送的文本消息内容
				String content = requestMap.get("Content");

				// 创建图文消息
				NewsMessage newsMessage = new NewsMessage();
				newsMessage.setToUserName(fromUserName);
				newsMessage.setFromUserName(toUserName);
				newsMessage.setCreateTime(new Date().getTime());
				newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);

				List<Article> articleList = new ArrayList<Article>();
				/*
				// 单图文消息
				if ("1".equals(content)) {
					Article article = new Article();
					article.setTitle("微信公众帐号开发教程Java版");
					article.setDescription("方便PICC信息技术人员以及公司其他用户交流运维经验、提供运维技术支持、提高运维服务相应速度和服务质量。");
					article.setPicUrl("http://0.xiaoqrobot.duapp.com/images/avatar_liufeng.jpg");
					article.setUrl("http://blog.csdn.net/lyq8479");
					articleList.add(article);
					// 设置图文消息个数
					newsMessage.setArticleCount(articleList.size());
					// 设置图文消息包含的图文集合
					newsMessage.setArticles(articleList);
					// 将图文消息对象转换成xml字符串
					respContent = MessageUtil.messageToXml(newsMessage);
				}
				// 单图文消息---不含图片
				else if ("2".equals(content)) {
					Article article = new Article();
					article.setTitle("微信公众帐号开发教程Java版");
					// 图文消息中可以使用QQ表情、符号表情
					article.setDescription("柳峰，80后，"
							+ "，微信公众帐号开发经验4个月。为帮助初学者入门，特推出此系列连载教程，也希望借此机会认识更多同行！\n\n目前已推出教程共12篇，包括接口配置、消息封装、框架搭建、QQ表情发送、符号表情发送等。\n\n后期还计划推出一些实用功能的开发讲解，例如：天气预报、周边搜索、聊天功能等。");
					// 将图片置为空
					article.setPicUrl("");
					article.setUrl("http://blog.csdn.net/lyq8479");
					articleList.add(article);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respContent = MessageUtil.messageToXml(newsMessage);
				}
				// 多图文消息
				else if ("3".equals(content)) {
					Article article1 = new Article();
					article1.setTitle("微信公众帐号开发教程\n引言");
					article1.setDescription("");
					article1.setPicUrl("http://ecma.bdimg.com/lego-mat/ae1e7356921c0925a3df77f6c2756566_660_200.jpg");
					article1.setUrl("http://blog.csdn.net/lyq8479/article/details/8937622");

					Article article2 = new Article();
					article2.setTitle("第2篇\n微信公众帐号的类型");
					article2.setDescription("");
					article2.setPicUrl("http://avatar.csdn.net/1/4/A/1_lyq8479.jpg");
					article2.setUrl("http://blog.csdn.net/lyq8479/article/details/8941577");

					Article article3 = new Article();
					article3.setTitle("第3篇\n开发模式启用及接口配置");
					article3.setDescription("");
					article3.setPicUrl("http://avatar.csdn.net/1/4/A/1_lyq8479.jpg");
					article3.setUrl("http://blog.csdn.net/lyq8479/article/details/8944988");

					articleList.add(article1);
					articleList.add(article2);
					articleList.add(article3);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respContent = MessageUtil.messageToXml(newsMessage);
				}
				// 多图文消息---首条消息不含图片
				else if ("4".equals(content)) {
					Article article1 = new Article();
					article1.setTitle("微信公众帐号开发教程Java版");
					article1.setDescription("");
					// 将图片置为空
					article1.setPicUrl("");
					article1.setUrl("http://blog.csdn.net/lyq8479");

					Article article2 = new Article();
					article2.setTitle("第4篇\n消息及消息处理工具的封装");
					article2.setDescription("");
					article2.setPicUrl("http://avatar.csdn.net/1/4/A/1_lyq8479.jpg");
					article2.setUrl("http://blog.csdn.net/lyq8479/article/details/8949088");

					Article article3 = new Article();
					article3.setTitle("第5篇\n各种消息的接收与响应");
					article3.setDescription("");
					article3.setPicUrl("http://avatar.csdn.net/1/4/A/1_lyq8479.jpg");
					article3.setUrl("http://blog.csdn.net/lyq8479/article/details/8952173");

					Article article4 = new Article();
					article4.setTitle("第6篇\n文本消息的内容长度限制揭秘");
					article4.setDescription("");
					article4.setPicUrl("http://avatar.csdn.net/1/4/A/1_lyq8479.jpg");
					article4.setUrl("http://blog.csdn.net/lyq8479/article/details/8967824");

					articleList.add(article1);
					articleList.add(article2);
					articleList.add(article3);
					articleList.add(article4);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respContent = MessageUtil.messageToXml(newsMessage);
				}
				// 多图文消息---最后一条消息不含图片
				else if ("5".equals(content)) {
					Article article1 = new Article();
					article1.setTitle("第7篇\n文本消息中换行符的使用");
					article1.setDescription("");
					article1.setPicUrl("http://0.xiaoqrobot.duapp.com/images/avatar_liufeng.jpg");
					article1.setUrl("http://blog.csdn.net/lyq8479/article/details/9141467");

					Article article2 = new Article();
					article2.setTitle("第8篇\n文本消息中使用网页超链接");
					article2.setDescription("");
					article2.setPicUrl("http://avatar.csdn.net/1/4/A/1_lyq8479.jpg");
					article2.setUrl("http://blog.csdn.net/lyq8479/article/details/9157455");

					Article article3 = new Article();
					article3.setTitle("如果觉得文章对你有所帮助，请通过博客留言或关注微信公众帐号xiaoqrobot来支持柳峰！");
					article3.setDescription("");
					// 将图片置为空
					article3.setPicUrl("");
					article3.setUrl("http://blog.csdn.net/lyq8479");

					articleList.add(article1);
					articleList.add(article2);
					articleList.add(article3);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respContent = MessageUtil.messageToXml(newsMessage);
				}else if("6".equals(content)){
					Article article = new Article();
					article.setTitle("代驾搜索服务");
					article.setDescription("代驾搜索服务");
					// 将图片置为空
					article.setPicUrl("");
					article.setUrl("http://115.28.128.212/drivingsearch");
					articleList.add(article);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respContent = MessageUtil.messageToXml(newsMessage);
				}
				*/
				
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("十分感谢！小来来已收到您反馈的问题。").append("\n");
				contentMsg.append("如果刚刚不是反馈问题，您可以点击屏幕下方菜单进入更多功能！").append("\n");
				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);
				
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {// 图片消息
				
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是图片消息!").append("\n");
				contentMsg.append("目前系统暂不支持图片消息!").append("\n");
				
				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);
				
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {// 语音消息
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是语音消息!").append("\n");
				contentMsg.append("目前系统暂不支持语音消息!").append("\n");
				
				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);
				
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VIDEO)) {// 视频消息
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是视频消息!").append("\n");
				contentMsg.append("目前系统暂不支持视频消息!").append("\n");
				
				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);
				
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {// 地理位置消息
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是地理位置消息!").append("\n");
				contentMsg.append("目前系统暂不支持地理位置消息!").append("\n");
				
				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);
				
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {// 链接消息
				StringBuffer contentMsg = new StringBuffer();
				contentMsg.append("您发送的是链接消息!").append("\n");
				contentMsg.append("目前系统暂不支持链接消息!").append("\n");
				
				textMessage.setContent(contentMsg.toString());
				// 将文本消息对象转换成xml字符串
				respContent = MessageUtil.messageToXml(textMessage);
				
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {// 事件推送
				// 事件类型
				String eventType = requestMap.get("Event");
				// 关注
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					//
				}else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {// 取消关注
					// TODO 取消订阅后用户不会再收到公众账号发送的消息，因此不需要回复
				}else if (eventType.equals(MessageUtil.EVENT_TYPE_SCAN)) {// 扫描带参数二维码
					// TODO 处理扫描带参数二维码事件
				}else if (eventType.equals(MessageUtil.EVENT_TYPE_LOCATION)) {// 上报地理位置
					// TODO 处理上报地理位置事件
				}else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {// 自定义菜单
					// 事件KEY值，与创建菜单时的key值对应
					String eventKey = requestMap.get("EventKey");
					// 根据key值判断用户点击的按钮
					if (eventKey.equals("oschina")) {
						Article article = new Article();
						article.setTitle("开源中国");
						article.setDescription("开源中国社区成立于2008年8月，是目前中国最大的开源技术社区。\n\n开源中国的目的是为中国的IT技术人员提供一个全面的、快捷更新的用来检索开源软件以及交流开源经验的平台。\n\n经过不断的改进,目前开源中国社区已经形成了由开源软件库、代码分享、资讯、讨论区和博客等几大频道内容。");
						article.setPicUrl("");
						article.setUrl("http://m.oschina.net");
						List<Article> articleList = new ArrayList<Article>();
						articleList.add(article);
						// 创建图文消息
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respContent = MessageUtil.messageToXml(newsMessage);
					} else if (eventKey.equals("iteye")) {
						textMessage.setContent("ITeye即创办于2003年9月的JavaEye,从最初的以讨论Java技术为主的技术论坛，已经逐渐发展成为涵盖整个软件开发领域的综合性网站。\n\nhttp://www.iteye.com");
						respContent = MessageUtil.messageToXml(textMessage);
					}else if(eventKey.equals("yhhd")){//优惠活动返回文本消息
						
						StringBuffer contentMsg = new StringBuffer();
						contentMsg.append("优惠活动正在筹备中，敬请期待!").append("\n");
			
						textMessage.setContent(contentMsg.toString());
						// 将文本消息对象转换成xml字符串
						respContent = MessageUtil.messageToXml(textMessage);
					}else if(eventKey.equals("wtfk")){//问题反馈返回文本消息
						
						StringBuffer contentMsg = new StringBuffer();
						contentMsg.append("非常感谢您的关注，请以“反馈”两字开头+您反馈的内容进行问题反馈。例如：").append("\n");
						contentMsg.append("反馈：我觉着需要提供更多的代驾公司以供选择。").append("\n");
						textMessage.setContent(contentMsg.toString());
						// 将文本消息对象转换成xml字符串
						respContent = MessageUtil.messageToXml(textMessage);
					}else if(eventKey.equals("djhz")){//代驾合作返回文本消息
						
						StringBuffer contentMsg = new StringBuffer();
						contentMsg.append("代驾合作规定正在商讨制作中，敬请期待!").append("\n");
			
						textMessage.setContent(contentMsg.toString());
						// 将文本消息对象转换成xml字符串
						respContent = MessageUtil.messageToXml(textMessage);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respContent;
	}
}
