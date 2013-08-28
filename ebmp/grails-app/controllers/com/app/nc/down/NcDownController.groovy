package com.app.nc.down

import com.app.nc.NcDataBaseConfig
import grails.converters.JSON

class NcDownController {

    def  _pageId='NcDown'
    def invClsDownFromNCService
    def bdPackDownFromNCService
    def invDownFromNCService
    def bdMeasdocDownFromNcService
    def currencyDownFromNCService
    def custClsDownFromNcService
    def custDownFromNCService
    def icBalanceDownFromNCService
    def index() {
       def config= NcDataBaseConfig.list()

    [pageId:_pageId,config:config[0]]
    }



    def InvClsDown(){
        def config= NcDataBaseConfig.list()
        invClsDownFromNCService.doDown(config[0])
        def json=[remoteMessage:'存货分类下载完成']
        render json as JSON
    }
    def BdPackDown(){
        def config= NcDataBaseConfig.list()
        bdPackDownFromNCService.doDown(config[0])
        def json=[remoteMessage:'包装信息下载完成']
        render json as JSON
    }
    def INvDown(){
        def config= NcDataBaseConfig.list()
        invDownFromNCService.doDown(config[0])
        def json=[remoteMessage:'存货信息下载完成']
        render json as JSON
    }

    def MeasDocDown(){
        def config= NcDataBaseConfig.list()
        bdMeasdocDownFromNcService.doDown(config[0])
        def json=[remoteMessage:'计量单位信息下载完成']
        render json as JSON
    }
    def CurrencyDown(){
        def config= NcDataBaseConfig.list()
        currencyDownFromNCService.doDown(config[0])
        def json=[remoteMessage:'币种信息下载完成']
        render json as JSON
    }

    def AreaDown(){
        def config= NcDataBaseConfig.list()
        custClsDownFromNcService.doDown(config[0])
        def json=[remoteMessage:'地区分类信息下载完成']
        render json as JSON
    }

    def CustDown(){
        def config= NcDataBaseConfig.list()
        custDownFromNCService.doDown(config[0])
        def json=[remoteMessage:'客商信息下载完成']
        render json as JSON
    }
    def onHandnumDown(){
        def config= NcDataBaseConfig.list()
        icBalanceDownFromNCService.doDown(config[0])
        def json=[remoteMessage:'现存量信息下载完成']
        render json as JSON
    }

}
