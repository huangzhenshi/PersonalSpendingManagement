package spring_test.entity;

import java.io.Serializable;
import java.util.Date;

public class Record 
implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3953339223696893526L;
	private String id;
	private String times;
	private Integer incomeTotal;
	private Integer profit;
	private Integer costDaily;
	private Integer eating;
	private Integer supermarket;
	private Integer party;
	private Integer rent;
	private Integer loan;
	private Integer book;
	private Integer clothes;
	private Integer traffic;
	private Integer elseCost;
	private String remark;
	private String holderName;

	public String getHolderName() {
		return holderName;
	}
	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}
	/*
	 * comment on column EXPENSE.INCOME_TOTAL is '日收入'; comment on column
	 * EXPENSE.PROFIT is '剩余'; comment on column EXPENSE.COST_DAILY is '开销';
	 * comment on column EXPENSE.EATING is '吃饭和水果'; comment on column
	 * EXPENSE.SUPERMARKET is '超市'; comment on column EXPENSE.PARTY is '聚餐';
	 * comment on column EXPENSE.RENT is '房租'; comment on column EXPENSE.LOAN is
	 * '贷款'; comment on column EXPENSE.TRAFFICEXP is '交通'; comment on column
	 * EXPENSE.ELSECOST is '其他'; comment on column EXPENSE.REMARK is '备注';
	 * comment on column EXPENSE.CLOTHES is '买衣服'; comment on column
	 * EXPENSE.BOOK is '买书'; comment on column EXPENSE.USERNAME is '记录所属用户名';
	 */
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public Integer getIncomeTotal() {
		return incomeTotal;
	}
	public void setIncomeTotal(Integer incomeTotal) {
		this.incomeTotal = incomeTotal;
	}
	public Integer getProfit() {
		return profit;
	}
	public void setProfit(Integer profit) {
		this.profit = profit;
	}
	public Integer getCostDaily() {
		return costDaily;
	}
	public void setCostDaily(Integer costDaily) {
		this.costDaily = costDaily;
	}
	public Integer getEating() {
		return eating;
	}
	public void setEating(Integer eating) {
		this.eating = eating;
	}
	public Integer getSupermarket() {
		return supermarket;
	}
	public void setSupermarket(Integer supermarket) {
		this.supermarket = supermarket;
	}
	public Integer getParty() {
		return party;
	}
	public void setParty(Integer party) {
		this.party = party;
	}
	public Integer getRent() {
		return rent;
	}
	public void setRent(Integer rent) {
		this.rent = rent;
	}
	public Integer getLoan() {
		return loan;
	}
	public void setLoan(Integer loan) {
		this.loan = loan;
	}
	public Integer getTraffic() {
		return traffic;
	}
	public void setTraffic(Integer traffic) {
		this.traffic = traffic;
	}
	public Integer getElseCost() {
		return elseCost;
	}
	public void setElseCost(Integer elseCost) {
		this.elseCost = elseCost;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getBook() {
		return book;
	}
	public void setBook(Integer book) {
		this.book = book;
	}
	public Integer getClothes() {
		return clothes;
	}
	public void setClothes(Integer clothes) {
		this.clothes = clothes;
	}
	
}
