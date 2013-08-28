package com.app.util

import com.app.ywms.rk.hyjh.Yhyjh
import org.hibernate.Criteria
import org.hibernate.criterion.*
import org.hibernate.transform.ResultTransformer

public class CriteriaHelper {

	def alias=[]
    def criteria
    ProjectionList projectionList
	public CriteriaHelper(_criteria){
		this.criteria=_criteria
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
        criteria.add(Restrictions.conjunction())

		//criteria.setMaxResults(50)//设置最大
	}
	
	public CriteriaHelper(_criteria,json){
        this.criteria=_criteria
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		this.code(json)
	}

    public void addProjection(String field){
       def name=  this.alias(field)
        if(projectionList==null) {
            projectionList = Projections.projectionList();
            criteria.setProjection(projectionList)
         }
    projectionList.add(Property.forName(name))
    }
    /**
     * 查询
     * @return
     */
	public def list(){
		return criteria.criteria.list()
	}
    /**
     *
     * @param params 提取分页参数
     * @param defaultSorft    默认排序
     * @return   []
     */
	public def list(params,defaultSorft){
	    return	this.list(params, defaultSorft,'')

	}
    public def list(params,defaultSorft,defaultOrder){
        this.page(params, defaultSorft,defaultOrder)
        return criteria.criteria.list()
    }

    /**
     *
     * @param names     字段
     * @param params    params 参数   提取排序参数
     * @param defaultSorft  默认排序
     * @return
     */
    public def listMap(names,params,defaultSorft){

       return this.listMap(names,params,defaultSorft,'')
    }

    public def listMap(names,params,defaultSorft,defaultOrder){
        this.page(params, defaultSorft,defaultOrder)
        criteria.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
        return this.listMap(names)
    }

    public def listMap(names){

        names.each {
            this.addProjection(it)
        }
        def rt=[]
        def result= criteria.criteria.list()
        result.each { r->
            def mpValue=[:]
            int index=0
            names.each {
                mpValue[it]= r[index]
                index++
            }
         rt << mpValue
        }
        return rt
    }
	public def list(params){
		
		return list(params,null)
	}
	
	//criteria.groupProperty(_loginCorp)
	public long count(){
		criteria.setProjection( Projections.rowCount() )
		//criteria.orderEntries.clear()

		return criteria.criteria.list()[0]
	}
	
	
	public  void createCriteria(name,name_){
		if(alias.contains(name))
			return;
		alias<< name

		 criteria.createAlias(name,name_,Criteria.LEFT_JOIN)
	}

    public  void createCriteria(name,name_,joinType){
        if(alias.contains(name))
            return;
        alias<< name

        criteria.createAlias(name,name_,joinType)
    }

    def static  pageMap(params){
        pageMap(params,null,null)
    }

    def static  pageMap(params,defaultSorft,defaultOrderBy){
        if(!params.rows) {//无分页信息

            return []
        }
        int pageSize=params.getLong('rows')

        if(!params.page) {//无分页信息

            return []
        }
        int page=params.getLong('page')





        def _sortBy=params.sort?:defaultSorft
        def _order=params.order?:defaultOrderBy





      return   [max: pageSize, offset: pageSize*(page-1),sort:_sortBy,order:_order]

    }
	
	/**
	 * 
	 * @param params
	 */
	public  void pageSet(params){
		
		
		if(!params.rows) {//无分页信息
			
			return
		}
		int pageSize=params.getLong('rows')
		
		if(!params.page) {//无分页信息
			
			return
		}
		int page=params.getLong('page')
		
		criteria.setFirstResult(pageSize*(page-1))
		criteria.setFetchSize(pageSize)
		
		criteria.setMaxResults(pageSize)
		
		

	}
	
	public void page(params,defaultSorft,defaultOrderBy){
		this.pageSet(params);
		this.pageSort(params, defaultSorft,defaultOrderBy)
	}
	
	public  void pageSort(params,defaultSorft,defaultOrderBy){
		
		//sort:carNo, order:desc


		
		def _sortBy=params.sort?:defaultSorft
        if(!_sortBy) return
		def _order=params.order?:defaultOrderBy

		def sortBy=_sortBy.split(',')
        def orderBy=_order.split(',')


		
		sortBy.eachWithIndex {elem, i ->
			
			def name=alias(elem)

			if(orderBy.size()>i){
                if(orderBy[i]=="desc")
                    criteria.addOrder( Order.desc(name))
                else
                    criteria.addOrder( Order.asc(name))
            }else{
                criteria.addOrder( Order.desc(name))
            }

				
				//criteria.groupProperty(name)
			
		}
	}
	
	

	/**
	 * 
	 * @param criteria
	 * @param fieldName
	 * @param _aliasMap
	 * @return
	 */
	public  def alias(fieldName){
		
		def fieldNames=fieldName.split("\\.")
		

		 def name=fieldName
		 if(fieldNames.length==2 && !name.endsWith(".id")){
			 createCriteria(  fieldNames[0],fieldNames[0])
			 
		 }else if(fieldNames.length>2 && name.endsWith(".id")){
			 
			 for(int index=0;index<fieldNames.length-2;index++){
				 if(index==0){
					 createCriteria(  fieldNames[index], fieldNames[index])
				 }
				 else{
					 
					 createCriteria(  "${fieldNames[index-1]}.${fieldNames[index]}",fieldNames[index])
				 }
			 }
			 
			 
					name=fieldNames[fieldNames.length-3]+'.'+fieldNames[fieldNames.length-2]+"."+fieldNames[fieldNames.length-1]
			 
		 }else if(fieldNames.length>2 && !name.endsWith(".id")){
			 def c
			 for(int index=0;index<fieldNames.length-1;index++){
				 if(index==0){
					 createCriteria(  fieldNames[index], fieldNames[index])
				 }
				 else{
					 
					 createCriteria(  "${fieldNames[index-1]}.${fieldNames[index]}",fieldNames[index])
				 }
			 }
			 
			 
			 name=fieldNames[fieldNames.length-2]+"."+fieldNames[fieldNames.length-1]
		 }
		 
		 return name

	}

    def add( restrictions){
        criteria.add(restrictions)
    }

	public  void code( jsobj){
		
		
		
       

		if(jsobj==null) return ;
		if(jsobj.operator==null) return ;
		if(jsobj.criterias==null) return ;
        //SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd");
		def criterias=[]
		if(jsobj.criteria instanceof org.codehaus.groovy.grails.web.json.JSONObject){
			criterias <<jsobj.criteria
		}else{
		criterias=jsobj.criterias
		}

       def subCriteria
 

        //判断 and or
		if(jsobj.operator=="and"){
            subCriteria =Restrictions.conjunction()
			criteria.add(subCriteria)

		}else if(jsobj.operator=="or"){
            subCriteria=Restrictions.disjunction()
			criteria.add(subCriteria)

		}else if (jsobj.operator=='not'){
			subCriteria =Restrictions.conjunction()
            criteria.add(Restrictions.not(subCriteria))
        }

       
		

		for(int i=0;i<criterias.size();i++) {
			def cr= criterias[i]

			

			if(cr.criterias==null){
				def value=cr.value
                if(!cr.fieldName) continue
               // criteria.createAlias('','')
               def fieldNames=cr.fieldName.split("\\.")
			   

                def name=alias(cr.fieldName)
                


				switch(cr.type){
					case 'date'://日期

						value=new Date(value.toString().toLong());
						 break;
					case 'int'://整型

							 value=value.toString().toInteger();
							  break;
                    case 'number'://整型

                        value=value.toString().toBigDecimal();
                        break;
                    case 'boolean'://
                        value = value.toString().toBoolean()
                        break
					default:
						break;
				}



				if(cr?.operator){
					switch (cr?.operator) {
					case 'contains'://like

                        subCriteria.add(Restrictions.like(name, "%"+value+"%"))
					break;
					case 'equals':
                        subCriteria.add(Restrictions.eq(name,value))
					break;

					case 'notEqual':
                        subCriteria.add(Restrictions.ne(name, value))
					break;

					case 'iEquals':
                        subCriteria.add(Restrictions.eq(name,value))
					break;

					case 'iNotEqual':
                        subCriteria.add(Restrictions.ne(name, value))
					break;

					case 'greaterThan':
                        subCriteria.add(Restrictions.gt(name, value))
					break;

					case 'lessThan':
                        subCriteria.add(Restrictions.lt(name, value))
					break;

					case 'greaterOrEqual':
                        subCriteria.add(Restrictions.ge(name, value))
					break;



					case 'lessOrEqual':
                        subCriteria.add(Restrictions.le(name, value))
					break;

					case 'startsWith':
                        subCriteria.add(Restrictions.like(name, value+"%"))
					break;
					case 'endsWith':
                        subCriteria.add(Restrictions.like(name, "%"+value))
					break;

					case 'iContains':
                        subCriteria.add(Restrictions.ilike(name, "%"+value+"%"))
					break;

					case 'iStartsWith':
                        subCriteria.add(Restrictions.ilike(name, value+"%"))
					break;


					case 'iEndsWith':
                        subCriteria.add(Restrictions.ilike(name, "%"+value))
					break;

					case 'notContains':
                        subCriteria.add(Restrictions.not(Restrictions.like(name, "%"+value+"%")))
					break;

					case 'isNull':
                        subCriteria.add(Restrictions.isNull(name))
					break;


					case 'notNull':
                        subCriteria.add(Restrictions.isNotNull(name))
					break;
					case 'inSet':
                        subCriteria.add(Restrictions.in(name,value))
					break;
                    case 'notStartsWith':
                        subCriteria.add(Restrictions.not(Restrictions.like(name,value+"%")))
                    break;
                    case 'notEndsWith':
                         subCriteria.add(Restrictions.not(Restrictions.like(name,"%"+value)))
                    break;
					default:
						break;
					}
				}



				//
//				iNotContains
				//iNotStartsWith
				//iNotEndsWith
				//iBetweenInclusive
				//regexp
				//iregexp




				//notInSet
				//between
				//betweenInclusive  <= and >=

			}else{
                code(cr)
			}

		}

	return 
	}



}
