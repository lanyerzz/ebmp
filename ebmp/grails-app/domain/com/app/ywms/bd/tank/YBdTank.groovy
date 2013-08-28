package com.app.ywms.bd.tank

import com.app.bd.invmandoc.BdInvmandoc

class YBdTank {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期
//基本信息
    String code
    Integer gllx//0:使用中  1: 包罐  2:清空  3:停用
    String describe
    BigDecimal bcrj //标秤容积(M3)
    BigDecimal aqrj //安全容积(M3)
    BdInvmandoc bdInvmandoc//存放物品
    Boolean bg//包罐
    Boolean zzgq//中转罐区
    Boolean bonded//保税
    Boolean zgzf//专罐专发
    Boolean rxhz//允许混装
    Boolean xuni //虚拟
    //计量信息
    Boolean bw //保温罐
    BigDecimal gd //高度 米
    BigDecimal gdsl //罐底死量(不包含在罐表中部分)
    String jyzsbh//检验证书编号
    Date jyrq//检验日期
    Date yxrq//有效日期
    String jygs//检验公司
    String jyyj//检验依据
    String jysm//检验说明
    BigDecimal gd1 //高度（耳朵）米
    BigDecimal gd2 //高度（泡沫线）
    BigDecimal zhijing //直径
    String code2 //相关罐号（工程）

    //管理说明
    String glsm//管理说明
    static constraints = {
    }

    def defaultPart(){
        ['id':id,'code':code,'name':code]
    }
}
