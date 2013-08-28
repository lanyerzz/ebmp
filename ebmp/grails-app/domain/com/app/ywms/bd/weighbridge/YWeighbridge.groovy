package com.app.ywms.bd.weighbridge



import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class YWeighbridge {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    String code
    String commName
    int ibit
    int databits
    int stopbits
    int payity
    String driver
    String writeFilePath
    BdCorp bdCorp

    static constraints = {
        code nullable: false
        commName nullable: false
        ibit nullable: false
        databits nullable:false
        payity nullable:false
        bdCorp nullable: false
        driver nullable: false
    }

    def defaultPart() {
        [id: id]
    }
}
