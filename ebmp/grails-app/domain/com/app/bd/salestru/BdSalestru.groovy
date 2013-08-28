package com.app.bd.salestru

import com.app.bd.corp.BdCorp
import com.app.bd.deptdoc.BdDeptdoc

class BdSalestru {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//    1	 belongcorp	所属公司主键	char
//    4	 def1	自定义项1	varchar
//    5	 def2	自定义项2	varchar
//    6	 def3	自定义项3	varchar
//    7	 def4	自定义项4	varchar
//    8	 def5	自定义项5	varchar
//    9	 dr	删除标志	smallint
//    10	 phone	电话	varchar
    BdDeptdoc	 bdDeptdoc//	所属部门主键	char
    String pid	 //	上级销售组织主键	char
    Boolean	 sealdate=false	//封存标志	varchar
    String	 vaddress	//办公地址	varchar
//    17	 vprincipal	负责人	varchar
    String	 code	//销售组织编码	varchar
    String	 name	//销售组织名称	varchar


    BdCorp bdCorp
    static constraints = {
        code nullable: false ,unique: 'bdCorp'
        name nullable: false,unique: 'bdCorp'
    }

    def defaultPart() {
        [id: id,name:name,code:code]
    }
}
