<?xml version="1.0" encoding='gb2312'?>
<ufinterface account="" billtype="5X" filename="${filename}" isexchange="" proc="add" receiver="${receiver}" replace="Y" sender="9999">
    <bill id="${docid}">
        <billhead>
        
            <!--单据号,最大长度为30,类型为:String-->
            <vcode>${vbillno}</vcode>
            
            <!--业务类型,不能为空,最大长度为20,类型为:String-->
            <cbiztypeid>${busitype}</cbiztypeid>   
            <!--单据类型,不能为空,最大长度为4,类型为:String-->
            <cbilltype>5X</cbilltype>                   
            <!--是否退回,不能为空,最大长度为1,类型为:Boolean-->
            <bretractflag>N</bretractflag>
            <!--单据主表ID,最大长度为20,类型为:String-->
            <cbillid></cbillid>
            
            <!--调出公司,不能为空,最大长度为4,类型为:String-->
            <coutcorpid>${outcorp}</coutcorpid>
            <!--调出库存组织,不能为空,最大长度为20,类型为:String-->
            <coutcbid>${coutcbid}</coutcbid>
            <!--调出仓库ID,最大长度为20,类型为:String-->
            <coutwhid>${hinfo.coutstordocid.storcode}</coutwhid>
            
            <!--调入公司,不能为空,最大长度为4,类型为:String-->
            <cincorpid>${incorp}</cincorpid>
            <!--调入库存组织,不能为空,最大长度为20,类型为:String-->
            <cincbid>${cincbid}</cincbid>
            <!--调入仓库ID,最大长度为20,类型为:String-->
            <cinwhid>${hinfo.cinstordocid.storcode}</cinwhid>
            
            <!--操作员,不能为空,最大长度为20,类型为:String-->
            <coperatorid>${hinfo.makeman.usercode}</coperatorid>
            <!--制单日期,不能为空,最大长度为10,类型为:Date-->
            <dbilldate>${hinfo.vbilldate}</dbilldate> 
            
            
            <!--1自由状态（单据录入后2审批中（申请提交审批后）3审批未通过（申请审批未通过）4未处理（单据审批后）-->
            <!-- 暂时仍以保存态上传 -->
		  	<fstatusflag>1</fstatusflag>  	      
            
            <!--币种,最大长度为20,类型为:String-->
            <coutcurrtype>${hinfo.currencytypeid.currCode}</coutcurrtype>
            <!--折本汇率,不能为空,最大长度为15,类型为:Double-->
            <nexchangeotobrate>${exrate?string("0.########")}</nexchangeotobrate>
            
            <!--项目,最大长度为20,类型为:String-->
            <cprojectid></cprojectid>
            <!--出货库存组织,三方调拨时不能为空,最大长度为20,类型为:String-->
            <ctakeoutcbid></ctakeoutcbid>
            <!--出货公司,三方调拨时不能为空,最大长度为4,类型为:String-->
            <ctakeoutcorpid></ctakeoutcorpid>
            <!--调入调出在途归属,不能为空,最大长度为2,类型为:Integer 0：归调出；1:归调入-->
            <foiwastpartflag>0</foiwastpartflag>
            <!--调出出货在途归属,不能为空,最大长度为2,类型为:Integer 0：归调出；1:归调入-->
            <fotwastpartflag>0</fotwastpartflag>
            <!--表头自定义项1,最大长度为100,类型为:String-->
            <vdef1></vdef1>
            <!--表头自定义项10,最大长度为100,类型为:String-->
            <vdef10></vdef10>
            <!--表头自定义项2,最大长度为100,类型为:String-->
            <vdef2></vdef2>
            <!--表头自定义项3,最大长度为100,类型为:String-->
            <vdef3></vdef3>
            <!--表头自定义项4,最大长度为100,类型为:String-->
            <vdef4></vdef4>
            <!--表头自定义项5,最大长度为100,类型为:String-->
            <vdef5></vdef5>
            <!--表头自定义项6,最大长度为100,类型为:String-->
            <vdef6></vdef6>
            <!--表头自定义项7,最大长度为100,类型为:String-->
            <vdef7></vdef7>
            <!--表头自定义项8,最大长度为100,类型为:String-->
            <vdef8></vdef8>
            <!--表头自定义项9,最大长度为100,类型为:String-->
            <vdef9></vdef9>
            <!--备注,最大长度为120,类型为:String-->
            <vnote>${hinfo.memo}</vnote>
        </billhead>
        <billbody>
        	<#list blist as binfo>
        		<#list binfo.bodys as bbinfo>
		            <entry>               
		                <!--表体id,最大长度为20,类型为:String-->
		                <cbill_bid></cbill_bid>
		                <!--表头id,最大长度为20,类型为:String-->
		                <cbillid></cbillid>
		                <!--源头单据表体ID,最大长度为20,类型为:String-->
		                <cfirstbid></cfirstbid>
		                <!--源头单据表头ID,最大长度为20,类型为:String-->
		                <cfirstid></cfirstid>
		                <!--源头单据类型编码,最大长度为4,类型为:String-->
		                <cfirsttypecode></cfirsttypecode>
		                <!--调入仓库ID,最大长度为20,类型为:String-->
		                <cincbid></cincbid>
		                <!--调入公司ID,最大长度为4,类型为:String-->
		                <cincorpid></cincorpid>
		                <!--调入部门ID,最大长度为20,类型为:String-->
		                <cindeptid></cindeptid>               
		                <!--调入人员,最大长度为20,类型为:String-->
		                <cinpsnid></cinpsnid>
		                <!--调入货物,最大长度为20,类型为:String-->
		                <cinspaceid></cinspaceid>               
		                <!--调入仓库id,最大长度为20,类型为:String-->
		                <cinwhid></cinwhid>
		                <!--调出库存组织id,最大长度为20,类型为:String-->
		                <coutcbid></coutcbid>
		                <!--调出公司id,最大长度为4,类型为:String-->
		                <coutcorpid></coutcorpid>
		                <!--调出部门id,最大长度为20,类型为:String-->
		                <coutdeptid></coutdeptid>
		                <!--调出存货管理档案,不能为空,最大长度为20,类型为:String-->
		                <coutinvid>0603000002</coutinvid>
		                <!--调出人员,最大长度为20,类型为:String-->
		                <coutpsnid></coutpsnid>
		                <!--调出货位,最大长度为20,类型为:String-->
		                <coutspaceid></coutspaceid>
		                <!--调出仓库id,最大长度为20,类型为:String-->
		                <coutwhid></coutwhid>
		                <!--项目,最大长度为20,类型为:String-->
		                <cprojectid></cprojectid>
		                <!--项目阶段,最大长度为20,类型为:String-->
		                <cprojectphase></cprojectphase>
		                <!--creceieveid,最大长度为20,类型为:String-->
		                <creceieveid></creceieveid>
		                <!--调拨关系子表,最大长度为20,类型为:String-->
		                <crelation_bid></crelation_bid>
		                <!--调拨关系主表,最大长度为20,类型为:String-->
		                <crelationid></crelationid>                            
		                <!--出货库存组织,最大长度为20,类型为:String-->
		                <ctakeoutcbid></ctakeoutcbid>
		                <!--出货公司,最大长度为4,类型为:String-->
		                <ctakeoutcorpid></ctakeoutcorpid>
		                <!--出货部门,最大长度为20,类型为:String-->
		                <ctakeoutdeptid></ctakeoutdeptid>
		                <!--出货公司存货管理档案,最大长度为20,类型为:String-->
		                <ctakeoutinvid></ctakeoutinvid>
		                <!--出货人员,最大长度为20,类型为:String-->
		                <ctakeoutpsnid></ctakeoutpsnid>
		                <!--出货货位,最大长度为20,类型为:String-->
		                <ctakeoutspaceid></ctakeoutspaceid>
		                <!--出货仓库,最大长度为20,类型为:String-->
		                <ctakeoutwhid></ctakeoutwhid>
		                <!--调出出货调拨关系子表,最大长度为20,类型为:String-->
		                <ctakerelation_bid></ctakerelation_bid>
		                <!--调出出货调拨关系主表,最大长度为20,类型为:String-->
		                <ctakerelationid></ctakerelationid>
		                <!--计划到货日期,最大长度为10,类型为:Date-->
		                <dplanarrivedate></dplanarrivedate>
		                <!--计划发货日期,最大长度为10,类型为:Date-->
		                <dplanoutdate></dplanoutdate>
		                <!--生产日期,最大长度为10,类型为:Date-->
		                <dproducedate></dproducedate>
		                <!--失效日期,最大长度为10,类型为:Date-->
		                <dvalidate></dvalidate>              
		                <!--赠品标志,最大长度为1,类型为:Boolean-->
		                <flargess>N</flargess>
		                <!--加价率,最大长度为9,类型为:Double-->
		                <naddpricerate>0.00</naddpricerate>
		                
		                <!--辅数量,最大长度为20,类型为:Double-->
		                <nassistnum>${binfo.fnumber * bbinfo.nnumber}</nassistnum>
		                <!--数量,不能为空,最大长度为20,类型为:Double-->
		                <nnum>${binfo.nnumber * bbinfo.nnumber}</nnum>
		                
		                <!--换算率,最大长度为20,类型为:Double-->
		                <nchangerate>${binfo.hsl}</nchangerate>
		                
		                <!--金额,最大长度为20,类型为:Double-->
		                <nmny>${binfo.nmoney}</nmny>
		                <!--非含税金额,最大长度为20,类型为:Double-->
		                <nnotaxmny>${binfo.nmoney}</nnotaxmny>
		                
		                <!--单价,最大长度为20,类型为:Double-->
		                <nprice>${binfo.nprice}</nprice>
		                <!--非含税单价,最大长度为20,类型为:Double-->
		                <nnotaxprice>${binfo.nprice}</nnotaxprice>
		                
		                
		                <!--税率,最大长度为9,类型为:Double-->
		                <ntaxrate>0.0000000</ntaxrate>
		                <!--到货地点,最大长度为20,类型为:String-->
		                <pk_arrivearea></pk_arrivearea>
		                <!--运输方式,最大长度为20,类型为:String-->
		                <pk_sendtype></pk_sendtype>
		                <!--批次号,最大长度为30,类型为:String-->
		                <vbatch></vbatch>
		                <!--表体自定义项1,最大长度为100,类型为:String-->
		                <vbdef1></vbdef1>
		                <!--表体自定义项2,最大长度为100,类型为:String-->
		                <vbdef2></vbdef2>
		                <!--表体自定义项3,最大长度为100,类型为:String-->
		                <vbdef3></vbdef3>
		                <!--表体自定义项4,最大长度为100,类型为:String-->
		                <vbdef4></vbdef4>
		                <!--表体自定义项5,最大长度为100,类型为:String-->
		                <vbdef5></vbdef5>
		                <!--表体自定义项6,最大长度为100,类型为:String-->
		                <vbdef6></vbdef6>
		                <!--单据号,最大长度为30,类型为:String-->
		                <vcode></vcode>
		                <!--源头单据号,最大长度为30,类型为:String-->
		                <vfirstcode></vfirstcode>
		                
		                <!--自由项1,最大长度为100,类型为:String-->
		                <vfree1>${binfo.zhuangshu.docname}</vfree1>
		                
		                <!--自由项2,最大长度为100,类型为:String-->
		                <vfree2></vfree2>
		                <!--自由项3,最大长度为100,类型为:String-->
		                <vfree3></vfree3>
		                <!--自由项4,最大长度为100,类型为:String-->
		                <vfree4></vfree4>
		                <!--自由项5,最大长度为100,类型为:String-->
		                <vfree5></vfree5>
		                <!--收货地址,最大长度为256,类型为:String-->
		                <vreceiveaddress></vreceiveaddress>
		            </entry>
        		</#list>
        	</#list>
        </billbody>
    </bill>
</ufinterface>
