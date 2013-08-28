<#setting number_format="0.########">
<?xml version="1.0" encoding="gb2312"?>
<ufinterface roottag="voucher" billtype="D0" subtype="run" replace="Y" receiver="${receiver}" sender="9999"  proc="add" isexchange="Y" filename="${filename}">
<voucher id ="${docid}" subdoctype="">
		<voucher_head>
			<!--是否预收预付标志 非空字段-->
			<prepay>n</prepay>
			<corp>${receiver}</corp> 
			<businessType>D0</businessType>
			<billDate>${hinfo.vbilldate}</billDate>
			<sysid>0</sysid>
			<initFlag>n</initFlag>
			<inputOp>${hinfo.makeman.usercode}</inputOp>
			<saleType>${busitype}</saleType>
			<!--供应商，不能为空-->
			<payCorp>${hinfo.ccustmid.custorm_Bas.custcode}</payCorp>
			<!--票据结算方式-->
			<settleType>${jsfs?default('')}</settleType>
			
			<!--备注，可空-->
			<scomment>收款单生成应收红字</scomment>
			
			<!--附件，不能为空，默认为0-->
			<appendix>0</appendix>
			<!--原币金额 非空字段,不能为0-->
			<original_sum></original_sum>
			<!--辅币金额 非空字段，默认为0-->
			<fractional_sum>0</fractional_sum>
			<!--本币金额 非空字段，应该与原币金额original_sum相同-->
			<local_sum></local_sum>
			<!-- 单据状态 -->
			<billstatus>1</billstatus>
		</voucher_head>
		<voucher_body>
			<entry>	
				<sum_direction>1</sum_direction>
				<!--摘要-->	 
				<digest></digest>
				<!--部门编码，可空-->
				<deptid>${deptcode?default('')}</deptid>
				<!--往来对象 非空字段，应收单中应取值为0，应付单中应为1-->
				<object>0</object>
				<!--客商档案-->
				<customer>${hinfo.ccustmid.custorm_Bas.custcode}</customer>
				<!--币种编码 非空-->
				<currencyId>${hinfo.currencyid.currCode}</currencyId>
				
				<!--借方原币金额 非空字段--> 
				<debit_original_sum>-${hinfo.nrebatemoney?string("0.##")}</debit_original_sum>
				<!--原币余额 非空字段，应与debit_original_sum值相同-->
				<original_balance>-${hinfo.nrebatemoney?string("0.##")}</original_balance>
				<!--借方原币无税金额 非空字段-->
				<debit_original_noTax>-${hinfo.nrebatemoney?string("0.##")}</debit_original_noTax>
				<!--借方原币税金 非空字段-->
				<debit_original_tax>0</debit_original_tax>

				<#assign ratekey = hinfo.currencyid.currCode + hinfo.vbilldate />
				<#assign ratearray = ratemap[ratekey] />
				<!--本币汇率 非空字段，默认1-->
				<original_exchange_rate>${ratearray[1]?string("0.######")}</original_exchange_rate>
				
				<#if ratearray[0]="M">
					<!--借方本币金额 非空字段，应与debit_original_sum值相同--> 
					<debit_local_sum>-${(hinfo.nrebatemoney * ratearray[1])?string("0.##")}</debit_local_sum>
					<!--本币余额 非空字段-->
					<local_balance>-${(hinfo.nrebatemoney * ratearray[1])?string("0.##")}</local_balance>
					<!--借方本币无税金额 非空字段-->
					<debit_local_noTax>-${(hinfo.nrebatemoney * ratearray[1])?string("0.##")}</debit_local_noTax>
					<!--借方本币税金 非空字段-->
					<debit_local_tax>0</debit_local_tax>
				<#elseif ratearray[0]="D">
					<debit_local_sum>-${(hinfo.nrebatemoney / ratearray[1])?string("0.##")}</debit_local_sum>
					<local_balance>-${(hinfo.nrebatemoney / ratearray[1])?string("0.##")}</local_balance>
					<debit_local_noTax>-${(hinfo.nrebatemoney / ratearray[1])?string("0.##")}</debit_local_noTax>
					<debit_local_tax>0</debit_local_tax>
				</#if>

				<!--辅币汇率，可以空-->
				<fractional_exchange_rate></fractional_exchange_rate>
				<!--借方辅币金额 非空字段，默认为0-->
				<debit_fractional_sum>0</debit_fractional_sum>
				<!--辅币余额 非空字段，默认为0-->
				<fractional_balance>0</fractional_balance>
				<!--借方辅币税金 非空字段-->
				<debit_fractional_tax>0</debit_fractional_tax>
				<!--借方辅币无税金额 非空字段-->
				<debit_frac_noTax>0</debit_frac_noTax>

				<!--数量余额 非空字段-->
				<quantity_balance>0</quantity_balance>
	 
				<!--借方数量 非空字段，计算出-->
				<debit_quantity>0</debit_quantity>
	 	
				<!--税率，可空-->
				<tax_rate></tax_rate>

				<!--贷方辅币无税金额 非空字段-->
				<credit_frac_noTax>0</credit_frac_noTax>
	 
				<!--收入标志，默认Y-->
				<incomeFlag>y</incomeFlag>

				<!--贷方原币金额 非空字段-->
				<credit_original_sum>0</credit_original_sum>
				<!--贷方辅币金额 非空字段-->
				<credit_frac_sum>0</credit_frac_sum>
				<!--贷方本币金额 非空字段-->
				<credit_local_sum>0</credit_local_sum>
				<!--贷方数量 非空字段-->
				<credit_quantity>10</credit_quantity>
				<!--贷方原币税金 非空字段-->
				<credit_original_Tax>0</credit_original_Tax>
				<!--贷方辅币税金 非空字段-->
				<credit_frac_Tax>0</credit_frac_Tax>
				<!--贷方本币税金 非空字段-->
				<credit_local_Tax>0</credit_local_Tax>
				<!--贷方原币无税金额 非空字段-->
				<credit_original_noTax>0</credit_original_noTax>
				<!--贷方本币无税金额 非空字段-->
				<credit_local_noTax>0</credit_local_noTax>
				
				<!--扣税类别，不能为空，默认为0-->
				<Tax_Type>0</Tax_Type> 
				
			</entry>
	</voucher_body>
</voucher>
</ufinterface>