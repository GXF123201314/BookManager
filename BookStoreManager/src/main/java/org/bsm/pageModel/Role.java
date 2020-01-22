package org.bsm.pageModel;

public class Role {

	private String ids;
	
	
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	/**
	 * 查询排序字段
	 */
	private String sort;
	private String order;
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	/**
	 * 分页数据
	 */
	private int page;
	private int rows;
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	/**
	 * 页面数据
	 */
	
	private int roleid;
	private String rolename;
	private String oldrolename;
	private String remark;
	private String excol;
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getOldrolename() {
		return oldrolename;
	}
	public void setOldrolename(String oldrolename) {
		this.oldrolename = oldrolename;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getExcol() {
		return excol;
	}
	public void setExcol(String excol) {
		this.excol = excol;
	}
	
}
