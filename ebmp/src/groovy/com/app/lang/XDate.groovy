package com.app.lang

import java.text.SimpleDateFormat
import java.util.Date

class XDate extends Date {

	
	public XDate(){		
		super();
//		this.setHours(0);
//		this.setMinutes(0);
//		this.setSeconds(0);
		
	}

	@Override
	public String toString() {
		return this.format("yyyy-MM-dd");
	}
	
	
}
