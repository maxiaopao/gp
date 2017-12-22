package com.mf.gp.modules.test.entity;

import com.mf.gp.modules.sys.entity.User;
import com.mf.gp.modules.sys.entity.Office;
import com.mf.gp.modules.sys.entity.Area;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.mf.gp.common.base.entity.DataEntity;

/**
 * 单表生成Entity
 * @author 马飞
 * @version 2017-12-23
 */
public class TestData extends DataEntity<TestData> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 归属用户
	private Office office;		// 归属部门
	private Area area;		// 归属区域
	private String name;		// 名称
	private String sex;		// 性别
	private Date inDate;		// 加入日期
	
	public TestData() {
		super();
	}

	public TestData(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	@Length(min=0, max=100, message="名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1, message="性别长度必须介于 0 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	
}