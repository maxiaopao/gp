package com.mf.gp.modules.test.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mf.gp.common.base.entity.Page;
import com.mf.gp.common.base.service.CrudService;
import com.mf.gp.modules.test.entity.TestData;
import com.mf.gp.modules.test.dao.TestDataDao;

/**
 * 单表生成Service
 * @author 马飞
 * @version 2017-12-23
 */
@Service
@Transactional(readOnly = true)
public class TestDataService extends CrudService<TestDataDao, TestData> {

	public TestData get(String id) {
		return super.get(id);
	}
	
	public List<TestData> findList(TestData testData) {
		return super.findList(testData);
	}
	
	public Page<TestData> findPage(Page<TestData> page, TestData testData) {
		return super.findPage(page, testData);
	}
	
	@Transactional(readOnly = false)
	public void save(TestData testData) {
		super.save(testData);
	}
	
	@Transactional(readOnly = false)
	public void delete(TestData testData) {
		super.delete(testData);
	}
	
}