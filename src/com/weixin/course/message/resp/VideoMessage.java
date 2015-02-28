package com.weixin.course.message.resp;

/**
 * 视频消息
 * 
* @author wuzhe
 * @date 2015-02-28
 */
public class VideoMessage extends BaseMessage {
	// 视频
	private Video Video;

	public Video getVideo() {
		return Video;
	}

	public void setVideo(Video video) {
		Video = video;
	}
}
