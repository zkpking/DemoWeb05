package com.base.dao;

import java.util.List;

public interface IBaseDao {
	/**
	 * 添加
	 * @param obj
	 * @return
	 */
	int insert(Object obj);
	/**
	 * 删除
	 * @param obj
	 * @return
	 */
	int delete(Object obj);
	/**
	 * 修改
	 * @param obj
	 * @return
	 */
	int update(Object obj);
	/**
	 * 查询单个对象
	 * @param obj
	 * @return
	 */
	Object select(Object obj);
	/**
	 * 查询多个对象
	 * @param obj
	 * @return
	 */
	List<Object> selectObjList(Object obj);
	/**
	 * 查询条数
	 * @param obj
	 * @return
	 */
	int getCount(Object obj);
}
