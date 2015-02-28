package com.weixin.course.message.resp;

/**
 * 音乐消息
 * 
* @author wuzhe
 * @date 2015-02-28
 */
public class MusicMessage extends BaseMessage {
	// 音乐
	private Music Music;

	public Music getMusic() {
		return Music;
	}

	public void setMusic(Music music) {
		Music = music;
	}
}
