package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.viva.db.util.DBConnectionUtil;
import com.viva.dto.InitedUser;
import com.viva.util.Constants;
import com.viva.util.MailSender;

public class InvitedUserDao {
	
	public String inviteUser(InitedUser iu) {
		String query ="insert into user_invite values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setString(1, iu.getUserMailId());
			ps.setInt(2, iu.getTeam());
			ps.setInt(3, iu.getDepartment());
			ps.setString(4, "invited");
			ps.setString(5, iu.getToken());
			ps.setString(6, iu.getInvitedBy());
			ps.setString(7, iu.getInvitedOn());
			int insertResult = ps.executeUpdate();
			if(insertResult >0) {
				String inviteLink="http://localhost:8080/viva/completeRegistration?token="+iu.getToken();
				MailSender.sendNotification(iu.getUserMailId(), "Registration invitation", inviteLink);
				return Constants.SUCCESS;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return Constants.ERROR;
		}

		return Constants.FAIL;
	}
}
