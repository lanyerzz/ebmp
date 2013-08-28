package com.app.oldPos

import com.app.bd.currtype.BdCurrtype
import com.app.exception.BusinessException
import org.apache.commons.lang.StringUtils

class CurrencyTypeService {

    static expose = ['cxf']


    public CurrencyTypeDto[] query() throws BusinessException {
        def ls=BdCurrtype.list()
        List<CurrencyTypeDto> rt=new ArrayList<CurrencyTypeDto>();
        ls?.each{


            rt.add(this.trans(it));
        }
        return rt.toArray(new CurrencyTypeDto[0]);
    }


    public CurrencyTypeDto[] queryFuzzy(String txt) throws BusinessException {
        if(StringUtils.isEmpty(txt)) return this.query();
      def ls=BdCurrtype.findAllByCodeLikeOrNameLike("%${txt}%","%${txt}%")

        List<CurrencyTypeDto> rt=new ArrayList<CurrencyTypeDto>();
       ls.each{


            rt.add(this.trans(this));
        }
        return rt.toArray(new CurrencyTypeDto[0]);

    }


    public CurrencyTypeDto queryByID(String txt) throws BusinessException {
        if(txt==null) throw new BusinessException("参数不能为空！");



            return this.trans(BdCurrtype.get(txt));

    }

    private CurrencyTypeDto trans(BdCurrtype vo){
        CurrencyTypeDto dto=new CurrencyTypeDto();
        dto.setCurrCode(vo.currtypename);
        dto.setCurrName(vo.currtypecode);
        dto.setPk_currencytype(vo.id);

        return dto;
    }
}
