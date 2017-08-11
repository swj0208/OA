package com.yc.bean;

import java.io.Serializable;

public class Notice extends CommonBean implements Serializable {

	private static final long serialVersionUID = -3042360926416388190L;

	private Integer nid;
	private String content;
	private Integer nweight;
	private String createtime;
	private Integer did;
	private Integer gid;
	private Integer uid;
	
	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getNweight() {
		return nweight;
	}

	public void setNweight(Integer nweight) {
		this.nweight = nweight;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
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
		return "Notice [nid=" + nid + ", content=" + content + ", nweight=" + nweight + ", createtime=" + createtime
				+ ", did=" + did + ", gid=" + gid + ", uid=" + uid + "]";
	}

}
