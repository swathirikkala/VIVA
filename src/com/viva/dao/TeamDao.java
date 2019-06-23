package com.viva.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.viva.db.util.DBConnectionUtil;
import com.viva.dto.Team;

public class TeamDao {

	public List<Team> getAllTeams() {
		String query = "select * from team";
		ResultSet rs = DBConnectionUtil.getData(query);
		List<Team> teams = parseTeams(rs);
		return teams;
	}

	private List<Team> parseTeams(ResultSet rs) {
		List<Team> teams = new ArrayList<Team>();
		try {
			while (rs != null && rs.next()) {
				Team team = new Team();
				team.setTeamId(rs.getInt(1));
				team.setTeamName(rs.getString(2));
				team.setStatus(rs.getBoolean(3));
				teams.add(team);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return teams;
	}

	public static void main(String[] args) {
		System.out.println(new TeamDao().getAllTeams());
	}

	public Map<Integer, Team> getTeamMap() {
		Map<Integer, Team> teamMap = new HashMap<Integer, Team>();
		for (Team t : getAllTeams()) {
			teamMap.put(t.getTeamId(), t);
		}
		return teamMap;
	}

}
