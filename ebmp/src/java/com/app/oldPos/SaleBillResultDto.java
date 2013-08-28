package com.app.oldPos;



/**
 * 
 * @author lxx
 *订单dto
 */
public class SaleBillResultDto  {
	

	
	/**
	 * 订单表头
	 */
	 private SaleHeaderDto header;//
	 /**
	  * 订单表体
	  */
	 private SaleBodyDto[] bodys;//
	public SaleHeaderDto getHeader() {
		return header;
	}
	public void setHeader(SaleHeaderDto header) {
		this.header = header;
	}
	public SaleBodyDto[] getBodys() {
		return bodys;
	}
	public void setBodys(SaleBodyDto[] bodys) {
		this.bodys = bodys;
	}
	 
}
