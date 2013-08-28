package com.app.bd.bankdoc

import com.app.bd.banktype.BdBanktype
import com.app.bd.corp.BdCorp
import com.app.sm.user.SmUser
//银行档案
class BdBankdoc {

    String  address  //所在地 varchar
    String  amcode //助记码 varchar
    String  bankdoccode  //银行编码 varchar
    String  bankdocname //银行名称 varchar

    SmUser  creator//创建人 char
    String  linkman1  //联系人1 varchar
    String  linkman2 //联系人2 varchar
    String  linkman3  //联系人3 varchar
    SmUser  modifier //修改人 char

    String  phone1// 联系电话1 varchar
    String  phone2 // 联系电话2 varchar
    String  phone3 //联系电话3 varchar
    String  id//  银行档案主键 char 是
    BdBanktype  banktype// 银行类别 char
    BdCorp  bdCorp//  公司主键 char
    String  pid='0'// 上级银行 char
    Boolean  sealflag //封存标志 char
    String  shortname // 银行简称 varchar


    static constraints = {
        bankdoccode nullable:false,unique: 'bdCorp'
        bankdocname nullable:false,unique: 'bdCorp'
    }
    static mapping = {

    }
}
