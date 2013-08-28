package com.app.bd.psndoc

import com.app.bd.corp.BdCorp
import com.app.bd.deptdoc.BdDeptdoc
import com.app.bd.psnbasdoc.BdPsnbasdoc
import com.app.bd.psncl.BdPsncl

//人员管理档案
class BdPsndoc {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期


    String amcode  //助记码 
    String  clerkcode //业务员编号 
    Boolean  clerkflag  //业务员标识 
    Boolean  indocflag  //已转入档案标识 
    Date  indutydate //到职日期 
    String  innercode  //编码级次 
    String  jobrank //岗位等级 
    String  jobseries  //岗位序列 
    BigDecimal  maxinnercode //内部编码内部最大值 
    Date  outdutydate  //离职日期 
    BdCorp  bdCorp //公司主键 
    BdDeptdoc  bdDeptdoc  //所在部门 
//    34  pk_om_job //岗位 
    BdPsnbasdoc  bdPsnbasdoc  //人员基本档案主键 
    BdPsncl  bdPsncl //人员类别 
    Integer  psnclscope //归属范围0:在职 1:试用期 2:离职
    String  psncode  //人员编码 
    String  psnname //姓名 
    Boolean  sealdate  //封存标记

    static constraints = {
        psncode(nullable: false,blank:false)
        psnname(nullable: false,blank:false)

    }

    static mapping ={
        indutydate(sqlType: 'date')
        outdutydate(sqlType: 'date')

    }

    def defaultPart(){
        [id:id,code:psncode,psncode:psncode,name:psnname,psnname:psnname]
    }
}
