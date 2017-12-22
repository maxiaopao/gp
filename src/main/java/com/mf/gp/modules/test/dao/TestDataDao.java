package com.mf.gp.modules.test.dao;

import com.mf.gp.common.base.dao.CrudDao;
import com.mf.gp.common.mybatis.annotation.MyBatisDao;
import com.mf.gp.modules.test.entity.TestData;

/**
 * 单表生成DAO接口
 * @author 马飞
 * @version 2017-12-23
 */
@MyBatisDao
public interface TestDataDao extends CrudDao<TestData> {
	
}