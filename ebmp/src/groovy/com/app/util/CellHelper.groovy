package com.app.util

import org.apache.poi.ss.usermodel.Cell
import com.app.exception.BusinessException

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 12-9-5
 * Time: 下午11:28
 * To change this template use File | Settings | File Templates.
 */
class CellHelper {
    public static def stringCellValue(Cell c){
        if(!c) return null
        if(c.cellType==Cell.CELL_TYPE_BLANK) return null
        if(c.cellType!=Cell.CELL_TYPE_STRING)
            throw new BusinessException("行号：${c.rowIndex+1},列:${c.columnIndex+1},数据类型不正确,请修改为字符型！")
         return c.stringCellValue
    }

    public static def  numberCellValue(Cell c){
        if(!c) return null
        if(c.cellType==Cell.CELL_TYPE_BLANK) return null
		
		if(c.cellType==Cell.CELL_TYPE_STRING){
			println c.stringCellValue
		}
		
        if(c.cellType!=Cell.CELL_TYPE_NUMERIC){
			println 'read num.....'
            throw new BusinessException("行号：${c.rowIndex+1},列:${c.columnIndex+1},数据类型不正确,请修改为数字型！")
        }
        return c.numericCellValue
    }
}
