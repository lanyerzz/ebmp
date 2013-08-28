package com.app.oldPos

import com.app.bd.corp.BdCorp

import javax.jws.WebMethod
import javax.jws.WebResult



class QueryCorpService {



    public CorpDTO[] queryCorp(){

       def ls= BdCorp.list()

        CorpDTO[] dto=new CorpDTO[ls.size()];

        ls.eachWithIndex {it,i->
            dto[i]=new CorpDTO()
            dto[i].cfatherid=it.fathercorp
            dto[i].pkCorp=it.id
            dto[i].unitcode=it.unitCode
            dto[i].unitname=it.unitName

        }

        return  dto
    }

//    @WebResult(name = 'corpDTO')
//    @WebMethod
//    public CorpDTO[] queryFuzzy(String str){
//        def ls= BdCorp.findAllByUnitCodeLikeOrUnitNameLike("%${str}%","%${str}%")
//        CorpDTO[] dto=new CorpDTO[0];
//        ls.eachWithIndex {it,i->
//            dto[i].cfatherid=it.fathercorp
//            dto[i].pkCorp=it.id
//            dto[i].unitcode=it.unitCode
//            dto[i].unitname=it.unitName
//
//        }
//        return  dto
//    }
//    @WebResult(name = 'corpDTO')
//    @WebMethod
//    public CorpDTO queryByID(String id) {
//        def corp= BdCorp.get(id)
//        CorpDTO dto=new CorpDTO();
//
//            dto.cfatherid=corp.fathercorp
//            dto.pkCorp=corp.id
//            dto.unitcode=corp.unitCode
//            dto.unitname=corp.unitName
//
//
//        return  dto
//    }
//    @WebResult(name = 'corpTogetherDTO')
//    @WebMethod
//    public CorpTogetherDTO[] queryAllCorp() {
//        def ls= BdCorp.list()
//        CorpTogetherDTO[] dto=new CorpTogetherDTO[0];
//        ls.eachWithIndex {it,i->
//            CorpDTO corp=new CorpDTO();
//            corp.cfatherid=it.fathercorp
//            corp.pkCorp=it.id
//            corp.unitcode=it.unitCode
//            corp.unitname=it.unitName
//            dto[i].header=corp
//        }
//        return  dto
//    }
}
