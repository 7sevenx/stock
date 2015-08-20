package com.seven.x.stock.prediction.dao;

import org.springframework.stereotype.Repository;

import com.seven.x.stock.prediction.domain.PredictionDetail;
import com.vivebest.finchas.i.bp.orm.hibernate.HibernateDao;

@Repository("predictionDetailDao")
public class PredictionDetailDao extends HibernateDao<PredictionDetail, String> {

}
