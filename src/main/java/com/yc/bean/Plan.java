package com.yc.bean;

import java.io.Serializable;
import java.util.List;

public class Plan extends CommonBean implements Serializable {

	private static final long serialVersionUID = 24222020371131691L;

	private Integer pid;
	private String pname;
	private String content;
	private String timestart;
	private String timelimit;
	private String timeend;
	private String pstatus;
	private Integer gid;

	private String gname;

	private String timefrom;
	private String timeto;

	private List<Users> userlist;

	public Plan(Integer pid, String pname, String content, String timestart, String timelimit, String timeend,
			String pstatus, Integer gid, String gname, String timefrom, String timeto, List<Users> userlist) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.content = content;
		this.timestart = timestart;
		this.timelimit = timelimit;
		this.timeend = timeend;
		this.pstatus = pstatus;
		this.gid = gid;
		this.gname = gname;
		this.timefrom = timefrom;
		this.timeto = timeto;
		this.userlist = userlist;
	}

	public List<Users> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<Users> userlist) {
		this.userlist = userlist;
	}

	public String getTimefrom() {
		return timefrom;
	}

	public void setTimefrom(String timefrom) {
		this.timefrom = timefrom;
	}

	public String getTimeto() {
		return timeto;
	}

	public void setTimeto(String timeto) {
		this.timeto = timeto;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getTimestart() {
		return timestart;
	}

	public void setTimestart(String timestart) {
		this.timestart = timestart;
	}

	public String getTimelimit() {
		return timelimit;
	}

	public void setTimelimit(String timelimit) {
		this.timelimit = timelimit;
	}

	public String getTimeend() {
		return timeend;
	}

	public void setTimeend(String timeend) {
		this.timeend = timeend;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public Plan(Integer pid, String pname, String content, String timestart, String timelimit, String timeend,
			String pstatus, Integer gid, String gname, String timefrom, String timeto) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.content = content;
		this.timestart = timestart;
		this.timelimit = timelimit;
		this.timeend = timeend;
		this.pstatus = pstatus;
		this.gid = gid;
		this.gname = gname;
		this.timefrom = timefrom;
		this.timeto = timeto;
	}

	@Override
	public String toString() {
		return "Plan [pid=" + pid + ", pname=" + pname + ", content=" + content + ", timestart=" + timestart
				+ ", timelimit=" + timelimit + ", timeend=" + timeend + ", pstatus=" + pstatus + ", gid=" + gid
				+ ", gname=" + gname + ", timefrom=" + timefrom + ", timeto=" + timeto + ", userlist=" + userlist + "]";
	}

	public Plan() {
		super();
	}

}
