package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

public class Notice extends CommonBean implements Serializable {

	private static final long serialVersionUID = -3042360926416388190L;

	private Integer nid;
	private String ntitle;
	private String ncontent;
	private String ntype;
	private Date publictime;
	private Integer uid;
	private String uname;
	
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Integer getNid() {
		return nid;
	}
	public void setNid(Integer nid) {
		this.nid = nid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNtype() {
		return ntype;
	}
	public void setNtype(String ntype) {
		this.ntype = ntype;
	}
	public Date getPublictime() {
		return publictime;
	}
	public void setPublictime(Date publictime) {
		this.publictime = publictime;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", ntype=" + ntype
				+ ", publictime=" + publictime + ", uid=" + uid + "]";
	}
	public Notice(Integer nid, String ntitle, String ncontent, String ntype, Date publictime, Integer uid) {
		super();
		this.nid = nid;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ntype = ntype;
		this.publictime = publictime;
		this.uid = uid;
	}
	public Notice() {
		super();
	}
	
	

}
