package com.app.taglib

class BdTagLib {
     def refBdCurrtypeQuery={attrs,body->
          out << """{
                “key”:${attrs.key},
                "value":${attrs.value},
                editerType:'combogrid',
                pagination:true,
                options:{idField:'id',textField:'currtypename', columns:[[
                 {field:'currtypecode',title:'${g.message(code:"bdCurrtype.currtypecode.label" ,default:"Currtypecode")  }',width:60},
                 {field:'currtypename',title:'${g.message(code:"bdCurrtype.currtypename.label" ,default:"Currtypename") }',width:100},
                 {field:'currtypesign',title:'${g.message (code:"bdCurrtype.currtypesign.label" ,default:"Currtypesign") }',width:120}
                    ]]  ,
                 url:'${createLink(controller: 'bdCurrtypeRef',action: 'list')}',
                 panelWidth:300,view:scrollview,rownumbers:true,singleSelect:true,autoRowHeight:false,pageSize:20}
             }
                 """
    }




    def refStateQuery={attrs,body->
        out << """
         {      “key”:${attrs.key},
                "value":${attrs.value},
                editerType:'combobox',options:{valueField:'id',textField:'text',data:[{id:'0',text:'自由'},{id:1,text:'审批'}], editable:false,panelHeight:'auto'}
         }
                 """
    }

    def refState={attrs,body->
        out << """
                <input id="cc" class="easyui-combobox" name="dept" data-options="{valueField:'id',textField:'text',data:[{id:'0',text:'自由'},{id:1,text:'审批'}], editable:false,panelHeight:'auto'}
                ">
                """
    }


    def refText={attrs,body->
        out << """{
                “key”:${attrs.key},
                "value":${attrs.value},
                editerType:'text'
                 }"""
    }




}
