package com.yc.bean;

import java.io.Serializable;

public class Message extends CommonBean implements Serializable {

	private static final long serialVersionUID = -3042360926416388190L;

	private Integer mid;
	private String content;
	private Integer mweight;
	private String createtime;
	private Integer fid;
	private Integer did;
	private Integer gid;
	private Integer uid;

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getMweight() {
		return mweight;
	}

	public void setMweight(Integer mweight) {
		this.mweight = mweight;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "Message [mid=" + mid + ", content=" + content + ", mweight=" + mweight + ", createtime=" + createtime
				+ ", fid=" + fid + ", did=" + did + ", gid=" + gid + ", uid=" + uid + "]";
	}

}
