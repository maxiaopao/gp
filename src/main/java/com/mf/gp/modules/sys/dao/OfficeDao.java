package com.mf.gp.modules.sys.dao;

import com.mf.gp.common.base.dao.TreeDao;
import com.mf.gp.common.mybatis.annotation.MyBatisDao;
import com.mf.gp.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
}
