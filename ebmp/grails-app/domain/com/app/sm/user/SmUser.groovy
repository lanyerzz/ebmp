package com.app.sm.user

import com.app.bd.corp.BdCorp
import com.app.bd.psndoc.BdPsndoc
import com.app.exception.BusinessException
import com.app.sm.roles.SmRoles

import java.util.Date;




class SmUser{

	transient springSecurityService
	String id
	String username
	String password
	boolean userenabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	
	Date lastUpdated //
	Date dateCreated
	String userRealName
	String address
	String linkTel
	String linkTel1
	String linkTel2
    BdPsndoc psndoc //人员档案
//	BdDeptdoc deptdoc
	
	static constraints = {
		username blank: false, unique: true
		password blank: false

	}

	static mapping = {
		password column: '`password`'
		cache true
	}

	Set<SmUserSmRoles> getAuthorities() {
		SmUserSmRoles.findAllBySmUser(this) as Set
	}
    Set<SmUserSmRoles> getAuthorities(String corpid) {
        BdCorp corp=BdCorp.get(corpid)
        if (!corp)
            throw new BusinessException('公司信息失效！')
        SmUserSmRoles.findAllBySmUserAndBdCorp(this,corp) as Set
    }

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

    def getCode(){
        username
    }

    def getName(){
        userRealName
    }

    def defaultPart(){
        ['id':id,'username':username,'userRealName':userRealName]
    }

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

    @Override
    String getFirstName() {
        return null  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    void setFirstName(String s) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    void setLastName(String s) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    String getLastName() {
        return null  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    void setEmail(String s) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    String getEmail() {
        return null  //To change body of implemented methods use File | Settings | File Templates.
    }
}
