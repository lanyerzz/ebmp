package com.app.sm.userinterface

import com.app.bd.corp.BdCorp

import com.app.sm.function.SmFunction
import com.app.sm.user.SmUser

import java.util.Date;

class SmUserinterface {
	Date dateCreated //创建时间 
	Date lastUpdated //最后修改时间
	
	String id
	BdCorp corp	//登陆公司
	SmUser user	//登陆用户
	SmFunction function	//常用节点

    static constraints = {

        function(unique: ['corp','user'])
    }
}
