
package com.app.taglib
class SmLibTagLib {
    def smFunctionType={attr->
        switch (attr.value){
            case 0: out<< message(code: 'SmFunction.funType.0',default: '功能目录')
                break
            case 1: out<< message(code: 'SmFunction.funType.1',default: '单据界面')
                break
            case 2: out<< message(code: 'SmFunction.funType.2',default: '执行节点')
                break
            case 3: out<< message(code: 'SmFunction.funType.3',default: '按钮')
                break
        }
    }

        def smConfigAttribute={attr->
            switch (attr.value){
                case null: out<< message(code: 'SmFunction.configAttribute.space',default: '不允许匿名访问(需要权限分配)')
                    break
                case '': out<< message(code: 'SmFunction.configAttribute.space',default: '不允许匿名访问(需要权限分配)')
                    break
                case 'IS_AUTHENTICATED_FULLY': out<< message(code: 'SmFunction.configAttribute.IS_AUTHENTICATED_FULLY',default: '不允许匿名访问(不需要权限分配)')
                    break
                case 'IS_AUTHENTICATED_ANONYMOUSLY': out<< message(code: 'SmFunction.configAttribute.IS_AUTHENTICATED_ANONYMOUSLY',default: '允许匿名访问')
                    break

            }
    }
}
