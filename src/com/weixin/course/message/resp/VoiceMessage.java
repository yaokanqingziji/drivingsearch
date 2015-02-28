package com.weixin.course.message.resp;

/**
 * 语音消息
 * 
* @author wuzhe
 * @date 2015-02-28
 */
public class VoiceMessage extends BaseMessage {
	// 语音
	private Voice Voice;

	public Voice getVoice() {
		return Voice;
	}

	public void setVoice(Voice voice) {
		Voice = voice;
	}
}
