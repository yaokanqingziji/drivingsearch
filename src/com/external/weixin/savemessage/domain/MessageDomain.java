package com.external.weixin.savemessage.domain;


public class MessageDomain {
	private  String zjid;
	private String wxid;
	private String message;
	
	public String getZjid() {
		return zjid;
	}
	public void setZjid(String zjid) {
		this.zjid = zjid;
	}
	public String getWxid() {
		return wxid;
	}
	public void setWxid(String wxid) {
		this.wxid = wxid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

}
