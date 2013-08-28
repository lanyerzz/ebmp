package com.app.bd.exchange

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException

class BdExchangeService {
    def springSecurityService

    /**
     * 获取汇率
     * @param currtypeOne
     * @param currtypeTwo
     * @param date
     * @return
     */
   def getTaxrate(currtypeOne,currtypeTwo, date){
      def exchanges= BdExchangeB.executeQuery("from BdExchangeB b where b.day=? and b.head.year=? and b.head.month=? " +
               "and ((b.head.currtypeOne.id=? and b.head.currtypeTwo.id=?) or (b.head.currtypeTwo.id=? and b.head.currtypeTwo.id=?))",[date.day,date.year,date.month,currtypeOne,currtypeTwo,currtypeOne,currtypeTwo]);
       if(exchanges){
           if(exchanges[0].head.currtypeOne.id==currtypeOne){
               return exchanges[0].exchange
           }else{
               return  BigDecimal.ONE.divide(exchanges[0].exchange,4)
           }

       }else{
           return 1;
       }
   }

    def getTaxrate(currtype, date){

        def calendar=date.toCalendar()
        println('-=-=-=-=-=-=-=--=-=-=-=-='+calendar.get(Calendar.YEAR))
        def corp=BdCorp.get(springSecurityService.authentication.loginCorp)

        def oneCurrtype=corp.currencyType

        if(!oneCurrtype){
            throw new BusinessException('未设置本位币种')
        }

//        println oneCurrtype
//        println currtype

        def exchanges= BdExchangeB.executeQuery("from BdExchangeB b where b.day=? and b.head.year=? and b.head.month=? " +
                "and (b.head.currtypeOne.id=? and b.head.currtypeTwo.id=?)",[calendar.get(Calendar.DATE),calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH)+1,oneCurrtype.id,currtype]);
       if(!exchanges){
           exchanges= BdExchangeB.executeQuery("from BdExchangeB b where b.day=? and b.head.year=? and b.head.month=? " +
                   "and (b.head.currtypeOne.id=? and b.head.currtypeTwo.id=?)",[calendar.get(Calendar.DATE),calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH)+1,currtype,oneCurrtype.id]);

       }
        if(exchanges){
            if(exchanges[0].head.currtypeOne.id==currtype){
                return exchanges[0].exchange
            }else{
                return  BigDecimal.ONE.divide(exchanges[0].exchange,4)
            }

        }else{
            return 1;
        }
    }

}
