package com.app.sv.sm

import com.app.exception.BusinessException
import com.app.sm.user.SmUser
import com.app.sm.user.SmUserSmRoles

class SmUserService {

    /**
     *
     * @return
     */
    def saveLinkRole(userid,smUserSmRoles){

        def user
        if (userid)
            user=SmUser.get(userid)
        if (user)
            SmUserSmRoles.removeAll(user)//删除原有的权限
        else{
           throw new BusinessException('用户不存在！')

        }

        SmUserSmRoles.saveAll(smUserSmRoles)
    }
}
