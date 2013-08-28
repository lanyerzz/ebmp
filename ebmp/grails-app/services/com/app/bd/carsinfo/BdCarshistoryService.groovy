package com.app.bd.carsinfo


import com.app.exception.BusinessException

class BdCarshistoryService {


    static transactional = true

    def save(def carNO, num) {
      def car=   BdCarshistory.findOrCreateByCarNo(carNO)
      car.max=car.max<num ? num : car.max

      car.min=(car.min==0 || car.min>num)? num : car.min

      car.current=num
      car.save()

    }
    def query(def carNo){
        def car=   BdCarshistory.findOrCreateByCarNo(carNo)
        return car
    }
}

