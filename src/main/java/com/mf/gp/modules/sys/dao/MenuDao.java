package com.mf.gp.modules.sys.dao;

import java.util.List;

import com.mf.gp.common.base.dao.CrudDao;
import com.mf.gp.common.mybatis.annotation.MyBatisDao;
import com.mf.gp.modules.sys.entity.Menu;

/**
 * 菜单DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface MenuDao extends CrudDao<Menu> {

	public List<Menu> findByParentIdsLike(Menu menu);

	public List<Menu> findByUserId(Menu menu);
	
	public int updateParentIds(Menu menu);
	
	public int updateSort(Menu menu);
	
}
