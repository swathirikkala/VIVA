package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.UsBv;
import com.viva.util.Constants;

public class UsBvDao {
	public String addBvsToUs(int usId, String[] bvs, String[] comments) {
		PreparedStatement ps = QueryBuilder.getAddBvsToUsPs(usId, bvs, comments);
		try {
			int executeUpdateResult = ps.executeUpdate();
			if (executeUpdateResult > 0) {
				return Constants.SUCCESS;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return Constants.ERROR;
		}
		return Constants.FAIL;
	}

	public List<UsBv> getBvsByUsId(int userStoryId) {
		List<UsBv> bvs = null;
		PreparedStatement ps = QueryBuilder.getBvsByUsIdPs(userStoryId);
		try {
			ResultSet rs = ps.executeQuery();
			bvs = parseBvs(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getBvsByUsId : " + bvs.size());
		return bvs;
	}

	public List<UsBv> getUsBvsByUsId(int usId) {
		List<UsBv> usBvs = new ArrayList<UsBv>();
		String sql = "SELECT * FROM us_bv where usid = ?";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setInt(1, usId);
			ResultSet rs = ps.executeQuery();
			usBvs = parseBvs(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getUsBvsByUsId :::: " + usBvs);
		return usBvs;
	}

	private List<UsBv> parseBvs(ResultSet rs) {
		List<UsBv> bvs = new ArrayList<UsBv>();
		try {
			while (rs != null && rs.next()) {
				UsBv ub = new UsBv();
				ub.setUsId(rs.getInt(1));
				ub.setBvId(rs.getInt(2));
				ub.setStatus(rs.getBoolean(3));
				ub.setViva(rs.getInt(4));
				ub.setComment(rs.getString(5));
				bvs.add(ub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bvs;
	}
	public String updateBvsOfUs(int usid, String [] bvids, String [] comments) {
		String uids = "";
		for(int a =0 ; a< bvids.length ; a++) {
			uids += bvids[a];
			if(a < bvids.length -1) {
				uids+=" , ";
			}
		}
		String sql = "delete from us_bv where bvid not in ("+uids+") and usid = " + usid;
		String response=Constants.FAIL;
		try {
//			int deleteResponse = DBConnectionUtil.insert(sql);
//			System.out.println("Number of bvs deleted from us is : " + deleteResponse);
			response = Constants.SUCCESS;
			String query = "insert into us_bv(usid,bvid,comment) values ";
			for(int i=0; i< bvids.length ; i++) {
				query += "(?,?,?)";
				if (i < bvids.length - 1) {
					query += ",";
				}
			}
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(query);
			int c = 1;
			for(int i = 0 ; i< bvids.length ; i++) {
				ps.setInt(c++, usid);
				int bvid= 0;
				try {
					bvid = Integer.valueOf(bvids[i]);
				}catch(Exception e) {
					System.out.println("Exception in bvid convertion at update us bvs");
				}
				ps.setInt(c++, bvid);
				ps.setString(c++, comments[i]);
			}

			System.out.println("inesert new us bvs ps : " + ps.toString() );
			int updateBvResp = ps.executeUpdate();
			System.out.println("Update us bvs response : " + updateBvResp);
		} catch (SQLException e) {
			e.printStackTrace();
			response = Constants.ERROR;
		}
		
		return response;
	}
}
