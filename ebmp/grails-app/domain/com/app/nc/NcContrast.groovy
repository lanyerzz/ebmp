package com.app.nc


import com.app.bd.corp.BdCorp

class NcContrast {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    String type

    String sourveValue
    String targetValue


    BdCorp bdCorp


    static constraints = {
    }


}
