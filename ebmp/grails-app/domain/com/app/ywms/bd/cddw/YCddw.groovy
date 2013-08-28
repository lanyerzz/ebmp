package com.app.ywms.bd.cddw

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.sm.user.SmUser

//船代单位
class YCddw {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期
    BdCorp pkCorp //公司

//基础信息
    String code //单位代码
    String name //单位名称
    String zjf //助记符
    Boolean blockUp //停用
    BdCumandoc bdCumandoc //客户
//联系人信息
    String linkman //联系人
    String frdb //法人代表
    String linktel //联系电话
    String fax //传真
    String url //主页
    String email //Email
    String address //地址
//财务信息
    String yyzz //营业执照
    String zzjgdmz //组织机构代码证
    String khyh //开户银行
    String account //帐号
    String swdjh //税务登记号
//其他信息
    SmUser maker //制单人
    Date makedate //制单日期
    String note //备注

    static constraints = {
        code(nullable: false,blank: false,unique:true)
        name(nullable: false,blank:false)


    }

    static mapping = {
        makedate(sqlType:'date')
    }
}
