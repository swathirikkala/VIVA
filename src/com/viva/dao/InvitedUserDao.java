package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.dto.InvitedUser;
import com.viva.util.Constants;
import com.viva.util.MailSender;

public class InvitedUserDao {
	
	public String inviteUser(InvitedUser iu) {
		String query ="insert into user_invite values (?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setString(1, iu.getUserMailId());
			ps.setInt(2, iu.getTeam());
			ps.setInt(3, iu.getDepartment());
			ps.setString(4, "invited");
			ps.setString(5, iu.getToken());
			ps.setString(6, iu.getInvitedBy());
			ps.setString(7, iu.getInvitedOn());
			ps.setString(8, iu.getDesignation());
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

	public InvitedUser getDetailsByToken(String token) {
		String query  = "select * from user_invite where token = ?";
		InvitedUser invitedUser = null;
		List<InvitedUser> users = null;
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setString(1, token);
			ResultSet rs = ps.executeQuery();
			users= parseInvitedUsers(rs);
			if(users != null) {
				invitedUser = users.get(0);
			}
			System.out.println("getDetailsByToken Query : " + ps.toString());
		}catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getDetailsByToken response : "+ invitedUser);
		return invitedUser; 
	}

	private List<InvitedUser> parseInvitedUsers(ResultSet rs) {
		List<InvitedUser> invites = new ArrayList<InvitedUser>();
		try {
			while(rs!=null && rs.next()) {
				InvitedUser iu = new InvitedUser();
				iu.setUserMailId(rs.getString(1));
				iu.setTeam(rs.getInt(2));
				iu.setDepartment(rs.getInt(3));
				iu.setStatus(rs.getString(4));
				iu.setToken(rs.getString(5));
				iu.setInvitedBy(rs.getString(6));
				iu.setInvitedOn(rs.getString(7));
				iu.setDesignation(rs.getString(8));
				invites.add(iu);
			}
		} catch (SQLException e) {
			System.err.println("Exception in parsing invite users");
			e.printStackTrace();
		}
		return invites;
	}
}
