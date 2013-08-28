package com.app.sm.user

import com.app.bd.corp.BdCorp
import com.app.sm.roles.SmRoles

import org.apache.commons.lang.builder.HashCodeBuilder



class SmUserSmRoles implements Serializable{

	SmUser smUser
	SmRoles smRoles
    BdCorp bdCorp

	boolean equals(other) {
		if (!(other instanceof SmUserSmRoles)) {
			return false
		}

		other.smUser?.id == smUser?.id &&
			other.smRoles?.id == smRoles?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (smUser) builder.append(smUser.id)
		if (smRoles) builder.append(smRoles.id)
		builder.toHashCode()
	}

	static SmUserSmRoles get(String smUserId, String smRolesId) {
		find 'from SmUserSmRoles where smUser.id=:smUserId and smRoles.id=:smRolesId',
			[smUserId: smUserId, smRolesId: smRolesId]
	}

	static SmUserSmRoles create(SmUser smUser, SmRoles smRoles, boolean flush = false) {
		new SmUserSmRoles(smUser: smUser, smRoles: smRoles).save(flush: flush, insert: true)
	}

	static boolean remove(SmUser smUser, SmRoles smRoles, boolean flush = false) {
		SmUserSmRoles instance = SmUserSmRoles.findBySmUserAndSmRoles(smUser, smRoles)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(SmUser smUser) {
		executeUpdate 'DELETE FROM SmUserSmRoles WHERE smUser=:smUser', [smUser: smUser]
	}

	static void removeAll(SmRoles smRoles) {
		executeUpdate 'DELETE FROM SmUserSmRoles WHERE smRoles=:smRoles', [smRoles: smRoles]
	}

	static mapping = {
		id composite: ['smRoles', 'smUser','bdCorp']
		version false
	}
}
