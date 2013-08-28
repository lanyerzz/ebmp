package com.app.sm.roles

import com.app.bd.corp.BdCorp
import com.app.domain.IDTO;

import com.app.sm.function.SmFunction;

class SmRoles{
	String id
	static hasMany = [function:SmRolesCorpFunction,corp:BdCorp]
//	String authority
	String roleCode //
	String roleName
	String description
	static mapping = {
		cache true
	}

	static constraints = {
//		authority blank: false, unique: true
		roleCode(blank: false, unique: true,nullable:false)
		roleName(blank: false, unique: true,nullable:false)
		description()
	}

    @Override
    String getName() {
        return null  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    void setName(String s) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    String getType() {
        return null  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    void setType(String s) {
        //To change body of implemented methods use File | Settings | File Templates.
    }
}
