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
	private Integer fromuid;
	
	private String fromuname;
	private String touname;
	private String fname;
	private String gname;
	private String department;
	
	

	public String getFromuname() {
		return fromuname;
	}

	public void setFromuname(String fromuname) {
		this.fromuname = fromuname;
	}

	public String getTouname() {
		return touname;
	}

	public void setTouname(String touname) {
		this.touname = touname;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Integer getFromuid() {
		return fromuid;
	}

	public void setFromuid(Integer fromuid) {
		this.fromuid = fromuid;
	}

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
				+ ", fid=" + fid + ", did=" + did + ", gid=" + gid + ", uid=" + uid + ", fromuid=" + fromuid
				+ ", fromuname=" + fromuname + ", touname=" + touname + ", fname=" + fname + ", gname=" + gname
				+ ", department=" + department + "]";
	}

}
