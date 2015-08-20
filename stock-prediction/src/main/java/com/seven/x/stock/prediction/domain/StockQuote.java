package com.seven.x.stock.prediction.domain;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;

/**
 * 股票行情
 * @author yan.jsh
 * 2015年8月5日
 */
@Entity
@Table(name="STOCK_QUOTE")
public class StockQuote {
	@Column(name="STOCK_CODE")
	private String stockCode;	//stockCode
	
	@Column(name="STOCK_NAME")
	private String stockName;	//stockName
	
	@Column(name="QUOTE_DATE")
	private java.sql.Date quoteDate;	//quoteDate
	
	@Column(name="OPEN_PRICE")
	private BigDecimal openPrice;	//openPrice
	
	@Column(name="HIGH_PRICE")
	private BigDecimal highPrice;	//highPrice
	
	@Column(name="LOW_PRICE")
	private BigDecimal lowPrice;	//lowPrice
	
	@Column(name="CLOSE_PRICE")
	private BigDecimal closePrice;	//closePrice
	
	@Column(name="VOLUME")
	private BigDecimal volume;	//volume
	
	@Column(name="ADDED_DATE")
	private java.util.Date addedDate;	//addedDate
	
	@Column(name="REMARK")
	private String remark;	//remark
	
	/**
	 * SPEL解析器
	 */
	private ExpressionParser parser= new SpelExpressionParser();
	
	
	/**
	 * 
	 */
	public StockQuote() {
		super();
	}

	/**
	 * @param stockCode
	 * @param stockName
	 * @param quoteDate
	 * @param openPrice
	 * @param highPrice
	 * @param lowPrice
	 * @param closePrice
	 * @param volume
	 */
	public StockQuote(String stockCode, String stockName, Date quoteDate, BigDecimal openPrice, BigDecimal highPrice, BigDecimal lowPrice, BigDecimal closePrice, BigDecimal volume) {
		super();
		this.stockCode = stockCode;
		this.stockName = stockName;
		this.quoteDate = quoteDate;
		this.openPrice = openPrice;
		this.highPrice = highPrice;
		this.lowPrice = lowPrice;
		this.closePrice = closePrice;
		this.volume = volume;
	}

	/**
	 * 获取涨幅
	 * <p>正数表示上涨，负数表示下跌
	 * @return
	 */
	public BigDecimal getIncrease(){
		return ((this.closePrice.subtract(openPrice)).divide(this.openPrice, 2, RoundingMode.HALF_UP)).multiply(new BigDecimal("100"));
	}
	
	/**
	 * 是否为上涨的
	 * <p>如果收盘价大于开盘价即为上涨
	 * @return
	 */
	public boolean isUp(){
		return closePrice.compareTo(openPrice) > 0;
	}
	
	/**
	 * 是否为下降的
	 * <p>如果收盘价小于开盘价即为下跌
	 * @return
	 */
	public boolean isDown(){
		return closePrice.compareTo(openPrice) < 0;
	}
	
	/**
	 * 获取实体最高价
	 * <p>收盘价，开盘价中最高者
	 * @return
	 */
	public BigDecimal getRealMaxPrice(){
		return this.closePrice.max(this.openPrice);
	}
	
	/**
	 * 获取实体最低价
	 * <p>收盘价，开盘价中最低者
	 * @return
	 */
	public BigDecimal getRealMinPrice(){
		return this.closePrice.min(this.openPrice);
	}
	
	/**
	 * 获取实体中心值
	 * <p>开盘价加上收盘价除以二
	 * @return
	 */
	public BigDecimal getRealMiddleValue(){
		return (this.closePrice.add(this.openPrice)).divide(new BigDecimal("2"), 2, BigDecimal.ROUND_HALF_UP);
	}
	
	/**
	 * 获取实体值
	 * <p>开盘价减去收盘价的绝对值
	 * @return
	 */
	public BigDecimal getRealValue(){
		return this.closePrice.subtract(this.openPrice).abs();
	}
	
	/**
	 * 获取上影线值
	 * <p>最高价减去实体最高价
	 * @return
	 */
	public BigDecimal getUpperShadowValue(){
		return this.highPrice.subtract(this.getRealMaxPrice());
	}
	
	/**
	 * 获取下影线值
	 * <p>实体最低价减去最低价
	 * @return
	 */
	public BigDecimal getLowerShadowValue(){
		return this.getRealMinPrice().subtract(this.lowPrice);
	}
	
	/**
	 * 秃头
	 * @return
	 */
	public boolean isBaldHead(){
		return this.highPrice.compareTo(this.getRealMaxPrice().multiply(new BigDecimal("1.002"))) <= 0;
	}
	
	/**
	 * 秃脚
	 * @return
	 */
	public boolean isBareFeet (){
		return this.lowPrice.compareTo(this.getRealMinPrice().multiply(new BigDecimal("1.002"))) >= 0;
	}
	
	/**
	 * 十字（蜡烛）线Doji
	 * 在某根蜡烛线上，如果开始价和收市价处于相同的水平（或几乎同一个水平），则构成了一根十字线。
	 * 十字线具有各种形态，（比如墓碑十字线，或者长腿十字线），
	 * 这取决于开始价和收市价相对与当日整个价格范围的位置。
	 * 十字线，居于最重要的单蜡烛线形态之列。
	 * 同时，它也是一些重要的蜡烛图形态的一个组成部分。
	 * @return
	 */
	public boolean isDoji() {
	// TODO: implement
	return false;
	}
	
	/**
	 * 锤子（蜡烛）线Hammer
	 * 是一种底部反转信号。锤子线与上吊线的形态是一致的，
	 * 它具备一个小小的实体（既可以是白色的，也可以是黑色的），
	 * 并且该实体位于当日价格范围的顶端；它还具备一条极长的下影线，，一条很短的上影线、或没有上影线。
	 * 如果这种蜡烛线出现在下降趋势中，就成了一根看涨的锤子线。
	 * 作为一根经典的锤子线，其下影线的长度应当至少达到其实体高度的两倍。
	 * @return
	 */
	public boolean isHammer() {
		StandardEvaluationContext context= new StandardEvaluationContext(this);
		//最高价 少于 开盘价与收盘价最大值的100.2%， 且开盘价与收盘价最小值 减去最低价的值 大于 开盘价减去收盘价的绝对值的1.5倍
		boolean result = parser.parseExpression("isBaldHead() and getLowerShadowValue() ge getRealValue() * 1.5").getValue(context, boolean.class);
		return result;
	}
	
	public boolean isInvertedHammer() {
		// TODO: implement
		return false;
	}
	
	public boolean isShootingStar() {
		// TODO: implement
		return false;
	}

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
	 * @return the quoteDate
	 */
	public java.sql.Date getQuoteDate() {
		return quoteDate;
	}

	/**
	 * @param quoteDate the quoteDate to set
	 */
	public void setQuoteDate(java.sql.Date quoteDate) {
		this.quoteDate = quoteDate;
	}

	/**
	 * @return the openPrice
	 */
	public BigDecimal getOpenPrice() {
		return openPrice;
	}

	/**
	 * @param openPrice the openPrice to set
	 */
	public void setOpenPrice(BigDecimal openPrice) {
		this.openPrice = openPrice;
	}

	/**
	 * @return the highPrice
	 */
	public BigDecimal getHighPrice() {
		return highPrice;
	}

	/**
	 * @param highPrice the highPrice to set
	 */
	public void setHighPrice(BigDecimal highPrice) {
		this.highPrice = highPrice;
	}

	/**
	 * @return the lowPrice
	 */
	public BigDecimal getLowPrice() {
		return lowPrice;
	}

	/**
	 * @param lowPrice the lowPrice to set
	 */
	public void setLowPrice(BigDecimal lowPrice) {
		this.lowPrice = lowPrice;
	}

	/**
	 * @return the closePrice
	 */
	public BigDecimal getClosePrice() {
		return closePrice;
	}

	/**
	 * @param closePrice the closePrice to set
	 */
	public void setClosePrice(BigDecimal closePrice) {
		this.closePrice = closePrice;
	}

	/**
	 * @return the volume
	 */
	public BigDecimal getVolume() {
		return volume;
	}

	/**
	 * @param volume the volume to set
	 */
	public void setVolume(BigDecimal volume) {
		this.volume = volume;
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
		return "StockQuote [stockCode=" + stockCode + ", stockName=" + stockName + ", quoteDate=" + quoteDate + ", openPrice=" + openPrice + ", highPrice=" + highPrice + ", lowPrice=" + lowPrice + ", closePrice=" + closePrice + ", volume=" + volume + ", addedDate=" + addedDate + ", remark=" + remark + "]";
	}
	
}