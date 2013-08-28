@artifact.package@class @artifact.name@ {
    def billTypeCode=''
    def  _pageId=billTypeCode?:"${java.util.UUID.randomUUID().toString().replaceAll('-','')}"
    def  ref_pageId=_pageId+'Ref'
    def index() { }
}
