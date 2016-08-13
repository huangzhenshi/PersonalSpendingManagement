package account_huang.entity;

import java.io.Serializable;

public class Card implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -9185211512873232224L;
	private String id;
	private String holderName;
	private String bankName;
	private String accountNumber;
	private Integer balance;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHolderName() {
		return holderName;
	}
	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public Integer getBalance() {
		return balance;
	}
	public void setBalance(Integer balance) {
		this.balance = balance;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getReserveField1() {
		return reserveField1;
	}
	public void setReserveField1(String reserveField1) {
		this.reserveField1 = reserveField1;
	}
	public String getReserveField2() {
		return reserveField2;
	}
	public void setReserveField2(String reserveField2) {
		this.reserveField2 = reserveField2;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private String updateTime;
	private String location;
	private String reserveField1;
	private String reserveField2;
	private String remark;
	private String password;


}
