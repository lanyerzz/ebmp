package com.app.ywms.settle.jscl

class YwmsCqfjsclController {

    def billTypeCode = ''
    def _pageId = billTypeCode ?: "a8db761d7a5c4752adf5b91e64ab03xx"


    def index(){
        [pageId: _pageId, billTypeCode: billTypeCode]
    }

}
