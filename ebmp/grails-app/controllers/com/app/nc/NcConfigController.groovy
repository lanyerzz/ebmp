package com.app.nc

import grails.converters.JSON

class NcConfigController {
    def billTypeCode = ''
    def _pageId = billTypeCode ?: "NcConfig"

    def index() {
        NcDataBaseConfig database=NcDataBaseConfig.list()[0]
        NcUpConfig upConfig=NcUpConfig.list()[0]
        [page:_pageId,database:database,upconfig:upConfig]
    }

    def save(){
        NcDataBaseConfig.executeUpdate('delete from NcDataBaseConfig ')
        NcDataBaseConfig config=new NcDataBaseConfig(params)
        config.save()
        def json=[remoteMessage:'保存完成']
        render json as JSON
    }

    def save1(){
        NcUpConfig.executeUpdate('delete from NcUpConfig ')
        NcUpConfig config=new NcUpConfig(params)
        config.save()
        def json=[remoteMessage:'保11存完成']
        render json as JSON
    }
}
