package com.app.bd.psncl

import com.app.bd.corp.BdCorp

class BdPsncl {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期

    String  memo  //备注 
    BdCorp  bdCorp //公司
    String  pid = '0'//上级人员分类
    String  code  //人员分类编码
    String  name //人员分类名称
    Integer  psnclscope  //人员分类归属范围0:在职 1:试用期 2:离职
    Boolean  sealflag //封存标志 

    static constraints = {
        code(nullable: false,blank:false,unique:true)
        name(nullable: false,blank:false)
    }
}
