package com.moneybook.dto;

import java.io.Serializable;

public class CommunityDTO implements Serializable {

	private static final long serializableUID = -4274700572038677000L;
	
	private String id;
	private String title;
	private String content;
	private String registDay;
	private int idx;
	private int likeNum;
	private int dislikeNum;
	private int readNum;
	private int ip;
	private int modified;
	private int commentNum;
	

	public CommunityDTO() {
		super();
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

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getDislikeNum() {
		return dislikeNum;
	}

	public void setDislikeNum(int dislikeNum) {
		this.dislikeNum = dislikeNum;
	}

	public int getReadNum() {
		return readNum;
	}

	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}

	public int getIp() {
		return ip;
	}

	public void setIp(int ip) {
		this.ip = ip;
	}

	public int getModified() {
		return modified;
	}

	public void setModified(int modified) {
		this.modified = modified;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	
	
}
