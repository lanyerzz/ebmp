package com.app.bd.carsinfo




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID

class BdCarshistoryController {
    //注册pageId   UUID 去除“-”
   def bdCarshistoryService
    def queryByCarInfo(String carNo){
        bdCarshistoryService.query(carNo)
    }


}
