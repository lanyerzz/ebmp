package com.app.oldPos

import com.app.bd.measdoc.BdMeasdoc
import com.app.exception.BusinessException
import org.apache.commons.lang.StringUtils

class BdUnitService {

    /**
     * 根据公司PK查询计量单位数据
     * @param corp 公司PK
     * @return
     * @throws BusinessException
     */
    @Override
    public BdUnitDto[] queryUnit(String corp) throws BusinessException {
        def ls=BdMeasdoc.list()
        //用于临时存放计量单位数据的集合类
        List<BdUnitDto> rt=new ArrayList<BdUnitDto>();
        //把查询到的计量单位数据放入到用于传输计量单位数据的载体中
      ls.each{

            BdUnitDto dto=new BdUnitDto();
            //计量单位VO翻译到计量单位DTO中

            dto.unitcode=it.shortname
            dto.unitname=it.measname
            dto.pk_unit=it.id
            rt.add(dto);
        }
        return rt.toArray(new BdUnitDto[0]);
    }

    /**
     * 根据公司PK,计量单位编码或者名称查询计量单位数据
     * @param corp 公司PK
     * @param text 计量单位编码或者名称
     * @return
     * @throws BusinessException
     */
    @Override
    public BdUnitDto[] queryFuzzy(String corp, String txt)
    throws BusinessException {

        //如果计量单位编码或者计量单位名称为空了就结束操作
        if(StringUtils.isEmpty(StringUtils.trimToEmpty(txt))) return this.queryUnit(corp);
        //根据公司PK,计量单位编码或者名称查询计量单位数据
       def ls=null;

        ls=BdMeasdoc.findAll {
            or{
                like('shortname',"%${txt}%")
                like('measname',"%${txt}%")
            }
        }
        List<BdUnitDto> rt=new ArrayList<BdUnitDto>();
        ls.each{

            BdUnitDto dto=new BdUnitDto();
            //计量单位VO翻译到计量单位DTO中

            dto.unitcode=it.shortname
            dto.unitname=it.measname
            dto.pk_unit=it.id
            //放入到集合类中
            rt.add(dto);
        }
        return rt.toArray(new BdUnitDto[0]);
    }

    /**
     * 根据公司PK,计量单位主表PK查询计量单位数据
     * @param corp 公司PK
     * @param id 计量单位主表PK
     * @return
     * @throws BusinessException
     */
    @Override
    public BdUnitDto queryByID(String corp, String id) throws BusinessException {

       BdMeasdoc meas=	BdMeasdoc.get(id)

        BdUnitDto dto=new BdUnitDto();
        //计量单位VO翻译到计量单位DTO中
        dto.unitcode=meas.shortname
        dto.unitname=meas.measname
        dto.pk_unit=meas.id

        return dto;
    }
}
