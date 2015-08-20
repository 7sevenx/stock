package com.seven.x.stock.prediction.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 预测明细
 * @author yan.jsh
 * 2015年8月5日
 */
@Entity
@Table(name="STOCK_PREDICTION_DETAIL")
public class PredictionDetail {
	@Column(name="STOCK_CODE")
	private String stockCode;	//stockCode
	
	@Column(name="STOCK_NAME")
	private String stockName;	//stockName
	
	@Column(name="PREDICTION_DATE")
	private java.util.Date predictionDate;	//predictionDate
	
	@Column(name="RULE_SEQ")
	private Integer ruleSeq;	//ruleSeq
	
	@Column(name="RULE_NAME")
	private String ruleName;	//ruleName
	
	@Column(name="IS_MATCHING")
	private boolean isMatching;	//isMatching
	
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
	 * @return the predictionDate
	 */
	public java.util.Date getPredictionDate() {
		return predictionDate;
	}
	/**
	 * @param predictionDate the predictionDate to set
	 */
	public void setPredictionDate(java.util.Date predictionDate) {
		this.predictionDate = predictionDate;
	}
	/**
	 * @return the ruleSeq
	 */
	public Integer getRuleSeq() {
		return ruleSeq;
	}
	/**
	 * @param ruleSeq the ruleSeq to set
	 */
	public void setRuleSeq(Integer ruleSeq) {
		this.ruleSeq = ruleSeq;
	}
	/**
	 * @return the ruleName
	 */
	public String getRuleName() {
		return ruleName;
	}
	/**
	 * @param ruleName the ruleName to set
	 */
	public void setRuleName(String ruleName) {
		this.ruleName = ruleName;
	}
	/**
	 * @return the isMatching
	 */
	public boolean isMatching() {
		return isMatching;
	}
	/**
	 * @param isMatching the isMatching to set
	 */
	public void setMatching(boolean isMatching) {
		this.isMatching = isMatching;
	}
	
	

}