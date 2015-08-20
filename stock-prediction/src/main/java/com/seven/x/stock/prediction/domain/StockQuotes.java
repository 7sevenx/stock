package com.seven.x.stock.prediction.domain;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * 股票行情集
 * @author yan.jsh
 * 2015年8月5日
 */
public class StockQuotes {
	
	private List<StockQuote> quotes = new ArrayList<StockQuote>();	//行情集
	
	/**
	 * 周期：
	 * 0-日
	 * 1-周
	 * 2-月
	 * 3-年
	 */
	private Integer period;	//period
	
	/**
	 * 转换成更长周期的行情集
	 * @return
	 */
	public StockQuotes toLongerQuotes() {
		//如果为年行情集，则不能再压缩了
		if(this.period == 3){
			return new StockQuotes();
		}
		
		Integer longerPeriodDays = null;
		switch(this.period){
			case 0 : 
				longerPeriodDays = 5;
				break;
			case 1 : 
				longerPeriodDays = 4;
				break;
			case 2 : 
				longerPeriodDays = 12;
				break;
			case 3 : 
				longerPeriodDays = 0;
				break;
			default : 
				longerPeriodDays = 0;
				break;
		}

		StockQuotes result = this.compress(longerPeriodDays);
		result.setPeriod(this.period + 1);
		return result;
	}
	
	/**
	 * 是否为上升趋势
	 * <p>先转换成更长周期的行情集，然后取3天的平均涨幅，如果大于0则表示上涨的
	 * @return
	 */
	public boolean isUpward() {
		return this.toLongerQuotes().getLatestQuotes(3).getAverageIncrease().compareTo(BigDecimal.ZERO) > 0;
	}
	
	/**
	 * 是否为下降趋势
	 * <p>先转换成更长周期的行情集，然后取3天的平均涨幅，如果小于-3则表示下降的
	 * @return
	 */
	public boolean isDownward() {
		return this.toLongerQuotes().getLatestQuotes(3).getAverageIncrease().compareTo(new BigDecimal("-3")) < 0;
	}

	/**
	 * 获取涨幅
	 * <p>正数表示上涨，负数表示下跌
	 * @return
	 */
	public BigDecimal getIncrease(){
		BigDecimal openPrice = getOriginalOpenPrice();
		BigDecimal closePrice = getFinalClosePrice();
		return ((closePrice.subtract(openPrice)).divide(openPrice, 2, RoundingMode.HALF_UP)).multiply(new BigDecimal("100"));
	}
	
	/**
	 * 获取平均涨幅
	 * @return
	 */
	public BigDecimal getAverageIncrease(){
		BigDecimal totalIncrease = BigDecimal.ZERO;
		for(StockQuote sq : this.quotes){
			totalIncrease.add(sq.getIncrease());
		}
		return totalIncrease.divide(new BigDecimal(this.getQuotes().size()), 2, RoundingMode.HALF_UP);
	}
	
	/**
	 * 按若干天作为周期压缩行情集
	 * @param days
	 */
	public StockQuotes compress(Integer days){
		StockQuotes result = new StockQuotes();
		
		StockQuotes temp = this;
		
		//压缩后的天数
		Integer compressedSize = this.quotes.size() / days + (this.quotes.size() % days > 0 ? 1 : 0);
		for(int i = 0; i < compressedSize; i++){
			StockQuotes sqs = temp.getLatestQuotes(days);
			temp = temp.getQuotesBefore(days);
			result.addQuote(sqs.toOneStockQuote());
		}
		
		return result;
	}
	
	/**
	 * 获取行情集里的最高价
	 * @return
	 */
	public BigDecimal getHighestPrice(){
		BigDecimal highestPrice = BigDecimal.ZERO;
		for(StockQuote sq : this.quotes){
			if(sq.getHighPrice().compareTo(highestPrice) > 0){
				highestPrice = sq.getHighPrice();
			}
		}
		
		return highestPrice;
	}
	
	/**
	 * 获取行情集里的最低价
	 * @return
	 */
	public BigDecimal getLowestPrice(){
		BigDecimal lowestPrice = BigDecimal.ZERO;
		for(StockQuote sq : this.quotes){
			if(sq.getLowPrice().compareTo(lowestPrice) < 0){
				lowestPrice = sq.getLowPrice();
			}
		}
		
		return lowestPrice;
	}
	
	/**
	 * 获取行情集里最早的开盘价
	 * @return
	 */
	public BigDecimal getOriginalOpenPrice(){
		return this.getQuotes().size() ==0 ? BigDecimal.ZERO : this.getQuotes().get(this.getQuotes().size() - 1).getOpenPrice();
	}
	
	/**
	 * 获取行情集里最后的收盘价
	 * @return
	 */
	public BigDecimal getFinalClosePrice(){
		return this.getQuotes().size() ==0 ? BigDecimal.ZERO : this.getQuotes().get(0).getOpenPrice();
	}
	
	/**
	 * 获取最近几天的行情集
	 * @param days 天数
	 * @return
	 */
	public StockQuotes getLatestQuotes(Integer days){
		StockQuotes sqs = new StockQuotes();
		Integer size = days > this.getQuotes().size() ? this.getQuotes().size() : days;
		for(int i = 0; i < size; i++){
			sqs.addQuote(this.getQuotes().get(i));
		}
		
		return sqs;
	}
	
	/**
	 * 获取区间的行情集
	 * @param start 第几天开始
	 * @param end 第几天结束
	 * @return
	 */
	public StockQuotes getQuotesBetween(Integer start, Integer end){
		StockQuotes sqs = new StockQuotes();
		Integer size = end > this.getQuotes().size() ? this.getQuotes().size() : end;
		for(int i = start - 1; i < size; i++){
			sqs.addQuote(this.getQuotes().get(i));
		}
		
		return sqs;
	}
	
	/**
	 * 获取若干天前的行情集
	 * @param days 多少天前
	 * @return
	 */
	public StockQuotes getQuotesBefore(Integer days){
		StockQuotes sqs = new StockQuotes();
		for(int i = days; i < this.getQuotes().size(); i++){
			sqs.addQuote(this.getQuotes().get(i));
		}
		
		return sqs;
	}
	
	/**
	 * 获取总共的交易量
	 * @return
	 */
	public BigDecimal getTotalVolume(){
		BigDecimal volume = BigDecimal.ZERO;
		for(StockQuote sq : this.quotes){
			volume = volume.add(sq.getVolume());
		}
		
		return volume;
	}
	
	/**
	 * 将行情集压缩成一天的行情
	 * @return
	 */
	public StockQuote toOneStockQuote(){
		BigDecimal volume = BigDecimal.ZERO;
		BigDecimal highestPrice = BigDecimal.ZERO;
		BigDecimal lowestPrice = BigDecimal.ZERO;
		String stockCode = this.getQuotes().get(0).getStockCode();
		String stockName = this.getQuotes().get(0).getStockName();
		Date quoteDate  = this.getQuotes().get(0).getQuoteDate();
		BigDecimal closePrice = this.getFinalClosePrice();
		BigDecimal openPrice = this.getOriginalOpenPrice();

		for(StockQuote sq : this.getQuotes()){
			volume = volume.add(sq.getVolume());
			if(sq.getLowPrice().compareTo(lowestPrice) < 0){
				lowestPrice = sq.getLowPrice();
			}
			if(sq.getHighPrice().compareTo(highestPrice) > 0){
				highestPrice = sq.getHighPrice();
			}
		}
		
		return new StockQuote(stockCode,stockName,quoteDate,openPrice,highestPrice,lowestPrice,closePrice,volume);
	}
	/**
	 * 添加行情
	 * @return
	 */
	public StockQuotes addQuote(StockQuote sq){
		this.getQuotes().add(sq);
		return this;
	}
	
	/**
	 * @return the quotes
	 */
	public List<StockQuote> getQuotes() {
		return quotes;
	}

	/**
	 * 获取某天的行情
	 * @param day 表示第几天
	 * @return 某天的行情
	 */
	public StockQuote getQuote(Integer day) {
		return quotes.get(day - 1);
	}
	
	/**
	 * 获取当天的行情
	 * @return 某天的行情
	 */
	public StockQuote getTodayQuote() {
		return quotes.get(0);
	}
	
	/**
	 * @param quotes the quotes to set
	 */
	public void setQuotes(List<StockQuote> quotes) {
		this.quotes = quotes;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "StockQuotes [quotes=" + quotes + "]";
	}

	/**
	 * @return the period
	 */
	public Integer getPeriod() {
		return period;
	}

	/**
	 * @param period the period to set
	 */
	public void setPeriod(Integer period) {
		this.period = period;
	}
}