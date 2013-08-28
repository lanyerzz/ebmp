package com.app.oldPos

import com.app.bd.corp.BdCorp
import com.app.bd.invbasdoc.BdInvbasdoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.exception.BusinessException
class QueryBarCodeService {
    static expose = ['cxf']

    public Bar queryBarInfo(String corpid,String barCode) {

        barCode = (barCode == null) ? null : barCode.trim();
        barCode= barCode?:'-'
        def bas=  BdInvbasdoc.findByInvbarcode(barCode)
        //
        if (!bas)
            return null;

       def man= BdInvmandoc.findByPkInvbasdocAndPkCorp(bas,BdCorp.get(corpid))

        return _queryBarByID(man);
    }


    public Bar queryBarByID(String corpid, String barCodeid)
    throws BusinessException {

        def man= BdInvmandoc.get(barCodeid)

        return _queryBarByID(man);

    }


    private Bar _queryBarByID( BdInvmandoc man)
    throws BusinessException {
      //  def man= BdInvmandoc.findByPkInvbasdocAndPkCorp(bas,BdCorp.get(corpid))
          def bas =man.pkInvbasdoc;

        Bar bar = new Bar();
        BarCodeDto h = new BarCodeDto();

        h.defaultNum=man.defaultNumber
        h.nprice=man.refSalePrice
        h.pkBarcode=man.id;
        h.vbarcode=bas.invcode;
        h.vbarname=bas.invname
        h.vcode=bas.invbarcode;

        h.pk_measdoc=bas.bdmeasdoc?.id;
        h.pk_measdoc1=bas.bdmeasdoc1?.id;
        h.pk_measdoc2=bas.bdmeasdoc2?.id;
        h.pk_measdoc3=bas.bdmeasdoc3?.id;


        h.meascode=bas.bdmeasdoc?.shortname
        h.meascode1=bas.bdmeasdoc1?.shortname
        h.meascode2=bas.bdmeasdoc2?.shortname
        h.meascode3=bas.bdmeasdoc3?.shortname



        h.measname=bas.bdmeasdoc?.measname;
        h.measname1=bas.bdmeasdoc1?.measname;
        h.measname2=bas.bdmeasdoc2?.measname;
        h.measname3=bas.bdmeasdoc3?.measname;



        h.pk_defdoc1=man.defaultPack?.id
        h.defdoccode1=man.defaultPack?.code;
        h.defdocname1=man.defaultPack?.name;
        h.defdocmemo1=man.defaultPack?.note;//备注

        bar.setBar(h)


        BarInfoDto info=new BarInfoDto();
        info.pkInvbasdoc=bas.id
        info.invname=bas.invname;
        info.invcode=bas.invcode;
        // info.pkUnit=bas.bdmeasdoc.id;
        info.pkCorp=bas.pkCorp?.id;


        info.nnumber=1;
        info.nprice=man.refSalePrice;
        info.defaultNum=man.defaultNumber;
        info.defaultZS=man.defaultPack?.hsl;


        info.pk_measdoc=bas.bdmeasdoc?.id;
        info.pk_measdoc1=bas.bdmeasdoc1?.id;
        info.pk_measdoc2=bas.bdmeasdoc2?.id;
        info.pk_measdoc3=bas.bdmeasdoc3?.id;


        info.meascode=bas.bdmeasdoc?.shortname
        info.meascode1=bas.bdmeasdoc1?.shortname
        info.meascode2=bas.bdmeasdoc2?.shortname
        info.meascode3=bas.bdmeasdoc3?.shortname



        info.measname=bas.bdmeasdoc?.measname;
        info.measname1=bas.bdmeasdoc1?.measname;
        info.measname2=bas.bdmeasdoc2?.measname;
        info.measname3=bas.bdmeasdoc3?.measname;

        info.pk_defdoc1=man.defaultPack?.id
        info.defdoccode1=man.defaultPack?.code;
        info.defdocname1=man.defaultPack?.name;
        info.defdocmemo1=man.defaultPack?.note;//备注

        def infos= new BarInfoDto[1]
        infos[0]=info
        bar.setBarInfo(infos);

        return bar;
    }

}
