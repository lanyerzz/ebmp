package com.app.plugin

import com.app.bd.carsinfo.BdCarshistory

class PluginController {

    def weighbridge(String carNo){
        def carh= BdCarshistory.findByCarNo(carNo)
        [car:carh]
    }
    def createWeighbridgeApplet(){
        println params
       render view: 'weighbridgeApplet',model: params
    }
}
