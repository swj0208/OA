package com.yc.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Users  extends CommonBean implements Serializable {

	private static final long serialVersionUID = -8608252383657396863L;
	private Integer uid;
	private String uname;
	private String upwd;
	private String sex;
	private String photo;
	private Date entrytime;
	private String tel;
	private String email;
	private String qq;
	private Date birthday;
	private String address;
	private Integer did;
	private String ustatus;
	private Integer gid;
	
	
	private String department;
	private String gname;
	
	private Integer perid;
	private String pername;
	
	public String getPername() {
		return pername;
	}

	public void setPername(String pername) {
		this.pername = pername;
	}

	public Integer getPerid() {
		return perid;
	}

	public void setPerid(Integer perid) {
		this.perid = perid;
	}

	private Permission permissions;

	

	public Permission getPermissions() {
		return permissions;
	}

	public void setPermissions(Permission permissions) {
		this.permissions = permissions;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Date getEntrytime() {
		return entrytime;
	}

	public void setEntrytime(Date entrytime) {
		this.entrytime = entrytime;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public String getUstatus() {
		return ustatus;
	}

	public void setUstatus(String ustatus) {
		this.ustatus = ustatus;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	@Override
	public String toString() {
		return "Users [uid=" + uid + ", uname=" + uname + ", upwd=" + upwd + ", sex=" + sex + ", photo=" + photo
				+ ", entrytime=" + entrytime + ", tel=" + tel + ", email=" + email + ", qq=" + qq + ", birthday="
				+ birthday + ", address=" + address + ", did=" + did + ", ustatus=" + ustatus + ", gid=" + gid
				+ ", department=" + department + ", gname=" + gname + ", perid=" + perid + ", permissions="
				+ permissions + "]";
	}

	
	
}
