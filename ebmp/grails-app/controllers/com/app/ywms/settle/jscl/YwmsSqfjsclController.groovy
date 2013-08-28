package com.app.ywms.settle.jscl

/**
 * 包量结算处理
 */
class YwmsSqfjsclController {
    def billTypeCode = ''
    def _pageId = billTypeCode ?: "a8db761d7a5c4752adf5b91e64ab03ac"


    def index(){
        [pageId: _pageId, billTypeCode: billTypeCode]
    }


}
