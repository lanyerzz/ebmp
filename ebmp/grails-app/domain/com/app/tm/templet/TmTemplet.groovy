package com.app.tm.templet

import com.app.bd.corp.BdCorp

class TmTemplet {

    Date dateCreated //创建日期
    Date lastUpdated //最后修改日期
    String id

    String templetCode //编码
    String templetName //名称
    String templetPath	//模板路径
    Integer templetType //模板分类 0)打印模板   1)查询模板	2)单据模板	3)报表模板
    BdCorp corp //公司
    static constraints = {
        templetCode(nullable:false,blank:false,unique:true)
        templetName(nullable:false,blank:false,unique:true)
    }
}
