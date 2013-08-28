<?xml version="1.0" encoding='gb2312'?>
<ufinterface billtype="IC" filename="${filename}" isDebug="N" isexchange="Y" proc="add" receiver="${receiver}" replace="Y" roottag="ic_bill" sender="9999" subtype="run">
    
    <!-- ������� -->
    <ic_bill id="${docid}_1">
        <!-- ��ͷ��Ҫ�ֶ� -->
        <ic_bill_head>
            <!--�������� �ɿ��ֶ� ����ϵͳ�Զ�����-->
            <cgeneralhid></cgeneralhid>
            <!--�������ͱ��� �ǿ��ֶ� -->
            <!--40	����ڳ����-->
            <!--41	����ڳ����뵥-->
            <!--44	����ڳ����ϼӹ���-->
            <!--45	���ɹ���ⵥ-->
            <!--46	������Ʒ��ⵥ-->
            <!--47	���ί��ӹ���ⵥ-->
            <!--48	������ϼӹ���ⵥ-->
            <!--49	�����뵥-->
            <!--4A	���������ⵥ-->
            <!--4B	��������ص�-->
            <!--4C	������۳��ⵥ-->
            <!--4D	�����ϳ��ⵥ-->
            <!--4F	���ί��ӹ����ϵ�-->
            <!--4G	������ϼӹ����ⵥ-->
            <!--4H	�������-->
            <!--4I	����������ⵥ-->
            <!--4J	�����뻹����-->
            <cbilltypecode>4A</cbilltypecode>
            <!--���ݹ�˾���� �ǿ��ֶ� ��Ҫ�������ݶ��գ���˾Ŀ¼��-->
            <pk_corp>${receiver}</pk_corp>
            <!--���ݺ� �ɿ��ֶ�, ���Ϊ�ձ���ʱϵͳ�Զ���ȡ -->
            <vbillcode>${hinfo.vbillcode}_1</vbillcode>
            
            
            <!--����ҵ��Ա���� �ɿ��ֶ� ��Ҫ�������ݶ��գ���Ա������-->
            <cbizid></cbizid>
            <!--����ҵ���������� �ɿ��ֶ� ��Ҫ�������ݶ��գ�ҵ�����ͣ�(����ǲɹ���ⵥ�������εĲɹ������������򵥾�ҵ��������Ҫ�����εĲɹ�����һ��)-->
            <cbiztype></cbiztype>
            <!--���ݿͻ����� �ɿ��ֶ� ��Ҫ�������ݶ��գ����̵�����-->
            <ccustomerid></ccustomerid>
            <!--���ݷ���������� �ɿ��ֶ� ��Ҫ�������ݶ��գ����˷�ʽ��-->
            <cdilivertypeid></cdilivertypeid>
            <!--�����շ�������� �ɿ��ֶ� ��Ҫ�������ݶ��գ��շ����-->
            <cdispatcherid>${rksflb?default('')}</cdispatcherid>
            <!--���ݲ������� �ɿ��ֶ� ��Ҫ�������ݶ��գ����ŵ�����-->
            <cdptid></cdptid>
            <!--���ݹ�Ӧ������ �ɿ��ֶ� ��Ҫ�������ݶ��գ����̵�����-->
            <cproviderid></cproviderid>
            
            
            <!--���ݿ����֯���� �ǿ��ֶ� ��Ҫ�������ݶ��գ������֯��-->
            <pk_calbody>${kczz}</pk_calbody>
           
            <!--���ݲֿ����� �ǿ��ֶ� ��Ҫ�������ݶ��գ��ֿ⵵����-->
            <cwarehouseid>${rkck}</cwarehouseid>
            
            <!--�������� �ǿ��ֶ� Ĭ���ǵ�ǰ����,��ʽ:YYYY-MM-DD -->
            <dbilldate>${hinfo.vbilldate}</dbilldate>
            <!--�����Ƶ������� �ǿ��ֶ� ��Ҫ�������ݶ��գ�����Ա��-->
            <coperatorid>${hinfo.makeman.usercode}</coperatorid>
            <!--���ݵ�ǰ�Ƶ������� �ǿ��ֶ� ��Ҫ�������ݶ��գ�����Ա��-->
            <coperatoridnow>${hinfo.makeman.usercode}</coperatoridnow>
            
            <!--����״̬��־ �ǿ��ֶ�  2������״̬��3��ǩ�֣�4����� Ĭ����2-->
            <!-- ��ʱ���Ա���̬�ϴ� -->
        	<fbillflag>2</fbillflag>
            
            <!--���ݿ��Ա���� �ɿ��ֶ� ��Ҫ�������ݶ��գ���Ա������-->
            <cwhsmanagerid></cwhsmanagerid>
            <!--������������� �ɿ��ֶ� ��Ҫ�������ݶ��գ�����Ա��ע:�������Ϊǩ��״̬ǩ����Ϊ�����ֶ�-->
            <cauditorid></cauditorid>
            <!--���ݴ���������� �ɿ��ֶ� ��ʽ:YYYY-MM-DD -->
            <dauditdate></dauditdate>
            
            
            <!--�������ͱ�־����������ⵥ�ǿ��ֶ�0��ֱ�˵�����1��������-->
            <fallocflag></fallocflag>
            
			<!--�����루�����ⵥ��������⣩��˾���� ��������ⵥ�ǿ��ֶ� ��Ҫ�������ݶ��գ���˾Ŀ¼��-->
            <cothercorpid></cothercorpid>
			<!--�����루�����ⵥ��������⣩�����֯���� ��������ⵥ�ǿ��ֶ� ��Ҫ�������ݶ��գ������֯��-->
            <cothercalbodyid></cothercalbodyid>
            <!--�����루�����ⵥ��������⣩�ֿ����� �ɿ��ֶ� ��Ҫ�������ݶ��գ��ֿ⵵����-->
            <cotherwhid></cotherwhid>
            
			<!--�����루�����ⵥ������˾���� ��������ⵥ�ǿ��ֶ� ��Ҫ�������ݶ��գ���˾Ŀ¼��-->
            <coutcorpid></coutcorpid>
            <!--�����루�����ⵥ���������֯���� ��������ⵥ�ǿ��ֶ� ��Ҫ�������ݶ��գ������֯��-->
            <coutcalbodyid></coutcalbodyid>
            <!--�����루�����ⵥ�����ֿ����� �ɿ��ֶ� ��Ҫ�������ݶ��գ��ֿ⵵����-->
            <coutwhid></coutwhid>
            
            
            <!--���ݷ�����ַ �ɿ��ֶ� ��Ҫ�������ݶ��գ����̷�����ַ)-->
            <vdiliveraddress></vdiliveraddress>
            <!--���ݱ�ͷ��ע �ɿ��ֶ� -->
            <vnote>${hinfo.memo}</vnote>
            <!--���ݱ�ͷ�Զ�����1 �ɿ��ֶ� -->
            <vuserdef1>
            </vuserdef1>
            <!--���ݱ�ͷ�Զ�����2 �ɿ��ֶ� -->
            <vuserdef2>
            </vuserdef2>
            <!--���ݱ�ͷ�Զ�����3 �ɿ��ֶ� -->
            <vuserdef3>
            </vuserdef3>
            <!--���ݱ�ͷ�Զ�����4 �ɿ��ֶ� -->
            <vuserdef4>
            </vuserdef4>
            <!--���ݱ�ͷ�Զ�����5 �ɿ��ֶ� -->
            <vuserdef5>
            </vuserdef5>
            <!--���ݱ�ͷ�Զ�����6 �ɿ��ֶ� -->
            <vuserdef6>
            </vuserdef6>
            <!--���ݱ�ͷ�Զ�����7 �ɿ��ֶ� -->
            <vuserdef7>
            </vuserdef7>
            <!--���ݱ�ͷ�Զ�����8 �ɿ��ֶ� -->
            <vuserdef8>
            </vuserdef8>
            <!--���ݱ�ͷ�Զ�����9 �ɿ��ֶ� -->
            <vuserdef9>
            </vuserdef9>
            <!--���ݱ�ͷ�Զ�����10 �ɿ��ֶ� -->
            <vuserdef10>
            </vuserdef10>

            <!--���ݱ�ͷ�Զ�����1���� �ɿ��ֶ� -->
            <pk_defdoc1>
            </pk_defdoc1>
            <!--���ݱ�ͷ�Զ�����2���� �ɿ��ֶ� -->
            <pk_defdoc2>
            </pk_defdoc2>
            <!--���ݱ�ͷ�Զ�����3���� �ɿ��ֶ� -->
            <pk_defdoc3>
            </pk_defdoc3>
            <!--���ݱ�ͷ�Զ�����4���� �ɿ��ֶ� -->
            <pk_defdoc4>
            </pk_defdoc4>
            <!--���ݱ�ͷ�Զ�����5���� �ɿ��ֶ� -->
            <pk_defdoc5>
            </pk_defdoc5>
            <!--���ݱ�ͷ�Զ�����6���� �ɿ��ֶ� -->
            <pk_defdoc6>
            </pk_defdoc6>
            <!--���ݱ�ͷ�Զ�����7���� �ɿ��ֶ� -->
            <pk_defdoc7>
            </pk_defdoc7>
            <!--���ݱ�ͷ�Զ�����8���� �ɿ��ֶ� -->
            <pk_defdoc8>
            </pk_defdoc8>
            <!--���ݱ�ͷ�Զ�����9���� �ɿ��ֶ� -->
            <pk_defdoc9>
            </pk_defdoc9>
            <!--���ݱ�ͷ�Զ�����10���� �ɿ��ֶ� -->
            <pk_defdoc10></pk_defdoc10>
            
        </ic_bill_head>
        <body>
        	<#list rkblist as binfo>
        		<#list binfo.bodys as bbinfo>
        			<entry>
		                <!--���ݱ�ͷ���� �ǿ��ֶΣ�����Ͷ�Ӧ�ı�ͷһ�� -->
		                <cgeneralhid>
		                </cgeneralhid>
		                <!--���ݱ������� �ɿ��ֶ� ����ϵͳ�Զ����� -->
		                <cgeneralbid>
		                </cgeneralbid>
		                <!--���ݱ��帨�������� �ɿ��ֶ� ��Ҫ�������ݶ��գ�������λ)-->
		                <castunitid>${binfo.fjl.unitcode}</castunitid>
		                <!--���ݱ����Ӧ���ݱ������� �ɿ��ֶ� -->
		                <ccorrespondbid>
		                </ccorrespondbid>
		                <!--���ݱ����Ӧ���ݺ����� �ɿ��ֶ� -->
		                <ccorrespondcode>
		                </ccorrespondcode>
		                <!--���ݱ����Ӧ���ݱ�ͷ���� �ɿ��ֶ� -->
		                <ccorrespondhid>
		                </ccorrespondhid>
		                <!--���ݱ����Ӧ�������ͱ��� �ɿ��ֶ� -->
		                <ccorrespondtype>
		                </ccorrespondtype>
		                <!--���ݱ���ɱ��������� �ɿ��ֶ� ��Ҫ�������ݶ��գ����������)-->
		                <ccostobject>
		                </ccostobject>
		                
		                <!--���ݱ������������� �ǿ��ֶ� ��Ҫ�������ݶ��գ����������)-->
		                <cinventoryid>${bbinfo.pkinvbasdoc.invcode}</cinventoryid>
		                <!--���ݱ��������� �ǿ��ֶ� ��Ҫ�������ݶ��գ������������)-->
		                <!--cinventoryid></cinventoryid-->
		                
		                <!--���ݱ�����Ŀ���� �ɿ��ֶ�  ��Ҫ�������ݶ��գ���Ŀ����)-->
		                <cprojectid>
		                </cprojectid>
		                <!--���ݱ�����Ŀ�׶����� �ɿ��ֶ� ��Ҫ�������ݶ��գ���Ŀ�׶ε���)-->
		                <cprojectphaseid>
		                </cprojectphaseid>
		                <!--���ݱ�����Դ���ݱ������� �ɿ��ֶ� ע:����Դ���ݴ��ֶηǿ�-->
		                <csourcebillbid>
		                </csourcebillbid>
		                <!--���ݱ�����Դ���ݱ�ͷ���� �ɿ��ֶ� ע:����Դ���ݴ��ֶηǿ�-->
		                <csourcebillhid>
		                </csourcebillhid>
		                <!--���ݱ�����Դ�������ͱ��� �ɿ��ֶ� ע:����Դ���ݴ��ֶηǿ�-->
		                <csourcetype>
		                </csourcetype>
		                <!--���ݱ�����Դ���ݺ� �ɿ��ֶ� ע:����Դ���ݴ��ֶηǿ�-->
		                <vsourcebillcode>
		                </vsourcebillcode>
		                <!--���ݱ���ҵ������ ������ʱΪ�ǿ��ֶ� ��ʽ:YYYY-MM-DD-->
		                <dbizdate>${hinfo.vbilldate}</dbizdate>
		                <!--���ݱ���ʧЧ���� �ɿ��ֶ� -->
		                <dvalidate></dvalidate>
		                
		                <!-- ������ -->
		                <hsl>${binfo.hsl}</hsl>
		                
		                <!--���ݱ���Ӧ������ �ɿ��ֶ� -->
		                <nshouldinnum>${binfo.nnumber * bbinfo.nnumber}</nshouldinnum>
		                <!--���ݱ���������� �ɿ��ֶ� ע:�������,�������������ͬʱ��д! -->
		                <ninnum>${binfo.nnumber * bbinfo.nnumber}</ninnum>
		                
		                <!--���ݱ���Ӧ�ո����� �ɿ��ֶ� -->
		                <nneedinassistnum>${binfo.fnumber * bbinfo.nnumber}</nneedinassistnum>
		                <!--���ݱ�����⸨���� �ɿ��ֶ� -->
		                <ninassistnum>${binfo.fnumber * bbinfo.nnumber}</ninassistnum>
		                
		                
						
						<!--���ݱ���Ӧ���⸨���� �ɿ��ֶ� -->
		                <nshouldoutassistnum></nshouldoutassistnum>
		                <!--���ݱ���Ӧ�������� �ɿ��ֶ� -->
		                <nshouldoutnum></nshouldoutnum>
		                <!--���ݱ�����⸨���� �ɿ��ֶ� -->
		                <noutassistnum></noutassistnum>
		                <!--���ݱ���������� �ɿ��ֶ� -->
		                <noutnum></noutnum>
		                
		                
		                <!--���ݱ������/���ת�������� �ɿ��ֶ� -->
		                <ntranoutastnum></ntranoutastnum>
		                <!--���ݱ������/���ת��������  �ɿ��ֶ� -->
		                <ntranoutnum></ntranoutnum>
		                
		
		                <!--���ݱ���ƻ����� �ɿ��ֶ� (����Ʒ��ⵥ����ƻ�����)-->
		                <nplannedprice></nplannedprice>
		                <!--���ݱ���ƻ���� �ɿ��ֶ� -->
		                <nplannedmny></nplannedmny>
		                <!--���ݱ��嵥�� �ɿ��ֶ� -->
		                <nprice></nprice>
		                <!--���ݱ����� �ɿ��ֶ� -->
		                <nmny></nmny>
		                <!--���ݱ������κ� �ɿ��ֶ� -->
		                <vbatchcode></vbatchcode>
		                <!--���ݱ��������κ� �ɿ��ֶ� -->
		                <vproductbatch></vproductbatch>
		                <!--���ݱ�ͷ�Զ�����1 �ɿ��ֶ� -->
		                <vuserdef1></vuserdef1>
		                <!--���ݱ�ͷ�Զ�����2 �ɿ��ֶ� -->
		                <vuserdef2></vuserdef2>
		                <!--���ݱ�ͷ�Զ�����3 �ɿ��ֶ� -->
		                <vuserdef3></vuserdef3>
		                <!--���ݱ�ͷ�Զ�����4 �ɿ��ֶ� -->
		                <vuserdef4></vuserdef4>
		                <!--���ݱ�ͷ�Զ�����5 �ɿ��ֶ� -->
		                <vuserdef5></vuserdef5>
		                <!--���ݱ�ͷ�Զ�����6 �ɿ��ֶ� -->
		                <vuserdef6></vuserdef6>
		                <!--���ݱ�ͷ�Զ�����7 �ɿ��ֶ� -->
		                <vuserdef7></vuserdef7>
		                <!--���ݱ�ͷ�Զ�����8 �ɿ��ֶ� -->
		                <vuserdef8></vuserdef8>
		                <!--���ݱ�ͷ�Զ�����9 �ɿ��ֶ� -->
		                <vuserdef9></vuserdef9>
		                <!--���ݱ�ͷ�Զ�����10 �ɿ��ֶ� -->
		                <vuserdef10></vuserdef10>
		                
		                <!--���ݱ�ͷ�Զ�����1���� �ɿ��ֶ� -->
		                <pk_defdoc1></pk_defdoc1>
		                <!--���ݱ�ͷ�Զ�����2���� �ɿ��ֶ� -->
		                <pk_defdoc2></pk_defdoc2>
		                <!--���ݱ�ͷ�Զ�����3���� �ɿ��ֶ� -->
		                <pk_defdoc3></pk_defdoc3>
		                <!--���ݱ�ͷ�Զ�����4���� �ɿ��ֶ� -->
		                <pk_defdoc4></pk_defdoc4>
		                <!--���ݱ�ͷ�Զ�����5���� �ɿ��ֶ� -->
		                <pk_defdoc5></pk_defdoc5>
		                <!--���ݱ�ͷ�Զ�����6���� �ɿ��ֶ� -->
		                <pk_defdoc6></pk_defdoc6>
		                <!--���ݱ�ͷ�Զ�����7���� �ɿ��ֶ� -->
		                <pk_defdoc7></pk_defdoc7>
		                <!--���ݱ�ͷ�Զ�����8���� �ɿ��ֶ� -->
		                <pk_defdoc8></pk_defdoc8>
		                <!--���ݱ�ͷ�Զ�����9���� �ɿ��ֶ� -->
		                <pk_defdoc9></pk_defdoc9>
		                <!--���ݱ�ͷ�Զ�����10���� �ɿ��ֶ� -->
		                <pk_defdoc10></pk_defdoc10>
		                <!--���ݱ�ͷ�Զ�����11���� �ɿ��ֶ� -->
		                
		                <!--���ݱ�����������1 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������ ��װװ��)-->
		                <vfree1>${binfo.zhuangshu.docname}</vfree1>
		                <!--���ݱ�����������2 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������)-->
		                <vfree2></vfree2>
		                <!--���ݱ�����������3 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������)-->
		                <vfree3></vfree3>
		                <!--���ݱ�����������4 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������)-->
		                <vfree4></vfree4>
		                <!--���ݱ�����������5 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������)-->
		                <vfree5></vfree5>
		                <!--���ݱ���Դͷ���ݱ������� �ɿ��ֶ� -->
		                <cfirstbillbid></cfirstbillbid>
		                <!--���ݱ���Դͷ���ݱ�ͷ���� �ɿ��ֶ� -->
		                <cfirstbillhid></cfirstbillhid>
		                <!--���ݱ���Դͷ�������ͱ��� �ɿ��ֶ� -->
		                <cfirsttype></cfirsttype>
		                <!--���ݱ��幩Ӧ������ �ɿ��ֶ� ��Ҫ�������ݶ��գ����̵���)-->
		                <cvendorid></cvendorid>
		                <!--���ݱ���ע�� �ɿ��ֶ� -->
		                <vnotebody></vnotebody>
		                <!--���ݱ����к� �ǿ��ֶ� ϵͳ���Զ���д�к�-->
		                <crowno></crowno>
		                <!--�����־  �ɿ��ֶ� 1 ���� 0 ����(Ĭ��) -->
		                <fchecked></fchecked>
		                <!--��Ʒ��־  �ɿ��ֶ� Y ��Ʒ  Ĭ��ΪN-->
		                <flargess></flargess>
		                <!--�ݹ���־  �ɿ��ֶ� Y �ݹ� Ĭ��ΪN -->
		                <bzgflag></bzgflag>
		                <!--�ݹ�����  �ɿ��ֶ�  ��ʽ:YYYY-MM-DD-->
		                <dzgdate></dzgdate>
		                <!-- �������� �ɿ��ֶ�  -->
		                <cwp></cwp>
		                <!-- Ͷ�ϵ� �ɿ��ֶ�  -->
		                <cworksiteid></cworksiteid>
		            </entry>
        		</#list>
        	</#list>
        </body>
    </ic_bill>
    
    <!-- �������� -->
    <ic_bill id="${docid}_2">
        <!-- ��ͷ��Ҫ�ֶ� -->
        <ic_bill_head>
            <!--�������� �ɿ��ֶ� ����ϵͳ�Զ�����-->
            <cgeneralhid></cgeneralhid>
            <!--�������ͱ��� �ǿ��ֶ� -->
            <!--40	����ڳ����-->
            <!--41	����ڳ����뵥-->
            <!--44	����ڳ����ϼӹ���-->
            <!--45	���ɹ���ⵥ-->
            <!--46	������Ʒ��ⵥ-->
            <!--47	���ί��ӹ���ⵥ-->
            <!--48	������ϼӹ���ⵥ-->
            <!--49	�����뵥-->
            <!--4A	���������ⵥ-->
            <!--4B	��������ص�-->
            <!--4C	������۳��ⵥ-->
            <!--4D	�����ϳ��ⵥ-->
            <!--4F	���ί��ӹ����ϵ�-->
            <!--4G	������ϼӹ����ⵥ-->
            <!--4H	�������-->
            <!--4I	����������ⵥ-->
            <!--4J	�����뻹����-->
            <cbilltypecode>4I</cbilltypecode>
            <!--���ݹ�˾���� �ǿ��ֶ� ��Ҫ�������ݶ��գ���˾Ŀ¼��-->
            <pk_corp>${receiver}</pk_corp>
            
            <!--���ݺ� �ɿ��ֶ�, ���Ϊ�ձ���ʱϵͳ�Զ���ȡ -->
            <vbillcode>${hinfo.vbillcode}_2</vbillcode>
            
            <!--����ҵ��Ա���� �ɿ��ֶ� ��Ҫ�������ݶ��գ���Ա������-->
            <cbizid></cbizid>
            <!--����ҵ���������� �ɿ��ֶ� ��Ҫ�������ݶ��գ�ҵ�����ͣ�(����ǲɹ���ⵥ�������εĲɹ������������򵥾�ҵ��������Ҫ�����εĲɹ�����һ��)-->
            <cbiztype></cbiztype>
            <!--���ݿͻ����� �ɿ��ֶ� ��Ҫ�������ݶ��գ����̵�����-->
            <ccustomerid></ccustomerid>
            <!--���ݷ���������� �ɿ��ֶ� ��Ҫ�������ݶ��գ����˷�ʽ��-->
            <cdilivertypeid></cdilivertypeid>
            <!--�����շ�������� �ɿ��ֶ� ��Ҫ�������ݶ��գ��շ����-->
            <cdispatcherid>${cksflb?default('')}</cdispatcherid>
            <!--���ݲ������� �ɿ��ֶ� ��Ҫ�������ݶ��գ����ŵ�����-->
            <cdptid></cdptid>
            <!--���ݹ�Ӧ������ �ɿ��ֶ� ��Ҫ�������ݶ��գ����̵�����-->
            <cproviderid></cproviderid>
            
            <!--���ݿ����֯���� �ǿ��ֶ� ��Ҫ�������ݶ��գ������֯��-->
            <pk_calbody>${kczz}</pk_calbody>
            <!--���ݲֿ����� �ǿ��ֶ� ��Ҫ�������ݶ��գ��ֿ⵵����-->
            <cwarehouseid>${ckck}</cwarehouseid>
            
            <!--�������� �ǿ��ֶ� Ĭ���ǵ�ǰ����,��ʽ:YYYY-MM-DD -->
            <dbilldate>${hinfo.vbilldate}</dbilldate>
            <!--�����Ƶ������� �ǿ��ֶ� ��Ҫ�������ݶ��գ�����Ա��-->
            <coperatorid>${hinfo.makeman.usercode}</coperatorid>
            <!--���ݵ�ǰ�Ƶ������� �ǿ��ֶ� ��Ҫ�������ݶ��գ�����Ա��-->
            <coperatoridnow>${hinfo.makeman.usercode}</coperatoridnow>
            
            <!--����״̬��־ �ǿ��ֶ�  2������״̬��3��ǩ�֣�4����� Ĭ����2-->
            <!-- ��ʱ���Ա���̬�ϴ� -->
        	<fbillflag>2</fbillflag>
            
            <!--���ݿ��Ա���� �ɿ��ֶ� ��Ҫ�������ݶ��գ���Ա������-->
            <cwhsmanagerid></cwhsmanagerid>
            <!--������������� �ɿ��ֶ� ��Ҫ�������ݶ��գ�����Ա��ע:�������Ϊǩ��״̬ǩ����Ϊ�����ֶ�-->
            <cauditorid></cauditorid>
            <!--���ݴ���������� �ɿ��ֶ� ��ʽ:YYYY-MM-DD -->
            <dauditdate></dauditdate>
            <!--�������ͱ�־����������ⵥ�ǿ��ֶ�0��ֱ�˵�����1��������-->
            <fallocflag></fallocflag>
            
			<!--�����루�����ⵥ��������⣩��˾���� ��������ⵥ�ǿ��ֶ� ��Ҫ�������ݶ��գ���˾Ŀ¼��-->
            <cothercorpid></cothercorpid>
			<!--�����루�����ⵥ��������⣩�����֯���� ��������ⵥ�ǿ��ֶ� ��Ҫ�������ݶ��գ������֯��-->
            <cothercalbodyid></cothercalbodyid>
            <!--�����루�����ⵥ��������⣩�ֿ����� �ɿ��ֶ� ��Ҫ�������ݶ��գ��ֿ⵵����-->
            <cotherwhid></cotherwhid>
            
			<!--�����루�����ⵥ������˾���� ��������ⵥ�ǿ��ֶ� ��Ҫ�������ݶ��գ���˾Ŀ¼��-->
            <coutcorpid></coutcorpid>
            <!--�����루�����ⵥ���������֯���� ��������ⵥ�ǿ��ֶ� ��Ҫ�������ݶ��գ������֯��-->
            <coutcalbodyid></coutcalbodyid>
            <!--�����루�����ⵥ�����ֿ����� �ɿ��ֶ� ��Ҫ�������ݶ��գ��ֿ⵵����-->
            <coutwhid></coutwhid>
            
            
            <!--���ݷ�����ַ �ɿ��ֶ� ��Ҫ�������ݶ��գ����̷�����ַ)-->
            <vdiliveraddress></vdiliveraddress>
            <!--���ݱ�ͷ��ע �ɿ��ֶ� -->
            <vnote>${hinfo.memo}</vnote>
            <!--���ݱ�ͷ�Զ�����1 �ɿ��ֶ� -->
            <vuserdef1>
            </vuserdef1>
            <!--���ݱ�ͷ�Զ�����2 �ɿ��ֶ� -->
            <vuserdef2>
            </vuserdef2>
            <!--���ݱ�ͷ�Զ�����3 �ɿ��ֶ� -->
            <vuserdef3>
            </vuserdef3>
            <!--���ݱ�ͷ�Զ�����4 �ɿ��ֶ� -->
            <vuserdef4>
            </vuserdef4>
            <!--���ݱ�ͷ�Զ�����5 �ɿ��ֶ� -->
            <vuserdef5>
            </vuserdef5>
            <!--���ݱ�ͷ�Զ�����6 �ɿ��ֶ� -->
            <vuserdef6>
            </vuserdef6>
            <!--���ݱ�ͷ�Զ�����7 �ɿ��ֶ� -->
            <vuserdef7>
            </vuserdef7>
            <!--���ݱ�ͷ�Զ�����8 �ɿ��ֶ� -->
            <vuserdef8>
            </vuserdef8>
            <!--���ݱ�ͷ�Զ�����9 �ɿ��ֶ� -->
            <vuserdef9>
            </vuserdef9>
            <!--���ݱ�ͷ�Զ�����10 �ɿ��ֶ� -->
            <vuserdef10>
            </vuserdef10>
        </ic_bill_head>
        <body>
        	<#list ckblist as binfo>
        		<#list binfo.bodys as bbinfo>
        			<entry>
		                <!--���ݱ�ͷ���� �ǿ��ֶΣ�����Ͷ�Ӧ�ı�ͷһ�� -->
		                <cgeneralhid>
		                </cgeneralhid>
		                <!--���ݱ������� �ɿ��ֶ� ����ϵͳ�Զ����� -->
		                <cgeneralbid>
		                </cgeneralbid>
		                <!--���ݱ��帨�������� �ɿ��ֶ� ��Ҫ�������ݶ��գ�������λ)-->
		                <castunitid>${binfo.fjl.unitcode}</castunitid>
		                <!--���ݱ����Ӧ���ݱ������� �ɿ��ֶ� -->
		                <ccorrespondbid>
		                </ccorrespondbid>
		                <!--���ݱ����Ӧ���ݺ����� �ɿ��ֶ� -->
		                <ccorrespondcode>
		                </ccorrespondcode>
		                <!--���ݱ����Ӧ���ݱ�ͷ���� �ɿ��ֶ� -->
		                <ccorrespondhid>
		                </ccorrespondhid>
		                <!--���ݱ����Ӧ�������ͱ��� �ɿ��ֶ� -->
		                <ccorrespondtype>
		                </ccorrespondtype>
		                <!--���ݱ���ɱ��������� �ɿ��ֶ� ��Ҫ�������ݶ��գ����������)-->
		                <ccostobject>
		                </ccostobject>
		                
		                <!--���ݱ������������� �ǿ��ֶ� ��Ҫ�������ݶ��գ����������)-->
		                <cinventoryid>${bbinfo.pkinvbasdoc.invcode}</cinventoryid>
		                <!--���ݱ��������� �ǿ��ֶ� ��Ҫ�������ݶ��գ������������)-->
		                <!--cinventoryid></cinventoryid-->
		                
		                <!--���ݱ�����Ŀ���� �ɿ��ֶ�  ��Ҫ�������ݶ��գ���Ŀ����)-->
		                <cprojectid>
		                </cprojectid>
		                
		                <!--���ݱ�����Ŀ�׶����� �ɿ��ֶ� ��Ҫ�������ݶ��գ���Ŀ�׶ε���)-->
		                <cprojectphaseid>
		                </cprojectphaseid>
		                <!--���ݱ�����Դ���ݱ������� �ɿ��ֶ� ע:����Դ���ݴ��ֶηǿ�-->
		                <csourcebillbid>
		                </csourcebillbid>
		                <!--���ݱ�����Դ���ݱ�ͷ���� �ɿ��ֶ� ע:����Դ���ݴ��ֶηǿ�-->
		                <csourcebillhid>
		                </csourcebillhid>
		                <!--���ݱ�����Դ�������ͱ��� �ɿ��ֶ� ע:����Դ���ݴ��ֶηǿ�-->
		                <csourcetype>
		                </csourcetype>
		                <!--���ݱ�����Դ���ݺ� �ɿ��ֶ� ע:����Դ���ݴ��ֶηǿ�-->
		                <vsourcebillcode>
		                </vsourcebillcode>
		                <!--���ݱ���ҵ������ ������ʱΪ�ǿ��ֶ� ��ʽ:YYYY-MM-DD-->
		                <dbizdate>${hinfo.vbilldate}</dbizdate>
		                <!--���ݱ���ʧЧ���� �ɿ��ֶ� -->
		                <dvalidate></dvalidate>
		                
		                
		                <!--���ݱ���Ӧ������ �ɿ��ֶ� -->
		                <nshouldinnum></nshouldinnum>
		                <!--���ݱ���������� �ɿ��ֶ� ע:�������,�������������ͬʱ��д! -->
		                <ninnum></ninnum>
		                
		                <!--���ݱ���Ӧ�ո����� �ɿ��ֶ� -->
		                <nneedinassistnum></nneedinassistnum>
		                <!--���ݱ�����⸨���� �ɿ��ֶ� -->
		                <ninassistnum></ninassistnum>
		                
		                <!-- ������ -->
		                <hsl>${binfo.hsl}</hsl>
		                
						<!--���ݱ���Ӧ���⸨���� �ɿ��ֶ� -->
		                <nshouldoutassistnum>${binfo.fnumber * bbinfo.nnumber}</nshouldoutassistnum>
		                <!--���ݱ�����⸨���� �ɿ��ֶ� -->
		                <noutassistnum>${binfo.fnumber * bbinfo.nnumber}</noutassistnum>
		                
		                <!--���ݱ���Ӧ�������� �ɿ��ֶ� -->
		                <nshouldoutnum>${binfo.nnumber * bbinfo.nnumber}</nshouldoutnum>
		                <!--���ݱ���������� �ɿ��ֶ� -->
		                <noutnum>${binfo.nnumber * bbinfo.nnumber }</noutnum>
		                
		                
		                <!--���ݱ������/���ת�������� �ɿ��ֶ� -->
		                <ntranoutastnum></ntranoutastnum>
		                <!--���ݱ������/���ת��������  �ɿ��ֶ� -->
		                <ntranoutnum></ntranoutnum>
		                
		
		                <!--���ݱ���ƻ����� �ɿ��ֶ� (����Ʒ��ⵥ����ƻ�����)-->
		                <nplannedprice></nplannedprice>
		                <!--���ݱ���ƻ���� �ɿ��ֶ� -->
		                <nplannedmny></nplannedmny>
		                <!--���ݱ��嵥�� �ɿ��ֶ� -->
		                <nprice></nprice>
		                <!--���ݱ����� �ɿ��ֶ� -->
		                <nmny></nmny>
		                <!--���ݱ������κ� �ɿ��ֶ� -->
		                <vbatchcode></vbatchcode>
		                <!--���ݱ��������κ� �ɿ��ֶ� -->
		                <vproductbatch></vproductbatch>
		                <!--���ݱ�ͷ�Զ�����1 �ɿ��ֶ� -->
		                <vuserdef1></vuserdef1>
		                <!--���ݱ�ͷ�Զ�����2 �ɿ��ֶ� -->
		                <vuserdef2></vuserdef2>
		                <!--���ݱ�ͷ�Զ�����3 �ɿ��ֶ� -->
		                <vuserdef3></vuserdef3>
		                <!--���ݱ�ͷ�Զ�����4 �ɿ��ֶ� -->
		                <vuserdef4></vuserdef4>
		                <!--���ݱ�ͷ�Զ�����5 �ɿ��ֶ� -->
		                <vuserdef5></vuserdef5>
		                <!--���ݱ�ͷ�Զ�����6 �ɿ��ֶ� -->
		                <vuserdef6></vuserdef6>
		                <!--���ݱ�ͷ�Զ�����7 �ɿ��ֶ� -->
		                <vuserdef7></vuserdef7>
		                <!--���ݱ�ͷ�Զ�����8 �ɿ��ֶ� -->
		                <vuserdef8></vuserdef8>
		                <!--���ݱ�ͷ�Զ�����9 �ɿ��ֶ� -->
		                <vuserdef9></vuserdef9>
		                <!--���ݱ�ͷ�Զ�����10 �ɿ��ֶ� -->
		                <vuserdef10></vuserdef10>

		                <!--���ݱ�ͷ�Զ�����1���� �ɿ��ֶ� -->
		                <pk_defdoc1></pk_defdoc1>
		                <!--���ݱ�ͷ�Զ�����2���� �ɿ��ֶ� -->
		                <pk_defdoc2></pk_defdoc2>
		                <!--���ݱ�ͷ�Զ�����3���� �ɿ��ֶ� -->
		                <pk_defdoc3></pk_defdoc3>
		                <!--���ݱ�ͷ�Զ�����4���� �ɿ��ֶ� -->
		                <pk_defdoc4></pk_defdoc4>
		                <!--���ݱ�ͷ�Զ�����5���� �ɿ��ֶ� -->
		                <pk_defdoc5></pk_defdoc5>
		                <!--���ݱ�ͷ�Զ�����6���� �ɿ��ֶ� -->
		                <pk_defdoc6></pk_defdoc6>
		                <!--���ݱ�ͷ�Զ�����7���� �ɿ��ֶ� -->
		                <pk_defdoc7></pk_defdoc7>
		                <!--���ݱ�ͷ�Զ�����8���� �ɿ��ֶ� -->
		                <pk_defdoc8></pk_defdoc8>
		                <!--���ݱ�ͷ�Զ�����9���� �ɿ��ֶ� -->
		                <pk_defdoc9></pk_defdoc9>
		                
		                <!--���ݱ�����������1 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������ ��װװ��)-->
		                <vfree1>${binfo.zhuangshu.docname}</vfree1>
		                <!--���ݱ�����������2 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������)-->
		                <vfree2></vfree2>
		                <!--���ݱ�����������3 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������)-->
		                <vfree3></vfree3>
		                <!--���ݱ�����������4 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������)-->
		                <vfree4></vfree4>
		                <!--���ݱ�����������5 �ɿ��ֶ� ��Ҫ�������ݶ��գ��Զ������)-->
		                <vfree5></vfree5>
		                <!--���ݱ���Դͷ���ݱ������� �ɿ��ֶ� -->
		                <cfirstbillbid></cfirstbillbid>
		                <!--���ݱ���Դͷ���ݱ�ͷ���� �ɿ��ֶ� -->
		                <cfirstbillhid></cfirstbillhid>
		                <!--���ݱ���Դͷ�������ͱ��� �ɿ��ֶ� -->
		                <cfirsttype></cfirsttype>
		                <!--���ݱ��幩Ӧ������ �ɿ��ֶ� ��Ҫ�������ݶ��գ����̵���)-->
		                <cvendorid></cvendorid>
		                <!--���ݱ���ע�� �ɿ��ֶ� -->
		                <vnotebody></vnotebody>
		                <!--���ݱ����к� �ǿ��ֶ� ϵͳ���Զ���д�к�-->
		                <crowno></crowno>
		                <!--�����־  �ɿ��ֶ� 1 ���� 0 ����(Ĭ��) -->
		                <fchecked></fchecked>
		                <!--��Ʒ��־  �ɿ��ֶ� Y ��Ʒ  Ĭ��ΪN-->
		                <flargess></flargess>
		                <!--�ݹ���־  �ɿ��ֶ� Y �ݹ� Ĭ��ΪN -->
		                <bzgflag></bzgflag>
		                <!--�ݹ�����  �ɿ��ֶ�  ��ʽ:YYYY-MM-DD-->
		                <dzgdate></dzgdate>
		                <!-- �������� �ɿ��ֶ�  -->
		                <cwp></cwp>
		                <!-- Ͷ�ϵ� �ɿ��ֶ�  -->
		                <cworksiteid></cworksiteid>
		            </entry>
        		</#list>
        	</#list>
        </body>
    </ic_bill>
</ufinterface>
