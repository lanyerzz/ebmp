package com.app.taglib

import com.app.pub.businesstype.PubBusinessBill
import com.app.pub.businesstype.PubBusinessType
import com.app.pub.ref.PubRefResource

class PubTagLib {
    def refTemplate={attrs,body->
        def _code=attrs.code
        if(!_code)
            _code=attrs.model.code
       def rs= PubRefResource.findByResourceCode(_code)
        def inForm= attrs.inForm?:true
        attrs.model['inForm']=inForm
        out<< g.render(template: rs.path,model: attrs.model)
    }

    def addButton={attrs,body->
        def billtype=attrs.billTypeCode
        def handler=attrs.handler?:'onAdd'
        def refHandler=attrs.refHandler?:'onRefPage'
        def pageId=attrs.pageId
        def types=PubBusinessType.createCriteria().list {
            createAlias('bills','bills')
            createAlias('bills.billtype','bill')
          //  createAlias()
            eq('bill.billtypecode',billtype)
        }

       if(types.size()==1){//只有一条对应的单据类型
            def bills=PubBusinessBill.createCriteria().list{
                createAlias('billtype','billtype')
                eq('head.id',types[0].id)
                eq('billtype.billtypecode',billtype)
            }
            if(bills.size()==1 ){//业务类型里只有一条此类型单据
                if(bills[0].sourceType==null && bills[0].canDefine){//无来源，可自制
                    out<< """
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="${handler}${pageId}('${types[0].id}')">
                 ${message(code: 'default.button.create.label',default: '增加')}
            """
                }else if(bills[0].sourceType!=null && bills[0].canDefine){//有来源 可自制
                    out << """
            <a href="#" class="easyui-menubutton" data-options="menu:'#mm${pageId}',iconCls:'icon-add'">${message(code: 'default.button.create.label',default: '增加')}</a>
            """
                    out<<""" <div id="mm${pageId}" style="width:150px;">"""
                    out<<"""<div>"""
                    out<<"<span>${types[0].name}</span>"
                    out << """ <div style="width:150px;">

                        <div onClick="${refHandler}${pageId}('${types[0].id}','${bills[0].sourceType.id}','${bills[0].sourceType.billtypename}','${billtype}')">${bills[0].sourceType.billtypename}</div>
                        <div onClick="${handler}${pageId}('${types[0].id}')">自制单据</div>
                        </div> """
                    out<<"</div>"
                    out<<"</div>"
                }else if(bills[0].sourceType!=null && !bills[0].canDefine){//有来源 不可自制
                    out<< """
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="${refHandler}${pageId}('${types[0].id}','${bills[0].sourceType.id}','${bills[0].sourceType.billtypename}','${billtype}')">
                 ${message(code: 'default.button.create.label',default: '增加')}
            """
                }




            }else {//存在多单据来源
                out << """
            <a href="#" class="easyui-menubutton" data-options="menu:'#mm${pageId}',iconCls:'icon-add'">${message(code: 'default.button.create.label',default: '增加')}</a>
            """
                out<<""" <div id="mm${pageId}" style="width:150px;">"""
                out<<"<span>${it.name}</span>"
                out << """ <div style="width:150px;">"""
                def define=false
                bills.each {
                    if(it.canDefine){
                      define=true
                    }
                    if(it.sourceType!=null)
                        out<<""" <div onClick="${refHandler}${pageId}('${types[0].id}','${it.id}','${bills[0].sourceType.billtypename}','${billtype}')">${it.sourceType.billtypename}</div>"""
                }


                if(define){
                    """<div onClick="${handler}${pageId}('${types[0].id}')">自制单据</div>"""
                }





                out<<"""</div> """
                out<<"</div>"
            }



        }else if (types.size()>1){
            out << """
            <a href="#" class="easyui-menubutton" data-options="menu:'#mm${pageId}',iconCls:'icon-add'">${message(code: 'default.button.create.label',default: '增加')}</a>
            """
            out<<""" <div id="mm${pageId}" style="width:150px;">"""
            types.each {type->

                def bills=PubBusinessBill.createCriteria().list{
                   createAlias('billtype','billtype')
                    eq('head.id',type.id)
                    eq('billtype.billtypecode',billtype)
                }
                if(bills.size()==1){
                    if(bills[0].sourceType==null && bills[0].canDefine)
                        out<<"""<div onClick="${handler}${pageId}('${type.id}')">${type.name}</div>"""
                    else if(bills[0].sourceType && bills[0].canDefine){
                       out<<"""<div>"""
                        out<<"""<span>${type.name}</span>"""
                        out<<"""<div style="width:150px;">"""
                        out<<"""<div onClick="${refHandler}${pageId}('${type.id}','${bills[0].sourceType.id}','${bills[0].sourceType.billtypename}','${billtype}')">${bills[0].sourceType.billtypename}</div>"""
                        out<<"""<div onClick="${handler}${pageId}('${type.id}')">自制单据</div>"""
                        out<<"""</div>"""
                        out<<"""</div>"""
                    }else if(bills[0].sourceType && !bills[0].canDefine){
                        out<<"""<div onClick="${refHandler}${pageId}('${type.id}','${bills[0].sourceType.id}','${bills[0].sourceType.billtypename}','${billtype}')">${type.name}</div>"""
                    }
                }else{
                    def define=false
                    out<<"""<span>${type.name}</span>"""
                    out<<"""<div style="width:150px;">"""
                    bills.each {
                        if(it.canDefine){
                            define=true
                        }
                        if(it.sourceType!=null)
                            out<<"""<div onClick="${refHandler}${pageId}('${type.id}','${it.sourceType.id}','${bills[0].sourceType.billtypename}','${billtype}')">${it.sourceType.billtypename}</div>"""


                    }
                    if(define){
                        out<<"""<div onClick="${handler}${pageId}('${type.id}')">自制单据</div>"""
                    }

                    out<<"""</div>"""
                }

            }
            out<<"""</div>"""
        }else {//没有对应单据的业务类型

               out<< """
                     <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="${handler}${pageId}()">
        ${message(code: 'default.button.create.label',default: '增加')}
                </a>
            """

       }
        
    }





}
