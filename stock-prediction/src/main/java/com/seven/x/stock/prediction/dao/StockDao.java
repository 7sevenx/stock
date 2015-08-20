package com.seven.x.stock.prediction.dao;

import org.springframework.stereotype.Repository;

import com.seven.x.stock.prediction.domain.Stock;
import com.vivebest.finchas.i.bp.orm.hibernate.HibernateDao;

@Repository("stockDao")
public class StockDao extends HibernateDao<Stock, String> {

}
