<?xml version="1.0" encoding="gb2312"?>
<ufinterface roottag="so_order" billtype="30"  replace="Y" receiver="${receiver}" sender="9999" isexchange="Y" filename="${filename}" proc="add" operation="req">
<so_order id="${docid}" subdoctype="">
		<so_order_head>
			<!--ȥ�������۶�����������-->
			
			<!--��˾PK,����Ϊ�գ����ջ�������"��˾Ŀ¼"-->
			<pk_corp>${receiver}</pk_corp>

			<!--���ݺ�,�ɿ��ֶ�, ���Ϊ�ձ���ʱϵͳ�Զ���ȡ -->
			<vreceiptcode>${vbillno}</vreceiptcode>

			<!--��������,����Ϊ��-->
			<creceipttype>30</creceipttype>

			<!--ҵ������ID,�ɿ��ֶΣ�����ҵ�����͵���ID��-->
			<cbiztype>${busitype}</cbiztype>
			
			<!--������,����Ϊ��-->
			<vaccountyear></vaccountyear>

			<!--�ڳ���־,����Ϊ��,��Ϊ�ڳ���������ΪY-->
			<binitflag>N</binitflag>

			<!--��������,����Ϊ��,YYYY-MM-DD-->
			<dbilldate>${hinfo.vbilldate}</dbilldate>

			<!--���̹�����ID,����Ϊ�գ���Ҫ���տ��̹�����ID��-->
			<ccustomerid>${hinfo.ccustomer.custorm_Bas.custcode}</ccustomerid>

			<!--���ŵ���ID,����Ϊ�գ���Ҫ���ղ��ŵ����������ݣ�-->
			<cdeptid>${deptid}</cdeptid>

			<!--ҵ��Ա����ID,����Ϊ��,���Ӧ���ţ���Ҫ����ҵ��Ա�����������ݣ�-->
			<cemployeeid></cemployeeid>

			<!--�Ƶ���:��Ա����ID,����Ϊ�գ���Ҫ������Ա�����������ݣ�-->
			<coperatorid>${hinfo.makeman.usercode}</coperatorid>

			<!--�տ�Э��ID,����Ϊ��,����Ҫ�����ո�����������ݣ�-->
			<ctermprotocolid></ctermprotocolid>

			<!--������֯ID,����Ϊ�գ���Ҫ����'������֯'�����������ݣ�-->
			<csalecorpid>${csalecorpid}</csalecorpid>

			<!--�����֯ID,����Ϊ�գ���Ҫ���տ����֯�����������ݣ�-->
			<ccalbodyid>${ccalbodyid}</ccalbodyid>

			<!--�ջ���λ���̹�����ID,����Ϊ�գ���Ҫ���տ��̹������������ݣ�-->
			<creceiptcustomerid>${hinfo.ccustomer.custorm_Bas.custcode}</creceiptcustomerid>

			<!--�ջ���ַ�ַ���,����Ϊ��-->
			<vreceiveaddress></vreceiveaddress>

			<!--�ջ�����ID,����Ϊ�գ���Ҫ�����ջ���λ�������������������ݣ�-->
			<creceiptareaid></creceiptareaid>

			<!--��Ʊ��λ���̹�����ID,����Ϊ�գ���Ҫ���տ��̹������������ݣ�-->
			<creceiptcorpid>${hinfo.ccustomer.custorm_Bas.custcode}</creceiptcorpid>

			<!--��Ʊ��λ���ÿ������е���ID,����Ϊ��-->
			<ccustbankid></ccustbankid>

			<!--���䷽ʽID,����Ϊ�գ���Ҫ�������䷽ʽ�������������ݣ�-->
			<ctransmodeid></ctransmodeid>

			<!--�����ۿ�,����Ϊ��-->
			<ndiscountrate>${ndiscount?string("0.########")}</ndiscountrate>

			<!--�ֿ⵵��ID,����Ϊ��,��Ҫ�������ݶ��գ��ֿ⵵����-->
			<cwarehouseid>${hinfo.pk_stordoc.storcode}</cwarehouseid>

			<!--�޶�����,����Ϊ��-->
			<veditreason></veditreason>

			<!--�Ƿ�ɢ��,Ĭ��ΪN-->
			<bfreecustflag>N</bfreecustflag>

			<!--ɢ��ID,����Ϊ�գ���Ҫ���տ��̹������������ݣ�-->
			<cfreecustid></cfreecustid>

			<!--�����־,Ĭ��ΪN-->
			<ibalanceflag>0</ibalanceflag>

			<!--����,����Ϊ��-->
			<nsubscription></nsubscription>

			<!--Ԥ���˷�,����Ϊ��-->
			<nevaluatecarriage></nevaluatecarriage>

			<!--�Ƶ�����,����Ϊ��,YYYY-MM-DD-->
			<dmakedate>${hinfo.vbilldate}</dmakedate>

			<!--״̬,����Ϊ��:0��״̬,1����,2����,3����,4�ر�,5����,6����,7��������,8����δͨ��-->
			<!--�ϴ�ʱ��ʱ��Ϊ����״̬-->
			<fstatus>1</fstatus>

			<!--��ע,����Ϊ��-->
			<vnote>${hinfo.memo?default('') + "  Ӧ��" +hinfo.nrecmoney+ "  �ۿ�" +hinfo.nrebatemoney}</vnote>

			<!--�Զ���1,����Ϊ��-->
			<vdef1></vdef1>

			<!--�Զ���2,����Ϊ��-->	
			<vdef2></vdef2>

			<!--�Զ���3,����Ϊ��-->
			<vdef3></vdef3>

			<!--�Զ���4,����Ϊ��-->
			<vdef4></vdef4>

			<!--�Զ���5,����Ϊ��-->
			<vdef5></vdef5>

			<!--�Զ���6,����Ϊ��-->
			<vdef6></vdef6>

			<!--�Զ���7,����Ϊ��-->
			<vdef7></vdef7>

			<!--�Զ���8,����Ϊ��-->
			<vdef8></vdef8>

			<!--�Զ���9,����Ϊ��-->
			<vdef9></vdef9>

			<!--�Զ���10,����Ϊ��-->
			<vdef10></vdef10>
			<!--pk_defdoc1,����Ϊ��(),vdef1Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef1��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc1></pk_defdoc1>
			<!--pk_defdoc2,����Ϊ��(),vdef2Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef2��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc2></pk_defdoc2>
			<!--pk_defdoc3,����Ϊ��(),vdef3Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef3��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc3></pk_defdoc3>
			<!--pk_defdoc4,����Ϊ��(),vdef4Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef4��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc4></pk_defdoc4>
			<!--pk_defdoc5,����Ϊ��(),vdef5Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef5��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc5></pk_defdoc5>
			<!--pk_defdoc6,����Ϊ��(),vdef6Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef6��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc6></pk_defdoc6>
			<!--pk_defdoc7,����Ϊ��(),vdef7Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef7��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc7></pk_defdoc7>
			<!--pk_defdoc8,����Ϊ��(),vdef8Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef8��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc8></pk_defdoc8>
			<!--pk_defdoc9,����Ϊ��(),vdef9Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef9��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc9></pk_defdoc9>
			<!--pk_defdoc10,����Ϊ��(),vdef10Ϊͳ���Ͳ���ʱpk_defdoc1��ֵvdef10��Ӧ���Ƶ�pkֵ-->
            <pk_defdoc10></pk_defdoc10>
			<!--�˻����,Ĭ��ΪN-->
			<bretinvflag>N</bretinvflag>

			<!--����������,Ĭ��ΪN-->
			<boutendflag>N</boutendflag>

			<!--��Ʊ�������,Ĭ��ΪN-->
			<binvoicendflag>N</binvoicendflag>

			<!--�����������,Ĭ��ΪN-->
			<breceiptendflag>N</breceiptendflag>

			<!--����������,Ĭ��ΪN-->
			<bpayendflag>N</bpayendflag>

		</so_order_head>

		<so_order_body>
			
			<#list blist as binfo> 
				
				<#list binfo.orderB as info>
				    <entry>
				    	
				    	<!-- ���� = ��װ���� * ��װ��ϸ����-->
				    	<#assign totalamount = binfo.nnumber * info.nnumber>
						<!-- ���� = ԭ�ҵ��� * �ۿ���  -->
						<#assign orgcurnetprice = binfo.nprice * ndiscountrate>
						<!-- �ۿ۽�� = ������ -���ۣ�* ���� -->
						<#assign orgdiscountmny = (binfo.nprice-orgcurnetprice) * totalamount />
						<!-- ԭ�ҽ�� = ���� * �ۿ��� * ���� -->
						<#assign orgmny = binfo.nprice * ndiscountrate * totalamount>
						
						<!--�к�,����Ϊ�գ���һ��Ϊ1���ڶ���Ϊ2����������-->
						<crowno>${binfo_index + 1}</crowno>
						
						<!--ȥ����������ID ����Ϊ��-->			
			
						<!--ȥ�����۶�������ID,����Ϊ��,�����ظ�-->
			
						<!--��˾����,���ջ�������"��˾Ŀ¼"-->
						<pk_corp>${receiver}</pk_corp>
			
						<!--��Դ��������,Ϊ�գ��ϲ�ҵ����Դ����ҵ�����ͣ�������䣩-->
						<creceipttype></creceipttype>
			
						<!--��Դ��������ID,Ϊ�գ���Դ���ݺţ�����Դ���ݺź͹�˾����ƥ��,�����Դ������NC�����ɵ���Դ��������ID��-->
						<csourcebillid></csourcebillid>
						
						<!--��Դ���ݸ���ID,Ϊ�գ���Դ���ݴ���кš���û�У��ô��ID����Դ��������IDƥ��,�����Դ���ݸ���ID��-->
						<csourcebillbodyid></csourcebillbodyid>
			
						<!--��������λ,����Ϊ�գ���Ҫ���ջ�������"��������"-->
						<cunitid>${binfo.jl.unitcode}</cunitid>
			
						<!--��װ��λ,����Ϊ����Ҫ���ջ�������"��������"-->
						<#if binfo.fjl??>
								<cpackunitid>${binfo.fjl.unitcode}</cpackunitid>
							<#else>
								<cpackunitid></cpackunitid>
						</#if>
			
						<!--����ID,����Ϊ��-->
						<cbatchid></cbatchid>
			
						<!-- ������ -->
						<!--fjlhsl>${binfo.hsl}</fjlhsl-->
						
						<!--����,����Ϊ��-->
						<nnumber>${totalamount}</nnumber>
			
						<!--��װ����,����Ϊ��-->
						<npacknumber>${binfo.fnumber}</npacknumber>
						
						<!--���������������,Ϊ�գ���Ҫҵ����ת��,��Ҫ���ջ�������"�������-->
						<cinvbasdocid></cinvbasdocid>
			
						<!--�������������,����Ϊ�գ���Ҫ���ջ�������"�������"-->
						<cinventoryid>${info.cinvbasdoc.invcode}</cinventoryid>
			
						<!--����ֿ�ID,����Ϊ�ղ��ղֿ⵵��ID-->
						<cbodywarehouseid>${binfo.pkStordoc.storcode}</cbodywarehouseid>
			
						<!--��������,����Ϊ��,YYYY-MM-DD-->
						<dconsigndate>${hinfo.vbilldate}</dconsigndate>
						
						<!--������˾������Ϊ�� ���չ�˾Ŀ¼ -->
						<cconsigncorpid>${receiver}</cconsigncorpid>
			
						<!--��������,����Ϊ��,YYYY-MM-DD-->
						<ddeliverdate>${hinfo.vbilldate}</ddeliverdate>
			
						<!--�Ƿ���Ʒ,����Ϊ��-->
						<blargessflag></blargessflag>
			
						<!--�޶��ĸ���ID,����Ϊ�գ��޶���־ΪYʱ����NC�л�ã�-->
						<ceditsaleid></ceditsaleid>
			
						<!--�޶���ʶ,����Ϊ��Ĭ��ΪN-->
						<beditflag></beditflag>
			
						<!--�޶�����,����Ϊ��-->
						<veditreason></veditreason>
			
						<!--ԭ��,����Ϊ��,�ο����ֵ���-->
						<ccurrencytypeid>${hinfo.currencytypeid.currCode}</ccurrencytypeid>
			
						<!--��Ʒ�ۿ���,����Ϊ��, Ĭ��100-->
						<nitemdiscountrate>100</nitemdiscountrate>
			
						<!--�����ۿ�,����Ϊ��, -->
						<ndiscountrate>${ndiscount?string("0.########")}</ndiscountrate>
			
						<!--�۸�����,����Ϊ��-->
						<nexchangeotoarate>0</nexchangeotoarate>
			
						<!--˰��,����Ϊ��-->
						<ntaxrate>0</ntaxrate>
			
						
						<!--ԭ����˰����,����Ϊ��-->
						<noriginalcurprice>${binfo.nprice?string("0.########")}</noriginalcurprice>
						<!--ԭ�Һ�˰����,����Ϊ��-->
						<noriginalcurtaxprice>${binfo.nprice?string("0.########")}</noriginalcurtaxprice>
			
			
						<!--ԭ����˰����,����Ϊ��-->
						<noriginalcurnetprice>${orgcurnetprice?string("0.########")}</noriginalcurnetprice>
						<!--ԭ�Һ�˰����,����Ϊ��-->
						<noriginalcurtaxnetprice>${orgcurnetprice?string("0.########")}</noriginalcurtaxnetprice>
			
			
						<!--ԭ��˰��,����Ϊ��-->
						<noriginalcurtaxmny>0</noriginalcurtaxmny>
			
						
						<!--ԭ����˰���,����Ϊ��-->
						<noriginalcurmny>${orgmny?string("0.########")}</noriginalcurmny>
						<!--ԭ�Ҽ�˰�ϼ�,����Ϊ��-->
						<noriginalcursummny>${orgmny?string("0.########")}</noriginalcursummny>
			
			
						<!--ԭ���ۿ۶�,����Ϊ��-->
						<noriginalcurdiscountmny>${orgdiscountmny?string("0.########")}</noriginalcurdiscountmny>

						
						<!--�۱�����,����Ϊ��-->
						<nexchangeotobrate>${exrate?string("0.######")}</nexchangeotobrate>
			
						<!--������˰����,����Ϊ��-->
						<#if operatecode="M">
							
							<nprice>${(binfo.nprice * exrate)?string("0.########")}</nprice>
							<!--���Һ�˰����,����Ϊ��-->
							<ntaxprice>${(binfo.nprice * exrate)?string("0.########")}</ntaxprice>
				
				
							<!--������˰����,����Ϊ��-->
							<nnetprice>${(orgcurnetprice * exrate)?string("0.########")}</nnetprice>
							<!--���Һ�˰����,����Ϊ��-->
							<ntaxnetprice>${(orgcurnetprice * exrate)?string("0.########")}</ntaxnetprice>
				
				
						    <!--����˰��,����Ϊ��-->
							<ntaxmny>0</ntaxmny>
				
				
							<!--������˰���,����Ϊ��-->
							<nmny>${(orgmny * exrate)?string("0.########")}</nmny>
							<!--���Ҽ�˰�ϼ�,����Ϊ��-->
							<nsummny>${(orgmny * exrate)?string("0.########")}</nsummny>
				
							<!--�����ۿ۶�,����Ϊ��-->
							<ndiscountmny>${(orgdiscountmny * exrate)?string("0.########")}</ndiscountmny>	
						
						<#elseif operatecode="D">
							
							<nprice>${(binfo.nprice / exrate)?string("0.########")}</nprice>
							<!--���Һ�˰����,����Ϊ��-->
							<ntaxprice>${(binfo.nprice / exrate)?string("0.########")}</ntaxprice>
				
				
							<!--������˰����,����Ϊ��-->
							<nnetprice>${(orgcurnetprice / exrate)?string("0.########")}</nnetprice>
							<!--���Һ�˰����,����Ϊ��-->
							<ntaxnetprice>${(orgcurnetprice / exrate)?string("0.########")}</ntaxnetprice>
				
				
						    <!--����˰��,����Ϊ��-->
							<ntaxmny>0</ntaxmny>
				
				
							<!--������˰���,����Ϊ��-->
							<nmny>${(orgmny / exrate)?string("0.########")}</nmny>
							<!--���Ҽ�˰�ϼ�,����Ϊ��-->
							<nsummny>${(orgmny / exrate)?string("0.########")}</nsummny>
				
							<!--�����ۿ۶�,����Ϊ��-->
							<ndiscountmny>${(orgdiscountmny / exrate)?string("0.########")}</ndiscountmny>	

						</#if>
						
						
						<!--�Ƶ���:��Ա����ID,����Ϊ��-->
						<coperatorid>${hinfo.makeman.usercode}</coperatorid>
			
						<!--��״̬,����Ϊ��:0��״̬,1����,2����,3����,4�ر�,5����,6����,7��������,8����δͨ��-->
						<!--��ʱ���Ա���̬�ϴ�-->
						<frowstatus>1</frowstatus>
			
						<!--�б�ע,����Ϊ��-->
						<frownote></frownote>
			
						<!--����״̬,����Ϊ��,0��ʾ���������ι���Ϊ�ջ�1��ʾ���ι����ڶ����޸�ʱ��Ҫ�������κ�-->
						<fbatchstatus>0</fbatchstatus>
			
						<!--��ͬID,����Ϊ�գ���������Դ�ں�ͬ��Ҫ�������ú�ͬ����NC�����ɵ�OID��-->
						<ct_manageid></ct_manageid>
			
						<!--����ID,����Ϊ�գ�����ҵ���д�ֶΣ��ռ��ɣ�-->
						<cfactoryid></cfactoryid>
			
						<!--���鷢�������֯,����Ϊ�գ����տ����֯������-->
						<cadvisecalbodyid>01</cadvisecalbodyid>
			
						<!--ȱ����־,����Ϊ�գ�Ĭ��ΪN��-->
						<boosflag>N</boosflag>
			
						<!--������־,����Ϊ�գ�Ĭ��ΪN��-->
						<bsupplyflag>N</bsupplyflag>
			
						<!--�ջ�����,����Ϊ�գ������ӱ���ջ���λ���������ĵ����������ݣ�-->
						<creceiptareaid></creceiptareaid>
			
						<!--�ջ���ַ,����Ϊ��(�����ӱ���ջ���λ��Ĭ���ջ���ַ�ַ���-->
						<vreceiveaddress></vreceiveaddress>
			
						<!--�ջ���λ,����Ϊ�գ���Ҫ���տ��̹������������ݣ�-->
						<creceiptcorpid>${hinfo.ccustomer.custorm_Bas.custcode}</creceiptcorpid>
			
						<!--�ۼ��տ���,����Ϊ��-->
						<ntotalpaymny></ntotalpaymny>
			
						<!--�ۼƷ�������,����Ϊ��-->
						<ntotalreceiptnumber></ntotalreceiptnumber>
			
						<!--�ۼƿ�Ʊ����,����Ϊ��-->
						<ntotalinvoicenumber></ntotalinvoicenumber>
			
						<!--�ۼƿ�Ʊ���,����Ϊ��-->
						<ntotalinvoicemny></ntotalinvoicemny>
			
						<!--�ۼƳ�������,����Ϊ��-->
						<ntotalinventorynumber></ntotalinventorynumber>
			
						<!--�ۼƽ�������,����Ϊ��-->
						<ntotalbalancenumber></ntotalbalancenumber>
			
						<!--�ۼ�ǩ������,����Ϊ��-->
						<ntotalsignnumber></ntotalsignnumber>
			
						<!--�ۼƳɱ����,����Ϊ��-->
						<ntotalcostmny></ntotalcostmny>
			
						<!--�Ƿ�Ʊ����,����Ϊ��-->
						<bifinvoicefinish>N</bifinvoicefinish>
			
						<!--�Ƿ񷢻�����,����Ϊ��-->
						<bifreceiptfinish>N</bifreceiptfinish>
			
						<!--�Ƿ�������,����Ϊ��-->
						<bifinventoryfinish>N</bifinventoryfinish>
			
						<!--�Ƿ��տ����,����Ϊ��-->
						<bifpayfinish>N</bifpayfinish>
			
						<!--�Ƿ�������,����Ϊ��-->
						<bifpaybalance>N</bifpaybalance>
			
						<!--�Ƿ�ǩ�ս���,����Ϊ��-->
						<bifpaysign>N</bifpaysign>
			
						<!--�����ۿ۶�,����Ϊ��-->
						<nassistcurdiscountmny></nassistcurdiscountmny>
			
						<!--���Ҽ�˰�ϼ�,����Ϊ��-->
						<nassistcursummny></nassistcursummny>
			
						<!--������˰���,����Ϊ��-->
						<nassistcurmny></nassistcurmny>
			
						<!--����˰��,����Ϊ��-->
						<nassistcurtaxmny></nassistcurtaxmny>
			
						<!--���Һ�˰����,����Ϊ��-->
						<nassistcurtaxnetprice></nassistcurtaxnetprice>
			
						<!--������˰����,����Ϊ��-->
						<nassistcurnetprice></nassistcurnetprice>
			
						<!--���Һ�˰����,����Ϊ��-->
						<nassistcurtaxprice></nassistcurtaxprice>
			
						<!--������˰����,����Ϊ��-->
						<nassistcurprice></nassistcurprice>
			
						<!--��Ŀ����ID,����Ϊ�գ�������Ŀ�������ݣ�-->
						<cprojectid></cprojectid>
			
						<!--��Ŀ�׶ε���ID,����Ϊ�գ�������Ŀ�������ݣ�-->
						<cprojectphaseid></cprojectphaseid>
			
						<!--��Ŀ����ID,����Ϊ�գ�������Ŀ�������ݣ�-->
						<cprojectid3></cprojectid3>
			
						<!--������1,����Ϊ��-->
						<vfree1>${binfo.freeItem1.docname}</vfree1>
						
						<!--������2,����Ϊ��-->
						<vfree2></vfree2>
			
						<!--������3,����Ϊ��-->
						<vfree3></vfree3>
			
						<!--������4,����Ϊ��-->
						<vfree4></vfree4>
			
						<!--������5,����Ϊ��-->
						<vfree5></vfree5>
			
						<!--�Զ���1,����Ϊ��-->
						<vdef1></vdef1>
			
						<!--�Զ���2,����Ϊ��-->
						<vdef2></vdef2>
			
						<!--�Զ���3,����Ϊ��-->
						<vdef3></vdef3>
			
						<!--�Զ���4,����Ϊ��-->
						<vdef4></vdef4>
			
						<!--�Զ���5,����Ϊ��-->
						<vdef5></vdef5>
			
						<!--�Զ���6,����Ϊ��-->
						<vdef6></vdef6>
			
						<!--�ۼ��˻�����,����Ϊ��-->
						<ntotalreturnnumber></ntotalreturnnumber>
			
						<!--�ۼƷ�������,����Ϊ��-->
						<ntotalcarrynumber></ntotalcarrynumber>
			
						<!--�ƻ���������,����Ϊ��-->
						<ntotalplanreceiptnumber></ntotalplanreceiptnumber>
					    </entry> 
				</#list>
		   </#list>
		</so_order_body>
</so_order>
</ufinterface>
