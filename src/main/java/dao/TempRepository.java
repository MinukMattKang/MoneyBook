package dao;

import java.util.ArrayList;

import dto.Account;

public class TempRepository {

	private ArrayList<Account> listOfAccounts = new ArrayList<Account>();
	private static TempRepository instance = new TempRepository();
	
	public TempRepository() {
		Account account1 = new Account();
		account1.setBank("부산은행");
		account1.setType("입금");
		account1.setAmount(10000);
		account1.setDatatime("2022/04/12");
		account1.setAccountNumber("301-1234-56-7890");
		
		Account account2 = new Account();
		account2.setBank("우리은행");
		account2.setType("출금");
		account2.setAmount(-5000);
		account2.setDatatime("2022/04/12");
		account2.setAccountNumber("248-14-546-7890");
		
		listOfAccounts.add(account1);
		listOfAccounts.add(account2);
	}
	
	public ArrayList<Account> getAllAccounts() {
		return listOfAccounts;
	}
	
	public static TempRepository getInstance() {
		return instance;
	}
	
	public void addTransitionHistory(Account account) {
		listOfAccounts.add(account);
	}
}
