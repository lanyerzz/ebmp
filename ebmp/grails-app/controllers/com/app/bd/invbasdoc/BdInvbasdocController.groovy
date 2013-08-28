package com.app.bd.invbasdoc

import com.app.bd.corp.BdCorp
import com.app.bd.invcl.BdInvcl
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.pack.BdPack
import com.app.exception.BusinessException
import com.app.util.CellHelper
import com.app.util.CriteriaHelper
import com.app.util.PageHelper
import grails.converters.JSON
import groovy.json.JsonBuilder
import org.apache.log4j.Logger
import org.apache.poi.POIXMLDocument
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.openxml4j.opc.OPCPackage
import org.apache.poi.poifs.filesystem.POIFSFileSystem
import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.Sheet
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.*
import org.hibernate.criterion.Restrictions
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.servlet.ServletOutputStream

import static java.util.UUID.randomUUID

/**
 *
 */
class BdInvbasdocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdInvbasdoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def bdInvbasdocService

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdInvbasdocInstanceList: BdInvbasdoc.list(params), bdInvbasdocInstanceTotal: BdInvbasdoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        def bdInvclInstance = BdInvcl.get(id)
        def bdInvbasdocInstance = new BdInvbasdoc()
        if (!bdInvclInstance){
            flash.message = message(code: 'default.not.found.message',default:'没有找到存货分类')
            [bdInvbasdocInstance:bdInvbasdocInstance,pageId:_pageId]
        }else{
            bdInvbasdocInstance.pkInvcl = bdInvclInstance
            [bdInvbasdocInstance:bdInvbasdocInstance,pageId:_pageId]
        }
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def bdInvbasdocInstance = new BdInvbasdoc(params)
        def creator = springSecurityService.currentUser
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        bdInvbasdocInstance.creator = creator
        bdInvbasdocInstance.pkCorp = corp
        if (!bdInvbasdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdInvbasdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdInvbasdocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdInvbasdoc.label', default: 'BdInvbasdoc'), bdInvbasdocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdInvbasdocInstance = BdInvbasdoc.get(id)
        if (!bdInvbasdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdInvbasdoc.label', default: 'BdInvbasdoc'), id])
            redirect(action: "list")
            return
        }

        [bdInvbasdocInstance: bdInvbasdocInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdInvbasdocInstance = BdInvbasdoc.get(id)
        if (!bdInvbasdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdInvbasdoc.label', default: 'BdInvbasdoc'), id])

        }

        [bdInvbasdocInstance: bdInvbasdocInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdInvbasdocInstance = BdInvbasdoc.get(id)
        if (!bdInvbasdocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdInvbasdoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdInvbasdocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdInvbasdoc.label', default: 'BdInvbasdoc')] as Object[],
                          "Another user has updated this BdInvbasdoc while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        def modifier = springSecurityService.currentUser
        params.modifier = modifier
        bdInvbasdocInstance.properties = params
        if (!bdInvbasdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdInvbasdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdInvbasdoc.label', default: 'BdInvbasdoc'), bdInvbasdocInstance.id])
        def data= bdInvbasdocInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdInvbasdocInstance = BdInvbasdoc.get(id)
        if (!bdInvbasdocInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        bdInvbasdocInstance.delete(flush: true)
        render id

    }
    /**
     * 查询存货分类
     * @param id
     * @return
     */
    def queryTree(String id){
        List bdInvclInstances
        if (id){
            bdInvclInstances = BdInvcl.findAllByPid(id,[sort:'invclassCode'])
        }else{
            bdInvclInstances = BdInvcl.findAllByPid('0',[sort:'invclassCode'])
        }
        def data = []
        bdInvclInstances?.each {
            def row = [:]
            row = [id:it.id,text:it.invclassName]
            if (BdInvcl.countByPid(it.id)!=0){
                row.state = 'closed'
            }
            data << row
        }
        render data as JSON

    }
    /**
     * 查询存货基本档案
     * @param pkInvcl
     * @return
     */
    def query(String pkInvcl){

        println params
        def data = []
        if (pkInvcl){
            List bdInvbasdocInstances
            def bdInvclInstance = BdInvcl.get(pkInvcl)
            println CriteriaHelper.pageMap(params)
            bdInvbasdocInstances = BdInvbasdoc.findAllByPkInvcl(bdInvclInstance,CriteriaHelper.pageMap(params))
            bdInvbasdocInstances?.each {

                data << it.part([defaultPart:true])
            }

            def json=[rows:data,total:BdInvbasdoc.countByPkInvcl(bdInvclInstance)]
            render json as JSON
        }else{
            render data as JSON
        }
    }
    /**
     * 显示分配界面
     * @param invclId
     * @return
     */
    def openAllotDlg(String invclId){
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        render view:'allotDlg',model:[corp:corp,invclId:invclId,pageId:_pageId]

    }
/**
 * 查询以分配存货
 * @param pkInvcl
 * @param pkCorp
 * @return
 */
    def queryInvbasdocInCorp(String pkInvcl,String pkCorp){
        if (!pkCorp||!pkInvcl){
            def row = [rows:[],total:0]
            render row as JSON
        }else{
            def _corpid=pkCorp
            def _invclsid=pkInvcl


            String sql="from BdInvmandoc where pkCorp.id=? and pkInvbasdoc.pkInvcl.id=?"

            def sf=BdInvmandoc.executeQuery(sql,[_corpid, _invclsid],PageHelper.pageMap(params, null))

            def data = []
            sf?.each{
                data << it.pkInvbasdoc.part()
            }

            String sql1="select count(pkInvbasdoc) from BdInvmandoc where pkCorp.id=? and pkInvbasdoc.pkInvcl.id=?"
            def count= BdInvmandoc.executeQuery(sql1,[_corpid, _invclsid])[0]
            def rows = [rows:data,total:count]
            render rows as JSON
        }

    }
/**
 * 查询未分配存货
 * @param pkInvcl
 * @param pkCorp
 * @return
 */

    def queryInvbasdocNotInCorp(String pkInvcl,String pkCorp){
        if (!pkCorp||!pkInvcl){
            def row = [rows:[],total:0]
            render row as JSON
        }else{
            def _corpid=pkCorp
            def _invclsid=pkInvcl

            def sql="""select bas from BdInvbasdoc bas
            where bas.id not in
            (
                select man.pkInvbasdoc from BdInvmandoc as man where man.pkCorp.id=?
            )
            and bas.pkInvcl.id=?  """

            def sf=BdInvbasdoc.executeQuery(sql, [_corpid, _invclsid],PageHelper.pageMap(params,"invcode"))

            def data=[]
            sf?.each{
                data << it.part()
            }
            def sql1="""select count(bas) from BdInvbasdoc bas
            where bas.id not in
            (
                select man.pkInvbasdoc from BdInvmandoc as man where man.pkCorp.id=?
            )
            and bas.pkInvcl.id=?"""
            def count=BdInvbasdoc.executeQuery(sql1, [_corpid, _invclsid])


            def row = [rows:data,total:count]
            render row as JSON
        }

    }

/**
 * 分配
 * @return
 */
    def allot(){
        def pkCorp = params.pkCorp
        def pkInvbasdoc = params.pkInvbasdoc
        if(!pkInvbasdoc){
            throw new BusinessException("无数据")
        }
        if(!pkCorp){
            throw new BusinessException("请选择公司");
        }
        bdInvbasdocService.allot(pkInvbasdoc, pkCorp)
        def state = ['success':true]
        render state as JSON


    }
/**
 * 全部分配
 * @return
 */
    def allotAll(){
        def pkCorp= params.pkCorp
        def pkInvcl= params.pkInvcl
        if(!pkCorp){
            throw new BusinessException("请选择公司");
        }
        bdInvbasdocService.allotAll(pkCorp,pkInvcl)
        def state = ['success':true]
        render state as JSON

    }

/**
 * 取消分配
 * @return
 */
    def deleteAllot(){
        def pkCorp = params.pkCorp
        def pkInvbasdoc = params.pkInvbasdoc

        if(!pkInvbasdoc){
            throw new BusinessException("无数据")
        }
        if(!pkCorp){
            throw new BusinessException("请选择公司");
        }
        bdInvbasdocService.deleteAllot(pkInvbasdoc, pkCorp);
        def state = ['success':true]
        render state as JSON

    }
/**
 * 取消全部分配
 * @return
 */

    def deleteAllotAll(){

        def pkCorp= params.pkCorp
        def pkInvcl= params.pkInvcl


        if(!pkCorp){
            throw new BusinessException("请选择公司");
        }
        bdInvbasdocService.deleteAllotAll(pkCorp,pkInvcl);
        def state = ['success':true]
        render state as JSON


    }
/**
 * 显示上传界面
 * @return
 */
    def openUploadDlg(){
        render view:'upload' ,model:[pageId:_pageId]
    }
/**
 * 读取上传文件
 * @return
 */
    def saveDataFile(){
        CommonsMultipartFile  file= request.getFile('file')
        BufferedInputStream bis =   new BufferedInputStream(file.getFileItem().getInputStream())
        Workbook wb = null
        if (POIFSFileSystem.hasPOIFSHeader(bis)) {
            wb = new HSSFWorkbook(bis)
        }
        if (POIXMLDocument.hasOOXMLHeader(bis)) {
            wb = new XSSFWorkbook(OPCPackage.open(bis))
        }


        try{

            Sheet sheet = wb.getSheetAt(0)
            def invbasdocs = []

            def smUser = springSecurityService.currentUser

            def corp = springSecurityService.getAuthentication().loginCorp
            def logincorp = BdCorp.load(corp)
            for (int i=1;i<sheet.getLastRowNum();i++) {

                def invbasdoc = new BdInvbasdoc();
                Row row = sheet.getRow(i);
                Cell cell0 = row.getCell(0);
                String invcode = CellHelper.stringCellValue(cell0)
                if(!invcode) {
                    Logger.getInstance('存货基本档案导入错误').info('第一列存货编码空，被认为行结束！')
                    break;
                }

                if(invcode){

                    invbasdoc.setInvcode(invcode);
                }else{
                    throw new BusinessException("存货编码不能为空:[${cell0.rowIndex+1},${cell0.columnIndex+1}]！")
                }
                Cell cell1 = row.getCell(1);
                String invname = CellHelper.stringCellValue(cell1)
                if (invname!=null) {

                    invbasdoc.setInvname(invname);
                }else{
                    throw new BusinessException("存货名称不能为空:[${cell0.rowIndex+1},${cell0.columnIndex+1}]！")
                }
                Cell cell2 = row.getCell(2);

                String invshortname = CellHelper.stringCellValue(cell2)
                invbasdoc.setInvshortname(invshortname);

                Cell cell3 = row.getCell(3);

                String forinvname = CellHelper.stringCellValue(cell3)
                invbasdoc.setForinvname(forinvname);

                Cell cell4 = row.getCell(4);

                String invpinpai = CellHelper.stringCellValue(cell4)
                invbasdoc.setInvpinpai(invpinpai);

                Cell cell5 = row.getCell(5);

                String invspec = CellHelper.stringCellValue(cell5)
                invbasdoc.setInvspec(invspec);



                Cell cell6 = row.getCell(6);

                String invtype = CellHelper.stringCellValue(cell6)
                invbasdoc.setInvtype(invtype);

                Cell cell7 = row.getCell(7);

                def invbarcode = CellHelper.stringCellValue(cell7)
                invbasdoc.setInvbarcode(invbarcode);

                Cell cell8 = row.getCell(8);

                def invmnecode = CellHelper.stringCellValue(cell8)
                invbasdoc.setInvmnecode(invmnecode);


                Cell cell9 = row.getCell(9);
                String pkInvcl = CellHelper.stringCellValue(cell9)
                if (pkInvcl!=null) {

                    def invcl = BdInvcl.findWhere(invclassName:pkInvcl)
                    if(!invcl){
                        throw new BusinessException("未找到分类:${pkInvcl}")
                    }
                    invbasdoc.putAt("pkInvcl", invcl)
                }else{
                    throw new BusinessException('存货分类不能为空!')
                }
                Cell cell10 = row.getCell(10);
                String bdmeasdoc = CellHelper.stringCellValue(cell10)
                if (bdmeasdoc!=null) {

                    def measdoc = BdMeasdoc.findWhere(measname:bdmeasdoc)
                    if(measdoc==null){
                        throw new BusinessException("未找到主计量单位:${bdmeasdoc}")
                    }
                    invbasdoc.putAt("bdmeasdoc", measdoc)
                } else
                    throw new BusinessException('主计量档案为不能空！')
                Cell cell11 = row.getCell(11);
                if (cell11!=null) {
                    String bdmeasdoc1 = CellHelper.stringCellValue(cell11)
                    println bdmeasdoc1
                    def measdoc = BdMeasdoc.findWhere(measname:bdmeasdoc1)
                    if(!measdoc){
                        throw new BusinessException("未找到计量单位:${bdmeasdoc1}")
                    }
                    invbasdoc.putAt("bdmeasdoc1", measdoc)
                }


                Cell cell12 = row.getCell(12);
                if (cell12!=null) {
                    String bdmeasdoc2 = CellHelper.stringCellValue(cell12)
                    def measdoc = BdMeasdoc.findWhere(measname:bdmeasdoc2)
                    if(!measdoc){
                        throw new BusinessException("未找到计量单位:${bdmeasdoc2}")
                    }
                    invbasdoc.putAt("bdmeasdoc2", measdoc)
                }
                Cell cell13 = row.getCell(13);
                if (cell13!=null) {
                    String bdmeasdoc3 = CellHelper.stringCellValue(cell13)
                    def measdoc = BdMeasdoc.findWhere(measname:bdmeasdoc3)
                    if(!measdoc){
                        throw new BusinessException("未找到计量单位:${bdmeasdoc3}")
                    }
                    invbasdoc.putAt("bdmeasdoc3", measdoc)
                }
                Cell cell14 = row.getCell(14);
                if (cell14!=null) {
                    String bdmeasdoc4 = CellHelper.stringCellValue(cell14)
                    def measdoc = BdMeasdoc.findWhere(measname:bdmeasdoc4)
                    if(!measdoc){
                        throw new BusinessException("未找到计量单位:${bdmeasdoc4}")
                    }
                    invbasdoc.putAt("bdmeasdoc4", measdoc)
                }
                Cell cell15 = row.getCell(15);
                if (cell15!=null) {
                    String bdmeasdoc5 = CellHelper.stringCellValue(cell15)
                    def measdoc = BdMeasdoc.findWhere(measname:bdmeasdoc5)
                    if(!measdoc){
                        throw new BusinessException("未找到计量单位:${bdmeasdoc5}")
                    }
                    invbasdoc.putAt("bdmeasdoc5", measdoc)
                }
                Cell cell16 = row.getCell(16);
                if (cell16!=null) {
                    String discountflag = CellHelper.stringCellValue(cell16)
                    if (discountflag == "Y") {
                        invbasdoc.setDiscountflag(true)
                    }
                }
                Cell cell17 = row.getCell(17)
                if (cell17!=null) {
                    String ismngstockbygrswt = CellHelper.stringCellValue(cell17)
                    if (ismngstockbygrswt == "Y") {
                        invbasdoc.setIsmngstockbygrswt(true)
                    }
                }
                Cell cell18 = row.getCell(18);
                if (cell18!=null) {
                    String isretail =  CellHelper.stringCellValue(cell18)
                    if (isretail == "Y") {
                        invbasdoc.setIsretail(true)
                    }
                }
                Cell cell19 = row.getCell(19);
                if (cell19!=null) {
                    String isstorebyconvert =  CellHelper.stringCellValue(cell19)
                    if (isstorebyconvert == "Y") {
                        invbasdoc.setIsstorebyconvert(true)
                    }
                }

                Cell cell20 = row.getCell(20);
                if (cell20!=null) {
                    String laborflag =  CellHelper.stringCellValue(cell20)
                    if (laborflag == "Y") {
                        invbasdoc.setLaborflag(true)
                    }
                }
                Cell cell21 = row.getCell(21);
                if (cell21!=null) {
                    def  length = cell21.getNumericCellValue()
                    invbasdoc.setLength(length)
                }
                Cell cell22 = row.getCell(22);
                if (cell22!=null) {
                    String width =  cell22.getNumericCellValue()
                    invbasdoc.setWidth(width)
                }
                Cell cell23 = row.getCell(23);
                if (cell23!=null) {
                    String graphid = CellHelper.stringCellValue(cell23)
                    invbasdoc.setGraphid(graphid)
                }
                Cell cell24 = row.getCell(24);
                if (cell24!=null) {
                    String height = cell24.stringCellValue()
                    invbasdoc.setHeight(height)
                }
                Cell cell25 = row.getCell(25);
                if (cell25!=null) {
                    String sealflag = CellHelper.stringCellValue(cell25)
                    if (sealflag == "Y") {
                        invbasdoc.setSealflag(true)
                    }
                }
                Cell cell26 = row.getCell(26);
                if (cell26!=null) {
                    String setpartsflag = CellHelper.stringCellValue(cell26)
                    if (setpartsflag == "Y") {
                        invbasdoc.setSetpartsflag(true)
                    }
                }
                Cell cell27 = row.getCell(27);
                if (cell27!=null) {
                    def shipunitnum = cell27.getNumericCellValue()
                    invbasdoc.setShipunitnum(shipunitnum);
                }
                Cell cell28 = row.getCell(28);
                if (cell28!=null) {
                    def storeunitnum = cell28.getNumericCellValue()
                    invbasdoc.setStoreunitnum(storeunitnum);
                }
                Cell cell29 = row.getCell(29);
                if (cell29!=null) {
                    def unitvolume = cell29.getNumericCellValue()
                    invbasdoc.setUnitvolume(unitvolume)
                }
                Cell cell30 = row.getCell(30);
                if (cell30!=null) {
                    def unitweight = cell30.getNumericCellValue()
                    invbasdoc.setUnitweight(unitweight)
                }
                Cell cell31 = row.getCell(31);
                if (cell31!=null) {
                    def weitunitnum = cell31.getNumericCellValue()
                    invbasdoc.weitunitnum=weitunitnum

                }
                Cell cell32 = row.getCell(32)
                if(cell32!=null){
                    def memo = cell32.getRichStringCellValue().toString()
                    invbasdoc.memo=memo

                }
                invbasdoc.creator = smUser

                invbasdoc.modifier = smUser

                invbasdoc.pkCorp = logincorp

                invbasdocs << invbasdoc

            }

            def errors=[]
            invbasdocs?.each {
                if(it.validate()){
                    it.save()
                }else{
                    errors<< it.errors
                }
            }

            if(errors){
                Logger.getInstance('存货基本档案导入错误').error(errors)
                render "<script>alert('文件导入失败,请查看后台日志！')</script>"
            }
            else
                render "<script>alert('文件导入工作操作完成！')</script>"
        }catch(Exception e){
            render "<script>alert('${e.getMessage()}')</script>"
        }finally{
            bis.close()
        }

    }

    /**
     * 查询
     * @return
     */
    def query1(){

        def bdPackInstanceLs
        def bdPackInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdInvbasdoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc=new CriteriaHelper(BdInvbasdoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            bdPackInstanceTotal = cc.count()

            bdPackInstanceLs = ch.list(params,"invcode") //TODO
        }else if (params.q!=null){//TODO 需要修改JSON中的字段
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'invcode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'invname','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdInvbasdoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc=new CriteriaHelper(BdInvbasdoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            bdPackInstanceTotal = cc.count()

            bdPackInstanceLs = ch.list(params,"invcode")//TODO

        }else if (params.id){
            def bdPackInstanceInstance= BdInvbasdoc.get(params.id)
            def json= [rows: [bdPackInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdInvbasdoc.createCriteria())
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc=new CriteriaHelper(BdInvbasdoc.createCriteria())
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            bdPackInstanceTotal = cc.count()

            bdPackInstanceLs = ch.list(params,"invcode")//TODO
        }





        def data = []
        bdPackInstanceLs?.each {
            data << it.part()
        }

        def json= [rows: data, total: bdPackInstanceTotal]
        render json as JSON
    }


/**
 * 导出文件
 */
    def leadingOut(){
        println params
        String pkInvcl = params.pkInvcl
        String filename = BdInvcl.load(pkInvcl).invclassName
        def _loginCorp=springSecurityService.getAuthentication().loginCorp
        def invcl = BdInvcl.get(pkInvcl)
        def corp = BdCorp.get(_loginCorp)
//        JSONElement jsobj =  CriteriaJsonHelper.toCriteriaJson(params,[
//                [fieldName:'pkCorp.id',value:_loginCorp],[fieldName:'pkInvcl.id',value:pkInvcl]
//        ])
//        CriteriaHelper ch=new CriteriaHelper(BdInvbasdoc.createCriteria(),jsobj)
        def bdInvbasdocInstances = BdInvbasdoc.findAll('pkInvcl':invcl,'pkCorp':corp)
        def sf=bdInvbasdocInstances
        XSSFWorkbook wb = new XSSFWorkbook()
        XSSFSheet sheet = wb.createSheet()
        def header = []
        header = ["存货编码","存货名称","存货简称","外文名称","品牌","规格","	型号","条形码","助记码","	存货分类","主计量单位","销售默认单位","采购默认单位","库存默认单位","生产默认单位","零售计量单位","是否价格折扣","是否按毛重管理库存","是否零售","是否换算率结存","是否应税劳务","长度","宽度","图号","高度","封存标志","是否成套件","多少标准运输单位","多少标准存储单位","单位体积","单位重量","多少标准重量单位","备注"]
        XSSFRow  row0 =	sheet.createRow(0)
        for (int i = 0; i < header.size(); i++) {
            XSSFCell cell = row0.createCell(i)
            XSSFRichTextString text = new XSSFRichTextString(header[i])
            cell.setCellValue(text)
        }
        Iterator<BdInvbasdoc> ite = sf.iterator()
        int index = 0
        while(ite.hasNext()){
            index++
            XSSFRow row = sheet.createRow(index)
            BdInvbasdoc invbasdoc = ite.next()
            XSSFCell cell0 = row.createCell(0)
            String text0 = invbasdoc.invcode
            if(text0!=null){
                cell0.setCellValue(text0)
            }
            XSSFCell cell1 = row.createCell(1)
            String text1 = invbasdoc.invname
            if(text1!=null){
                cell1.setCellValue(text1)
            }
            XSSFCell cell2 = row.createCell(2)
            String text2 = invbasdoc.invshortname
            if(text2!=null){
                cell2.setCellValue(text2)
            }
            XSSFCell cell3 = row.createCell(3)
            String text3 = invbasdoc.forinvname
            if(text3!=null){
                cell3.setCellValue(text3)
            }
            XSSFCell cell4 = row.createCell(4)
            String text4 = invbasdoc.invpinpai
            if(text4!=null){
                cell4.setCellValue(text4)
            }
            XSSFCell cell5 = row.createCell(5)
            String text5 = invbasdoc.invspec
            if(text5!=null){
                cell5.setCellValue(text5)
            }
            XSSFCell cell6 = row.createCell(6)
            String text6 = invbasdoc.invtype
            if(text6!=null){
                cell6.setCellValue(text6)
            }
            XSSFCell cell7 = row.createCell(7)
            String text7 = invbasdoc.invbarcode
            if(text7!=null){
                cell7.setCellValue(text7)
            }
            XSSFCell cell8 = row.createCell(8)
            String text8 = invbasdoc.invmnecode
            if(text8!=null){
                cell8.setCellValue(text8)
            }
            XSSFCell cell9 = row.createCell(9)
            String text9 = invbasdoc.pkInvcl.invclassName
            if(text9!=null){
                cell9.setCellValue(text9)
            }
            XSSFCell cell10 = row.createCell(10)
            def text10 = invbasdoc.bdmeasdoc.measname
            if(text10!=null){
                cell10.setCellValue(text10)
            }
            XSSFCell cell11 = row.createCell(11)
            def text11 = invbasdoc?.bdmeasdoc1?.measname
            if(text11!=null){
                cell11.setCellValue(text11)
            }
            XSSFCell cell12 = row.createCell(12)
            def text12 = invbasdoc?.bdmeasdoc2?.measname
            if(text12!=null){
                cell12.setCellValue(text12)
            }
            XSSFCell cell13 = row.createCell(13)
            def text13 = invbasdoc?.bdmeasdoc3?.measname
            if(text13!=null){
                cell13.setCellValue(text13)
            }
            XSSFCell cell14 = row.createCell(14)
            def text14 = invbasdoc?.bdmeasdoc4?.measname
            if(text14!=null){
                cell14.setCellValue(text14)
            }
            XSSFCell cell15 = row.createCell(15)
            def text15 = invbasdoc?.bdmeasdoc5?.measname
            if(text15!=null){
                cell15.setCellValue(text15)
            }
            XSSFCell cell16 = row.createCell(16)
            String text16 = invbasdoc.discountflag
            if(text16!=null){
                if(text16=="true"){
                    cell16.setCellValue("Y")
                }else{
                    cell16.setCellValue("N")
                }
            }
            XSSFCell cell17 = row.createCell(17)
            String text17 = invbasdoc.ismngstockbygrswt
            if(text17!=null){
                if(text17=="true"){
                    cell17.setCellValue("Y")
                }
                else{
                    cell17.setCellValue("N")
                }
            }
            XSSFCell cell18 = row.createCell(18)
            String text18 = invbasdoc.isretail
            if(text18!=null){
                if(text18=="true"){
                    cell18.setCellValue("Y")
                }
                else{
                    cell18.setCellValue("N")
                }
            }

            XSSFCell cell19 = row.createCell(19)
            String text19 = invbasdoc.isstorebyconvert
            if(text19!=null){
                if(text19=="true"){
                    cell19.setCellValue("Y")
                }
                else{
                    cell19.setCellValue("N")
                }
            }
            XSSFCell cell20 = row.createCell(20)
            String text20 = invbasdoc.laborflag
            if(text20!=null){
                if(text20=="true"){
                    cell20.setCellValue("Y")
                }
                else{
                    cell20.setCellValue("N")
                }
            }
            XSSFCell cell21 = row.createCell(21)
            String text21 = invbasdoc.length
            if(text21!=null){
                cell21.setCellValue(text21)
            }
            XSSFCell cell22 = row.createCell(22)
            String text22 = invbasdoc.width
            if(text22!=null){
                cell22.setCellValue(text22)
            }
            XSSFCell cell23 = row.createCell(23)
            String text23 = invbasdoc.graphid
            if(text23!=null){
                cell23.setCellValue(text23)
            }
            XSSFCell cell24 = row.createCell(24)
            String text24 = invbasdoc.height
            if(text24!=null){
                cell24.setCellValue(text24)
            }
            XSSFCell cell25 = row.createCell(25)
            String text25 = invbasdoc.sealflag
            if(text25!=null){
                if(text25=="true"){
                    cell25.setCellValue("Y")
                }else{
                    cell25.setCellValue("N")
                }
            }
            XSSFCell cell26 = row.createCell(26)
            String text26 = invbasdoc.setpartsflag
            if(text26!=null){
                if(text26=="true"){
                    cell26.setCellValue("Y")
                }else{
                    cell26.setCellValue("N")
                }
            }
            XSSFCell cell27 = row.createCell(27)
            String text27 = invbasdoc.shipunitnum
            if(text27!=null){
                cell27.setCellValue(text27)
            }
            XSSFCell cell28 = row.createCell(28)
            def text28 = invbasdoc.storeunitnum
            if(text28!=null){
                cell28.setCellValue(text28)
            }
            XSSFCell cell29 = row.createCell(29)
            def text29 = invbasdoc.unitvolume
            if(text29!=null){
                cell29.setCellValue(text29)
            }
            XSSFCell cell30 = row.createCell(30)
            def text30 = invbasdoc.unitweight
            if(text30!=null){
                cell30.setCellValue(text30)
            }
            XSSFCell cell31 = row.createCell(31)
            def text31 = invbasdoc.weitunitnum
            if(text31!=null){
                cell31.setCellValue(text31)
            }
            XSSFCell cell32 = row.createCell(32)
            String text32 = invbasdoc.memo
            if(text32!=null){
                cell32.setCellValue(text32)
            }




        }
        response.setContentType("application/octet-stream");
        def fileName=URLEncoder.encode(filename, "utf-8")
        response.setHeader("Content-Disposition", "attachment; filename=\"" +fileName+".xlsx\"");
        ServletOutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream)




        ouputStream.flush()
        ouputStream.close()
    }
}
