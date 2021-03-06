<#setting number_format="0.########">
<?xml version="1.0" encoding='UTF-8'?>
<ufinterface  billtype="4U" filename="${filename}" isexchange="Y" proc="add" receiver="${receiver}" replace="Y" roottag="ic_bill" sender="9999" subbilltype="4K">
    <ic_bill id="${docid}">
        <header>
        		
        	
            <!--单据类型编码 -->
            <cbilltypecode>4K</cbilltypecode>
           <!--公司 -->
            <pk_corp>${receiver}</pk_corp>
           <!--单据号 -->
            <vbillcode></vbillcode>
          <!--单据日期-->
            <dbilldate>${hinfo.vbilldate}</dbilldate>
            <!--pk_sendtype,最大长度为20,类型为:String-->
            <pk_sendtype></pk_sendtype>
           <!--业务类型 -->
            <cbiztype></cbiztype>
            
            <cincalbodyid>${calbodycode}</cincalbodyid>
			<coutcalbodyid>${calbodycode}</coutcalbodyid>
			<!--入库仓库 -->
            <cinwarehouseid>${hinfo.cinstordocid.storcode}</cinwarehouseid>
            <!--出库仓库 -->
            <coutwarehouseid>${hinfo.coutstordocid.storcode}</coutwarehouseid>
          	<!--部门 -->
            <cdeptid></cdeptid>
           <!-- -->
            <cbsmanid></cbsmanid>
            <!--操作员 -->
            <coperatorid>${hinfo.makeman.usercode}</coperatorid>
            <!--审批人 -->
            <cauditorid></cauditorid>
            
            <!--审批日期 -->
            <dauditordate></dauditordate>
            
             <!--单据状态标志 非空字段  2是自由状态，3是签字，4是审核 默认是2-->
            <!-- 暂时仍以保存态上传 -->
            <fbillflag>2</fbillflag>
            <!--vnote,最大长度为100,类型为:String-->
            <vnote>${hinfo.vbillcode},${hinfo.memo}</vnote>
            
        </header>
        <body>
        <#list blist as binfo>
        		<#list binfo.bodys as info>
            <entry>
                <!--callocationbid,最大长度为20,类型为:String-->
                <callocationbid></callocationbid>
                <!--callocationhid,最大长度为20,类型为:String-->
                <callocationhid></callocationhid>
                <!--存货 -->
                <cinventoryid>${info.pkinvbasdoc.invcode}</cinventoryid>
                
                <!--vbatchcode,最大长度为20,类型为:String-->
                <vbatchcode></vbatchcode>
               
                <castunitid>${binfo.fjl.unitcode}</castunitid>
                <!--nprice,最大长度为13,类型为:UFDouble-->
                <nprice>0.00000000</nprice>
                <!--nmny,最大长度为13,类型为:UFDouble-->
                <nmny>0.00000000</nmny>
                <!--crowno,最大长度为20,类型为:String-->
                <crowno></crowno>
                <!--入库仓库 -->
                <cinwarehouseid>${hinfo.cinstordocid.storcode}</cinwarehouseid>
               <!--出库仓库 -->
                <coutwarehouseid>${hinfo.coutstordocid.storcode}</coutwarehouseid>
               <!--行备注 -->
                <vnote></vnote>
               
                <!--计划出库日期-->
                <dplanindate>${hinfo.vbilldate}</dplanindate>
                <!--计划入库日期-->
                <dplanoutdate>${hinfo.vbilldate}</dplanoutdate>
                <!--xxxx -->
                <dvalidate>${hinfo.vbilldate}</dvalidate>
                
                <!--换算率 -->
                <hsl>${binfo.hsl}</hsl>
                <!-- 数量-->
                <dshldtransnum>${binfo.nnumber * info.nnumber}</dshldtransnum>
                <!--辅助数量-->
                <nshldtransastnum>${binfo.fnumber * info.nnumber}</nshldtransastnum>
            
                <!--fbillrowflag,最大长度为2,类型为:Integer-->
                <fbillrowflag>0</fbillrowflag>
                
                 <!--单据表体自由项项1 可空字段 需要基础数据对照（自定义项档案 包装装数)-->
		         <vfree1>${binfo.zhuangshu.docname}</vfree1>
               
            </entry>
            	</#list>
        	</#list>
        </body>
    </ic_bill>
</ufinterface>
