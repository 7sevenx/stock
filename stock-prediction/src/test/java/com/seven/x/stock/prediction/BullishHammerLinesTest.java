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

public class BullishHammerLinesTest {

	private ExpressionParser parser= new SpelExpressionParser();
	
	@Test
	public void testTodayMatch() {
		String expression = "(getTodayQuote().isHammer() and isDownward() ) or  (getQuote(2).isHammer() and getQuotesBefore(1).isDownward())";
		
		StockQuotes sqs = new StockQuotes();
		StockQuote sq2  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-10").getTime()),new BigDecimal("9.8"),new BigDecimal("9.98"),new BigDecimal("9.46"),new BigDecimal("9.98"),new BigDecimal("44627900")                  );
		StockQuote sq3  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-07").getTime()),new BigDecimal("9.57"),new BigDecimal("9.92"),new BigDecimal("9.07"),new BigDecimal("9.07"),new BigDecimal("87080000")                 );
		StockQuote sq4  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-06").getTime()),new BigDecimal("11.51"),new BigDecimal("11.51"),new BigDecimal("9.45"),new BigDecimal("10.08"),new BigDecimal("102669700")             );
		StockQuote sq5  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-03").getTime()),new BigDecimal("10.71"),new BigDecimal("11.64"),new BigDecimal("10.02"),new BigDecimal("10.46"),new BigDecimal("92502300")             );
		StockQuote sq6  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-02").getTime()),new BigDecimal("11.38"),new BigDecimal("11.79"),new BigDecimal("10.63"),new BigDecimal("11.08"),new BigDecimal("87130500")             );
		StockQuote sq7  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-01").getTime()),new BigDecimal("11.93"),new BigDecimal("12.44"),new BigDecimal("11.1"),new BigDecimal("11.21"),new BigDecimal("94786000")              );
		StockQuote sq8  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-30").getTime()),new BigDecimal("11.15"),new BigDecimal("11.91"),new BigDecimal("10.5"),new BigDecimal("11.91"),new BigDecimal("99023900")              );
		StockQuote sq9  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-29").getTime()),new BigDecimal("12.3"),new BigDecimal("12.3"),new BigDecimal("10.8"),new BigDecimal("10.83"),new BigDecimal("98859100")                );
		StockQuote sq10 = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-26").getTime()),new BigDecimal("13"),new BigDecimal("13"),new BigDecimal("12"),new BigDecimal("12"),new BigDecimal("86495300")                         );
		StockQuote sq11 = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-25").getTime()),new BigDecimal("14.53"),new BigDecimal("14.53"),new BigDecimal("13.22"),new BigDecimal("13.33"),new BigDecimal("82841000")             );

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
		
		StandardEvaluationContext context= new StandardEvaluationContext(sqs);
		boolean result = parser.parseExpression(expression).getValue(context, boolean.class);
	
		System.out.println(result);
	}

	
	@Test
	public void testYesterdayMatch() {
		String expression = "(getTodayQuote().isHammer() and isDownward() ) or  (getQuote(2).isHammer() and getQuotesBefore(1).isDownward())";
		
		StockQuotes sqs = new StockQuotes();
		StockQuote sq1  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-13").getTime()),new BigDecimal("10.5"),new BigDecimal("10.98"),new BigDecimal("10.2"),new BigDecimal("10.98"),new BigDecimal("99475300")               );
		StockQuote sq2  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-10").getTime()),new BigDecimal("9.8"),new BigDecimal("9.98"),new BigDecimal("9.46"),new BigDecimal("9.98"),new BigDecimal("44627900")                  );
		StockQuote sq3  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-07").getTime()),new BigDecimal("9.57"),new BigDecimal("9.92"),new BigDecimal("9.07"),new BigDecimal("9.07"),new BigDecimal("87080000")                 );
		StockQuote sq4  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-06").getTime()),new BigDecimal("11.51"),new BigDecimal("11.51"),new BigDecimal("9.45"),new BigDecimal("10.08"),new BigDecimal("102669700")             );
		StockQuote sq5  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-03").getTime()),new BigDecimal("10.71"),new BigDecimal("11.64"),new BigDecimal("10.02"),new BigDecimal("10.46"),new BigDecimal("92502300")             );
		StockQuote sq6  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-02").getTime()),new BigDecimal("11.38"),new BigDecimal("11.79"),new BigDecimal("10.63"),new BigDecimal("11.08"),new BigDecimal("87130500")             );
		StockQuote sq7  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-01").getTime()),new BigDecimal("11.93"),new BigDecimal("12.44"),new BigDecimal("11.1"),new BigDecimal("11.21"),new BigDecimal("94786000")              );
		StockQuote sq8  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-30").getTime()),new BigDecimal("11.15"),new BigDecimal("11.91"),new BigDecimal("10.5"),new BigDecimal("11.91"),new BigDecimal("99023900")              );
		StockQuote sq9  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-29").getTime()),new BigDecimal("12.3"),new BigDecimal("12.3"),new BigDecimal("10.8"),new BigDecimal("10.83"),new BigDecimal("98859100")                );
		StockQuote sq10 = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-26").getTime()),new BigDecimal("13"),new BigDecimal("13"),new BigDecimal("12"),new BigDecimal("12"),new BigDecimal("86495300")                         );
		StockQuote sq11 = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-25").getTime()),new BigDecimal("14.53"),new BigDecimal("14.53"),new BigDecimal("13.22"),new BigDecimal("13.33"),new BigDecimal("82841000")             );

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
		
		StandardEvaluationContext context= new StandardEvaluationContext(sqs);
		boolean result = parser.parseExpression(expression).getValue(context, boolean.class);
	
		System.out.println(result);
	}
	
	@Test
	public void testUnMatch() {
		String expression = "(getTodayQuote().isHammer() and isDownward() ) or  (getQuote(2).isHammer() and getQuotesBefore(1).isDownward())";
		
		StockQuotes sqs = new StockQuotes();
		StockQuote sq3  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-07").getTime()),new BigDecimal("9.57"),new BigDecimal("9.92"),new BigDecimal("9.07"),new BigDecimal("9.07"),new BigDecimal("87080000")                 );
		StockQuote sq4  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-06").getTime()),new BigDecimal("11.51"),new BigDecimal("11.51"),new BigDecimal("9.45"),new BigDecimal("10.08"),new BigDecimal("102669700")             );
		StockQuote sq5  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-03").getTime()),new BigDecimal("10.71"),new BigDecimal("11.64"),new BigDecimal("10.02"),new BigDecimal("10.46"),new BigDecimal("92502300")             );
		StockQuote sq6  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-02").getTime()),new BigDecimal("11.38"),new BigDecimal("11.79"),new BigDecimal("10.63"),new BigDecimal("11.08"),new BigDecimal("87130500")             );
		StockQuote sq7  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-01").getTime()),new BigDecimal("11.93"),new BigDecimal("12.44"),new BigDecimal("11.1"),new BigDecimal("11.21"),new BigDecimal("94786000")              );
		StockQuote sq8  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-30").getTime()),new BigDecimal("11.15"),new BigDecimal("11.91"),new BigDecimal("10.5"),new BigDecimal("11.91"),new BigDecimal("99023900")              );
		StockQuote sq9  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-29").getTime()),new BigDecimal("12.3"),new BigDecimal("12.3"),new BigDecimal("10.8"),new BigDecimal("10.83"),new BigDecimal("98859100")                );
		StockQuote sq10 = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-26").getTime()),new BigDecimal("13"),new BigDecimal("13"),new BigDecimal("12"),new BigDecimal("12"),new BigDecimal("86495300")                         );
		StockQuote sq11 = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-25").getTime()),new BigDecimal("14.53"),new BigDecimal("14.53"),new BigDecimal("13.22"),new BigDecimal("13.33"),new BigDecimal("82841000")             );

		sqs.addQuote(sq3);
		sqs.addQuote(sq4);
		sqs.addQuote(sq5);
		sqs.addQuote(sq6);
		sqs.addQuote(sq7);
		sqs.addQuote(sq8);
		sqs.addQuote(sq9);
		sqs.addQuote(sq10);
		sqs.addQuote(sq11);
		
		StandardEvaluationContext context= new StandardEvaluationContext(sqs);
		boolean result = parser.parseExpression(expression).getValue(context, boolean.class);
	
		System.out.println(result);
	}
	
	@Test
	public void testStrengthenMatch() {
		String expression = "getQuote(2).isHammer() and getQuotesBefore(1).isDownward() and getTodayQuote().isUp() ? 10 : 0";
		
		StockQuotes sqs = new StockQuotes();
		StockQuote sq1  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-13").getTime()),new BigDecimal("10.5"),new BigDecimal("10.98"),new BigDecimal("10.2"),new BigDecimal("10.98"),new BigDecimal("99475300")               );
		StockQuote sq2  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-10").getTime()),new BigDecimal("9.8"),new BigDecimal("9.98"),new BigDecimal("9.46"),new BigDecimal("9.98"),new BigDecimal("44627900")                  );
		StockQuote sq3  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-07").getTime()),new BigDecimal("9.57"),new BigDecimal("9.92"),new BigDecimal("9.07"),new BigDecimal("9.07"),new BigDecimal("87080000")                 );
		StockQuote sq4  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-06").getTime()),new BigDecimal("11.51"),new BigDecimal("11.51"),new BigDecimal("9.45"),new BigDecimal("10.08"),new BigDecimal("102669700")             );
		StockQuote sq5  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-03").getTime()),new BigDecimal("10.71"),new BigDecimal("11.64"),new BigDecimal("10.02"),new BigDecimal("10.46"),new BigDecimal("92502300")             );
		StockQuote sq6  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-02").getTime()),new BigDecimal("11.38"),new BigDecimal("11.79"),new BigDecimal("10.63"),new BigDecimal("11.08"),new BigDecimal("87130500")             );
		StockQuote sq7  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-07-01").getTime()),new BigDecimal("11.93"),new BigDecimal("12.44"),new BigDecimal("11.1"),new BigDecimal("11.21"),new BigDecimal("94786000")              );
		StockQuote sq8  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-30").getTime()),new BigDecimal("11.15"),new BigDecimal("11.91"),new BigDecimal("10.5"),new BigDecimal("11.91"),new BigDecimal("99023900")              );
		StockQuote sq9  = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-29").getTime()),new BigDecimal("12.3"),new BigDecimal("12.3"),new BigDecimal("10.8"),new BigDecimal("10.83"),new BigDecimal("98859100")                );
		StockQuote sq10 = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-26").getTime()),new BigDecimal("13"),new BigDecimal("13"),new BigDecimal("12"),new BigDecimal("12"),new BigDecimal("86495300")                         );
		StockQuote sq11 = new StockQuote("600516","方大碳素",new java.sql.Date(DateTime.getDateFrom("2015-06-25").getTime()),new BigDecimal("14.53"),new BigDecimal("14.53"),new BigDecimal("13.22"),new BigDecimal("13.33"),new BigDecimal("82841000")             );

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
		
		StandardEvaluationContext context= new StandardEvaluationContext(sqs);
		Integer result = parser.parseExpression(expression).getValue(context, Integer.class);
	
		System.out.println(result);
	}
	
}
