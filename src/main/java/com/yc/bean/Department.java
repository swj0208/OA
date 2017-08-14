package com.yc.bean;

import java.io.Serializable;

public class Department implements Serializable {

	private static final long serialVersionUID = -423855747735706343L;

	private Integer did;
	private String department;

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}


	@Override
	public String toString() {
		return "Department [did=" + did + ", department=" + department + "]";
	}

}
