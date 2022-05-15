package com.moneybook.dto;

import java.io.Serializable;

public class AccountDTO implements Serializable {

	private static final long serializableUID = -4274700572038677000L;
	
	private String bank;
	private String type;
	private int amount;
	private String content;
	private String datetime;
	private String accountNumber;
	
	public AccountDTO() {
		super();
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getContent() {
		return content;
	} 

	public void setContent(String content) {
		this.content = content;
	}

	public String getDatatime() {
		return datetime;
	}

	public void setDatatime(String datetime) {
		this.datetime = datetime;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	
}
