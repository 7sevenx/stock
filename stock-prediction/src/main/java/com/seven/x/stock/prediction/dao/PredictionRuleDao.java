package com.seven.x.stock.prediction.dao;

import org.springframework.stereotype.Repository;

import com.seven.x.stock.prediction.domain.PredictionRule;
import com.vivebest.finchas.i.bp.orm.hibernate.HibernateDao;

@Repository("predictionRuleDao")
public class PredictionRuleDao extends HibernateDao<PredictionRule, String> {

}
