package com.app.oldPos

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.currtype.BdCurrtype
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.pack.BdPack
import com.app.bd.salestru.BdSalestru
import com.app.bd.stordoc.BdStordoc
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.so.order.SoSale
import com.app.so.order.SoSaleOrder
import com.app.util.CriteriaHelper
import grails.converters.JSON



class PosSaleBillService {
    def soSaleService


    public SaleBillResultDto insert_REQUIRED(SaleBillResultDto dto)			throws BusinessException {
        //dto.getHeader().setVbilldate(myapp.core.date.Calendar.getDate());

        def rs= translation(dto)

        SoSale h=rs[0]

        if(!h.validate()){
            log.error(h.errors)
            throw new BusinessException('表头字段填写不完整')
        }

        h?.bodys?.each {
            if(!it.validate()){
                log.error(it.errors)
                throw new BusinessException('表体字段填写不完整')
            }
        }

       def data=  soSaleService.save(h,rs[1]);

        SaleBillResultDto rt= new SaleBillResultDto();
        SaleHeaderDto hdto=new SaleHeaderDto();
        println '-=-=-=-='+h.id
        hdto.setCsaleid(h.id);
        rt.setHeader(hdto);
        return rt;
    }


    public void delSaleOrderBillByID_REQUIRED(String id) throws BusinessException {
       // SoSale order= this.getHibernateTemplate().load(SoSaleorder.class, id);
       soSaleService.delete(id)
    }



    public SaleBillResultDto updateSaleBillBs(SaleBillResultDto dto)
    throws BusinessException {

        if (dto.getHeader().getCsaleid() == null)
            throw new BusinessException("订单 csaleid 字段不能为空！");



            def vo= translation(dto);


        // 删除订单可执行量表
        // this.getHibernateTemplate().deleteAll(sale.getExecuteOrder());

        // this.getSession().s
        soSaleService.save(vo[0],vo[1])

        SaleBillResultDto rt = new SaleBillResultDto();
        SaleHeaderDto hdto = new SaleHeaderDto();
        hdto.setCsaleid(dto.header.csaleid);
        rt.setHeader(hdto);
        return rt;
    }


    public SaleBillResultDto queryByID(String id) throws BusinessException {

        SoSale sale = SoSale.get(id)
        SaleBillResultDto rtDto = translation(sale);
        return rtDto;
    }


    public SaleBillResultDto[] query(QuerySaleBillDto queryDto)
    throws BusinessException {
        if (queryDto == null)
            throw new BusinessException("查询条件不能为空！");


      def js=[operator:'and',criterias:[]]

            if(queryDto.billno){
               js.criterias<<['operator':'equals','fieldName':'pkCorp.id','value':queryDto.corpID]
            }
            if(queryDto.startDate){
                js.criterias<<['operator':'greaterOrEqual','fieldName':'billdate','value':Date.parse('yyyy-MM-dd',queryDto.getStartDate())]

            }
            if(queryDto.endDate){
                js.criterias<<['operator':'lessOrEqual','fieldName':'billdate','value':Date.parse('yyyy-MM-dd',queryDto.getEndDate())]

            }
            if(queryDto.custID){
                js.criterias<<['operator':'equals','fieldName':'customer.id','value':queryDto.custID]

            }


        def ls
        try{
         ls=new CriteriaHelper (SoSale.createCriteria(),js).list()
        }catch (Exception e){
            e.printStackTrace()
        }
        SaleBillResultDto[] rtDto=new SaleBillResultDto[ls.size()];

        ls.eachWithIndex {it,index->
            SoSale head=it;
            rtDto[index] = new SaleBillResultDto();

            SaleHeaderDto hdto = new SaleHeaderDto();
            hdto.vbillno=head.billno
            hdto.vbilldate=head.billdate.format('yyyy-MM-dd')
            hdto.csaleid=head.id
            hdto.nrebatemoney=head.nratemnny
            hdto.nmoney=head.nheadsummny
            hdto.nrecmoney=head.nrecmnny
            hdto.setCcustomer(head.customer.id);
            hdto.setCustcode(head.customer.pkCubasdoc.custcode);
            hdto.setCustname(head.customer.pkCubasdoc.custname);


            hdto.setCurrencytypeid(head.currencytype.id);
            hdto.setCurrencytypecode(head.currencytype.code);
            hdto.setCurrencytypename(head.currencytype.name);

            rtDto[index].setHeader(hdto);
        }


        return rtDto;
    }








    private  translation(SaleBillResultDto dto) throws BusinessException {
        if (dto == null)
            throw new BusinessException("增加销售订单参数不能为空！");
        if (dto.getHeader() == null)
            throw new BusinessException("订单头信息不能为空！");

        SoSale h = SoSale.findOrCreateById(dto.header.csaleid?:'-');


        h.bdCorp=BdCorp.get(dto.getHeader().getPkCorp())
        h.currencytype=BdCurrtype.get(dto.getHeader().getCurrencytypeid())

        h.maker=SmUser.get(dto.getHeader().makeman);

        h.billdate= Date.parse( "yyyy-MM-dd", dto.getHeader().getVbilldate() )
//        h.balatype=

        h.customer=BdCumandoc.get(dto.header.ccustomer)
//        h.bdSalestru=dto.header.s
        h.bdSalestru=BdSalestru.find {}

        h.billTypeCode='S01'
        h.billtype=PubBilltype.findByBilltypecode('S01')

        h.businessType=PubBusinessType.findByCode('S01')

//        h.(new BDStordoc(dto.getHeader().getPk_stordoc()));//仓库在表体 TODO
        if (dto.getHeader().getCcustomer() == null
                || dto.getHeader().getCcustomer().trim().length() == 0)
            throw new BusinessException("客户不能为空！");
        h.customer=BdCumandoc.get(dto.getHeader().getCcustomer());

        h.stordoc=BdStordoc.get(dto.getHeader().getPk_stordoc())


//        h.balatype=dto
//
//
//
        if (h.billdate == null)
            throw new BusinessException("单据日期不能为空！");



      //  BigDecimal money = new BigDecimal(0);// 总金额
        SaleBodyDto[] bodyDtos = dto.getBodys();

        def mpKey=[:]
        h.bodys?.each {
            mpKey.put(it.id)
        }

        for (int x = 0; x < bodyDtos.length; x++) {
            SoSaleOrder saleOrder =  SoSaleOrder.findOrCreateById(bodyDtos[x].csaleorderid?:'-')// 实力新的表体
            mpKey.remove(saleOrder.id)
            if (bodyDtos[x].getCbarcodeid() == null
                    || bodyDtos[x].getCbarcodeid().trim().length() == 0)
                throw new BusinessException("表体货号不能为空!");
            saleOrder.invmandoc=BdInvmandoc.get( bodyDtos[x].cbarcodeid)


            //lxx  07 开始的存货 不判断 2012-07-04

            saleOrder.nnumber=bodyDtos[x].nnumber?:0
            saleOrder.noriginalcurtaxnetprice=bodyDtos[x].nprice?:0


            if(saleOrder.invmandoc.pkInvbasdoc.invcode.startsWith("07")){
                if (saleOrder.nnumber == 0)
                    throw new BusinessException("表体数量不能为空!");
                if (saleOrder.noriginalcurtaxnetprice == 0)
                    throw new BusinessException("表体价格不能为空!");
            }
            saleOrder.noriginalcurmny=saleOrder.noriginalcurtaxnetprice*saleOrder.nnumber
            saleOrder.fsl= bodyDtos[x].fnumber
            // 由客户端计算

//            // 主计量单位不可以为空

            if(bodyDtos[x].getJl())
                saleOrder.fjl=BdMeasdoc.get( bodyDtos[x].getJl())
            saleOrder.stordoc=BdStordoc.get(bodyDtos[x].pk_stordoc)

            if (bodyDtos[x].getFreeItem1() != null
                    && bodyDtos[x].getFreeItem1().trim().length() > 0) {
                saleOrder.bzm=BdPack.get(bodyDtos[x].getFreeItem1())
            }
            if (bodyDtos[x].getPk_stordoc() != null
                    && bodyDtos[x].getPk_stordoc().trim().length() != 0) {
                saleOrder.stordoc=BdStordoc.get(bodyDtos[x]
                        .getPk_stordoc())
            }
//
      //      money = money.add(saleOrder.noriginalcurmny);
//
//            // 具体明细表
//



//
            h.addToBodys(saleOrder);
        }

        h.nheadsummny=dto.header.nmoney;
        h.nratemnny=dto.header.nrebatemoney;//折扣金额
        h.nrecmnny=dto.header.nrecmoney

        return [h,mpKey];
    }

    private SaleBillResultDto translation(SoSale sale) throws BusinessException {
        SaleBillResultDto rtDto = new SaleBillResultDto();
        SaleHeaderDto hDto = new SaleHeaderDto();
        hDto.csaleid=sale.id
        hDto.vbilldate=sale.billdate.format('yyyy-MM-dd')
        hDto.setCcustomer(sale.customer.id);
        hDto.setCustcode(sale.customer.pkCubasdoc.custcode);
        hDto.setCustname(sale.customer.pkCubasdoc.custname);
        hDto.setCurrencytypeid(sale.currencytype?.id);
        hDto.setCurrencytypecode(sale.currencytype?.currtypecode);
        hDto.setCurrencytypename(sale.currencytype?.currtypename);
        hDto.setPkCorp(sale.bdCorp.id);
        hDto.setUnitCode(sale.bdCorp.unitCode);
        hDto.setUnitName(sale.bdCorp.unitName);
        hDto.setMakeman(sale.maker?.id);
        hDto.setMakemancode(sale.maker?.username);
        hDto.setMakemanname(sale.maker?.userRealName);

        hDto.pk_stordoc=sale.stordoc?.id
        hDto.stordoccode=sale.stordoc?.code
        hDto.stordocname=sale.stordoc?.name

//        hDto.setPk_stordoc(sale.);
//        hDto.setStordoccode(sale.getPk_stordoc().getStorcode());
//        hDto.setStordocname(sale.getPk_stordoc().getStorname());
        //hDto.setUpstate(sale.upstate);


            hDto.setCheckdate(sale.checkDate?.format('yyyy-MM-dd'));
//            hDto.setChecktime(sale.che());
            hDto.setCheckman(sale.checker?.id);
            hDto.setCheckmancode(sale.checker?.username);
            hDto.setCheckmanname(sale.checker?.userRealName);


        rtDto.setHeader(hDto);


        SaleBodyDto[]  bodyDtos = new SaleBodyDto[sale.bodys?.size()];
        sale.bodys?.eachWithIndex {it,index->
            bodyDtos[index] = new SaleBodyDto();



            bodyDtos[index].setCbarcodeid(it.invmandoc.id);
            // System.out.println();
            bodyDtos[index].setCbarcode(it.invmandoc.pkInvbasdoc.invcode);
            bodyDtos[index].setCbar_vcode(it.invmandoc.pkInvbasdoc.invbarcode);
            bodyDtos[index].setCbar_name(it.invmandoc.pkInvbasdoc.invname);
            bodyDtos[index].setDefaultNum(it.invmandoc.defaultNumber);


                bodyDtos[index].setPk_stordoc(it.stordoc?.id);
                bodyDtos[index].setStordoccode(it.stordoc?.code);
                bodyDtos[index].setStordocname(it.stordoc?.name);


            bodyDtos[index]
                    .setJl(it.invmandoc.pkInvbasdoc.bdmeasdoc.id);
            bodyDtos[index].setFjlcode(it.invmandoc.pkInvbasdoc.bdmeasdoc.shortname);
            bodyDtos[index].setJlname(it.invmandoc.pkInvbasdoc.bdmeasdoc.measname);


                bodyDtos[index].setFjl(it.fjl?.id);
                bodyDtos[index].setFjlcode(it.fjl?.shortname);
                bodyDtos[index].setFjlname(it.fjl?.measname);





                bodyDtos[index].setFreeItem1(it.bzm?.id);
                bodyDtos[index].setFreeItem1code(it.bzm?.code);
                bodyDtos[index].setFreeItem1name(it.bzm?.name)


            bodyDtos[index].nnumber=it.nnumber
            bodyDtos[index].fnumber=it.fsl



            SaleExecuteDto exdto = new SaleExecuteDto();

            exdto.nnumber=it.nnumber

            exdto.setCinvbasdoc(it.invmandoc.id);
            exdto.setCinvcode(it.invmandoc.pkInvbasdoc.invcode);
            exdto.setCinvname(it.invmandoc.pkInvbasdoc.invname);
            SaleExecuteDto[] edto=  new SaleExecuteDto[1]
            edto[0]=exdto
            bodyDtos[index].setExecDto(edto);

        }






        rtDto.setBodys(bodyDtos);
        return rtDto;
    }



}
