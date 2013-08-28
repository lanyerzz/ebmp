package com.app.ywms.bd.shipdoc

import com.app.bd.corp.BdCorp
import com.app.sm.user.SmUser

//船舶档案
class Yshipdoc {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期
    BdCorp pkCorp //公司
    //船舶基本信息
    String shipname //船名
    String shipcountry //船籍
    String shipforeignname //外文名称
    Date buildYear //建造年份
    String zjm //助记码
    Integer shiptype //船舶类型 0:内轮 1:外轮 2;其他
    BigDecimal shiplength//船长
    BigDecimal shipwidth //船宽
    BigDecimal draft //吃水
    BigDecimal load //载重
    BigDecimal grossweight //总重
    BigDecimal netweight //净重
    Boolean dl //大轮
    Boolean yrk //预入库
    //保安基本信息
    String bazsh//保安证书号
    String badj //保安等级
    String basm //保安声明
    //船舶联系方式
    String chuanzhu //船主
    String linkman //联系人
    String linktel//联系电话
    String head //负责人
    //附加信息
    SmUser maker //制单人
    Date makedate //制单日期
    Boolean syz //使用中
    String note //备注
    static constraints = {

        shipname(nullable: false,blank: false)

    }

    static mapping = {
        buildYear(sqlType:'date')
        makedate(sqlType:'date')
    }

    def defaultPart(){
        ['id':id,'shipname':shipname]
    }
}
