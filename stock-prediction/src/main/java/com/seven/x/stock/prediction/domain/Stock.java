package com.seven.x.stock.prediction.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 股票
 * @author yan.jsh
 * 2015年8月5日
 */
@Entity
@Table(name="STOCK")
public class Stock {
	@Id
	@Column(name="STOCK_CODE")
	private String stockCode;	//stockCode
	
	@Column(name="STOCK_NAME")
	private String stockName;	//stockName
	
	@Column(name="STOCK_EXCHANGE")
	private String stockExchange;	//stockExchange
	
	@Column(name="STOCK_LISTING_DATE")
	private java.sql.Date stockListingDate;	//stockListingDate
	
	@Column(name="ADDED_DATE")
	private java.util.Date addedDate;	//addedDate
	
	@Column(name="REMARK")
	private String remark;	//remark
	
	/**
	 * @return the stockCode
	 */
	public String getStockCode() {
		return stockCode;
	}
	/**
	 * @param stockCode the stockCode to set
	 */
	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}
	/**
	 * @return the stockName
	 */
	public String getStockName() {
		return stockName;
	}
	/**
	 * @param stockName the stockName to set
	 */
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	/**
	 * @return the stockExchange
	 */
	public String getStockExchange() {
		return stockExchange;
	}
	/**
	 * @param stockExchange the stockExchange to set
	 */
	public void setStockExchange(String stockExchange) {
		this.stockExchange = stockExchange;
	}
	/**
	 * @return the stockListingDate
	 */
	public java.sql.Date getStockListingDate() {
		return stockListingDate;
	}
	/**
	 * @param stockListingDate the stockListingDate to set
	 */
	public void setStockListingDate(java.sql.Date stockListingDate) {
		this.stockListingDate = stockListingDate;
	}
	/**
	 * @return the addedDate
	 */
	public java.util.Date getAddedDate() {
		return addedDate;
	}
	/**
	 * @param addedDate the addedDate to set
	 */
	public void setAddedDate(java.util.Date addedDate) {
		this.addedDate = addedDate;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Stock [stockCode=" + stockCode + ", stockName=" + stockName + ", stockExchange=" + stockExchange + ", stockListingDate=" + stockListingDate + ", addedDate=" + addedDate + ", remark=" + remark + "]";
	}
	
}