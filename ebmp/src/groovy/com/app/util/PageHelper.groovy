package com.app.util

import org.hibernate.Criteria;
import org.hibernate.criterion.Order
import org.hibernate.criteria.*;
import com.app.dto.TDTO
import grails.converters.JSON

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 12-7-25
 * Time: 上午12:57
 * To change this template use File | Settings | File Templates.
 */
class PageHelper {
	
	
	
	
	
	
	
    /**
     * 根据参数转换为分页 排序参数
     * @param params
     */
    public static def pageMap(params,defaultSorft){
		String _sortBy=params._sortBy?:defaultSorft
		
		def desc =_sortBy?.startsWith('-')
		def order ='esc'
		if(desc){
			_sortBy=_sortBy.replace('-','')
			order='desc'
		}
		
		
		if(!params._startRow) {//无分页信息
			def p=[sort: _sortBy,order: order]
			return  p
		}
        int _startRow=params.getLong('_startRow')
		
		if(!params._endRow) {//无分页信息
			def p=[sort: _sortBy,order: order]
			return  p
		}
        int _endRow=params.getLong('_endRow')
        
        
        def p=[sort: _sortBy,order: order,max: _endRow-_startRow,offset: _startRow]

    }

    /**
     * 根据   分页信息设置  DTO 客户端分页信息数据
     * @param data
     * @param count
     * @param params
     */
    public static def pageDTO(data,count,params){
		if(!params._startRow) {//无分页信息
			 def dto= new TDTO(data:data )
			return  dto
		}
        int startRow=params.getLong('_startRow')
		
		if(!params._endRow) {//无分页信息
			def dto= new TDTO(data:data )
		   return  dto
	   }
        int endRow=params.getLong('_endRow')
        def dto= new TDTO(data:data,response: [startRow:startRow,endRow:endRow>count ? count :endRow,totalRows:count ] )
    }
}
