package com.app.sm.function

import com.app.pub.billtype.PubBilltype

import java.util.Date;



class SmFunction{

	//transient springSecurityService
	String id
    String smaction
    String smcontroller
    Date lastUpdated //
    Date dateCreated//
	String configAttribute

	String funCode;//节点编码
	String funName;//节点名称
	int funType;//节点类型

	String parentId='0';//父节点id
	String helpLink;//帮助文件地址
	String resourceCode;//资源码
    PubBilltype pubBilltype //单据类型
	String icUrl //图标路径
    String url
	static mapping = {
		cache true

	}

	static constraints = {

		configAttribute blank: false
		funCode(size:0..40,unique:true,blank: false,nullable: false)
		funName(size:0..40,unique: true,blank: false,nullable: false)

		helpLink(nullable:true)
		resourceCode(nullable:true)

		icUrl(nullable:true)

	}
	
//	private void setConfigAttribute(String configAttribute){
//		this.configAttribute=configAttribute
//	}
//	
//	private String getConfigAttribute(){
//		def _id=springSecurityService.principal.id
//		def configAttribute=	 executeQuery("""select ur.smRoles.roleCode from SmUserSmRoles ur
//																left join  ur.smRoles.function f
//																join  ur.smRoles.corp c where ur.smUser.id=?
//															and c.id=? and f=? """,[_id,159L,this])
//		def rt=''
//		configAttribute.each {
//			rt+=('${it},')
//		}
//		return rt
//	}
	
}
