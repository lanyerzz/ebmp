<#setting number_format="0.########">
<?xml version="1.0" encoding="gb2312"?>
<ufinterface roottag="voucher" billtype="D2" subtype="run" replace="Y" receiver="${receiver}" sender="9999"  proc="add" isexchange="Y" filename="${filename}">
<voucher id ="${docid}" subdoctype="">
		<voucher_head>
			
			<!-- ���ݺ� -->
			<billnumber>${hinfo.vbillno}</billnumber>
			
		    <!--���ݴ��࣬�����޸�-->
		    <djdl>sk</djdl>
			<!--�Ƿ�Ԥ��Ԥ����־ �ǿ��ֶ�-->
			<prepay>n</prepay>

			<!--��λ����  �ǿ��ֶΣ���Ҫ�������ݶ���(��˾Ŀ¼)-->
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

			<!--�ո����ˣ���������ݣ���Ҫ�������ݶ���(��Ա����)-->
			<teller></teller>

			<!--��Ŀ���룬��������ݣ���Ҫ�������ݶ���(��ƿ�Ŀ)-->
			<subject></subject>

			<!--Ʊ�ݽ��㷽ʽ����������ݣ���Ҫ�������ݶ���(���㷽ʽ)-->
			<settleType>${jsfs?default('')}</settleType>
			
			<!--ȷ���ˣ���������ݣ���Ҫ�������ݶ���(����Ա)-->
			<affirmant></affirmant>

			<!--����ȷ���� �������ĵ���״̬��ǩ��̬ �������¼������ȷ���ˣ�ҵ������Ϊǩ���ˣ�-->
			<bank_affirmant></bank_affirmant>

			<!-- ͷ����ע  -->
			<#assign memo="">
			<!--keyΪ��������ֵΪ��� -->
			<#list recMemoMap?keys as key>
				<!-- ����տ���ָ��������ֲ���ͬ��д�뱸ע -->
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

			<!--ԭ�ҽ�� �ǿ��ֶ�,����Ϊ0-->
			<original_sum>0</original_sum>

			<!--���ҽ�� �ǿ��ֶΣ�Ĭ��Ϊ0-->
			<fractional_sum>0</fractional_sum>

			<!--���ҽ�� �ǿ��ֶΣ�Ӧ����ԭ�ҽ��original_sum��ͬ-->
			<local_sum>0</local_sum>
			
			<!-- V5 ���� -->
			
			<!-- �ڿ��������� -->
			<inner_effect_date></inner_effect_date>
			
			<!-- ���̿������� -->
			<kskhyh></kskhyh>
			
			<!--�������������� -->
			<sscause></sscause>
			
			<!--����״̬ -->
			<spzt></spzt>
			
			<!--֧���� -->
			<payman></payman>
			
			<!-- ֧������ -->
			<paydate></paydate>
			
			<!-- �ݹ�Ӧ�ձ�־ 0-���ݹ���1-�ݹ���2-�س�-->
			<zgys></zgys>
			
			<!-- ������-->
			<freeitem1></freeitem1>
			<freeitem2></freeitem2>
			<freeitem3></freeitem3>
			<freeitem4></freeitem4>
			<freeitem5></freeitem5>
			
		</voucher_head>
		<voucher_body>
			<#list blist as binfo>
				<entry>	
					<!--���� �ǿ��ֶΣ�Ӧ��������ڴ������跽���Ϊ0��Ӧ�յ�����ڽ跽���������Ϊ0��-->
					<!-- 1�跽 -1���� -->
					<sum_direction>-1</sum_direction>
					
					<!--�������� �ǿ��ֶΣ�Ӧ�յ���ӦȡֵΪ0��Ӧ������ӦΪ1-->
					<object>0</object>
					
					<!--ժҪ ����տ���ָ�����������ͬ����Ϊ��-->
					<#if hinfo.currencyid.currName==binfo.currencyid.currName>
						<digest></digest>
					<#else>
						<digest>${"ʵ��"+binfo.nmoney+binfo.currencyid.currName+"  ����"+binfo.npmoney+hinfo.currencyid.currName}</digest>
					</#if>	 
					
					<!--��Ŀ���룬����Ϊ�գ���Ҫ�������ݶ���(��ƿ�Ŀ)-->	 
					<subject></subject>
					
					<!--���һ��ʣ����Կ�-->
					<fractional_exchange_rate></fractional_exchange_rate>
	
					<!--��Ŀ����, ���Կգ������ֵ����Ҫ�������ݶ���(��Ŀ������)-->
					<job></job>
					
					<!--�����ţ��ɿ�-->
					<orderId></orderId>
		 			<!--Ʊ�ݺ�-->
					<note_num></note_num>
					<!--��Ʊ���ڣ��ɿգ���������-->
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
					
					<!--�跽���� �ǿ��ֶΣ������-->
					<debit_quantity>0</debit_quantity>
					
					<!--�跽ԭ�ҽ�� �ǿ��ֶ�--> 
					<debit_original_sum>0</debit_original_sum>
					<!--�跽���ҽ�� �ǿ��ֶΣ�Ĭ��Ϊ0-->
					<debit_fractional_sum>0</debit_fractional_sum>
					<!--�跽���ҽ�� �ǿ��ֶΣ�Ӧ��debit_original_sumֵ��ͬ--> 
					<debit_local_sum>0</debit_local_sum>
					<!--�跽ԭ��˰�� �ǿ��ֶ�-->
					<debit_original_tax>0</debit_original_tax>
					<!--�跽����˰�� �ǿ��ֶ�-->
					<debit_fractional_tax>0</debit_fractional_tax>
					<!--�跽����˰�� �ǿ��ֶ�-->
					<debit_local_tax>0</debit_local_tax>
					<!--�跽������˰��� �ǿ��ֶ�-->
					<debit_frac_noTax>0</debit_frac_noTax>
					<!--�跽������˰��� �ǿ��ֶ�-->
					<debit_local_noTax>0</debit_local_noTax>
					<!--�跽ԭ����˰��� �ǿ��ֶ�-->
					<debit_original_noTax>0</debit_original_noTax>
					
					
					
					<!--������룬�����ֵ����Ҫ�������ݶ���(�������)-->
					<inventoryId></inventoryId>
	
		 			<!--��Ͷ�ʱ�־�����Կ�-->
					<investFlag></investFlag>
		 
					<!--���ۣ��ɿ�-->
					<unit_price></unit_price>
	
					<!--˰�ʣ��ɿ�-->
					<tax_rate></tax_rate>
	
		 			<!--�����������ƣ��ɿ�-->
					<pay_bankName></pay_bankName>
	
					<!--���������˻� �����⴦����ֶ�,Ҫ�����¼���ʺŵı���-->
					<pay_accounts></pay_accounts>
	
					<!--�������е�ַ���ɿ�-->
					<pay_bank_addr></pay_bank_addr>
	
		 			<!--�տ��������ƣ��ɿ�-->
					<gather_bankName></gather_bankName>
					<!--�տ������˻����ɿ�-->
					<gather_accounts>${binfo.currencyid.currCode}</gather_accounts>
					<!--�տ����е�ַ���ɿ�-->
					<gather_bank_addr></gather_bank_addr>
		 
					<!--�����־��Ĭ��Y-->
					<incomeFlag>y</incomeFlag>
					
					<!--��֧��Ŀ������Ϊ�գ������ֵһ��Ҫ��������(��֧��Ŀ)-->
					<accsubjId></accsubjId>
	
					<!--�˻�����������Ϊ�գ������ֵһ��Ҫ��������(�˻�����)-->
					<accountid></accountid>
					
					<!--�տ�Э��ţ�����Ϊ�գ������ֵһ��Ҫ��������(�ո���Э��)-->
					<pay_agreementId></pay_agreementId>
	
					
					<!--˰�ţ��ɿ�-->
					<tax_num></tax_num>
	
					<!--��Ŀ�׶Σ�����Ϊ�գ������ֵһ��Ҫ��������(��Ŀ�׶�)-->
					<pk_jobobjpha></pk_jobobjpha>
	
					<!--������;�����Կ�-->
					<purpose_sum></purpose_sum>
	
					<!--ҵ��Ա���룬�ɿգ������ֵ��Ҫ��������(��Ա����)-->
					<employeeId></employeeId>
	
		 			<!--��˰���ۣ��ɿ�-->
					<unit_price_WithTax></unit_price_WithTax>
		
					<!--��˰��𣬲���Ϊ�գ�Ĭ��Ϊ0-->
					<Tax_Type>0</Tax_Type> 
					 
					<!--ע�⣺���̡����š�ҵ��Ա����ͬʱΪ��--> 
					<!-- V5����  -->
					<!-- ���κ�1 -->
					<seqnum></seqnum>
					
					<!--ɢ�� -->
					<sanhu></sanhu>
					
					<!-- ʹ�ò��� -->
					<usedept></usedept>
					
					<!--�̶��ʲ���Ƭ�� -->
					<facardbh></facardbh>
					
					<!-- �ֽ�������Ŀ -->
					<cashitem></cashitem>
	
					<!-- ֧��״̬ -->
					<payflag> </payflag>
	
					<!--���۵�λ��˰���� -->
					<bjdwwsdj></bjdwwsdj>
	
					<!--���ⵥ�� -->
					<ckdh></ckdh>
	
					<!--֧���� -->
					<payman></payman>
					
					<!-- ֧������ -->
					<paydate></paydate>
	
					<!--��Ŀ�׶ι�����id -->
					<pk_jobobjpha></pk_jobobjpha>
	
					<!-- ������ -->
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