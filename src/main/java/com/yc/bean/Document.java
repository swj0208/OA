package com.yc.bean;

import java.io.Serializable;

public class Document extends CommonBean implements Serializable {

	private static final long serialVersionUID = 6734470747085887477L;

	private Integer doid;
	private String dotitle;
	private String docontent;
	private Integer dofromuid;
	private Integer dotouid;
	private Integer douid;   //实行人
	private String dotime;
	private Integer dofid;
	private String dostatus;
	
	
	private String funame;
	private String douname;
	private String tuname;
	private String fname;
	private String docomment;
	
	private Integer perid;
	
	
	
	
	public String getDouname() {
		return douname;
	}

	public void setDouname(String douname) {
		this.douname = douname;
	}

	public Integer getDouid() {
		return douid;
	}

	public void setDouid(Integer douid) {
		this.douid = douid;
	}

	public Integer getPerid() {
		return perid;
	}

	public void setPerid(Integer perid) {
		this.perid = perid;
	}

	public String getDocomment() {
		return docomment;
	}

	public void setDocomment(String docomment) {
		this.docomment = docomment;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFuname() {
		return funame;
	}

	public void setFuname(String funame) {
		this.funame = funame;
	}

	public String getTuname() {
		return tuname;
	}

	public void setTuname(String tuname) {
		this.tuname = tuname;
	}

	public Integer getDoid() {
		return doid;
	}

	public void setDoid(Integer doid) {
		this.doid = doid;
	}

	public String getDotitle() {
		return dotitle;
	}

	public void setDotitle(String dotitle) {
		this.dotitle = dotitle;
	}

	public String getDocontent() {
		return docontent;
	}

	public void setDocontent(String docontent) {
		this.docontent = docontent;
	}

	public Integer getDofromuid() {
		return dofromuid;
	}

	public void setDofromuid(Integer dofromuid) {
		this.dofromuid = dofromuid;
	}

	public Integer getDotouid() {
		return dotouid;
	}

	public void setDotouid(Integer dotouid) {
		this.dotouid = dotouid;
	}

	public String getDotime() {
		return dotime;
	}

	public void setDotime(String dotime) {
		this.dotime = dotime;
	}

	public Integer getDofid() {
		return dofid;
	}

	public void setDofid(Integer dofid) {
		this.dofid = dofid;
	}

	public String getDostatus() {
		return dostatus;
	}

	public void setDostatus(String dostatus) {
		this.dostatus = dostatus;
	}

	@Override
	public String toString() {
		return "Document [doid=" + doid + ", dotitle=" + dotitle + ", docontent=" + docontent + ", dofromuid="
				+ dofromuid + ", dotouid=" + dotouid + ", douid=" + douid + ", dotime=" + dotime + ", dofid=" + dofid
				+ ", dostatus=" + dostatus + ", funame=" + funame + ", douname=" + douname + ", tuname=" + tuname
				+ ", fname=" + fname + ", docomment=" + docomment + ", perid=" + perid + "]";
	}

	
	
}
