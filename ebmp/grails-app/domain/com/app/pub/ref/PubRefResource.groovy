package com.app.pub.ref

class PubRefResource {
    String id
    String resourceCode //参照资源编码
    String resourceName//参照资源名称
    String path//路径
    Date lastUpdated //
    Date dateCreated
    static constraints = {
        resourceCode blank: false, unique: true,nullable: false
        resourceName blank: false,nullable: false
        path nullable: false,blank: false
    }
}
