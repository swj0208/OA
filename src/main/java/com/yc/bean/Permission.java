package com.yc.bean;

import java.io.Serializable;

public class Permission extends CommonBean implements Serializable {

	private static final long serialVersionUID = -5043834247875373480L;
	
	private Integer perid;
	private String pername;
	private Integer uid;
	
	
	private Users users;

	
	
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getPerid() {
		return perid;
	}

	public void setPerid(Integer perid) {
		this.perid = perid;
	}

	public String getPername() {
		return pername;
	}

	public void setPername(String pername) {
		this.pername = pername;
	}

	
	
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Permission [perid=" + perid + ", pername=" + pername + ", users=" + users + "]";
	}
	
	

}
