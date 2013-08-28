<#setting number_format="0.########">
<?xml version="1.0" encoding="gb2312"?>
<ufinterface title="BB">
	<test>
		<#assign a=10.234>
		<#if value == 0 >
			<#assign a=(a*1.5)?string("0.##")?number />
		</#if>
		${a}
		<#assign n1=4.93>
		<#assign n2=2.84013>
		<#assign n3=(n1*n2)?string("0.##")?number>
		<#assign n4=n3*2>
		${n3}
		${n1}
		${n4}
		
		<#assign discount=false>
		<#if num=0>
			<#assign discount=true>
		</#if>
		<#if discount>
			${discount?string}
		</#if>
		${(n1*n2)?string("0.####")}
		
	</test>
</ufinterface>
