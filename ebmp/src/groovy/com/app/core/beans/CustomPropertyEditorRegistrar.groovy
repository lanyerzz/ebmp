package com.app.core.beans

import java.text.DateFormat
import java.text.SimpleDateFormat;

//import grails.util.GrailsConfig;

import org.springframework.beans.PropertyEditorRegistrar;
import org.springframework.beans.PropertyEditorRegistry;
//import org.springframework.beans.propertyeditors.CustomDateEditor;

import com.app.lang.XDate;
class CustomPropertyEditorRegistrar implements PropertyEditorRegistrar{

	@Override
	public void registerCustomEditors(PropertyEditorRegistry arg0) {
		//def format = GrailsConfig.get("grails.date.formats",String.class)?:"yyyy-MM-dd'T'HH:mm:ssZ"
		//def df= DateFormat.getDateInstance (DateFormat.LONG)

//		df.setTimeZone(TimeZone.getTimeZone("UTC"))
		arg0.registerCustomEditor(Date.class,new CustomDateBinder());
		//arg0.registerCustomEditor(XDate.class,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
}
