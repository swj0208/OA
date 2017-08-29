package com.yc.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Chat implements Serializable {

	private static final long serialVersionUID = 5933959423011186839L;

	private Integer chatId;
	private Integer fromId;
	private String fromName;
	private Integer toUid;
	private Integer toDid;
	private String chatText;
	private String chatDate;

	public Integer getChatId() {
		return chatId;
	}

	public void setChatId(Integer chatId) {
		this.chatId = chatId;
	}

	public Integer getFromId() {
		return fromId;
	}

	public void setFromId(Integer fromId) {
		this.fromId = fromId;
	}

	public String getFromName() {
		return fromName;
	}

	public void setFromName(String fromName) {
		this.fromName = fromName;
	}

	public Integer getToUid() {
		return toUid;
	}

	public void setToUid(Integer toUid) {
		this.toUid = toUid;
	}

	public Integer getToDid() {
		return toDid;
	}

	public void setToDid(Integer toDid) {
		this.toDid = toDid;
	}

	public String getChatText() {
		return chatText;
	}

	public void setChatText(String chatText) {
		this.chatText = chatText;
	}

	@Override
	public String toString() {
		return "Chat [chatId=" + chatId + ", fromId=" + fromId + ", fromName=" + fromName + ", toUid=" + toUid
				+ ", toDid=" + toDid + ", chatText=" + chatText + ", chatDate=" + chatDate + "]";
	}

	public Chat(Integer chatId, Integer fromId, String fromName, Integer toUid, Integer toDid, String chatText,
			String chatDate) {
		super();
		this.chatId = chatId;
		this.fromId = fromId;
		this.fromName = fromName;
		this.toUid = toUid;
		this.toDid = toDid;
		this.chatText = chatText;
		this.chatDate = chatDate;
	}

	public String getChatDate() {
		return chatDate;
	}

	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}

	public Chat() {
		super();
	}

}