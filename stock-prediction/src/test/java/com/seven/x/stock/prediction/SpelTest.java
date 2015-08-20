package com.seven.x.stock.prediction;

import java.math.BigDecimal;

import org.junit.Test;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;

import com.seven.x.stock.prediction.domain.StockQuote;

public class SpelTest {

	private ExpressionParser parser= new SpelExpressionParser();
	
	@Test
	public void testParse(){
		StockQuote sq = new StockQuote();
		
		sq.setClosePrice(new BigDecimal("15.40"));
		sq.setHighPrice(new BigDecimal("15.55"));
		sq.setOpenPrice(new BigDecimal("15.00"));
		sq.setLowPrice(new BigDecimal("14.00"));
		
		String expression = "highPrice le T(java.lang.Math).max(closePrice,openPrice) * 1.01 and (T(java.lang.Math).min(closePrice,openPrice) - lowPrice) ge T(java.lang.Math).abs(highPrice - openPrice) * 2";
		
		StandardEvaluationContext context= new StandardEvaluationContext(sq);
		boolean result = parser.parseExpression("highPrice le (closePrice.max(openPrice) * 1.01) and (closePrice.min(openPrice) - lowPrice) ge (highPrice - openPrice).abs() * 2").getValue(context, boolean.class);
	
		System.out.println(result);
	}
}
