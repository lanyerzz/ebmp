package com.app.bd.carsinfo

import com.app.bd.cumandoc.BdCumandoc
//车辆信息
class BdCarsinfo {

    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期
    String id

    String carCode //编号
    String carNo //车号
    int carType //挂车种类 0普通半挂 1罐式全挂 2集装箱全挂
    String carOwner //车主姓名
    String carOwnerId //车主身份证号码
    String linkPhone //联系电话
    String linkMan //联系人
    BdCumandoc  clqsdw//车辆权属单位
    BdCumandoc  carrier//承运商
    BigDecimal approvedLoading //核定载重
    boolean isLoadlimit//是否限载
    BigDecimal deadweight //车辆自重
    String yszjCode //运输证件编号
    Date yszjyxq //运输证件有效期
    String ylrqzNo //压力容器证书号
    Date ylrqyxq //压力容器有效期

    String memo //备注



    static constraints = {
        carCode(nullable:false,blank:false,unique:true)
        carNo(nullable:false,blank:false,unique:true)

    }

    static mapping = {
        cache true;
        yszjyxq(sqlType:'date')
        ylrqyxq(sqlType:'date')
    }
}
