package com.app.bd.deptdoc

import com.app.bd.corp.BdCorp

class BdDeptdoc {

    Date lastUpdated //最后修改日期
    Date dateCreated //创建日期

    String  id
    String  deptCode  //部门编码
    String  deptName //部门名称
    String  addr  //地址
    boolean  canceled  //部门是否封存
    String  def1  //自定义项1
    String  def2 //自定义项2
    String  def3  //自定义项3
    String  def4 //自定义项4
    String  def5  //自定义项5
    String  memo  //备注
    String  phone  //电话
    BdCorp  corp  //公司主键
    String  fatherId='0'  //上级部门
    String  remcode  //助记码
    static constraints = {
        deptCode(unique:'corp',nullable:false,blank:false)
        deptName(unique:'corp',nullable:false,blank:false)

    }

    static mapping = {
        cache true
    }

    def getCode(){
        deptCode
    }
    def getName(){
        deptName
    }

    def  defaultPart(){
        [id:id,code:deptCode,deptCode:deptCode,name:deptName,deptName:deptName]
    }
}
