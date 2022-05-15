package com.moneybook.dto;

import java.io.Serializable;

public class CommentDTO implements Serializable {
	
	private static final long serializableUID = -4274700572038677000L;

	private int idx;
	private int commIdx;
	private String id;
	private String content;
	private String registDay;
	private int likeNum;
	private int modified;
	
	public CommentDTO() {
		super();
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCommIdx() {
		return commIdx;
	}

	public void setCommIdx(int commIdx) {
		this.commIdx = commIdx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getModified() {
		return modified;
	}

	public void setModified(int modified) {
		this.modified = modified;
	}
	
	
}
