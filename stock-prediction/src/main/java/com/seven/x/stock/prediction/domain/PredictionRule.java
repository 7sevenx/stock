package com.seven.x.stock.prediction.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 预测规则
 * @author yan.jsh
 * 2015年8月5日
 */
@Entity
@Table(name="STOCK_PREDICTION_RULE")
public class PredictionRule {
	@Id
	@Column(name="RULE_SEQ")
	private Integer ruleSeq;	//ruleSeq
	
	@Column(name="RULE_NAME")
	private String ruleName;	//ruleName
	
	@Column(name="PREDICTION_EXPRESSION")
	private String predictionExpression;	//expression
	
	@Column(name="BASE_QUOTE_EXPRESSION")
	private String baseQuoteExpression;	//基准行情表达式
	
	@Column(name="BASE_QUOTE_EXPRESSION")
	private String strengtheningExpression; //强化预测表达式
	
	@Column(name="PERIOD")
	private String period;	//period
	
	@Column(name="SCORE")
	private Integer score;	//score
	
	@Column(name="TREND")
	private String trend;	//trend
	
	@Column(name="REMARK")
	private String remark;	//remark
	
	/** @param quotes */
	public boolean isMatching(StockQuotes quotes) {
		// TODO: implement
		return false;
	}
	
	/**
	 * 根据基准行情表达式获取基准索引
	 * @param quotes
	 * @return
	 */
	public Integer getBaseQuoteIndex(StockQuotes quotes){
		return 0;
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
	 * @return the baseQuoteExpression
	 */
	public String getBaseQuoteExpression() {
		return baseQuoteExpression;
	}

	/**
	 * @param baseQuoteExpression the baseQuoteExpression to set
	 */
	public void setBaseQuoteExpression(String baseQuoteExpression) {
		this.baseQuoteExpression = baseQuoteExpression;
	}

	/**
	 * @return the period
	 */
	public String getPeriod() {
		return period;
	}

	/**
	 * @param period the period to set
	 */
	public void setPeriod(String period) {
		this.period = period;
	}

	/**
	 * @return the score
	 */
	public Integer getScore() {
		return score;
	}

	/**
	 * @param score the score to set
	 */
	public void setScore(Integer score) {
		this.score = score;
	}

	/**
	 * @return the trend
	 */
	public String getTrend() {
		return trend;
	}

	/**
	 * @param trend the trend to set
	 */
	public void setTrend(String trend) {
		this.trend = trend;
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

	/**
	 * @return the predictionExpression
	 */
	public String getPredictionExpression() {
		return predictionExpression;
	}

	/**
	 * @param predictionExpression the predictionExpression to set
	 */
	public void setPredictionExpression(String predictionExpression) {
		this.predictionExpression = predictionExpression;
	}

	/**
	 * @return the strengtheningExpression
	 */
	public String getStrengtheningExpression() {
		return strengtheningExpression;
	}

	/**
	 * @param strengtheningExpression the strengtheningExpression to set
	 */
	public void setStrengtheningExpression(String strengtheningExpression) {
		this.strengtheningExpression = strengtheningExpression;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PredictionRule [ruleSeq=" + ruleSeq + ", ruleName=" + ruleName + ", predictionExpression=" + predictionExpression + ", baseQuoteExpression=" + baseQuoteExpression + ", strengtheningExpression=" + strengtheningExpression + ", period=" + period + ", score=" + score + ", trend=" + trend + ", remark=" + remark + "]";
	}
	
}