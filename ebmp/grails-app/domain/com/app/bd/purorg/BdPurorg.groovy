package com.app.bd.purorg

import com.app.bd.corp.BdCorp
//采购组织
class BdPurorg {
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期

    String id
    String  code  //采购组织编码
    String  name  //采购组织名称
    String  def1  //自定义项1
    String  def2 //自定义项2
    String  def3  //自定义项3
    String  def4 //自定义项4
    String  def5  //自定义项5
    String  memo  //备注
    BdCorp  ownercorp  //所属公司
    boolean  sealflag //封存标志


    static constraints = {
        code(nullable:false,blank:false,unique:true)
        name(nullbale:false,blank:false,unique:true)
    }
    static mapping = {
        cache true
    }

}
