<#setting number_format="0.########">
<?xml version="1.0" encoding="gb2312"?>
<ufinterface roottag="voucher" billtype="D0" subtype="run" replace="Y" receiver="${receiver}" sender="9999"  proc="add" isexchange="Y" filename="${filename}">
<voucher id ="${docid}" subdoctype="">
		<voucher_head>
			<!--�Ƿ�Ԥ��Ԥ����־ �ǿ��ֶ�-->
			<prepay>n</prepay>
			<corp>${receiver}</corp> 
			<businessType>D0</businessType>
			<billDate>${hinfo.vbilldate}</billDate>
			<sysid>0</sysid>
			<initFlag>n</initFlag>
			<inputOp>${hinfo.makeman.usercode}</inputOp>
			<saleType>${busitype}</saleType>
			<!--��Ӧ�̣�����Ϊ��-->
			<payCorp>${hinfo.ccustmid.custorm_Bas.custcode}</payCorp>
			<!--Ʊ�ݽ��㷽ʽ-->
			<settleType>${jsfs?default('')}</settleType>
			
			<!--��ע���ɿ�-->
			<scomment>�տ����Ӧ�պ���</scomment>
			
			<!--����������Ϊ�գ�Ĭ��Ϊ0-->
			<appendix>0</appendix>
			<!--ԭ�ҽ�� �ǿ��ֶ�,����Ϊ0-->
			<original_sum></original_sum>
			<!--���ҽ�� �ǿ��ֶΣ�Ĭ��Ϊ0-->
			<fractional_sum>0</fractional_sum>
			<!--���ҽ�� �ǿ��ֶΣ�Ӧ����ԭ�ҽ��original_sum��ͬ-->
			<local_sum></local_sum>
			<!-- ����״̬ -->
			<billstatus>1</billstatus>
		</voucher_head>
		<voucher_body>
			<entry>	
				<sum_direction>1</sum_direction>
				<!--ժҪ-->	 
				<digest></digest>
				<!--���ű��룬�ɿ�-->
				<deptid>${deptcode?default('')}</deptid>
				<!--�������� �ǿ��ֶΣ�Ӧ�յ���ӦȡֵΪ0��Ӧ������ӦΪ1-->
				<object>0</object>
				<!--���̵���-->
				<customer>${hinfo.ccustmid.custorm_Bas.custcode}</customer>
				<!--���ֱ��� �ǿ�-->
				<currencyId>${hinfo.currencyid.currCode}</currencyId>
				
				<!--�跽ԭ�ҽ�� �ǿ��ֶ�--> 
				<debit_original_sum>-${hinfo.nrebatemoney?string("0.##")}</debit_original_sum>
				<!--ԭ����� �ǿ��ֶΣ�Ӧ��debit_original_sumֵ��ͬ-->
				<original_balance>-${hinfo.nrebatemoney?string("0.##")}</original_balance>
				<!--�跽ԭ����˰��� �ǿ��ֶ�-->
				<debit_original_noTax>-${hinfo.nrebatemoney?string("0.##")}</debit_original_noTax>
				<!--�跽ԭ��˰�� �ǿ��ֶ�-->
				<debit_original_tax>0</debit_original_tax>

				<#assign ratekey = hinfo.currencyid.currCode + hinfo.vbilldate />
				<#assign ratearray = ratemap[ratekey] />
				<!--���һ��� �ǿ��ֶΣ�Ĭ��1-->
				<original_exchange_rate>${ratearray[1]?string("0.######")}</original_exchange_rate>
				
				<#if ratearray[0]="M">
					<!--�跽���ҽ�� �ǿ��ֶΣ�Ӧ��debit_original_sumֵ��ͬ--> 
					<debit_local_sum>-${(hinfo.nrebatemoney * ratearray[1])?string("0.##")}</debit_local_sum>
					<!--������� �ǿ��ֶ�-->
					<local_balance>-${(hinfo.nrebatemoney * ratearray[1])?string("0.##")}</local_balance>
					<!--�跽������˰��� �ǿ��ֶ�-->
					<debit_local_noTax>-${(hinfo.nrebatemoney * ratearray[1])?string("0.##")}</debit_local_noTax>
					<!--�跽����˰�� �ǿ��ֶ�-->
					<debit_local_tax>0</debit_local_tax>
				<#elseif ratearray[0]="D">
					<debit_local_sum>-${(hinfo.nrebatemoney / ratearray[1])?string("0.##")}</debit_local_sum>
					<local_balance>-${(hinfo.nrebatemoney / ratearray[1])?string("0.##")}</local_balance>
					<debit_local_noTax>-${(hinfo.nrebatemoney / ratearray[1])?string("0.##")}</debit_local_noTax>
					<debit_local_tax>0</debit_local_tax>
				</#if>

				<!--���һ��ʣ����Կ�-->
				<fractional_exchange_rate></fractional_exchange_rate>
				<!--�跽���ҽ�� �ǿ��ֶΣ�Ĭ��Ϊ0-->
				<debit_fractional_sum>0</debit_fractional_sum>
				<!--������� �ǿ��ֶΣ�Ĭ��Ϊ0-->
				<fractional_balance>0</fractional_balance>
				<!--�跽����˰�� �ǿ��ֶ�-->
				<debit_fractional_tax>0</debit_fractional_tax>
				<!--�跽������˰��� �ǿ��ֶ�-->
				<debit_frac_noTax>0</debit_frac_noTax>

				<!--������� �ǿ��ֶ�-->
				<quantity_balance>0</quantity_balance>
	 
				<!--�跽���� �ǿ��ֶΣ������-->
				<debit_quantity>0</debit_quantity>
	 	
				<!--˰�ʣ��ɿ�-->
				<tax_rate></tax_rate>

				<!--����������˰��� �ǿ��ֶ�-->
				<credit_frac_noTax>0</credit_frac_noTax>
	 
				<!--�����־��Ĭ��Y-->
				<incomeFlag>y</incomeFlag>

				<!--����ԭ�ҽ�� �ǿ��ֶ�-->
				<credit_original_sum>0</credit_original_sum>
				<!--�������ҽ�� �ǿ��ֶ�-->
				<credit_frac_sum>0</credit_frac_sum>
				<!--�������ҽ�� �ǿ��ֶ�-->
				<credit_local_sum>0</credit_local_sum>
				<!--�������� �ǿ��ֶ�-->
				<credit_quantity>10</credit_quantity>
				<!--����ԭ��˰�� �ǿ��ֶ�-->
				<credit_original_Tax>0</credit_original_Tax>
				<!--��������˰�� �ǿ��ֶ�-->
				<credit_frac_Tax>0</credit_frac_Tax>
				<!--��������˰�� �ǿ��ֶ�-->
				<credit_local_Tax>0</credit_local_Tax>
				<!--����ԭ����˰��� �ǿ��ֶ�-->
				<credit_original_noTax>0</credit_original_noTax>
				<!--����������˰��� �ǿ��ֶ�-->
				<credit_local_noTax>0</credit_local_noTax>
				
				<!--��˰��𣬲���Ϊ�գ�Ĭ��Ϊ0-->
				<Tax_Type>0</Tax_Type> 
				
			</entry>
	</voucher_body>
</voucher>
</ufinterface>