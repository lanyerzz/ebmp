<?xml version="1.0" encoding='gb2312'?>
<ufinterface account="" billtype="5X" filename="${filename}" isexchange="" proc="add" receiver="${receiver}" replace="Y" sender="9999">
    <bill id="${docid}">
        <billhead>
        
            <!--���ݺ�,��󳤶�Ϊ30,����Ϊ:String-->
            <vcode>${vbillno}</vcode>
            
            <!--ҵ������,����Ϊ��,��󳤶�Ϊ20,����Ϊ:String-->
            <cbiztypeid>${busitype}</cbiztypeid>   
            <!--��������,����Ϊ��,��󳤶�Ϊ4,����Ϊ:String-->
            <cbilltype>5X</cbilltype>                   
            <!--�Ƿ��˻�,����Ϊ��,��󳤶�Ϊ1,����Ϊ:Boolean-->
            <bretractflag>N</bretractflag>
            <!--��������ID,��󳤶�Ϊ20,����Ϊ:String-->
            <cbillid></cbillid>
            
            <!--������˾,����Ϊ��,��󳤶�Ϊ4,����Ϊ:String-->
            <coutcorpid>${outcorp}</coutcorpid>
            <!--���������֯,����Ϊ��,��󳤶�Ϊ20,����Ϊ:String-->
            <coutcbid>${coutcbid}</coutcbid>
            <!--�����ֿ�ID,��󳤶�Ϊ20,����Ϊ:String-->
            <coutwhid>${hinfo.coutstordocid.storcode}</coutwhid>
            
            <!--���빫˾,����Ϊ��,��󳤶�Ϊ4,����Ϊ:String-->
            <cincorpid>${incorp}</cincorpid>
            <!--��������֯,����Ϊ��,��󳤶�Ϊ20,����Ϊ:String-->
            <cincbid>${cincbid}</cincbid>
            <!--����ֿ�ID,��󳤶�Ϊ20,����Ϊ:String-->
            <cinwhid>${hinfo.cinstordocid.storcode}</cinwhid>
            
            <!--����Ա,����Ϊ��,��󳤶�Ϊ20,����Ϊ:String-->
            <coperatorid>${hinfo.makeman.usercode}</coperatorid>
            <!--�Ƶ�����,����Ϊ��,��󳤶�Ϊ10,����Ϊ:Date-->
            <dbilldate>${hinfo.vbilldate}</dbilldate> 
            
            
            <!--1����״̬������¼���2�����У������ύ������3����δͨ������������δͨ����4δ��������������-->
            <!-- ��ʱ���Ա���̬�ϴ� -->
		  	<fstatusflag>1</fstatusflag>  	      
            
            <!--����,��󳤶�Ϊ20,����Ϊ:String-->
            <coutcurrtype>${hinfo.currencytypeid.currCode}</coutcurrtype>
            <!--�۱�����,����Ϊ��,��󳤶�Ϊ15,����Ϊ:Double-->
            <nexchangeotobrate>${exrate?string("0.########")}</nexchangeotobrate>
            
            <!--��Ŀ,��󳤶�Ϊ20,����Ϊ:String-->
            <cprojectid></cprojectid>
            <!--���������֯,��������ʱ����Ϊ��,��󳤶�Ϊ20,����Ϊ:String-->
            <ctakeoutcbid></ctakeoutcbid>
            <!--������˾,��������ʱ����Ϊ��,��󳤶�Ϊ4,����Ϊ:String-->
            <ctakeoutcorpid></ctakeoutcorpid>
            <!--���������;����,����Ϊ��,��󳤶�Ϊ2,����Ϊ:Integer 0���������1:�����-->
            <foiwastpartflag>0</foiwastpartflag>
            <!--����������;����,����Ϊ��,��󳤶�Ϊ2,����Ϊ:Integer 0���������1:�����-->
            <fotwastpartflag>0</fotwastpartflag>
            <!--��ͷ�Զ�����1,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef1></vdef1>
            <!--��ͷ�Զ�����10,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef10></vdef10>
            <!--��ͷ�Զ�����2,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef2></vdef2>
            <!--��ͷ�Զ�����3,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef3></vdef3>
            <!--��ͷ�Զ�����4,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef4></vdef4>
            <!--��ͷ�Զ�����5,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef5></vdef5>
            <!--��ͷ�Զ�����6,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef6></vdef6>
            <!--��ͷ�Զ�����7,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef7></vdef7>
            <!--��ͷ�Զ�����8,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef8></vdef8>
            <!--��ͷ�Զ�����9,��󳤶�Ϊ100,����Ϊ:String-->
            <vdef9></vdef9>
            <!--��ע,��󳤶�Ϊ120,����Ϊ:String-->
            <vnote>${hinfo.memo}</vnote>
        </billhead>
        <billbody>
        	<#list blist as binfo>
        		<#list binfo.bodys as bbinfo>
		            <entry>               
		                <!--����id,��󳤶�Ϊ20,����Ϊ:String-->
		                <cbill_bid></cbill_bid>
		                <!--��ͷid,��󳤶�Ϊ20,����Ϊ:String-->
		                <cbillid></cbillid>
		                <!--Դͷ���ݱ���ID,��󳤶�Ϊ20,����Ϊ:String-->
		                <cfirstbid></cfirstbid>
		                <!--Դͷ���ݱ�ͷID,��󳤶�Ϊ20,����Ϊ:String-->
		                <cfirstid></cfirstid>
		                <!--Դͷ�������ͱ���,��󳤶�Ϊ4,����Ϊ:String-->
		                <cfirsttypecode></cfirsttypecode>
		                <!--����ֿ�ID,��󳤶�Ϊ20,����Ϊ:String-->
		                <cincbid></cincbid>
		                <!--���빫˾ID,��󳤶�Ϊ4,����Ϊ:String-->
		                <cincorpid></cincorpid>
		                <!--���벿��ID,��󳤶�Ϊ20,����Ϊ:String-->
		                <cindeptid></cindeptid>               
		                <!--������Ա,��󳤶�Ϊ20,����Ϊ:String-->
		                <cinpsnid></cinpsnid>
		                <!--�������,��󳤶�Ϊ20,����Ϊ:String-->
		                <cinspaceid></cinspaceid>               
		                <!--����ֿ�id,��󳤶�Ϊ20,����Ϊ:String-->
		                <cinwhid></cinwhid>
		                <!--���������֯id,��󳤶�Ϊ20,����Ϊ:String-->
		                <coutcbid></coutcbid>
		                <!--������˾id,��󳤶�Ϊ4,����Ϊ:String-->
		                <coutcorpid></coutcorpid>
		                <!--��������id,��󳤶�Ϊ20,����Ϊ:String-->
		                <coutdeptid></coutdeptid>
		                <!--�������������,����Ϊ��,��󳤶�Ϊ20,����Ϊ:String-->
		                <coutinvid>0603000002</coutinvid>
		                <!--������Ա,��󳤶�Ϊ20,����Ϊ:String-->
		                <coutpsnid></coutpsnid>
		                <!--������λ,��󳤶�Ϊ20,����Ϊ:String-->
		                <coutspaceid></coutspaceid>
		                <!--�����ֿ�id,��󳤶�Ϊ20,����Ϊ:String-->
		                <coutwhid></coutwhid>
		                <!--��Ŀ,��󳤶�Ϊ20,����Ϊ:String-->
		                <cprojectid></cprojectid>
		                <!--��Ŀ�׶�,��󳤶�Ϊ20,����Ϊ:String-->
		                <cprojectphase></cprojectphase>
		                <!--creceieveid,��󳤶�Ϊ20,����Ϊ:String-->
		                <creceieveid></creceieveid>
		                <!--������ϵ�ӱ�,��󳤶�Ϊ20,����Ϊ:String-->
		                <crelation_bid></crelation_bid>
		                <!--������ϵ����,��󳤶�Ϊ20,����Ϊ:String-->
		                <crelationid></crelationid>                            
		                <!--���������֯,��󳤶�Ϊ20,����Ϊ:String-->
		                <ctakeoutcbid></ctakeoutcbid>
		                <!--������˾,��󳤶�Ϊ4,����Ϊ:String-->
		                <ctakeoutcorpid></ctakeoutcorpid>
		                <!--��������,��󳤶�Ϊ20,����Ϊ:String-->
		                <ctakeoutdeptid></ctakeoutdeptid>
		                <!--������˾���������,��󳤶�Ϊ20,����Ϊ:String-->
		                <ctakeoutinvid></ctakeoutinvid>
		                <!--������Ա,��󳤶�Ϊ20,����Ϊ:String-->
		                <ctakeoutpsnid></ctakeoutpsnid>
		                <!--������λ,��󳤶�Ϊ20,����Ϊ:String-->
		                <ctakeoutspaceid></ctakeoutspaceid>
		                <!--�����ֿ�,��󳤶�Ϊ20,����Ϊ:String-->
		                <ctakeoutwhid></ctakeoutwhid>
		                <!--��������������ϵ�ӱ�,��󳤶�Ϊ20,����Ϊ:String-->
		                <ctakerelation_bid></ctakerelation_bid>
		                <!--��������������ϵ����,��󳤶�Ϊ20,����Ϊ:String-->
		                <ctakerelationid></ctakerelationid>
		                <!--�ƻ���������,��󳤶�Ϊ10,����Ϊ:Date-->
		                <dplanarrivedate></dplanarrivedate>
		                <!--�ƻ���������,��󳤶�Ϊ10,����Ϊ:Date-->
		                <dplanoutdate></dplanoutdate>
		                <!--��������,��󳤶�Ϊ10,����Ϊ:Date-->
		                <dproducedate></dproducedate>
		                <!--ʧЧ����,��󳤶�Ϊ10,����Ϊ:Date-->
		                <dvalidate></dvalidate>              
		                <!--��Ʒ��־,��󳤶�Ϊ1,����Ϊ:Boolean-->
		                <flargess>N</flargess>
		                <!--�Ӽ���,��󳤶�Ϊ9,����Ϊ:Double-->
		                <naddpricerate>0.00</naddpricerate>
		                
		                <!--������,��󳤶�Ϊ20,����Ϊ:Double-->
		                <nassistnum>${binfo.fnumber * bbinfo.nnumber}</nassistnum>
		                <!--����,����Ϊ��,��󳤶�Ϊ20,����Ϊ:Double-->
		                <nnum>${binfo.nnumber * bbinfo.nnumber}</nnum>
		                
		                <!--������,��󳤶�Ϊ20,����Ϊ:Double-->
		                <nchangerate>${binfo.hsl}</nchangerate>
		                
		                <!--���,��󳤶�Ϊ20,����Ϊ:Double-->
		                <nmny>${binfo.nmoney}</nmny>
		                <!--�Ǻ�˰���,��󳤶�Ϊ20,����Ϊ:Double-->
		                <nnotaxmny>${binfo.nmoney}</nnotaxmny>
		                
		                <!--����,��󳤶�Ϊ20,����Ϊ:Double-->
		                <nprice>${binfo.nprice}</nprice>
		                <!--�Ǻ�˰����,��󳤶�Ϊ20,����Ϊ:Double-->
		                <nnotaxprice>${binfo.nprice}</nnotaxprice>
		                
		                
		                <!--˰��,��󳤶�Ϊ9,����Ϊ:Double-->
		                <ntaxrate>0.0000000</ntaxrate>
		                <!--�����ص�,��󳤶�Ϊ20,����Ϊ:String-->
		                <pk_arrivearea></pk_arrivearea>
		                <!--���䷽ʽ,��󳤶�Ϊ20,����Ϊ:String-->
		                <pk_sendtype></pk_sendtype>
		                <!--���κ�,��󳤶�Ϊ30,����Ϊ:String-->
		                <vbatch></vbatch>
		                <!--�����Զ�����1,��󳤶�Ϊ100,����Ϊ:String-->
		                <vbdef1></vbdef1>
		                <!--�����Զ�����2,��󳤶�Ϊ100,����Ϊ:String-->
		                <vbdef2></vbdef2>
		                <!--�����Զ�����3,��󳤶�Ϊ100,����Ϊ:String-->
		                <vbdef3></vbdef3>
		                <!--�����Զ�����4,��󳤶�Ϊ100,����Ϊ:String-->
		                <vbdef4></vbdef4>
		                <!--�����Զ�����5,��󳤶�Ϊ100,����Ϊ:String-->
		                <vbdef5></vbdef5>
		                <!--�����Զ�����6,��󳤶�Ϊ100,����Ϊ:String-->
		                <vbdef6></vbdef6>
		                <!--���ݺ�,��󳤶�Ϊ30,����Ϊ:String-->
		                <vcode></vcode>
		                <!--Դͷ���ݺ�,��󳤶�Ϊ30,����Ϊ:String-->
		                <vfirstcode></vfirstcode>
		                
		                <!--������1,��󳤶�Ϊ100,����Ϊ:String-->
		                <vfree1>${binfo.zhuangshu.docname}</vfree1>
		                
		                <!--������2,��󳤶�Ϊ100,����Ϊ:String-->
		                <vfree2></vfree2>
		                <!--������3,��󳤶�Ϊ100,����Ϊ:String-->
		                <vfree3></vfree3>
		                <!--������4,��󳤶�Ϊ100,����Ϊ:String-->
		                <vfree4></vfree4>
		                <!--������5,��󳤶�Ϊ100,����Ϊ:String-->
		                <vfree5></vfree5>
		                <!--�ջ���ַ,��󳤶�Ϊ256,����Ϊ:String-->
		                <vreceiveaddress></vreceiveaddress>
		            </entry>
        		</#list>
        	</#list>
        </billbody>
    </bill>
</ufinterface>
