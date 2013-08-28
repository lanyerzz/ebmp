package com.app.core.beans

import java.beans.PropertyEditorSupport

/**
 * Created with IntelliJ IDEA.
 * User: lanyer
 * Date: 13-1-12
 * Time: 上午2:11
 * To change this template use File | Settings | File Templates.
 */
class CustomDateBinder  extends PropertyEditorSupport{
    @Override
    void setAsText(String text) throws IllegalArgumentException {
        if(text)
            this.setValue(new Date(text.toLong()))
    }


}
