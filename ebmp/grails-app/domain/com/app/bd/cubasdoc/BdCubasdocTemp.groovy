package com.app.bd.cubasdoc

class BdCubasdocTemp {
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期
    String id
    String custcode //客商编号
    Integer custprop //客商类型   0）外部单位  1）内部单位
    boolean blockUp //停用
    String custshortname	//客商简称
    String custname //客商名称
    String engname	//外文名称
    String mnecode  //助记码

    boolean signClient //签约客户
    boolean trader //贸易商
    boolean	deliveryCorp //提货单位
    boolean agentCorp //代理单位
    boolean openingCorp //开证单位
    boolean exchange //交易所
    boolean transitwarehouse //中转库区
    boolean useWhenStorage //入库时使用

    String legalbody	//法人代表
    String	linkman  //联系人
    String conaddr //通信地址
    String phone  //联系电话
    String fax	//传真
    String url //网址
    String zipcode  //邮政编码
    String email	//E-mail
    String recordInfo //备案信息
    Date sampleGuarantee //样张有效期

    String contractLinkman //合同联系人
    String phone1 //联系电话
    String fax1 //传真
    String invoiceLinkman //结算发票联系人
    String phone2 //联系电话
    String fax2 //传真
    String contractInvoiceMailingAddress //合同发票邮寄地址
    String accountStatementMailingAddress //对账单邮寄地址
    String consignee //收件人
    String zipcode1 //邮编
    String phone3 //联系电话
    String fax3 //传真

    String commercialInstruments //营业执照
    String organizationalSetupCard //组织机构代码证
//    String bankOfDeposit //开户银行
//    String account //账号
    String taxRegistryNo //税务登记号
    String grade //等级
    BigDecimal creditmny //信用额度
    BigDecimal accountsReceivablePeriod //应收账期
    BigDecimal accountsPayablePeriod //应付账期

    boolean msgservice //开通短信通知服务
    boolean emailservice //开通邮件通知服务
    boolean asOwnerNotify //作为货主通知
    boolean deliveryNotify //提货时通知
    String receivePhone //接收手机号码
    String textShort //短信简称
    String receiveEmail //接收邮件


    String creator //创建人
    String	memo //备注



//    String ecotypesincevfive	//经济类型



    Boolean freecustflag	//是否散户
    Boolean isconnflag	//是否渠道成员

    String linkman2 	//联系人2
    String linkman3  //联系人3

    String mobilephone1 //手机1
    String mobilephone2  //手机2
    String mobilephone3 //手机3

    String pkAreacl //地区分类
    String pkCorp  //公司主键
    String pkCorp1 //对应公司编码
    BigDecimal registerfund //注册资金
    String saleaddr  //营业地址
    Boolean sealflag //封存标志
    String taxpayerid  //纳税人登记号
    String trade //所属行业

    String sourceId

}
