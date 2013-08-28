package com.app.weixin



import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.psndoc.BdPsndoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser


/**
 * ToUserName	开发者微信号
 FromUserName	 发送方帐号（一个OpenID）
 CreateTime	 消息创建时间 （整型）
 MsgType	 text
 Content	 文本消息内容
 MsgId	 消息id，64位整型
 */
class WeiXinUser {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    String openId //微信用户id

    BdPsndoc psndoc //内部员工绑定
    BdCumandoc cumandoc //客商绑定

    static constraints = {
    }

    def defaultPart() {
        [id: id]
    }
}
