package com.sh.airbnb.reservation.model.dto;

import java.sql.Date;

public class SalesData {

	
	private int salesNo;
	private int totalPrice;
	private Date regDate;
	private String reNo;
	public SalesData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SalesData(int salesNo, int totalPrice, Date regDate, String reNo) {
		super();
		this.salesNo = salesNo;
		this.totalPrice = totalPrice;
		this.regDate = regDate;
		this.reNo = reNo;
	}

	public int getSalesNo() {
		return salesNo;
	}
	public void setSalesNo(int salesNo) {
		this.salesNo = salesNo;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getReNo() {
		return reNo;
	}
	public void setReNo(String reNo) {
		this.reNo = reNo;
	}

	@Override
	public String toString() {
		return "SalesData [salesNo=" + salesNo + ", totalPrice=" + totalPrice + ", regDate=" + regDate + ", reNo="
				+ reNo + "]";
	}
	
	
	
	
	
	
	
	
}


