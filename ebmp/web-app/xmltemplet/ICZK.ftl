<?xml version="1.0" encoding='gb2312'?>
<ufinterface billtype="IC" filename="${filename}" isDebug="N" isexchange="Y" proc="add" receiver="${receiver}" replace="Y" roottag="ic_bill" sender="9999" subtype="run">
    <ic_bill id="${docid}_1">
        <!-- 表头主要字段 -->
        <ic_bill_head>
            <!--单据主键 可空字段 空则系统自动增加-->
            <cgeneralhid></cgeneralhid>
            <!--单据类型编码 非空字段 -->
            <!--40	库存期初余额-->
            <!--41	库存期初借入单-->
            <!--44	库存期初来料加工单-->
            <!--45	库存采购入库单-->
            <!--46	库存产成品入库单-->
            <!--47	库存委外加工入库单-->
            <!--48	库存来料加工入库单-->
            <!--49	库存借入单-->
            <!--4A	库存其它入库单-->
            <!--4B	库存借出还回单-->
            <!--4C	库存销售出库单-->
            <!--4D	库存材料出库单-->
            <!--4F	库存委外加工发料单-->
            <!--4G	库存来料加工出库单-->
            <!--4H	库存借出单-->
            <!--4I	库存其它出库单-->
            <!--4J	库存借入还出单-->
            
            <cbilltypecode>4A</cbilltypecode>
            <!--单据公司主键 非空字段 需要基础数据对照（公司目录）-->
            <pk_corp>${receiver}</pk_corp>
            <!--单据号 可空字段, 如果为空保存时系统自动获取 -->
            <vbillcode>${hinfo.vbillcode}_1</vbillcode>
            <!--单据业务员主键 可空字段 需要基础数据对照（人员档案）-->
            <cbizid></cbizid>
            <!--单据业务类型主键 可空字段 需要基础数据对照（业务类型）(如果是采购入库单并与上游的采购订单关联，则单据业务类型需要与上游的采购订单一致)-->
            <cbiztype></cbiztype>
            <!--单据客户主键 可空字段 需要基础数据对照（客商档案）-->
            <ccustomerid></ccustomerid>
            <!--单据发运类别主键 可空字段 需要基础数据对照（发运方式）-->
            <cdilivertypeid></cdilivertypeid>
            <!--单据部门主键 可空字段 需要基础数据对照（部门档案）-->
            <cdptid></cdptid>
            <!--单据供应商主键 可空字段 需要基础数据对照（客商档案）-->
            <cproviderid></cproviderid>
            
            
            <!--单据收发类别主键 可空字段 需要基础数据对照（收发类别）-->
            <cdispatcherid>${rksflb?default('')}</cdispatcherid>
            <!--单据库存组织主键 非空字段 需要基础数据对照（库存组织）-->
            <pk_calbody>${calbodycode}</pk_calbody>
            <!--单据仓库主键 非空字段 需要基础数据对照（仓库档案）-->
            <cwarehouseid>${hinfo.cinstordocid.storcode}</cwarehouseid>
            
            
            <!--单据日期 非空字段 默认是当前日期,格式:YYYY-MM-DD -->
            <dbilldate>${hinfo.vbilldate}</dbilldate>
            <!--单据制单人主键 非空字段 需要基础数据对照（操作员）-->
            <coperatorid>${hinfo.makeman.usercode}</coperatorid>
            <!--单据当前制单人主键 非空字段 需要基础数据对照（操作员）-->
            <coperatoridnow>${hinfo.makeman.usercode}</coperatoridnow>
            
            <!--单据状态标志 非空字段  2是自由状态，3是签字，4是审核 默认是2-->
            <!-- 暂时仍以保存态上传 -->
        	<fbillflag>2</fbillflag>
            
            
            <!--单据库管员主键 可空字段 需要基础数据对照（人员档案）-->
            <cwhsmanagerid></cwhsmanagerid>
            <!--单据审核人主键 可空字段 需要基础数据对照（操作员）注:如果单据为签字状态签字人为必输字段-->
            <cauditorid></cauditorid>
            <!--单据存货结算日期 可空字段 格式:YYYY-MM-DD -->
            <dauditdate></dauditdate>
            <!--调拨类型标志，调拨出入库单非空字段0是直运调拨，1是入库调拨-->
            <fallocflag></fallocflag>
            
            
			<!--调拨入（出）库单     出货（入库）  公司主键   调拨出入库单非空字段 需要基础数据对照（公司目录）-->
            <cothercorpid>${receiver}</cothercorpid>
			<!--调拨入（出）库单     出货（入库） 库存组织主键   调拨出入库单非空字段 需要基础数据对照（库存组织）-->
            <cothercalbodyid>${calbodycode}</cothercalbodyid>
            <!--调拨入（出）库单    出货（入库）  仓库主键    可空字段 需要基础数据对照（仓库档案）-->
            <cotherwhid>${hinfo.coutstordocid.storcode}</cotherwhid>
            
            
			<!--调拨入（出）库单    调出    公司主键 调拨出入库单非空字段 需要基础数据对照（公司目录）-->
            <coutcorpid></coutcorpid>
            <!--调拨入（出）库单    调 出   库存组织主键    调拨出入库单非空字段 需要基础数据对照（库存组织）-->
            <coutcalbodyid></coutcalbodyid>
            <!--调拨入（出）库单   调出    仓库主键    可空字段 需要基础数据对照（仓库档案）-->
            <coutwhid></coutwhid>
            
            
            <!--单据发货地址 可空字段 需要基础数据对照（客商发货地址)-->
            <vdiliveraddress></vdiliveraddress>
            <!--单据表头备注 可空字段 -->
            <vnote>${hinfo.memo}</vnote>
            <!--单据表头自定义项1 可空字段 -->
            <vuserdef1>
            </vuserdef1>
            <!--单据表头自定义项2 可空字段 -->
            <vuserdef2>
            </vuserdef2>
            <!--单据表头自定义项3 可空字段 -->
            <vuserdef3>
            </vuserdef3>
            <!--单据表头自定义项4 可空字段 -->
            <vuserdef4>
            </vuserdef4>
            <!--单据表头自定义项5 可空字段 -->
            <vuserdef5>
            </vuserdef5>
            <!--单据表头自定义项6 可空字段 -->
            <vuserdef6>
            </vuserdef6>
            <!--单据表头自定义项7 可空字段 -->
            <vuserdef7>
            </vuserdef7>
            <!--单据表头自定义项8 可空字段 -->
            <vuserdef8>
            </vuserdef8>
            <!--单据表头自定义项9 可空字段 -->
            <vuserdef9>
            </vuserdef9>
            <!--单据表头自定义项10 可空字段 -->
            <vuserdef10>
            </vuserdef10>
            <!--单据表头自定义项11 可空字段 -->
            <vuserdef11>
            </vuserdef11>
            <!--单据表头自定义项12 可空字段 -->
            <vuserdef12>
            </vuserdef12>
            <!--单据表头自定义项13 可空字段 -->
            <vuserdef13>
            </vuserdef13>
            <!--单据表头自定义项14 可空字段 -->
            <vuserdef14>
            </vuserdef14>
            <!--单据表头自定义项15 可空字段 -->
            <vuserdef15>
            </vuserdef15>
            <!--单据表头自定义项16 可空字段 -->
            <vuserdef16>
            </vuserdef16>
            <!--单据表头自定义项17 可空字段 -->
            <vuserdef17>
            </vuserdef17>
            <!--单据表头自定义项18 可空字段 -->
            <vuserdef18>
            </vuserdef18>
            <!--单据表头自定义项19 可空字段 -->
            <vuserdef19>
            </vuserdef19>
            <!--单据表头自定义项20 可空字段 -->
            <vuserdef20>
            </vuserdef20>
            <!--单据表头自定义项1主键 可空字段 -->
            <pk_defdoc1>
            </pk_defdoc1>
            <!--单据表头自定义项2主键 可空字段 -->
            <pk_defdoc2>
            </pk_defdoc2>
            <!--单据表头自定义项3主键 可空字段 -->
            <pk_defdoc3>
            </pk_defdoc3>
            <!--单据表头自定义项4主键 可空字段 -->
            <pk_defdoc4>
            </pk_defdoc4>
            <!--单据表头自定义项5主键 可空字段 -->
            <pk_defdoc5>
            </pk_defdoc5>
            <!--单据表头自定义项6主键 可空字段 -->
            <pk_defdoc6>
            </pk_defdoc6>
            <!--单据表头自定义项7主键 可空字段 -->
            <pk_defdoc7>
            </pk_defdoc7>
            <!--单据表头自定义项8主键 可空字段 -->
            <pk_defdoc8>
            </pk_defdoc8>
            <!--单据表头自定义项9主键 可空字段 -->
            <pk_defdoc9>
            </pk_defdoc9>
            <!--单据表头自定义项10主键 可空字段 -->
            <pk_defdoc10>
            </pk_defdoc10>
            <!--单据表头自定义项11主键 可空字段 -->
            <pk_defdoc11>
            </pk_defdoc11>
            <!--单据表头自定义项12主键 可空字段 -->
            <pk_defdoc12>
            </pk_defdoc12>
            <!--单据表头自定义项13主键 可空字段 -->
            <pk_defdoc13>
            </pk_defdoc13>
            <!--单据表头自定义项14主键 可空字段 -->
            <pk_defdoc14>
            </pk_defdoc14>
            <!--单据表头自定义项15主键 可空字段 -->
            <pk_defdoc15>
            </pk_defdoc15>
            <!--单据表头自定义项16主键 可空字段 -->
            <pk_defdoc16>
            </pk_defdoc16>
            <!--单据表头自定义项17主键 可空字段 -->
            <pk_defdoc17>
            </pk_defdoc17>
            <!--单据表头自定义项18主键 可空字段 -->
            <pk_defdoc18>
            </pk_defdoc18>
            <!--单据表头自定义项9主键 可空字段 -->
            <pk_defdoc19>
            </pk_defdoc19>
            <!--单据表头自定义项20主键 可空字段 -->
            <pk_defdoc20>
            </pk_defdoc20>
        </ic_bill_head>
        <body>
        	<#list blist as binfo>
        		<#list binfo.bodys as info>
        			<entry>
		                <!--单据表头主键 非空字段，必须和对应的表头一致 -->
		                <cgeneralhid>
		                </cgeneralhid>
		                <!--单据表体主键 可空字段 空则系统自动增加 -->
		                <cgeneralbid>
		                </cgeneralbid>
		                <!--单据表体辅计量主键 可空字段 需要基础数据对照（计量单位)-->
		                <castunitid>${binfo.fjl.unitcode}</castunitid>
		                <!--单据表体对应单据表体主键 可空字段 -->
		                <ccorrespondbid>
		                </ccorrespondbid>
		                <!--单据表体对应单据号主键 可空字段 -->
		                <ccorrespondcode>
		                </ccorrespondcode>
		                <!--单据表体对应单据表头主键 可空字段 -->
		                <ccorrespondhid>
		                </ccorrespondhid>
		                <!--单据表体对应单据类型编码 可空字段 -->
		                <ccorrespondtype>
		                </ccorrespondtype>
		                <!--单据表体成本对象主键 可空字段 需要基础数据对照（存货管理档案)-->
		                <ccostobject>
		                </ccostobject>
		                
		                <!--单据表体存货管理主键 非空字段 需要基础数据对照（存货管理档案)-->
		                <cinventoryid>${info.pkinvbasdoc.invcode}</cinventoryid>
		                <!--单据表体存货编码 非空字段 需要基础数据对照（存货基础档案)-->
		                <!--cinventoryid></cinventoryid-->
		                
		                <!--单据表体项目主键 可空字段  需要基础数据对照（项目档案)-->
		                <cprojectid>
		                </cprojectid>
		                <!--单据表体项目阶段主键 可空字段 需要基础数据对照（项目阶段档案)-->
		                <cprojectphaseid>
		                </cprojectphaseid>
		                <!--单据表体来源单据表体主键 可空字段 注:有来源单据此字段非空-->
		                <csourcebillbid>
		                </csourcebillbid>
		                <!--单据表体来源单据表头主键 可空字段 注:有来源单据此字段非空-->
		                <csourcebillhid>
		                </csourcebillhid>
		                <!--单据表体来源单据类型编码 可空字段 注:有来源单据此字段非空-->
		                <csourcetype>
		                </csourcetype>
		                <!--单据表体来源单据号 可空字段 注:有来源单据此字段非空-->
		                <vsourcebillcode>
		                </vsourcebillcode>
		                <!--单据表体业务日期 有数量时为非空字段 格式:YYYY-MM-DD-->
		                <dbizdate>${hinfo.vbilldate}</dbizdate>
		                <!--单据表体失效日期 可空字段 -->
		                <dvalidate></dvalidate>
		                
		                <!-- 换算率 -->
		                <hsl>${binfo.hsl}</hsl>
		                
		                <!--单据表体应收数量 可空字段 -->
		                <nshouldinnum>${binfo.nnumber * info.nnumber}</nshouldinnum>
		                <!--单据表体入库数量 可空字段 注:入库数量,与出库数量不能同时填写! -->
		                <ninnum>${binfo.nnumber * info.nnumber}</ninnum>
		                
		                <!--单据表体应收辅数量 可空字段 -->
		                <nneedinassistnum>${binfo.fnumber * info.nnumber}</nneedinassistnum>
		                <!--单据表体入库辅数量 可空字段 -->
		                <ninassistnum>${binfo.fnumber * info.nnumber}</ninassistnum>
		                
		                
						<!--单据表体应出库辅数量 可空字段 -->
		                <nshouldoutassistnum></nshouldoutassistnum>
		                <!--单据表体应出库数量 可空字段 -->
		                <nshouldoutnum></nshouldoutnum>
		                <!--单据表体出库辅数量 可空字段 -->
		                <noutassistnum></noutassistnum>
		                <!--单据表体出库数量 可空字段 -->
		                <noutnum></noutnum>
		                
		                
		                <!--单据表体借入/借出转出辅数量 可空字段 -->
		                <ntranoutastnum></ntranoutastnum>
		                <!--单据表体借入/借出转出库数量  可空字段 -->
		                <ntranoutnum></ntranoutnum>
		                
		
		                <!--单据表体计划单价 可空字段 (产成品入库单必输计划单价)-->
		                <nplannedprice></nplannedprice>
		                <!--单据表体计划金额 可空字段 -->
		                <nplannedmny></nplannedmny>
		                <!--单据表体单价 可空字段 -->
		                <nprice></nprice>
		                <!--单据表体金额 可空字段 -->
		                <nmny></nmny>
		                <!--单据表体批次号 可空字段 -->
		                <vbatchcode></vbatchcode>
		                <!--单据表体生产次号 可空字段 -->
		                <vproductbatch></vproductbatch>
		                <!--单据表头自定义项1 可空字段 -->
		                <vuserdef1></vuserdef1>
		                <!--单据表头自定义项2 可空字段 -->
		                <vuserdef2></vuserdef2>
		                <!--单据表头自定义项3 可空字段 -->
		                <vuserdef3></vuserdef3>
		                <!--单据表头自定义项4 可空字段 -->
		                <vuserdef4></vuserdef4>
		                <!--单据表头自定义项5 可空字段 -->
		                <vuserdef5></vuserdef5>
		                <!--单据表头自定义项6 可空字段 -->
		                <vuserdef6></vuserdef6>
		                <!--单据表头自定义项7 可空字段 -->
		                <vuserdef7></vuserdef7>
		                <!--单据表头自定义项8 可空字段 -->
		                <vuserdef8></vuserdef8>
		                <!--单据表头自定义项9 可空字段 -->
		                <vuserdef9></vuserdef9>
		                <!--单据表头自定义项10 可空字段 -->
		                <vuserdef10></vuserdef10>
		                <!--单据表头自定义项11 可空字段 -->
		                <vuserdef11></vuserdef11>
		                <!--单据表头自定义项12 可空字段 -->
		                <vuserdef12></vuserdef12>
		                <!--单据表头自定义项13 可空字段 -->
		                <vuserdef13></vuserdef13>
		                <!--单据表头自定义项14 可空字段 -->
		                <vuserdef14></vuserdef14>
		                <!--单据表头自定义项15 可空字段 -->
		                <vuserdef15></vuserdef15>
		                <!--单据表头自定义项16 可空字段 -->
		                <vuserdef16></vuserdef16>
		                <!--单据表头自定义项17 可空字段 -->
		                <vuserdef17></vuserdef17>
		                <!--单据表头自定义项18 可空字段 -->
		                <vuserdef18></vuserdef18>
		                <!--单据表头自定义项19 可空字段 -->
		                <vuserdef19></vuserdef19>
		                <!--单据表头自定义项20 可空字段 -->
		                <vuserdef20></vuserdef20>
		                <!--单据表头自定义项1主键 可空字段 -->
		                <pk_defdoc1></pk_defdoc1>
		                <!--单据表头自定义项2主键 可空字段 -->
		                <pk_defdoc2></pk_defdoc2>
		                <!--单据表头自定义项3主键 可空字段 -->
		                <pk_defdoc3></pk_defdoc3>
		                <!--单据表头自定义项4主键 可空字段 -->
		                <pk_defdoc4></pk_defdoc4>
		                <!--单据表头自定义项5主键 可空字段 -->
		                <pk_defdoc5></pk_defdoc5>
		                <!--单据表头自定义项6主键 可空字段 -->
		                <pk_defdoc6></pk_defdoc6>
		                <!--单据表头自定义项7主键 可空字段 -->
		                <pk_defdoc7></pk_defdoc7>
		                <!--单据表头自定义项8主键 可空字段 -->
		                <pk_defdoc8></pk_defdoc8>
		                <!--单据表头自定义项9主键 可空字段 -->
		                <pk_defdoc9></pk_defdoc9>
		                <!--单据表头自定义项10主键 可空字段 -->
		                <pk_defdoc10></pk_defdoc10>
		                <!--单据表头自定义项11主键 可空字段 -->
		                <pk_defdoc11></pk_defdoc11>
		                <!--单据表头自定义项12主键 可空字段 -->
		                <pk_defdoc12></pk_defdoc12>
		                <!--单据表头自定义项13主键 可空字段 -->
		                <pk_defdoc13></pk_defdoc13>
		                <!--单据表头自定义项14主键 可空字段 -->
		                <pk_defdoc14></pk_defdoc14>
		                <!--单据表头自定义项15主键 可空字段 -->
		                <pk_defdoc15></pk_defdoc15>
		                <!--单据表头自定义项16主键 可空字段 -->
		                <pk_defdoc16></pk_defdoc16>
		                <!--单据表头自定义项17主键 可空字段 -->
		                <pk_defdoc17></pk_defdoc17>
		                <!--单据表头自定义项18主键 可空字段 -->
		                <pk_defdoc18></pk_defdoc18>
		                <!--单据表头自定义项9主键 可空字段 -->
		                <pk_defdoc19></pk_defdoc19>
		                <!--单据表头自定义项20主键 可空字段 -->
		                <pk_defdoc20></pk_defdoc20>
		                
		                <!--单据表体自由项项1 可空字段 需要基础数据对照（自定义项档案 包装装数)-->
		                <vfree1>${binfo.zhuangshu.docname}</vfree1>
		                <!--单据表体自由项项2 可空字段 需要基础数据对照（自定义项档案)-->
		                <vfree2></vfree2>
		                <!--单据表体自由项项3 可空字段 需要基础数据对照（自定义项档案)-->
		                <vfree3></vfree3>
		                <!--单据表体自由项项4 可空字段 需要基础数据对照（自定义项档案)-->
		                <vfree4></vfree4>
		                <!--单据表体自由项项5 可空字段 需要基础数据对照（自定义项档案)-->
		                <vfree5></vfree5>
		                <!--单据表体源头单据表体主键 可空字段 -->
		                <cfirstbillbid></cfirstbillbid>
		                <!--单据表体源头单据表头主键 可空字段 -->
		                <cfirstbillhid></cfirstbillhid>
		                <!--单据表体源头单据类型编码 可空字段 -->
		                <cfirsttype></cfirsttype>
		                <!--单据表体供应商主键 可空字段 需要基础数据对照（客商档案)-->
		                <cvendorid></cvendorid>
		                <!--单据表体注释 可空字段 -->
		                <vnotebody></vnotebody>
		                <!--单据表体行号 非空字段 系统可自动填写行号-->
		                <crowno></crowno>
		                <!--待检标志  可空字段 1 待检 0 正常(默认) -->
		                <fchecked></fchecked>
		                <!--赠品标志  可空字段 Y 赠品  默认为N-->
		                <flargess></flargess>
		                <!--暂估标志  可空字段 Y 暂估 默认为N -->
		                <bzgflag></bzgflag>
		                <!--暂估日期  可空字段  格式:YYYY-MM-DD-->
		                <dzgdate></dzgdate>
		                <!-- 工作中心 可空字段  -->
		                <cwp></cwp>
		                <!-- 投料点 可空字段  -->
		                <cworksiteid></cworksiteid>
		            </entry>
        		</#list>
        	</#list>
        </body>
    </ic_bill>
    <ic_bill id="${docid}_2">
        <!-- 表头主要字段 -->
        <ic_bill_head>
            <!--单据主键 可空字段 空则系统自动增加-->
            <cgeneralhid></cgeneralhid>
            <!--单据类型编码 非空字段 -->
            <!--40	库存期初余额-->
            <!--41	库存期初借入单-->
            <!--44	库存期初来料加工单-->
            <!--45	库存采购入库单-->
            <!--46	库存产成品入库单-->
            <!--47	库存委外加工入库单-->
            <!--48	库存来料加工入库单-->
            <!--49	库存借入单-->
            <!--4A	库存其它入库单-->
            <!--4B	库存借出还回单-->
            <!--4C	库存销售出库单-->
            <!--4D	库存材料出库单-->
            <!--4F	库存委外加工发料单-->
            <!--4G	库存来料加工出库单-->
            <!--4H	库存借出单-->
            <!--4I	库存其它出库单-->
            <!--4J	库存借入还出单-->
            <cbilltypecode>4I</cbilltypecode>
            <!--单据公司主键 非空字段 需要基础数据对照（公司目录）-->
            <pk_corp>${receiver}</pk_corp>
            
            <!--单据号 可空字段, 如果为空保存时系统自动获取 -->
            <vbillcode>${hinfo.vbillcode}_2</vbillcode>
            <!--单据业务员主键 可空字段 需要基础数据对照（人员档案）-->
            <cbizid></cbizid>
            <!--单据业务类型主键 可空字段 需要基础数据对照（业务类型）(如果是采购入库单并与上游的采购订单关联，则单据业务类型需要与上游的采购订单一致)-->
            <cbiztype></cbiztype>
            <!--单据客户主键 可空字段 需要基础数据对照（客商档案）-->
            <ccustomerid></ccustomerid>
            <!--单据发运类别主键 可空字段 需要基础数据对照（发运方式）-->
            <cdilivertypeid></cdilivertypeid>
            <!--单据收发类别主键 可空字段 需要基础数据对照（收发类别）-->
            <cdispatcherid>${cksflb?default('')}</cdispatcherid>
            <!--单据部门主键 可空字段 需要基础数据对照（部门档案）-->
            <cdptid></cdptid>
            <!--单据供应商主键 可空字段 需要基础数据对照（客商档案）-->
            <cproviderid></cproviderid>
           
			
			<!--单据库存组织主键 非空字段 需要基础数据对照（库存组织）-->
            <pk_calbody>${calbodycode}</pk_calbody>
            <!--单据仓库主键 非空字段 需要基础数据对照（仓库档案）-->
            <cwarehouseid>${hinfo.coutstordocid.storcode}</cwarehouseid>
            
            
            <!--单据库管员主键 可空字段 需要基础数据对照（人员档案）-->
            <cwhsmanagerid></cwhsmanagerid>
            
            <!--单据日期 非空字段 默认是当前日期,格式:YYYY-MM-DD -->
            <dbilldate>${hinfo.vbilldate}</dbilldate>
            <!--单据制单人主键 非空字段 需要基础数据对照（操作员）-->
            <coperatorid>${hinfo.makeman.usercode}</coperatorid>
            <!--单据当前制单人主键 非空字段 需要基础数据对照（操作员）-->
            <coperatoridnow>${hinfo.makeman.usercode}</coperatoridnow>
            
            
            <!--单据状态标志 非空字段  2是自由状态，3是签字，4是审核 默认是2-->
            <!-- 暂时仍以保存态上传 -->
        	<fbillflag>2</fbillflag>
            
            
            <!--单据审核人主键 可空字段 需要基础数据对照（操作员）注:如果单据为签字状态签字人为必输字段-->
            <cauditorid></cauditorid>
            <!--单据存货结算日期 可空字段 格式:YYYY-MM-DD -->
            <dauditdate></dauditdate>
            <!--调拨类型标志，调拨出入库单非空字段0是直运调拨，1是入库调拨-->
            <fallocflag></fallocflag>
            
            
			<!--调拨入（出）库单     出货（入库）  公司主键   调拨出入库单非空字段 需要基础数据对照（公司目录）-->
            <cothercorpid>${receiver}</cothercorpid>
			<!--调拨入（出）库单     出货（入库） 库存组织主键   调拨出入库单非空字段 需要基础数据对照（库存组织）-->
            <cothercalbodyid>${calbodycode}</cothercalbodyid>
            <!--调拨入（出）库单    出货（入库）  仓库主键    可空字段 需要基础数据对照（仓库档案）-->
            <cotherwhid>${hinfo.cinstordocid.storcode}</cotherwhid>
            
            
			<!--调拨入（出）库单    调出    公司主键 调拨出入库单非空字段 需要基础数据对照（公司目录）-->
            <coutcorpid></coutcorpid>
            <!--调拨入（出）库单    调 出   库存组织主键    调拨出入库单非空字段 需要基础数据对照（库存组织）-->
            <coutcalbodyid></coutcalbodyid>
            <!--调拨入（出）库单   调出    仓库主键    可空字段 需要基础数据对照（仓库档案）-->
            <coutwhid></coutwhid>
            
            
            <!--单据发货地址 可空字段 需要基础数据对照（客商发货地址)-->
            <vdiliveraddress></vdiliveraddress>
            <!--单据表头备注 可空字段 -->
            <vnote>${hinfo.memo}</vnote>
            <!--单据表头自定义项1 可空字段 -->
            <vuserdef1>
            </vuserdef1>
            <!--单据表头自定义项2 可空字段 -->
            <vuserdef2>
            </vuserdef2>
            <!--单据表头自定义项3 可空字段 -->
            <vuserdef3>
            </vuserdef3>
            <!--单据表头自定义项4 可空字段 -->
            <vuserdef4>
            </vuserdef4>
            <!--单据表头自定义项5 可空字段 -->
            <vuserdef5>
            </vuserdef5>
            <!--单据表头自定义项6 可空字段 -->
            <vuserdef6>
            </vuserdef6>
            <!--单据表头自定义项7 可空字段 -->
            <vuserdef7>
            </vuserdef7>
            <!--单据表头自定义项8 可空字段 -->
            <vuserdef8>
            </vuserdef8>
            <!--单据表头自定义项9 可空字段 -->
            <vuserdef9>
            </vuserdef9>
            <!--单据表头自定义项10 可空字段 -->
            <vuserdef10>
            </vuserdef10>
            <!--单据表头自定义项11 可空字段 -->
            <vuserdef11>
            </vuserdef11>
            <!--单据表头自定义项12 可空字段 -->
            <vuserdef12>
            </vuserdef12>
            <!--单据表头自定义项13 可空字段 -->
            <vuserdef13>
            </vuserdef13>
            <!--单据表头自定义项14 可空字段 -->
            <vuserdef14>
            </vuserdef14>
            <!--单据表头自定义项15 可空字段 -->
            <vuserdef15>
            </vuserdef15>
            <!--单据表头自定义项16 可空字段 -->
            <vuserdef16>
            </vuserdef16>
            <!--单据表头自定义项17 可空字段 -->
            <vuserdef17>
            </vuserdef17>
            <!--单据表头自定义项18 可空字段 -->
            <vuserdef18>
            </vuserdef18>
            <!--单据表头自定义项19 可空字段 -->
            <vuserdef19>
            </vuserdef19>
            <!--单据表头自定义项20 可空字段 -->
            <vuserdef20>
            </vuserdef20>
            <!--单据表头自定义项1主键 可空字段 -->
            <pk_defdoc1>
            </pk_defdoc1>
            <!--单据表头自定义项2主键 可空字段 -->
            <pk_defdoc2>
            </pk_defdoc2>
            <!--单据表头自定义项3主键 可空字段 -->
            <pk_defdoc3>
            </pk_defdoc3>
            <!--单据表头自定义项4主键 可空字段 -->
            <pk_defdoc4>
            </pk_defdoc4>
            <!--单据表头自定义项5主键 可空字段 -->
            <pk_defdoc5>
            </pk_defdoc5>
            <!--单据表头自定义项6主键 可空字段 -->
            <pk_defdoc6>
            </pk_defdoc6>
            <!--单据表头自定义项7主键 可空字段 -->
            <pk_defdoc7>
            </pk_defdoc7>
            <!--单据表头自定义项8主键 可空字段 -->
            <pk_defdoc8>
            </pk_defdoc8>
            <!--单据表头自定义项9主键 可空字段 -->
            <pk_defdoc9>
            </pk_defdoc9>
            <!--单据表头自定义项10主键 可空字段 -->
            <pk_defdoc10>
            </pk_defdoc10>
            <!--单据表头自定义项11主键 可空字段 -->
            <pk_defdoc11>
            </pk_defdoc11>
            <!--单据表头自定义项12主键 可空字段 -->
            <pk_defdoc12>
            </pk_defdoc12>
            <!--单据表头自定义项13主键 可空字段 -->
            <pk_defdoc13>
            </pk_defdoc13>
            <!--单据表头自定义项14主键 可空字段 -->
            <pk_defdoc14>
            </pk_defdoc14>
            <!--单据表头自定义项15主键 可空字段 -->
            <pk_defdoc15>
            </pk_defdoc15>
            <!--单据表头自定义项16主键 可空字段 -->
            <pk_defdoc16>
            </pk_defdoc16>
            <!--单据表头自定义项17主键 可空字段 -->
            <pk_defdoc17>
            </pk_defdoc17>
            <!--单据表头自定义项18主键 可空字段 -->
            <pk_defdoc18>
            </pk_defdoc18>
            <!--单据表头自定义项9主键 可空字段 -->
            <pk_defdoc19>
            </pk_defdoc19>
            <!--单据表头自定义项20主键 可空字段 -->
            <pk_defdoc20>
            </pk_defdoc20>
        </ic_bill_head>
        <body>
        	<#list blist as binfo>
        		<#list binfo.bodys as info>
        			<entry>
		                <!--单据表头主键 非空字段，必须和对应的表头一致 -->
		                <cgeneralhid>
		                </cgeneralhid>
		                <!--单据表体主键 可空字段 空则系统自动增加 -->
		                <cgeneralbid>
		                </cgeneralbid>
		                <!--单据表体辅计量主键 可空字段 需要基础数据对照（计量单位)-->
		                <castunitid>${binfo.fjl.unitcode}</castunitid>
		                <!--单据表体对应单据表体主键 可空字段 -->
		                <ccorrespondbid>
		                </ccorrespondbid>
		                <!--单据表体对应单据号主键 可空字段 -->
		                <ccorrespondcode>
		                </ccorrespondcode>
		                <!--单据表体对应单据表头主键 可空字段 -->
		                <ccorrespondhid>
		                </ccorrespondhid>
		                <!--单据表体对应单据类型编码 可空字段 -->
		                <ccorrespondtype>
		                </ccorrespondtype>
		                <!--单据表体成本对象主键 可空字段 需要基础数据对照（存货管理档案)-->
		                <ccostobject>
		                </ccostobject>
		                
		                <!--单据表体存货管理主键 非空字段 需要基础数据对照（存货管理档案)-->
		                <cinventoryid>${info.pkinvbasdoc.invcode}</cinventoryid>
		                <!--单据表体存货编码 非空字段 需要基础数据对照（存货基础档案)-->
		                <!--cinventoryid></cinventoryid-->
		                
		                <!--单据表体项目主键 可空字段  需要基础数据对照（项目档案)-->
		                <cprojectid>
		                </cprojectid>
		                <!--单据表体项目阶段主键 可空字段 需要基础数据对照（项目阶段档案)-->
		                <cprojectphaseid>
		                </cprojectphaseid>
		                <!--单据表体来源单据表体主键 可空字段 注:有来源单据此字段非空-->
		                <csourcebillbid>
		                </csourcebillbid>
		                <!--单据表体来源单据表头主键 可空字段 注:有来源单据此字段非空-->
		                <csourcebillhid>
		                </csourcebillhid>
		                <!--单据表体来源单据类型编码 可空字段 注:有来源单据此字段非空-->
		                <csourcetype>
		                </csourcetype>
		                <!--单据表体来源单据号 可空字段 注:有来源单据此字段非空-->
		                <vsourcebillcode>
		                </vsourcebillcode>
		                <!--单据表体业务日期 有数量时为非空字段 格式:YYYY-MM-DD-->
		                <dbizdate>${hinfo.vbilldate}</dbizdate>
		                <!--单据表体失效日期 可空字段 -->
		                <dvalidate></dvalidate>
		                
		                <!--单据表体应收数量 可空字段 -->
		                <nshouldinnum></nshouldinnum>
		                <!--单据表体入库数量 可空字段 注:入库数量,与出库数量不能同时填写! -->
		                <ninnum></ninnum>
		                
		                <!--单据表体应收辅数量 可空字段 -->
		                <nneedinassistnum></nneedinassistnum>
		                <!--单据表体入库辅数量 可空字段 -->
		                <ninassistnum></ninassistnum>
		                
		                <!-- 换算率 -->
		                <hsl>${binfo.hsl}</hsl>
		                
						<!--单据表体应出库辅数量 可空字段 -->
		                <nshouldoutassistnum>${binfo.fnumber * info.nnumber}</nshouldoutassistnum>
		                <!--单据表体出库辅数量 可空字段 -->
		                <noutassistnum>${binfo.fnumber * info.nnumber}</noutassistnum>
		                
		                <!--单据表体应出库数量 可空字段 -->
		                <nshouldoutnum>${binfo.nnumber * info.nnumber}</nshouldoutnum>
		                <!--单据表体出库数量 可空字段 -->
		                <noutnum>${binfo.nnumber * info.nnumber}</noutnum>
		                
		                
		                <!--单据表体借入/借出转出辅数量 可空字段 -->
		                <ntranoutastnum></ntranoutastnum>
		                <!--单据表体借入/借出转出库数量  可空字段 -->
		                <ntranoutnum></ntranoutnum>
		                
		
		                <!--单据表体计划单价 可空字段 (产成品入库单必输计划单价)-->
		                <nplannedprice></nplannedprice>
		                <!--单据表体计划金额 可空字段 -->
		                <nplannedmny></nplannedmny>
		                <!--单据表体单价 可空字段 -->
		                <nprice></nprice>
		                <!--单据表体金额 可空字段 -->
		                <nmny></nmny>
		                <!--单据表体批次号 可空字段 -->
		                <vbatchcode></vbatchcode>
		                <!--单据表体生产次号 可空字段 -->
		                <vproductbatch></vproductbatch>
		                <!--单据表头自定义项1 可空字段 -->
		                <vuserdef1></vuserdef1>
		                <!--单据表头自定义项2 可空字段 -->
		                <vuserdef2></vuserdef2>
		                <!--单据表头自定义项3 可空字段 -->
		                <vuserdef3></vuserdef3>
		                <!--单据表头自定义项4 可空字段 -->
		                <vuserdef4></vuserdef4>
		                <!--单据表头自定义项5 可空字段 -->
		                <vuserdef5></vuserdef5>
		                <!--单据表头自定义项6 可空字段 -->
		                <vuserdef6></vuserdef6>
		                <!--单据表头自定义项7 可空字段 -->
		                <vuserdef7></vuserdef7>
		                <!--单据表头自定义项8 可空字段 -->
		                <vuserdef8></vuserdef8>
		                <!--单据表头自定义项9 可空字段 -->
		                <vuserdef9></vuserdef9>
		                <!--单据表头自定义项10 可空字段 -->
		                <vuserdef10></vuserdef10>
		                <!--单据表头自定义项11 可空字段 -->
		                <vuserdef11></vuserdef11>
		                <!--单据表头自定义项12 可空字段 -->
		                <vuserdef12></vuserdef12>
		                <!--单据表头自定义项13 可空字段 -->
		                <vuserdef13></vuserdef13>
		                <!--单据表头自定义项14 可空字段 -->
		                <vuserdef14></vuserdef14>
		                <!--单据表头自定义项15 可空字段 -->
		                <vuserdef15></vuserdef15>
		                <!--单据表头自定义项16 可空字段 -->
		                <vuserdef16></vuserdef16>
		                <!--单据表头自定义项17 可空字段 -->
		                <vuserdef17></vuserdef17>
		                <!--单据表头自定义项18 可空字段 -->
		                <vuserdef18></vuserdef18>
		                <!--单据表头自定义项19 可空字段 -->
		                <vuserdef19></vuserdef19>
		                <!--单据表头自定义项20 可空字段 -->
		                <vuserdef20></vuserdef20>
		                <!--单据表头自定义项1主键 可空字段 -->
		                <pk_defdoc1></pk_defdoc1>
		                <!--单据表头自定义项2主键 可空字段 -->
		                <pk_defdoc2></pk_defdoc2>
		                <!--单据表头自定义项3主键 可空字段 -->
		                <pk_defdoc3></pk_defdoc3>
		                <!--单据表头自定义项4主键 可空字段 -->
		                <pk_defdoc4></pk_defdoc4>
		                <!--单据表头自定义项5主键 可空字段 -->
		                <pk_defdoc5></pk_defdoc5>
		                <!--单据表头自定义项6主键 可空字段 -->
		                <pk_defdoc6></pk_defdoc6>
		                <!--单据表头自定义项7主键 可空字段 -->
		                <pk_defdoc7></pk_defdoc7>
		                <!--单据表头自定义项8主键 可空字段 -->
		                <pk_defdoc8></pk_defdoc8>
		                <!--单据表头自定义项9主键 可空字段 -->
		                <pk_defdoc9></pk_defdoc9>
		                <!--单据表头自定义项10主键 可空字段 -->
		                <pk_defdoc10></pk_defdoc10>
		                <!--单据表头自定义项11主键 可空字段 -->
		                <pk_defdoc11></pk_defdoc11>
		                <!--单据表头自定义项12主键 可空字段 -->
		                <pk_defdoc12></pk_defdoc12>
		                <!--单据表头自定义项13主键 可空字段 -->
		                <pk_defdoc13></pk_defdoc13>
		                <!--单据表头自定义项14主键 可空字段 -->
		                <pk_defdoc14></pk_defdoc14>
		                <!--单据表头自定义项15主键 可空字段 -->
		                <pk_defdoc15></pk_defdoc15>
		                <!--单据表头自定义项16主键 可空字段 -->
		                <pk_defdoc16></pk_defdoc16>
		                <!--单据表头自定义项17主键 可空字段 -->
		                <pk_defdoc17></pk_defdoc17>
		                <!--单据表头自定义项18主键 可空字段 -->
		                <pk_defdoc18></pk_defdoc18>
		                <!--单据表头自定义项9主键 可空字段 -->
		                <pk_defdoc19></pk_defdoc19>
		                <!--单据表头自定义项20主键 可空字段 -->
		                <pk_defdoc20></pk_defdoc20>
		                
		                <!--单据表体自由项项1 可空字段 需要基础数据对照（自定义项档案 包装装数)-->
		                <vfree1>${binfo.zhuangshu.docname}</vfree1>
		                <!--单据表体自由项项2 可空字段 需要基础数据对照（自定义项档案)-->
		                <vfree2></vfree2>
		                <!--单据表体自由项项3 可空字段 需要基础数据对照（自定义项档案)-->
		                <vfree3></vfree3>
		                <!--单据表体自由项项4 可空字段 需要基础数据对照（自定义项档案)-->
		                <vfree4></vfree4>
		                <!--单据表体自由项项5 可空字段 需要基础数据对照（自定义项档案)-->
		                <vfree5></vfree5>
		                <!--单据表体源头单据表体主键 可空字段 -->
		                <cfirstbillbid></cfirstbillbid>
		                <!--单据表体源头单据表头主键 可空字段 -->
		                <cfirstbillhid></cfirstbillhid>
		                <!--单据表体源头单据类型编码 可空字段 -->
		                <cfirsttype></cfirsttype>
		                <!--单据表体供应商主键 可空字段 需要基础数据对照（客商档案)-->
		                <cvendorid></cvendorid>
		                <!--单据表体注释 可空字段 -->
		                <vnotebody></vnotebody>
		                <!--单据表体行号 非空字段 系统可自动填写行号-->
		                <crowno></crowno>
		                <!--待检标志  可空字段 1 待检 0 正常(默认) -->
		                <fchecked></fchecked>
		                <!--赠品标志  可空字段 Y 赠品  默认为N-->
		                <flargess></flargess>
		                <!--暂估标志  可空字段 Y 暂估 默认为N -->
		                <bzgflag></bzgflag>
		                <!--暂估日期  可空字段  格式:YYYY-MM-DD-->
		                <dzgdate></dzgdate>
		                <!-- 工作中心 可空字段  -->
		                <cwp></cwp>
		                <!-- 投料点 可空字段  -->
		                <cworksiteid></cworksiteid>
		            </entry>
        		</#list>
        	</#list>
        </body>
    </ic_bill>
</ufinterface>
