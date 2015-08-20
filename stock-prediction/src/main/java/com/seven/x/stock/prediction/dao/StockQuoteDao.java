package com.seven.x.stock.prediction.dao;

import org.springframework.stereotype.Repository;

import com.seven.x.stock.prediction.domain.StockQuote;
import com.vivebest.finchas.i.bp.orm.hibernate.HibernateDao;

@Repository("stockQuoteDao")
public class StockQuoteDao extends HibernateDao<StockQuote, String> {

}
