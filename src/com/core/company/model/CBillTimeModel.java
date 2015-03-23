package com.core.company.model;


/**
 * @Description: 代驾公司当前有效的计费方案（以时间段区分）
 * @author ldw
 * @date 2015年3月21日 下午10:51:12
 */
public class CBillTimeModel {
	private String jfbbid;
	private String jfsjdid;
	private String qssj;
	private String zzsj;
	private String bz;

	public String getJfbbid() {
		return jfbbid;
	}

	public void setJfbbid(String jfbbid) {
		this.jfbbid = jfbbid;
	}

	public String getJfsjdid() {
		return jfsjdid;
	}

	public void setJfsjdid(String jfsjdid) {
		this.jfsjdid = jfsjdid;
	}

	public String getQssj() {
		return qssj;
	}

	public void setQssj(String qssj) {
		this.qssj = qssj;
	}

	public String getZzsj() {
		return zzsj;
	}

	public void setZzsj(String zzsj) {
		this.zzsj = zzsj;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

}
