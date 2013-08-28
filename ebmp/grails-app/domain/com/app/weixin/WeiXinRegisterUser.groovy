package com.app.weixin



import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class WeiXinRegisterUser {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    String openId //微信用户id
    String content
    static constraints = {
    }

    def defaultPart() {
        [id: id]
    }
}
