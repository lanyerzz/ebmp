package com.app.bd.measdoc
//计量档案
class BdMeasdoc {
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期

    String id
    String shortname	//计量单位编码
    String measname		//计量单位名称
    Boolean basecodeflag	//是否基本单位
    String oppdimen		//所属量纲
    BigDecimal scalefactor	//换算系数
    String sourceId
    static constraints = {
        shortname(nullable:false,blank:false,unique:true);
        measname(nullable:false,blank:false,unique:true);
    }
    static mapping = {
        cache true
    }

    def defaultPart(){
        [id:id,code:shortname,shortname:shortname,name:measname,measname:measname]
    }

}
