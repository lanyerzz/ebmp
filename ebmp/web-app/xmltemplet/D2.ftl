<#setting number_format="0.########">
<?xml version="1.0" encoding="gb2312"?>
<ufinterface roottag="voucher" billtype="D2" subtype="run" replace="Y" receiver="${receiver}" sender="9999"  proc="add" isexchange="Y" filename="${filename}">
<voucher id ="${docid}" subdoctype="">
		<voucher_head>
			
			<!-- 单据号 -->
			<billnumber>${hinfo.vbillno}</billnumber>
		    <djdl>sk</djdl>
			<prepay>n</prepay>
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
			<teller></teller>
			<subject></subject>

			<!--票据结算方式，如果有数据，需要基础数据对照(结算方式)-->
			<settleType>${jsfs?default('')}</settleType>
			<affirmant></affirmant>
			<bank_affirmant></bank_affirmant>

			<!-- 头部备注  如果收款币种跟核销币种不同则写入备注-->
			<#assign memo="">
			<!--key为币种名，值为金额 -->
			<#list recMemoMap?keys as key>
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
			<original_sum>0</original_sum>
			<fractional_sum>0</fractional_sum>
			<local_sum>0</local_sum>
			<inner_effect_date></inner_effect_date>
			<kskhyh></kskhyh>
			<sscause></sscause>
			<spzt></spzt>
			<payman></payman>
			<paydate></paydate>
			<zgys></zgys>
		</voucher_head>
		<voucher_body>
			<#list blist as binfo>
				<entry>	
					<!-- 1借方 -1贷方 -->
					<sum_direction>-1</sum_direction>
					<object>0</object>
					
					<!--摘要 如果收款币种跟核销币种相同就置为空-->
					<#if hinfo.currencyid.currName==binfo.currencyid.currName>
						<digest></digest>
					<#else>
						<digest>${"实收"+binfo.nmoney+binfo.currencyid.currName+"  核销"+binfo.npmoney+hinfo.currencyid.currName}</digest>
					</#if>	 
					<subject></subject>
					<fractional_exchange_rate></fractional_exchange_rate>
					<job></job>
					<orderId></orderId>
					<note_num></note_num>
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
					
					<debit_quantity>0</debit_quantity>
					<debit_original_sum>0</debit_original_sum>
					<debit_fractional_sum>0</debit_fractional_sum>
					<debit_local_sum>0</debit_local_sum>
					<debit_original_tax>0</debit_original_tax>
					<debit_fractional_tax>0</debit_fractional_tax>
					<debit_local_tax>0</debit_local_tax>
					<debit_frac_noTax>0</debit_frac_noTax>
					<debit_local_noTax>0</debit_local_noTax>
					<debit_original_noTax>0</debit_original_noTax>
					<inventoryId></inventoryId>
					<investFlag></investFlag>
					<unit_price></unit_price>
					<tax_rate></tax_rate>
					<pay_bankName></pay_bankName>
					<pay_accounts></pay_accounts>
					<pay_bank_addr></pay_bank_addr>
	
		 			<!--收款银行名称，可空-->
					<gather_bankName></gather_bankName>
					<!--收款银行账户，可空-->
					<gather_accounts>${binfo.currencyid.currCode}</gather_accounts>
					<!--收款银行地址，可空-->
					<gather_bank_addr></gather_bank_addr>
		 
					<incomeFlag>y</incomeFlag>
					<accsubjId></accsubjId>
					<accountid></accountid>
					<pay_agreementId></pay_agreementId>
					<tax_num></tax_num>
					<pk_jobobjpha></pk_jobobjpha>
					<purpose_sum></purpose_sum>
					<employeeId></employeeId>
					<unit_price_WithTax></unit_price_WithTax>
					<Tax_Type>0</Tax_Type> 
					<seqnum></seqnum>
					<sanhu></sanhu>
					<usedept></usedept>
					<facardbh></facardbh>
					<cashitem></cashitem>
					<payflag> </payflag>
					<bjdwwsdj></bjdwwsdj>
					<ckdh></ckdh>
					<payman></payman>
					<paydate></paydate>
					<pk_jobobjpha></pk_jobobjpha>
	
				</entry>
			</#list>	
	</voucher_body>
</voucher>
</ufinterface>