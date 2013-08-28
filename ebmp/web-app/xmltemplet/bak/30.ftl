<?xml version="1.0" encoding="gb2312"?>
<ufinterface roottag="so_order" billtype="30"  replace="Y" receiver="${receiver}" sender="9999" isexchange="Y" filename="${filename}" proc="add" operation="req">
<so_order id="${docid}" subdoctype="">
		<so_order_head>
			<!--去掉了销售订单主表主键-->
			
			<!--公司PK,不能为空，参照基础数据"公司目录"-->
			<pk_corp>${receiver}</pk_corp>

			<!--单据号,可空字段, 如果为空保存时系统自动获取 -->
			<vreceiptcode>${vbillno}</vreceiptcode>

			<!--单据类型,不能为空-->
			<creceipttype>30</creceipttype>

			<!--业务类型ID,可空字段（参照业务类型档案ID）-->
			<cbiztype>${busitype}</cbiztype>
			
			<!--会计年度,可以为空-->
			<vaccountyear></vaccountyear>

			<!--期初标志,可以为空,若为期初订单请置为Y-->
			<binitflag>N</binitflag>

			<!--单据日期,不能为空,YYYY-MM-DD-->
			<dbilldate>${hinfo.vbilldate}</dbilldate>

			<!--客商管理档案ID,不能为空（需要参照客商管理档案ID）-->
			<ccustomerid>${hinfo.ccustomer.custorm_Bas.custcode}</ccustomerid>

			<!--部门档案ID,不能为空（需要参照部门档案基础数据）-->
			<cdeptid>${deptid}</cdeptid>

			<!--业务员档案ID,可以为空,需对应部门（需要参照业务员档案基础数据）-->
			<cemployeeid></cemployeeid>

			<!--制单人:人员档案ID,不能为空（需要参照人员档案基础数据）-->
			<coperatorid>${hinfo.makeman.usercode}</coperatorid>

			<!--收款协议ID,可以为空,（需要参照收付款档案基础数据）-->
			<ctermprotocolid></ctermprotocolid>

			<!--销售组织ID,不能为空（需要参照'销售组织'档案基础数据）-->
			<csalecorpid>${csalecorpid}</csalecorpid>

			<!--库存组织ID,不能为空（需要参照库存组织档案基础数据）-->
			<ccalbodyid>${ccalbodyid}</ccalbodyid>

			<!--收货单位客商管理档案ID,不能为空（需要参照客商管理档案基础数据）-->
			<creceiptcustomerid>${hinfo.ccustomer.custorm_Bas.custcode}</creceiptcustomerid>

			<!--收货地址字符串,可以为空-->
			<vreceiveaddress></vreceiveaddress>

			<!--收货地区ID,可以为空（需要参照收货单位所属地区档案基础数据）-->
			<creceiptareaid></creceiptareaid>

			<!--开票单位客商管理档案ID,不能为空（需要参照客商管理档案基础数据）-->
			<creceiptcorpid>${hinfo.ccustomer.custorm_Bas.custcode}</creceiptcorpid>

			<!--开票单位所用开户银行档案ID,可以为空-->
			<ccustbankid></ccustbankid>

			<!--运输方式ID,可以为空（需要参照运输方式管理档案基础数据）-->
			<ctransmodeid></ctransmodeid>

			<!--整单折扣,不能为空-->
			<ndiscountrate>${ndiscount?string("0.########")}</ndiscountrate>

			<!--仓库档案ID,可以为空,需要基础数据对照（仓库档案）-->
			<cwarehouseid>${hinfo.pk_stordoc.storcode}</cwarehouseid>

			<!--修订理由,可以为空-->
			<veditreason></veditreason>

			<!--是否散户,默认为N-->
			<bfreecustflag>N</bfreecustflag>

			<!--散户ID,可以为空（需要参照客商管理档案基础数据）-->
			<cfreecustid></cfreecustid>

			<!--结算标志,默认为N-->
			<ibalanceflag>0</ibalanceflag>

			<!--订金,可以为空-->
			<nsubscription></nsubscription>

			<!--预估运费,可以为空-->
			<nevaluatecarriage></nevaluatecarriage>

			<!--制单日期,不能为空,YYYY-MM-DD-->
			<dmakedate>${hinfo.vbilldate}</dmakedate>

			<!--状态,不能为空:0无状态,1自由,2审批,3冻结,4关闭,5作废,6结束,7正在审批,8审批未通过-->
			<!--上传时暂时仍为保存状态-->
			<fstatus>1</fstatus>

			<!--备注,可以为空-->
			<vnote>${hinfo.memo?default('') + "  应收" +hinfo.nrecmoney+ "  折扣" +hinfo.nrebatemoney}</vnote>

			<!--自定义1,可以为空-->
			<vdef1></vdef1>

			<!--自定义2,可以为空-->	
			<vdef2></vdef2>

			<!--自定义3,可以为空-->
			<vdef3></vdef3>

			<!--自定义4,可以为空-->
			<vdef4></vdef4>

			<!--自定义5,可以为空-->
			<vdef5></vdef5>

			<!--自定义6,可以为空-->
			<vdef6></vdef6>

			<!--自定义7,可以为空-->
			<vdef7></vdef7>

			<!--自定义8,可以为空-->
			<vdef8></vdef8>

			<!--自定义9,可以为空-->
			<vdef9></vdef9>

			<!--自定义10,可以为空-->
			<vdef10></vdef10>
			<!--pk_defdoc1,可以为空(),vdef1为统计型参照时pk_defdoc1赋值vdef1对应名称的pk值-->
            <pk_defdoc1></pk_defdoc1>
			<!--pk_defdoc2,可以为空(),vdef2为统计型参照时pk_defdoc1赋值vdef2对应名称的pk值-->
            <pk_defdoc2></pk_defdoc2>
			<!--pk_defdoc3,可以为空(),vdef3为统计型参照时pk_defdoc1赋值vdef3对应名称的pk值-->
            <pk_defdoc3></pk_defdoc3>
			<!--pk_defdoc4,可以为空(),vdef4为统计型参照时pk_defdoc1赋值vdef4对应名称的pk值-->
            <pk_defdoc4></pk_defdoc4>
			<!--pk_defdoc5,可以为空(),vdef5为统计型参照时pk_defdoc1赋值vdef5对应名称的pk值-->
            <pk_defdoc5></pk_defdoc5>
			<!--pk_defdoc6,可以为空(),vdef6为统计型参照时pk_defdoc1赋值vdef6对应名称的pk值-->
            <pk_defdoc6></pk_defdoc6>
			<!--pk_defdoc7,可以为空(),vdef7为统计型参照时pk_defdoc1赋值vdef7对应名称的pk值-->
            <pk_defdoc7></pk_defdoc7>
			<!--pk_defdoc8,可以为空(),vdef8为统计型参照时pk_defdoc1赋值vdef8对应名称的pk值-->
            <pk_defdoc8></pk_defdoc8>
			<!--pk_defdoc9,可以为空(),vdef9为统计型参照时pk_defdoc1赋值vdef9对应名称的pk值-->
            <pk_defdoc9></pk_defdoc9>
			<!--pk_defdoc10,可以为空(),vdef10为统计型参照时pk_defdoc1赋值vdef10对应名称的pk值-->
            <pk_defdoc10></pk_defdoc10>
			<!--退货标记,默认为N-->
			<bretinvflag>N</bretinvflag>

			<!--出库结束标记,默认为N-->
			<boutendflag>N</boutendflag>

			<!--开票结束标记,默认为N-->
			<binvoicendflag>N</binvoicendflag>

			<!--发货结束标记,默认为N-->
			<breceiptendflag>N</breceiptendflag>

			<!--付款结束标记,默认为N-->
			<bpayendflag>N</bpayendflag>

		</so_order_head>

		<so_order_body>
			
			<#list blist as binfo> 
				
				<#list binfo.orderB as info>
				    <entry>
				    	
				    	<!-- 数量 = 包装数量 * 包装明细数量-->
				    	<#assign totalamount = binfo.nnumber * info.nnumber>
						<!-- 净价 = 原币单价 * 折扣率  -->
						<#assign orgcurnetprice = binfo.nprice * ndiscountrate>
						<!-- 折扣金额 = （单价 -净价）* 数量 -->
						<#assign orgdiscountmny = (binfo.nprice-orgcurnetprice) * totalamount />
						<!-- 原币金额 = 单价 * 折扣率 * 数量 -->
						<#assign orgmny = binfo.nprice * ndiscountrate * totalamount>
						
						<!--行号,不能为空，第一行为1，第二行为2，依此类推-->
						<crowno>${binfo_index + 1}</crowno>
						
						<!--去掉销售主表ID 不能为空-->			
			
						<!--去掉销售订单附表ID,不能为空,不能重复-->
			
						<!--公司主键,参照基础数据"公司目录"-->
						<pk_corp>${receiver}</pk_corp>
			
						<!--来源单据类型,为空（上层业务来源单据业务类型，插件补充）-->
						<creceipttype></creceipttype>
			
						<!--来源单据主表ID,为空（来源单据号；用来源单据号和公司主键匹配,获得来源单据在NC中生成的来源单据主表ID）-->
						<csourcebillid></csourcebillid>
						
						<!--来源单据附表ID,为空（来源单据存货行号。若没有，用存货ID和来源单据主表ID匹配,获得来源单据附表ID）-->
						<csourcebillbodyid></csourcebillbodyid>
			
						<!--主计量单位,不能为空，需要参照基础数据"计量档案"-->
						<cunitid>${binfo.jl.unitcode}</cunitid>
			
						<!--包装单位,可以为空需要参照基础数据"计量档案"-->
						<#if binfo.fjl??>
								<cpackunitid>${binfo.fjl.unitcode}</cpackunitid>
							<#else>
								<cpackunitid></cpackunitid>
						</#if>
			
						<!--批次ID,可以为空-->
						<cbatchid></cbatchid>
			
						<!-- 换算率 -->
						<!--fjlhsl>${binfo.hsl}</fjlhsl-->
						
						<!--数量,不能为空-->
						<nnumber>${totalamount}</nnumber>
			
						<!--包装数量,可以为空-->
						<npacknumber>${binfo.fnumber}</npacknumber>
						
						<!--存货基本档案主键,为空，需要业务插件转换,需要参照基础数据"存货档案-->
						<cinvbasdocid></cinvbasdocid>
			
						<!--存货管理档案主键,不能为空，需要参照基础数据"存货档案"-->
						<cinventoryid>${info.cinvbasdoc.invcode}</cinventoryid>
			
						<!--附表仓库ID,可以为空参照仓库档案ID-->
						<cbodywarehouseid>${binfo.pkStordoc.storcode}</cbodywarehouseid>
			
						<!--发货日期,不能为空,YYYY-MM-DD-->
						<dconsigndate>${hinfo.vbilldate}</dconsigndate>
						
						<!--发货公司，可以为空 参照公司目录 -->
						<cconsigncorpid>${receiver}</cconsigncorpid>
			
						<!--交货日期,不能为空,YYYY-MM-DD-->
						<ddeliverdate>${hinfo.vbilldate}</ddeliverdate>
			
						<!--是否赠品,可以为空-->
						<blargessflag></blargessflag>
			
						<!--修订的附表ID,可以为空（修订标志为Y时，从NC中获得）-->
						<ceditsaleid></ceditsaleid>
			
						<!--修订标识,可以为空默认为N-->
						<beditflag></beditflag>
			
						<!--修订理由,可以为空-->
						<veditreason></veditreason>
			
						<!--原币,不能为空,参考币种档案-->
						<ccurrencytypeid>${hinfo.currencytypeid.currCode}</ccurrencytypeid>
			
						<!--单品折扣率,不能为空, 默认100-->
						<nitemdiscountrate>100</nitemdiscountrate>
			
						<!--整单折扣,不能为空, -->
						<ndiscountrate>${ndiscount?string("0.########")}</ndiscountrate>
			
						<!--折辅汇率,可以为空-->
						<nexchangeotoarate>0</nexchangeotoarate>
			
						<!--税率,不能为空-->
						<ntaxrate>0</ntaxrate>
			
						
						<!--原币无税单价,不能为空-->
						<noriginalcurprice>${binfo.nprice?string("0.########")}</noriginalcurprice>
						<!--原币含税单价,不能为空-->
						<noriginalcurtaxprice>${binfo.nprice?string("0.########")}</noriginalcurtaxprice>
			
			
						<!--原币无税净价,不能为空-->
						<noriginalcurnetprice>${orgcurnetprice?string("0.########")}</noriginalcurnetprice>
						<!--原币含税净价,不能为空-->
						<noriginalcurtaxnetprice>${orgcurnetprice?string("0.########")}</noriginalcurtaxnetprice>
			
			
						<!--原币税额,不能为空-->
						<noriginalcurtaxmny>0</noriginalcurtaxmny>
			
						
						<!--原币无税金额,不能为空-->
						<noriginalcurmny>${orgmny?string("0.########")}</noriginalcurmny>
						<!--原币价税合计,不能为空-->
						<noriginalcursummny>${orgmny?string("0.########")}</noriginalcursummny>
			
			
						<!--原币折扣额,不能为空-->
						<noriginalcurdiscountmny>${orgdiscountmny?string("0.########")}</noriginalcurdiscountmny>

						
						<!--折本汇率,不能为空-->
						<nexchangeotobrate>${exrate?string("0.######")}</nexchangeotobrate>
			
						<!--本币无税单价,不能为空-->
						<#if operatecode="M">
							
							<nprice>${(binfo.nprice * exrate)?string("0.########")}</nprice>
							<!--本币含税单价,不能为空-->
							<ntaxprice>${(binfo.nprice * exrate)?string("0.########")}</ntaxprice>
				
				
							<!--本币无税净价,不能为空-->
							<nnetprice>${(orgcurnetprice * exrate)?string("0.########")}</nnetprice>
							<!--本币含税净价,不能为空-->
							<ntaxnetprice>${(orgcurnetprice * exrate)?string("0.########")}</ntaxnetprice>
				
				
						    <!--本币税额,不能为空-->
							<ntaxmny>0</ntaxmny>
				
				
							<!--本币无税金额,不能为空-->
							<nmny>${(orgmny * exrate)?string("0.########")}</nmny>
							<!--本币价税合计,不能为空-->
							<nsummny>${(orgmny * exrate)?string("0.########")}</nsummny>
				
							<!--本币折扣额,不能为空-->
							<ndiscountmny>${(orgdiscountmny * exrate)?string("0.########")}</ndiscountmny>	
						
						<#elseif operatecode="D">
							
							<nprice>${(binfo.nprice / exrate)?string("0.########")}</nprice>
							<!--本币含税单价,不能为空-->
							<ntaxprice>${(binfo.nprice / exrate)?string("0.########")}</ntaxprice>
				
				
							<!--本币无税净价,不能为空-->
							<nnetprice>${(orgcurnetprice / exrate)?string("0.########")}</nnetprice>
							<!--本币含税净价,不能为空-->
							<ntaxnetprice>${(orgcurnetprice / exrate)?string("0.########")}</ntaxnetprice>
				
				
						    <!--本币税额,不能为空-->
							<ntaxmny>0</ntaxmny>
				
				
							<!--本币无税金额,不能为空-->
							<nmny>${(orgmny / exrate)?string("0.########")}</nmny>
							<!--本币价税合计,不能为空-->
							<nsummny>${(orgmny / exrate)?string("0.########")}</nsummny>
				
							<!--本币折扣额,不能为空-->
							<ndiscountmny>${(orgdiscountmny / exrate)?string("0.########")}</ndiscountmny>	

						</#if>
						
						
						<!--制单人:人员档案ID,不能为空-->
						<coperatorid>${hinfo.makeman.usercode}</coperatorid>
			
						<!--行状态,不能为空:0无状态,1自由,2审批,3冻结,4关闭,5作废,6结束,7正在审批,8审批未通过-->
						<!--暂时仍以保存态上传-->
						<frowstatus>1</frowstatus>
			
						<!--行备注,可以为空-->
						<frownote></frownote>
			
						<!--批次状态,可以为空,0表示不进行批次管理。为空或1表示批次管理，在订单修改时需要输入批次号-->
						<fbatchstatus>0</fbatchstatus>
			
						<!--合同ID,可以为空（若订单来源于合同需要传入所用合同号在NC中生成的OID）-->
						<ct_manageid></ct_manageid>
			
						<!--工厂ID,可以为空（后续业务回写字段，空即可）-->
						<cfactoryid></cfactoryid>
			
						<!--建议发货库存组织,不能为空（参照库存组织档案）-->
						<cadvisecalbodyid>01</cadvisecalbodyid>
			
						<!--缺货标志,可以为空（默认为N）-->
						<boosflag>N</boosflag>
			
						<!--补货标志,可以为空（默认为N）-->
						<bsupplyflag>N</bsupplyflag>
			
						<!--收货地区,不能为空（参照子表的收货单位所属地区的档案基础数据）-->
						<creceiptareaid></creceiptareaid>
			
						<!--收货地址,不能为空(参照子表的收货单位的默认收货地址字符串-->
						<vreceiveaddress></vreceiveaddress>
			
						<!--收货单位,不能为空（需要参照客商管理档案基础数据）-->
						<creceiptcorpid>${hinfo.ccustomer.custorm_Bas.custcode}</creceiptcorpid>
			
						<!--累计收款金额,可以为空-->
						<ntotalpaymny></ntotalpaymny>
			
						<!--累计发货数量,可以为空-->
						<ntotalreceiptnumber></ntotalreceiptnumber>
			
						<!--累计开票数量,可以为空-->
						<ntotalinvoicenumber></ntotalinvoicenumber>
			
						<!--累计开票金额,可以为空-->
						<ntotalinvoicemny></ntotalinvoicemny>
			
						<!--累计出库数量,可以为空-->
						<ntotalinventorynumber></ntotalinventorynumber>
			
						<!--累计结算数量,可以为空-->
						<ntotalbalancenumber></ntotalbalancenumber>
			
						<!--累计签收数量,可以为空-->
						<ntotalsignnumber></ntotalsignnumber>
			
						<!--累计成本金额,可以为空-->
						<ntotalcostmny></ntotalcostmny>
			
						<!--是否开票结束,可以为空-->
						<bifinvoicefinish>N</bifinvoicefinish>
			
						<!--是否发货结束,可以为空-->
						<bifreceiptfinish>N</bifreceiptfinish>
			
						<!--是否出库结束,可以为空-->
						<bifinventoryfinish>N</bifinventoryfinish>
			
						<!--是否收款结束,可以为空-->
						<bifpayfinish>N</bifpayfinish>
			
						<!--是否结算结束,可以为空-->
						<bifpaybalance>N</bifpaybalance>
			
						<!--是否签收结束,可以为空-->
						<bifpaysign>N</bifpaysign>
			
						<!--辅币折扣额,可以为空-->
						<nassistcurdiscountmny></nassistcurdiscountmny>
			
						<!--辅币价税合计,可以为空-->
						<nassistcursummny></nassistcursummny>
			
						<!--辅币无税金额,可以为空-->
						<nassistcurmny></nassistcurmny>
			
						<!--辅币税额,可以为空-->
						<nassistcurtaxmny></nassistcurtaxmny>
			
						<!--辅币含税净价,可以为空-->
						<nassistcurtaxnetprice></nassistcurtaxnetprice>
			
						<!--辅币无税净价,可以为空-->
						<nassistcurnetprice></nassistcurnetprice>
			
						<!--辅币含税单价,可以为空-->
						<nassistcurtaxprice></nassistcurtaxprice>
			
						<!--辅币无税单价,可以为空-->
						<nassistcurprice></nassistcurprice>
			
						<!--项目档案ID,可以为空（参照项目档案数据）-->
						<cprojectid></cprojectid>
			
						<!--项目阶段档案ID,可以为空（参照项目档案数据）-->
						<cprojectphaseid></cprojectphaseid>
			
						<!--项目档案ID,可以为空（参照项目档案数据）-->
						<cprojectid3></cprojectid3>
			
						<!--自由项1,可以为空-->
						<vfree1>${binfo.freeItem1.docname}</vfree1>
						
						<!--自由项2,可以为空-->
						<vfree2></vfree2>
			
						<!--自由项3,可以为空-->
						<vfree3></vfree3>
			
						<!--自由项4,可以为空-->
						<vfree4></vfree4>
			
						<!--自由项5,可以为空-->
						<vfree5></vfree5>
			
						<!--自定义1,可以为空-->
						<vdef1></vdef1>
			
						<!--自定义2,可以为空-->
						<vdef2></vdef2>
			
						<!--自定义3,可以为空-->
						<vdef3></vdef3>
			
						<!--自定义4,可以为空-->
						<vdef4></vdef4>
			
						<!--自定义5,可以为空-->
						<vdef5></vdef5>
			
						<!--自定义6,可以为空-->
						<vdef6></vdef6>
			
						<!--累计退货数量,可以为空-->
						<ntotalreturnnumber></ntotalreturnnumber>
			
						<!--累计发运数量,可以为空-->
						<ntotalcarrynumber></ntotalcarrynumber>
			
						<!--计划发运数量,可以为空-->
						<ntotalplanreceiptnumber></ntotalplanreceiptnumber>
					    </entry> 
				</#list>
		   </#list>
		</so_order_body>
</so_order>
</ufinterface>
