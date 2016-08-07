package spring_test.entity;

import java.io.Serializable;

public class Property implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8690656326650349483L;
	private String id;
	private String times;
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	private Integer card1;
	private Integer card2;
	private Integer card3;
	private Integer card4;
	private Integer card5;
	private Integer card6;
	private Integer cash;
	private Integer housingFund;
	private Integer alipay;
	private String holderName;
	private Integer creditCard;
	private Integer rent;
	private Integer mortgage;
	private Integer loan1;
	private Integer loan2;
	private String remark;
	public String getHolderName() {
		return holderName;
	}
	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getCard1() {
		return card1;
	}
	public void setCard1(Integer card1) {
		this.card1 = card1;
	}
	public Integer getCard2() {
		return card2;
	}
	public void setCard2(Integer card2) {
		this.card2 = card2;
	}
	public Integer getCard3() {
		return card3;
	}
	public void setCard3(Integer card3) {
		this.card3 = card3;
	}
	public Integer getCard4() {
		return card4;
	}
	public void setCard4(Integer card4) {
		this.card4 = card4;
	}
	public Integer getCard5() {
		return card5;
	}
	public void setCard5(Integer card5) {
		this.card5 = card5;
	}
	public Integer getCard6() {
		return card6;
	}
	public void setCard6(Integer card6) {
		this.card6 = card6;
	}
	public Integer getCash() {
		return cash;
	}
	public void setCash(Integer cash) {
		this.cash = cash;
	}
	public Integer getHousingFund() {
		return housingFund;
	}
	public void setHousingFund(Integer housingFund) {
		this.housingFund = housingFund;
	}
	public Integer getAlipay() {
		return alipay;
	}
	public void setAlipay(Integer alipay) {
		this.alipay = alipay;
	}
	public Integer getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(Integer creditCard) {
		this.creditCard = creditCard;
	}
	public Integer getRent() {
		return rent;
	}
	public void setRent(Integer rent) {
		this.rent = rent;
	}
	public Integer getMortgage() {
		return mortgage;
	}
	public void setMortgage(Integer mortgage) {
		this.mortgage = mortgage;
	}
	public Integer getLoan1() {
		return loan1;
	}
	public void setLoan1(Integer loan1) {
		this.loan1 = loan1;
	}
	public Integer getLoan2() {
		return loan2;
	}
	public void setLoan2(Integer loan2) {
		this.loan2 = loan2;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
