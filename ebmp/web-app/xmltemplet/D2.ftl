<#setting number_format="0.########">
<?xml version="1.0" encoding="gb2312"?>
<ufinterface roottag="voucher" billtype="D2" subtype="run" replace="Y" receiver="${receiver}" sender="9999"  proc="add" isexchange="Y" filename="${filename}">
<voucher id ="${docid}" subdoctype="">
		<voucher_head>
			
			<!-- ���ݺ� -->
			<billnumber>${hinfo.vbillno}</billnumber>
		    <djdl>sk</djdl>
			<prepay>n</prepay>
			<corp>${receiver}</corp> 

			<!--ҵ������ �ǿ��ֶΣ�D0��Ӧ�յ��������Ӧ����sysidӦ��Ϊ1�������Ӧ�յ���sysidӦ��Ϊ0������������Ҫ��Ҫ�������ݶ���(��������)-->
			<businessType>D2</businessType>
			 
			<!--ϵͳ��� 0Ӧ�ա��տ��1Ӧ���������2��������  �ǿ��ֶ�-->
			<sysid>0</sysid>

			<!--�Ƿ��ڳ����� �ǿ��ֶ�-->
			<initFlag>n</initFlag>

			<!--¼���� �ǿ��ֶ�,��Ҫ�������ݶ���(����Ա)-->
			<inputOp>${hinfo.makeman.usercode}</inputOp>
			<!--�������� �ǿ��ֶ�-->
			<billDate>${hinfo.vbilldate}</billDate>
			
			<!-- ����״̬  -99�ݴ� 0δȷ�� 1���� 2��� 3ǩ��ȷ�� -->
			<!-- ��ʱ���Ա���̬�ϴ� -->
			<billstatus>1</billstatus>
			<!--�������ͱ���,��������ݣ���Ҫ�������ݶ���(ҵ������)-->
			<saleType>${busitype}</saleType>

			<!--��Ӧ�̣�����Ϊ�գ���Ҫ�������ݶ���(���̵���)-->
			<payCorp>${hinfo.ccustmid.custorm_Bas.custcode}</payCorp>
			<teller></teller>
			<subject></subject>

			<!--Ʊ�ݽ��㷽ʽ����������ݣ���Ҫ�������ݶ���(���㷽ʽ)-->
			<settleType>${jsfs?default('')}</settleType>
			<affirmant></affirmant>
			<bank_affirmant></bank_affirmant>

			<!-- ͷ����ע  ����տ���ָ��������ֲ�ͬ��д�뱸ע-->
			<#assign memo="">
			<!--keyΪ��������ֵΪ��� -->
			<#list recMemoMap?keys as key>
				<#if hinfo.currencyid.currName!=key>
					<#assign memo=memo+recMemoMap[key]+key>				
				</#if>
			</#list>
			<#if memo!="">
				<#assign memo="ʵ��"+memo />
			</#if>
			
			<!--��ע���ɿ�-->
			<#if hinfo.nrebatemoney == 0>
				<scomment>${hinfo.memo?default('')+"  "+memo+"  ����"+(hinfo.nrecmoney+hinfo.nrebatemoney)+hinfo.currencyid.currName}</scomment>
			<#else>
				<scomment>${hinfo.memo?default('')+"  "+memo+"  ����"+(hinfo.nrecmoney+hinfo.nrebatemoney)+hinfo.currencyid.currName+"  ����"+hinfo.nrebatemoney+hinfo.currencyid.currName}</scomment>
			</#if>
			
			<!--����������Ϊ�գ�Ĭ��Ϊ0-->
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
					<!-- 1�跽 -1���� -->
					<sum_direction>-1</sum_direction>
					<object>0</object>
					
					<!--ժҪ ����տ���ָ�����������ͬ����Ϊ��-->
					<#if hinfo.currencyid.currName==binfo.currencyid.currName>
						<digest></digest>
					<#else>
						<digest>${"ʵ��"+binfo.nmoney+binfo.currencyid.currName+"  ����"+binfo.npmoney+hinfo.currencyid.currName}</digest>
					</#if>	 
					<subject></subject>
					<fractional_exchange_rate></fractional_exchange_rate>
					<job></job>
					<orderId></orderId>
					<note_num></note_num>
					<check_date></check_date>
					<!--���ű��룬�ɿգ������ֵ��Ҫ��������(���ŵ���)-->
					<deptid>${deptcode?default('')}</deptid>
					<!--�ͻ�����������Ӧ�յ�����Ϊ�գ���Ҫ�������ݶ���(���̵���)-->
					<customer>${hinfo.ccustmid.custorm_Bas.custcode}</customer>
					
					<!--���ֱ��� �ǿ��ֶΣ���Ҫ�������ݶ���(��ҵ���)-->
					<currencyId>${binfo.currencyid.currCode}</currencyId>
					<!--�������� �ǿ��ֶ�-->
					<credit_quantity>0</credit_quantity>
					<!--����ԭ�ҽ�� �ǿ��ֶ�-->
					<credit_original_sum>${binfo.nmoney?string("0.##")}</credit_original_sum>
					<!--����ԭ��˰�� �ǿ��ֶ�-->
					<credit_original_Tax>0</credit_original_Tax>
					<!--����ԭ����˰��� �ǿ��ֶ�-->
					<credit_original_noTax>${binfo.nmoney?string("0.##")}</credit_original_noTax>
					<!--ԭ����� �ǿ��ֶΣ�Ӧ��debit_original_sumֵ��ͬ-->
					<original_balance>${binfo.nmoney?string("0.##")}</original_balance>
					
					
					<!--�������ҽ�� �ǿ��ֶ�-->
					<credit_frac_sum>0</credit_frac_sum>
					<!--����������˰��� �ǿ��ֶ�-->
					<credit_frac_noTax>0</credit_frac_noTax>
					<!--��������˰�� �ǿ��ֶ�-->
					<credit_frac_Tax>0</credit_frac_Tax>
					<!--������� �ǿ��ֶΣ�Ĭ��Ϊ0-->
					<fractional_balance>0</fractional_balance>
					
					<#assign ratekey = binfo.currencyid.currCode + hinfo.vbilldate />
					<#assign ratearray = ratemap[ratekey] />
					
					<!--���һ��� �ǿ��ֶΣ�Ĭ��1-->
					<original_exchange_rate>${ratearray[1]?string("0.######")}</original_exchange_rate>
					<#if ratearray[0]="M">
					
						<!-- Դ���� * ���� = Ŀ����� -->
						<!--�������ҽ�� �ǿ��ֶ�-->
						<credit_local_sum>${(binfo.nmoney * ratearray[1])?string("0.##")}</credit_local_sum>
						<!--��������˰�� �ǿ��ֶ�-->
						<credit_local_Tax>0</credit_local_Tax>
						<!--����������˰��� �ǿ��ֶ�-->
						<credit_local_noTax>${(binfo.nmoney * ratearray[1])?string("0.##")}</credit_local_noTax>
						<!--������� �ǿ��ֶ�-->
						<local_balance>${(binfo.nmoney * ratearray[1])?string("0.##")}</local_balance>
						
					<#elseif ratearray[0]="D">
					
						<!-- Դ���� / ���� = Ŀ����� -->
						<!--�������ҽ�� �ǿ��ֶ�-->
						<credit_local_sum>${(binfo.nmoney / ratearray[1])?string("0.##")}</credit_local_sum>
						<!--��������˰�� �ǿ��ֶ�-->
						<credit_local_Tax>0</credit_local_Tax>
						<!--����������˰��� �ǿ��ֶ�-->
						<credit_local_noTax>${(binfo.nmoney / ratearray[1])?string("0.##")}</credit_local_noTax>
						<!--������� �ǿ��ֶ�-->
						<local_balance>${(binfo.nmoney / ratearray[1])?string("0.##")}</local_balance>
						
					</#if>
					
					
					
					<!--������� �ǿ��ֶ�-->
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
	
		 			<!--�տ��������ƣ��ɿ�-->
					<gather_bankName></gather_bankName>
					<!--�տ������˻����ɿ�-->
					<gather_accounts>${binfo.currencyid.currCode}</gather_accounts>
					<!--�տ����е�ַ���ɿ�-->
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