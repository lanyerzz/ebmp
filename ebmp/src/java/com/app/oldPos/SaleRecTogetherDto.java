package com.app.oldPos;



public class SaleRecTogetherDto   {

	private SaleRecBillDto header;
	
	private SaleRecBillbDto[] bodys;

	public SaleRecBillDto getHeader() {
		return header;
	}

	public void setHeader(SaleRecBillDto header) {
		this.header = header;
	}

	public SaleRecBillbDto[] getBodys() {
		return bodys;
	}

	public void setBodys(SaleRecBillbDto[] bodys) {
		this.bodys = bodys;
	}
	
	
}
