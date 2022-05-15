package com.moneybook.dto;

import java.io.Serializable;

public class MemoDTO implements Serializable {

	private static final long serializableUID = -4274700572038677000L;
	
	private String id;
	private String title;
	private String content;
	private String registDay;
	private int idx;
	
	public MemoDTO() {
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRegistDay() {
		return registDay;
	}
	
	public void setRegistDay(String registDay) {
		this.registDay = registDay;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	
}
