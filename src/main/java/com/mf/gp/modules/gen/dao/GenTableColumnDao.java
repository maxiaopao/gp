package com.mf.gp.modules.gen.dao;

import com.mf.gp.common.base.dao.CrudDao;
import com.mf.gp.common.mybatis.annotation.MyBatisDao;
import com.mf.gp.modules.gen.entity.GenTableColumn;

/**
 * 业务表字段DAO接口
 * @author ThinkGem
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenTableColumnDao extends CrudDao<GenTableColumn> {
	
	public void deleteByGenTableId(String genTableId);
}
