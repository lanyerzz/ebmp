package com.app.oldPos

import com.app.bd.areacl.BdAreacl
import com.app.bd.cubasdoc.BdCubasdoc
import com.app.bd.cumandoc.BdCumandoc
import com.app.exception.BusinessException

class QueryCustomerService {
    static expose = ['cxf']


    public CustomerDto[] queryFuzzy(String corpID, String v, Boolean custFlag)
    throws BusinessException {



        if (custFlag == null)
            throw new BusinessException("请指定查询客户或供应商!");
        if (v == null || "".equals(v))
            return this.query(corpID, custFlag);
      //  String falg = custFlag ? "0" : "1";
        def custLs = BdCumandoc.createCriteria().buildCriteria {
            eq('pkCorp.id',corpId)
            createAlias('pkCubasdoc','pkCubasdoc')
            or{
                like('pkCubasdoc.custcode',v)
                like('pkCubasdoc.custname',v)
                like('pkCubasdoc.mnecode',v)
            }
            order('pkCubasdoc.custname')
        }.list();


        List<CustomerDto> custDtos = new ArrayList<CustomerDto>();
        custLs.each {

            custDtos.add(this.trans(it));
        }


        return custDtos.toArray(new CustomerDto[0]);
    }


    public CustomerDto[] query(String corpID, Boolean custFlag)
    throws BusinessException {
        if (custFlag == null)
            throw new BusinessException("请指定查询客户或供应商!");
        String falg = custFlag ? "0" : "1";
        def custLs = BdCumandoc.createCriteria().buildCriteria {
            eq('pkCorp.id',corpID)
            createAlias('pkCubasdoc','pkCubasdoc')
            order('pkCubasdoc.custname')
        }.list()

        List<CustomerDto> custDtos = new ArrayList<CustomerDto>();
        custLs?.each {

            custDtos.add(this.trans(it));
        }

        return custDtos.toArray(new CustomerDto[0]);
    }

    private CustomerDto trans(BdCumandoc m) {


        CustomerDto dto = new CustomerDto();
        BdCubasdoc cust = m.pkCubasdoc;
        BdAreacl cls = cust.pkAreacl;

        dto.pkCustomerM=m.id
        dto.pkCustorm=cust.id

        dto.setClsCode(cls.areaclcode);

        dto.setClsName(cls.areaclname);
        dto.setPk_custcls(cls.id);
        dto.setCustcode(cust.getCustcode());
        dto.setCustname(cust.getCustname());
        dto.setPkCustorm(cust.id);
        dto.setMnecode(cust.mnecode);	//助记码
        dto.setPkCustomerM(m.id);

            //System.out.println("-----------curency:"+m.getPk_currtype1().getCurrName());
            dto.setCurrencyType1(m.defaultCurrtype?.id);
            dto.setCurrencyCode1(m.defaultCurrtype?.currtypecode);
            dto.setCurrencyName1(m.defaultCurrtype?.currtypename);

        return dto;
    }

}
