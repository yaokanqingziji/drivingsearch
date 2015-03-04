package com.weixin.course.message.resp;

/**
 * 图片消息
 * 
* @author wuzhe
 * @date 2015-02-28
 */
public class ImageMessage extends BaseMessage {
	// 图片
	private Image Image;

	public Image getImage() {
		return Image;
	}

	public void setImage(Image image) {
		Image = image;
	}
}
