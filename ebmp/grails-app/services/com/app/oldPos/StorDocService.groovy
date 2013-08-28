package com.app.oldPos

import com.app.bd.stordoc.BdStordoc
import com.app.exception.BusinessException

class StorDocService {



    public BDStorDocDto[] queryByCode(String code, String corpid)
    throws BusinessException {


       def ls=null
        if(code!=null && code.trim().length()!=0)
            ls= BdStordoc.findAll {
                eq('code',code)
                eq('bdCorp.id',corpid)
            } //this.getHibernateTemplate().iterate("from BDStordoc c where c.storcode=? and c.pk_corp.pkCorp=?",code,corpid);
        else
            ls= BdStordoc.findAll {
                eq('bdCorp.id',corpid)
            } //this.getHibernateTemplate().iterate("from BDStordoc c where  c.pk_corp.pkCorp=?", new Object[]{corpid});

        List<BDStorDocDto> rt=new ArrayList<BDStorDocDto>();
       ls?.each{

            BDStorDocDto dto=	 new BDStorDocDto();
            dto.pk_stordoc=it.id
           dto.storcode=it.code
           dto.storname=it.name
            dto.pk_corp=it.bdCorp.id
           dto.corpname=it.bdCorp.unitName
           dto.corpcode=it.bdCorp.unitCode
            rt.add(dto);
        }


        return rt.toArray(new BDStorDocDto[0]);
    }


    public BDStorDocDto[] queryLikeName(String name, String corpid)
    throws BusinessException {


        def ls= BdStordoc.findAll {
            like('name',"%${name}%")
            eq('bdCorp.id',corpid)
        } //this.getHibernateTemplate().iterate("from BDStordoc c where c.storname like ? and c.pk_corp.pkCorp=?", new Object[]{"%"+name+"%",corpid});
        List<BDStorDocDto> rt=new ArrayList<BDStorDocDto>();
       ls?.each{

           BDStorDocDto dto=	 new BDStorDocDto();
           dto.pk_stordoc=it.id
           dto.storcode=it.code
           dto.storname=it.name
           dto.pk_corp=it.bdCorp.id
           dto.corpname=it.bdCorp.unitName
           dto.corpcode=it.bdCorp.unitCode
           rt.add(dto);
        }


        return rt.toArray(new BDStorDocDto[0]);
    }


    public BDStorDocDto[] queryFuzzy(String w, String corpid)
    throws BusinessException {

        println '-=-=-=-=-=--=--='
        println w
        println corpid

        if(w==null || w.trim().length()==0)
        {
            return this.query(corpid);
        }
       def ls=BdStordoc.findAll {
          or{
              like('code',"%${w}%")
              like('name',"%${w}%")
          }
           eq('bdCorp.id',corpid)
       }  //=  this.getHibernateTemplate().iterate("from BDStordoc c where  ( c.storcode like ? or c.storname like ? ) and c.pk_corp.pkCorp=?", new Object[]{"%"+w+"%","%"+w+"%",corpid});
        List<BDStorDocDto> rt=new ArrayList<BDStorDocDto>();
       ls.each{
           BDStorDocDto dto=	 new BDStorDocDto();
           dto.pk_stordoc=it.id
           dto.storcode=it.code
           dto.storname=it.name
           dto.pk_corp=it.bdCorp.id
           dto.corpname=it.bdCorp.unitName
           dto.corpcode=it.bdCorp.unitCode
           rt.add(dto);
        }


        return rt.toArray(new BDStorDocDto[0]);
    }


    public BDStorDocDto[] query(String corpID) throws BusinessException {
       def ls=  null;
        if(corpID==null)
            throw null;
             //this.getHibernateTemplate().iterate("from BDStordoc c ", new Object[]{corpID});
        else
            ls= BdStordoc.findAll {
            eq('bdCorp.id',corpID)
        }   //this.getHibernateTemplate().iterate("from BDStordoc c where   c.pk_corp.pkCorp=?", new Object[]{corpID});
        List<BDStorDocDto> rt=new ArrayList<BDStorDocDto>();
       ls.each{
           BDStorDocDto dto=	 new BDStorDocDto();
           dto.pk_stordoc=it.id
           dto.storcode=it.code
           dto.storname=it.name
           dto.pk_corp=it.bdCorp.id
           dto.corpname=it.bdCorp.unitName
           dto.corpcode=it.bdCorp.unitCode
           rt.add(dto);
        }

        println rt
        return rt.toArray(new BDStorDocDto[0]);
    }


    public BDStorDocDto queryByID(String corpid, String id)
    throws BusinessException {
       def stor=  null;

        stor= BdStordoc.get(id) //this.getHibernateTemplate().iterate("from BDStordoc c where   c.pk_corp.pkCorp=? and c.pk_stordoc=?", new Object[]{corpid,id});
        List<BDStorDocDto> rt=new ArrayList<BDStorDocDto>();

        BDStorDocDto dto=	 new BDStorDocDto();
        dto.pk_stordoc=stor.id
        dto.storcode=stor.code
        dto.storname=stor.name
        dto.pk_corp=stor.bdCorp.id
        dto.corpname=stor.bdCorp.unitName
        dto.corpcode=stor.bdCorp.unitCode
        rt.add(dto);


        return rt.toArray(new BDStorDocDto[0]);
    }





//    @Override
//    public BDStorDocTogetherDto queryStorByID(String id) throws BusinessException {
//        BDStorDocTogetherDto togetherDto = new BDStorDocTogetherDto();
//        Iterator<BDStordoc> ls=  null;
//
//        ls=this.getHibernateTemplate().iterate("from BDStordoc c where c.pk_stordoc=?", new Object[]{id});
//        List<BDStorDocDto> rt=new ArrayList<BDStorDocDto>();
//        while(ls.hasNext()){
//            BDStordoc doc=	ls.next();
//            BDStorDocDto dto=	 new BDStorDocDto();
//            doc.copyObject(dto);
//            trans(doc,dto);
//            togetherDto.setHeader(dto);
//            return togetherDto;
//        }
//        return null;
//    }
//
//    @Override
//    public BDStorDocTogetherDto[] queryStorInfo(QueryBDStorDocDto dto) throws BusinessException {
//
//        Iterator<BDStordoc> ls=  null;
//        List<Object> list = new ArrayList<Object>();
//        StringBuffer hsql = new StringBuffer("from BDStordoc c where 1=1");
//        //单据号
//        String sbillNo = dto.getPk_stordoc();
//        if(!StringUtils.isEmpty(sbillNo)){
//            hsql.append(" and c.pk_stordoc=? ");
//            list.add(sbillNo);
//        }
//        //公司PK
//        hsql.append(" and c.pk_corp.pkCorp=?");
//        list.add(dto.getPk_corp());
//        ls=this.getHibernateTemplate().iterate(hsql.toString(), list.toArray(new Object[0]));
//        List<BDStorDocTogetherDto> rt=new ArrayList<BDStorDocTogetherDto>();
//        while(ls.hasNext()){
//            BDStorDocTogetherDto togetherDto = new BDStorDocTogetherDto();
//            BDStordoc doc=	ls.next();
//            BDStorDocDto storDocdto=	 new BDStorDocDto();
//            doc.copyObject(storDocdto);
//            trans(doc,storDocdto);
//            togetherDto.setHeader(storDocdto);
//            rt.add(togetherDto);
//        }
//        return rt.toArray(new BDStorDocTogetherDto[0]);
//    }




}
