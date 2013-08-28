package com.app.bd.invbasdoc

import com.app.bd.corp.BdCorp
import com.app.bd.invcl.BdInvcl
import com.app.bd.measdoc.BdMeasdoc
import com.app.sm.user.SmUser

class BdInvbasdocTemp {
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期

    //基本信息
    String id
    Date  createtime //创建时间
    String  creator  //创建人
    String  graphid //图号
    String  invcode  //存货编码
    String  invbarcode //条形码
    String  invmnecode //助记码
    String  invname  //存货名称
    String  forinvname //外文名称
    String  invpinpai //品牌
    String  invshortname  //存货简称
    String  invspec //规格
    String  invtype  //型号

    //管理详情
    SmUser  modifier //修改人
    Date  modifytime  //修改时间
    BdCorp  pkCorp  //公司主键
    String  pkInvcl  //存货分类主键
    String  bdmeasdoc //主计量单位主键
    String  bdmeasdoc1  //销售默认单位
    String  bdmeasdoc2 //采购默认单位
    String  bdmeasdoc3  //库存默认单位
    String  bdmeasdoc4 //生产默认单位
    String  bdmeasdoc5  //零售计量单位
    boolean  discountflag //价格折扣基本
    boolean  ismngstockbygrswt //按毛重管理库存
    boolean  isretail  //是否零售
    boolean  isstorebyconvert //换算率结存
    boolean  laborflag  //应税劳务

    //档案详情
    BigDecimal  height  //高度
    BigDecimal  length //长度
    BigDecimal  width //宽度
    boolean  sealflag //封存标志
    boolean  setpartsflag  //成套件
    BigDecimal  shipunitnum //多少标准运输单位
    BigDecimal  storeunitnum  //多少标准存储单位
    BigDecimal  unitvolume  //单位体积
    BigDecimal  unitweight //单位重量
    BigDecimal  weitunitnum  //多少标准重量单位


    String sourceId //外系统id

    //自定义项
    String  def1 //自定义项1
    String  def2 //自定义项2
    String  def3 //自定义项3
    String  def4 //自定义项4
    String  def5 //自定义项5
    String  def6 //自定义项6
    String  def7 //自定义项7
    String  def8 //自定义项8
    String  def9 //自定义项9
    String  def10 //自定义项10
    String  def11 //自定义项11
    String  def12 //自定义项12
    String  def13 //自定义项13
    String  def14 //自定义项14
    String  def15 //自定义项15
    String  def16 //自定义项16
    String  def17 //自定义项17
    String  def18 //自定义项18
    String  def19 //自定义项19
    String  def20 //自定义项20
    String  free1  //自由项1
    String  free2 //自由项2
    String  free3  //自由项3
    String  free4 //自由项4
    String  free5  //自由项5
    String  memo  //备注



    static mapping = {
        cache true
    }


    def getCode(){
        invcode
    }

    def getName(){
        invname
    }

    def setName(name){
        invname=name
    }

    def defaultPart(){
        [id:id,code:invcode,name:invname,invcode:invcode,invname:invname]
    }
}
