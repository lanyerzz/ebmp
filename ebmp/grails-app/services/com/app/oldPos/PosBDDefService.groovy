package com.app.oldPos

import com.app.bd.pack.BdPack
import com.app.exception.BusinessException

class PosBDDefService {



    private BdDefDocDto[] query(String listCode) throws BusinessException {
        List<BdDefDocDto> rt = new ArrayList<BdDefDocDto>();



        def ls = BdPack.listOrderByCode()
       ls.each{
            rt.add(this.trans(it));
        }
        return rt.toArray(new BdDefDocDto[0]);
    }

    private BdDefDocDto trans(BdPack doc) throws BusinessException {



        BdDefDocDto dto = new BdDefDocDto();

        dto.doccode=doc.code
        dto.docname=doc.name
        dto.memo=doc.note
        dto.fatherid=doc.pid
        dto.pk_corp=doc?.bdCorp?.id
        dto.pk_defdoc=doc.id


        return dto;
    }

    @Override
    public BdDefDocDto[] queryByCodeOrName(String listCode, String str, boolean isContainsChildern) throws BusinessException {


        if(str==null || str.trim().length()==0){
            return this.queryByCondition(listCode,isContainsChildern);
        }
        System.out.println("是否包含下级："+isContainsChildern);
        def ls
        //String sql = "from BdDefDoc doc where  (doc.doccode like ? or doc.docname like ? ) order by doc.doccode";
        if(!isContainsChildern){
            ls =BdPack.findAll {
                or{
                    like('code',"%${str}%")
                    like('name',"%${str}%")
                }
                eq('pid',0)
                order('code')
            }
            //sql = "from BdDefDoc doc where (fatherid is null or fatherid='')  and (doc.doccode like ? or doc.docname like ? ) order by doc.doccode";
        }else{
            ls =BdPack.findAll {
                or{
                    like('code',"%${str}%")
                    like('name',"%${str}%")
                }
                order('code')
            }
        }

          //this.getHibernateTemplate().iterate(sql,new Object[]{listCode,"%"+str+"%","%"+str+"%"});

        List<BdDefDocDto> rt=new ArrayList<BdDefDocDto>();
       ls.each {
            rt.add(this.trans(it));
        }
        return rt.toArray(new BdDefDocDto[0]);
    }


    public BdDefDocDto[] queryByCode(String listCode, String str, boolean isContainsChildern) throws BusinessException {

        if(str==null || str.trim().length()==0){
            return this.queryByCondition(listCode,isContainsChildern);
        }
        System.out.println("是否包含下级："+isContainsChildern);
        //String sql = "from BdDefDoc doc where doc.pk_defdoclist.listcode=? and (doc.doccode = ? ) order by doc.doccode";
        def ls
        if(!isContainsChildern){
            //sql = "from BdDefDoc doc where (fatherid is null or fatherid='') and doc.pk_defdoclist.listcode=? and (doc.doccode = ? ) order by doc.doccode";
            ls =BdPack.findAll {

                 eq('code',str)


                eq('pid',0)
                order('code')
            }
        }else{
            ls =BdPack.findAll {

                eq('code',str)

                order('code')
            }
        }
       // System.out.println("查询语句："+sql);


        List<BdDefDocDto> rt=new ArrayList<BdDefDocDto>();
        ls.each {
            rt.add(this.trans(it));
        }
        return rt.toArray(new BdDefDocDto[0]);
    }

    private BdDefDocDto[] queryByCondition(String listCode,boolean isContainsChildern) throws BusinessException {
        List<BdDefDocDto> rt = new ArrayList<BdDefDocDto>();



        //String sql = "from BdDefDoc doc where doc.pk_defdoclist.listcode=? order by doc.doccode";
        def ls
        if(!isContainsChildern){
            //sql = "from BdDefDoc doc where (fatherid is null or fatherid='') and doc.pk_defdoclist.listcode=? order by doc.doccode";
            ls=BdPack.findAllByPid('0')
        }else{
            ls =BdPack.listOrderByCode()
        }


        ls.each {
            rt.add(this.trans(it));
        }
        return rt.toArray(new BdDefDocDto[0]);
    }

    @Override
    public BdDefDocDto queryByID(String id) throws BusinessException {
        BdPack doc=	BdPack.get(id)
        return this.trans(doc);
        //return rt.toArray(new BdDefDocDto[0]);
    }
}
