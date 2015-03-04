package com.weixin.course.message.req;

/**
 * 文本消息
 * 
 * @author wuzhe
 * @date 2015-02-28
 */
public class TextMessage extends BaseMessage {
	// 消息内容
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}
