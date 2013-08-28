<#setting number_format="0.########">
<?xml version="1.0" encoding="gb2312"?>
<ufinterface roottag="voucher" billtype="D2" subtype="run" replace="Y" receiver="${receiver}" sender="9999"  proc="add" isexchange="Y" filename="${filename}">
<voucher id ="${docid}" subdoctype="">
		<voucher_head>
			
			<!-- 单据号 -->
			<billnumber>${hinfo.vbillno}</billnumber>
			
		    <!--单据大类，不用修改-->
		    <djdl>sk</djdl>
			<!--是否预收预付标志 非空字段-->
			<prepay>n</prepay>

			<!--单位编码  非空字段，需要基础数据对照(公司目录)-->
			<corp>${receiver}</corp> 

			<!--业务类型 非空字段，D0是应收单，如果是应付单sysid应该为1，如果是应收单，sysid应该为0，该数据项需要需要基础数据对照(单据类型)-->
			<businessType>D2</businessType>
			 
			<!--系统编号 0应收、收款单，1应付、付款单，2报账中心  非空字段-->
			<sysid>0</sysid>

			<!--是否期初单据 非空字段-->
			<initFlag>n</initFlag>

			<!--录入人 非空字段,需要基础数据对照(操作员)-->
			<inputOp>${hinfo.makeman.usercode}</inputOp>
			<!--单据日期 非空字段-->
			<billDate>${hinfo.vbilldate}</billDate>
			
			<!-- 单据状态  -99暂存 0未确认 1保存 2审核 3签字确认 -->
			<!-- 暂时仍以保存态上传 -->
			<billstatus>1</billstatus>
			
			
			
			<!--销售类型编码,如果有数据，需要基础数据对照(业务类型)-->
			<saleType>${busitype}</saleType>

			<!--供应商，不能为空，需要基础数据对照(客商档案)-->
			<payCorp>${hinfo.ccustmid.custorm_Bas.custcode}</payCorp>

			<!--收付款人，如果有数据，需要基础数据对照(人员档案)-->
			<teller></teller>

			<!--科目编码，如果有数据，需要基础数据对照(会计科目)-->
			<subject></subject>

			<!--票据结算方式，如果有数据，需要基础数据对照(结算方式)-->
			<settleType>${jsfs?default('')}</settleType>
			
			<!--确认人，如果有数据，需要基础数据对照(操作员)-->
			<affirmant></affirmant>

			<!--银行确认人 如果导入的单据状态是签字态 ，则必须录入银行确认人（业务意义为签字人）-->
			<bank_affirmant></bank_affirmant>

			<!-- 头部备注  -->
			<#assign memo="">
			<!--key为币种名，值为金额 -->
			<#list recMemoMap?keys as key>
				<!-- 如果收款币种跟核销币种不相同则写入备注 -->
				<#if hinfo.currencyid.currName!=key>
					<#assign memo=memo+recMemoMap[key]+key>				
				</#if>
			</#list>
			<#if memo!="">
				<#assign memo="实收"+memo />
			</#if>
			
			<!--备注，可空-->
			<#if hinfo.nrebatemoney == 0>
				<scomment>${hinfo.memo?default('')+"  "+memo+"  核销"+(hinfo.nrecmoney+hinfo.nrebatemoney)+hinfo.currencyid.currName}</scomment>
			<#else>
				<scomment>${hinfo.memo?default('')+"  "+memo+"  核销"+(hinfo.nrecmoney+hinfo.nrebatemoney)+hinfo.currencyid.currName+"  少收"+hinfo.nrebatemoney+hinfo.currencyid.currName}</scomment>
			</#if>
			
			<!--附件，不能为空，默认为0-->
			<appendix>0</appendix>

			<!--原币金额 非空字段,不能为0-->
			<original_sum>0</original_sum>

			<!--辅币金额 非空字段，默认为0-->
			<fractional_sum>0</fractional_sum>

			<!--本币金额 非空字段，应该与原币金额original_sum相同-->
			<local_sum>0</local_sum>
			
			<!-- V5 新增 -->
			
			<!-- 内控账期日期 -->
			<inner_effect_date></inner_effect_date>
			
			<!-- 客商开户银行 -->
			<kskhyh></kskhyh>
			
			<!--事项审批单事由 -->
			<sscause></sscause>
			
			<!--审批状态 -->
			<spzt></spzt>
			
			<!--支付人 -->
			<payman></payman>
			
			<!-- 支付日期 -->
			<paydate></paydate>
			
			<!-- 暂估应收标志 0-非暂估，1-暂估，2-回冲-->
			<zgys></zgys>
			
			<!-- 自由项-->
			<freeitem1></freeitem1>
			<freeitem2></freeitem2>
			<freeitem3></freeitem3>
			<freeitem4></freeitem4>
			<freeitem5></freeitem5>
			
		</voucher_head>
		<voucher_body>
			<#list blist as binfo>
				<entry>	
					<!--金额方向 非空字段，应付单金额在贷方，借方金额为0，应收单金额在借方，贷方金额为0，-->
					<!-- 1借方 -1贷方 -->
					<sum_direction>-1</sum_direction>
					
					<!--往来对象 非空字段，应收单中应取值为0，应付单中应为1-->
					<object>0</object>
					
					<!--摘要 如果收款币种跟核销币种相同就置为空-->
					<#if hinfo.currencyid.currName==binfo.currencyid.currName>
						<digest></digest>
					<#else>
						<digest>${"实收"+binfo.nmoney+binfo.currencyid.currName+"  核销"+binfo.npmoney+hinfo.currencyid.currName}</digest>
					</#if>	 
					
					<!--科目编码，不能为空，需要基础数据对照(会计科目)-->	 
					<subject></subject>
					
					<!--辅币汇率，可以空-->
					<fractional_exchange_rate></fractional_exchange_rate>
	
					<!--项目编码, 可以空，如果有值，需要基础数据对照(项目管理档案)-->
					<job></job>
					
					<!--订单号，可空-->
					<orderId></orderId>
		 			<!--票据号-->
					<note_num></note_num>
					<!--开票日期，可空，记帐日期-->
					<check_date></check_date>
					
					<!--部门编码，可空，如果有值需要建立对照(部门档案)-->
					<deptid>${deptcode?default('')}</deptid>
	
					<!--客户档案主键，应收单不能为空，需要基础数据对照(客商档案)-->
					<customer>${hinfo.ccustmid.custorm_Bas.custcode}</customer>
					
					<!--币种编码 非空字段，需要基础数据对照(外币档案)-->
					<currencyId>${binfo.currencyid.currCode}</currencyId>
					
					
					<!--贷方数量 非空字段-->
					<credit_quantity>0</credit_quantity>
	
					<!--贷方原币金额 非空字段-->
					<credit_original_sum>${binfo.nmoney?string("0.##")}</credit_original_sum>
					<!--贷方原币税金 非空字段-->
					<credit_original_Tax>0</credit_original_Tax>
					<!--贷方原币无税金额 非空字段-->
					<credit_original_noTax>${binfo.nmoney?string("0.##")}</credit_original_noTax>
					<!--原币余额 非空字段，应与debit_original_sum值相同-->
					<original_balance>${binfo.nmoney?string("0.##")}</original_balance>
					
					
					<!--贷方辅币金额 非空字段-->
					<credit_frac_sum>0</credit_frac_sum>
					<!--贷方辅币无税金额 非空字段-->
					<credit_frac_noTax>0</credit_frac_noTax>
					<!--贷方辅币税金 非空字段-->
					<credit_frac_Tax>0</credit_frac_Tax>
					<!--辅币余额 非空字段，默认为0-->
					<fractional_balance>0</fractional_balance>
					
					
					<#assign ratekey = binfo.currencyid.currCode + hinfo.vbilldate />
					<#assign ratearray = ratemap[ratekey] />
					
					<!--本币汇率 非空字段，默认1-->
					<original_exchange_rate>${ratearray[1]?string("0.######")}</original_exchange_rate>
					<#if ratearray[0]="M">
					
						<!-- 源币种 * 汇率 = 目标币种 -->
						<!--贷方本币金额 非空字段-->
						<credit_local_sum>${(binfo.nmoney * ratearray[1])?string("0.##")}</credit_local_sum>
						<!--贷方本币税金 非空字段-->
						<credit_local_Tax>0</credit_local_Tax>
						<!--贷方本币无税金额 非空字段-->
						<credit_local_noTax>${(binfo.nmoney * ratearray[1])?string("0.##")}</credit_local_noTax>
						<!--本币余额 非空字段-->
						<local_balance>${(binfo.nmoney * ratearray[1])?string("0.##")}</local_balance>
						
					<#elseif ratearray[0]="D">
					
						<!-- 源币种 / 汇率 = 目标币种 -->
						<!--贷方本币金额 非空字段-->
						<credit_local_sum>${(binfo.nmoney / ratearray[1])?string("0.##")}</credit_local_sum>
						<!--贷方本币税金 非空字段-->
						<credit_local_Tax>0</credit_local_Tax>
						<!--贷方本币无税金额 非空字段-->
						<credit_local_noTax>${(binfo.nmoney / ratearray[1])?string("0.##")}</credit_local_noTax>
						<!--本币余额 非空字段-->
						<local_balance>${(binfo.nmoney / ratearray[1])?string("0.##")}</local_balance>
						
					</#if>
					
					
					
					<!--数量余额 非空字段-->
					<quantity_balance>0</quantity_balance>
					
					<!--借方数量 非空字段，计算出-->
					<debit_quantity>0</debit_quantity>
					
					<!--借方原币金额 非空字段--> 
					<debit_original_sum>0</debit_original_sum>
					<!--借方辅币金额 非空字段，默认为0-->
					<debit_fractional_sum>0</debit_fractional_sum>
					<!--借方本币金额 非空字段，应与debit_original_sum值相同--> 
					<debit_local_sum>0</debit_local_sum>
					<!--借方原币税金 非空字段-->
					<debit_original_tax>0</debit_original_tax>
					<!--借方辅币税金 非空字段-->
					<debit_fractional_tax>0</debit_fractional_tax>
					<!--借方本币税金 非空字段-->
					<debit_local_tax>0</debit_local_tax>
					<!--借方辅币无税金额 非空字段-->
					<debit_frac_noTax>0</debit_frac_noTax>
					<!--借方本币无税金额 非空字段-->
					<debit_local_noTax>0</debit_local_noTax>
					<!--借方原币无税金额 非空字段-->
					<debit_original_noTax>0</debit_original_noTax>
					
					
					
					<!--存货编码，如果有值，需要基础数据对照(存货档案)-->
					<inventoryId></inventoryId>
	
		 			<!--筹投资标志，可以空-->
					<investFlag></investFlag>
		 
					<!--单价，可空-->
					<unit_price></unit_price>
	
					<!--税率，可空-->
					<tax_rate></tax_rate>
	
		 			<!--付款银行名称，可空-->
					<pay_bankName></pay_bankName>
	
					<!--付款银行账户 需特殊处理的字段,要求必须录入帐号的编码-->
					<pay_accounts></pay_accounts>
	
					<!--付款银行地址，可空-->
					<pay_bank_addr></pay_bank_addr>
	
		 			<!--收款银行名称，可空-->
					<gather_bankName></gather_bankName>
					<!--收款银行账户，可空-->
					<gather_accounts>${binfo.currencyid.currCode}</gather_accounts>
					<!--收款银行地址，可空-->
					<gather_bank_addr></gather_bank_addr>
		 
					<!--收入标志，默认Y-->
					<incomeFlag>y</incomeFlag>
					
					<!--收支项目，或者为空，如果有值一定要建立对照(收支项目)-->
					<accsubjId></accsubjId>
	
					<!--账户档案，或者为空，如果有值一定要建立对照(账户档案)-->
					<accountid></accountid>
					
					<!--收款协议号，或者为空，如果有值一定要建立对照(收付款协议)-->
					<pay_agreementId></pay_agreementId>
	
					
					<!--税号，可空-->
					<tax_num></tax_num>
	
					<!--项目阶段，可以为空，如果有值一定要建立对照(项目阶段)-->
					<pk_jobobjpha></pk_jobobjpha>
	
					<!--款项用途，可以空-->
					<purpose_sum></purpose_sum>
	
					<!--业务员编码，可空，如果有值需要建立对照(人员档案)-->
					<employeeId></employeeId>
	
		 			<!--含税单价，可空-->
					<unit_price_WithTax></unit_price_WithTax>
		
					<!--扣税类别，不能为空，默认为0-->
					<Tax_Type>0</Tax_Type> 
					 
					<!--注意：客商、部门、业务员不能同时为空--> 
					<!-- V5新增  -->
					<!-- 批次号1 -->
					<seqnum></seqnum>
					
					<!--散户 -->
					<sanhu></sanhu>
					
					<!-- 使用部门 -->
					<usedept></usedept>
					
					<!--固定资产卡片号 -->
					<facardbh></facardbh>
					
					<!-- 现金流量项目 -->
					<cashitem></cashitem>
	
					<!-- 支付状态 -->
					<payflag> </payflag>
	
					<!--报价单位无税单价 -->
					<bjdwwsdj></bjdwwsdj>
	
					<!--出库单号 -->
					<ckdh></ckdh>
	
					<!--支付人 -->
					<payman></payman>
					
					<!-- 支付日期 -->
					<paydate></paydate>
	
					<!--项目阶段管理档案id -->
					<pk_jobobjpha></pk_jobobjpha>
	
					<!-- 自由项 -->
					<freeitem1></freeitem1>
					<freeitem2></freeitem2>
					<freeitem3></freeitem3>
					<freeitem4></freeitem4>
					<freeitem5></freeitem5>
				</entry>
			</#list>	
	</voucher_body>
</voucher>
</ufinterface>