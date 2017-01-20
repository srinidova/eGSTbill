package com.eBilling.baseDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.model.Client;

public class ClientBaseDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO clientInfo(clientId,companyName, address,clientEmail,contactPerson,contactNo,tinNo,uploadLogo,smsSuport,emailSupport,createdDate,smsUrl,smsUserName,smsPassword) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public boolean saveClient(final Client client) {
		boolean isSave = false;
		try{
		
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] { client.getClientId(), client.getCompanyName(),client.getAddress(),client.getClientEmail(),client.getContactPerson(),client.getContactNo(),client.getTinNo(),client.getUploadLogo(),client.getSmsSuport(),client.getEmailSupport(),client.getCreatedDate(),client.getSmsUrl(),client.getSmsUserName(),client.getSmsPassword()});
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}

	public boolean updateClient(Client client) {
		boolean isUpdate = false;
		try {
			System.out.println("clientUpadate=="+client);
			String sql = "UPDATE clientInfo  set companyName = ?, address = ?, clientEmail = ?, contactPerson= ?, contactNo= ?,tinNo= ?,uploadLogo= ?,smsSuport= ?,emailSupport= ?,createdDate= ?,smsUrl =?,smsUserName =?,smsPassword =? where clientId = ? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] {client.getCompanyName(),client.getAddress(),client.getClientEmail(),client.getContactPerson(),client.getContactNo(),client.getTinNo(),client.getUploadLogo(),client.getSmsSuport(),client.getEmailSupport(),client.getCreatedDate(),client.getSmsUrl(),client.getSmsUserName(),client.getSmsPassword(),client.getClientId() });
			System.out.println("update111==="+update);
			System.out.println(sql);
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdate;
	}

	public boolean deleteClient(String clientId) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM clientInfo WHERE clientId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { clientId });
			System.out.println("delete row"+delete);
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}

		return isDelete;
	}

	public List<Client> getClientId(int clientId) {
		List<Client> retlist = null;
		try {
			String sql = "SELECT * from clientInfo where clientId = ? ";
			retlist = jdbcTemplate.query(sql, new Object[] {clientId},
					ParameterizedBeanPropertyRowMapper
							.newInstance(Client.class));
			if (retlist.size() > 0)
				return retlist;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public List<Client> getAllClient() {
		List<Client> retlist = null;
		try {
			String sql = "SELECT * from clientInfo";
			retlist = jdbcTemplate.query(sql,
					ParameterizedBeanPropertyRowMapper
							.newInstance(Client.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}

}

