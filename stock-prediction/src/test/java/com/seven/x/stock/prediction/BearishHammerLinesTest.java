package com.seven.x.stock.prediction;

import static org.junit.Assert.*;

import java.math.BigDecimal;

import org.junit.Test;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;

import com.seven.x.stock.prediction.domain.StockQuote;
import com.seven.x.stock.prediction.domain.StockQuotes;
import com.seven.x.stock.prediction.commons.DateTime;

public class BearishHammerLinesTest {

	private ExpressionParser parser= new SpelExpressionParser();
	
	@Test
	public void base() {
		String expression = "(getTodayQuote().isHammer() and isUpward() ) or  (getQuote(2).isHammer() and getQuotesBefore(1).isUpward())";
		
		StockQuotes sqs = new StockQuotes();
		StockQuote sq1  = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-29").getTime()),new BigDecimal("97.19"),new BigDecimal("101.65"), new BigDecimal("86.48"), new BigDecimal("101.65"), new BigDecimal("3101400"));
		StockQuote sq2  = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-28").getTime()),new BigDecimal("89.1") ,new BigDecimal("102.5") , new BigDecimal("89.1") , new BigDecimal("96")    , new BigDecimal("5840700"));
		StockQuote sq3  = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-27").getTime()),new BigDecimal("93.01"),new BigDecimal("107.59"), new BigDecimal("93.01"), new BigDecimal("99")    , new BigDecimal("8905600"));
		StockQuote sq4  = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-24").getTime()),new BigDecimal("96.5") ,new BigDecimal("100")   , new BigDecimal("92.89"), new BigDecimal("97.81") , new BigDecimal("3803600"));
		StockQuote sq5  = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-23").getTime()),new BigDecimal("95.35"),new BigDecimal("97.9")  , new BigDecimal("92.5") , new BigDecimal("96.65") , new BigDecimal("2127600"));
		StockQuote sq6  = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-22").getTime()),new BigDecimal("96")   ,new BigDecimal("99.5")  , new BigDecimal("92.01"), new BigDecimal("95.54") , new BigDecimal("1966900"));
		StockQuote sq7  = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-21").getTime()),new BigDecimal("87.98"),new BigDecimal("98.2")  , new BigDecimal("86.06"), new BigDecimal("97.28") , new BigDecimal("3241000"));
		StockQuote sq8  = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-20").getTime()),new BigDecimal("84.48"),new BigDecimal("92.2")  , new BigDecimal("84.48"), new BigDecimal("90.55") , new BigDecimal("3094700"));
		StockQuote sq9  = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-17").getTime()),new BigDecimal("77.99"),new BigDecimal("85.1")  , new BigDecimal("75.05"), new BigDecimal("84.42") , new BigDecimal("3367800"));
		StockQuote sq10 = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-16").getTime()),new BigDecimal("77.6") ,new BigDecimal("82.42") , new BigDecimal("73.51"), new BigDecimal("77.99") , new BigDecimal("4198900"));
		StockQuote sq11 = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-15").getTime()),new BigDecimal("92")   ,new BigDecimal("92")    , new BigDecimal("81.68"), new BigDecimal("81.68") , new BigDecimal("2357100"));
		StockQuote sq12 = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-14").getTime()),new BigDecimal("90.75"),new BigDecimal("90.75") , new BigDecimal("90.75"), new BigDecimal("90.75") , new BigDecimal("512100")) ;
		StockQuote sq13 = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-13").getTime()),new BigDecimal("82.5") ,new BigDecimal("82.5")  , new BigDecimal("82.5") , new BigDecimal("82.5")  , new BigDecimal("234300")) ;
		StockQuote sq14 = new StockQuote("002707","众信旅游",new java.sql.Date(DateTime.getDateFrom("2015-07-03").getTime()),new BigDecimal("73")   ,new BigDecimal("85")    , new BigDecimal("72.5") , new BigDecimal("75")    , new BigDecimal("2710000"));

		sqs.addQuote(sq1); 
		sqs.addQuote(sq2); 
		sqs.addQuote(sq3);
		sqs.addQuote(sq4);
		sqs.addQuote(sq5);
		sqs.addQuote(sq6);
		sqs.addQuote(sq7);
		sqs.addQuote(sq8);
		sqs.addQuote(sq9);
		sqs.addQuote(sq10);
		sqs.addQuote(sq11);
		sqs.addQuote(sq12);
		sqs.addQuote(sq13);
		sqs.addQuote(sq14);
		
		StandardEvaluationContext context= new StandardEvaluationContext(sqs);
		boolean result = parser.parseExpression(expression).getValue(context, boolean.class);
	
		System.out.println(result);
	}

}
