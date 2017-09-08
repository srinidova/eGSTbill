package com.eGSTbill.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.eGSTbill.dao.AutoIncrementDAO;
import com.eGSTbill.model.AutoIncrement;
import com.fasterxml.jackson.databind.ObjectMapper;

public class AutoIncrementService {


	@SuppressWarnings("null")
	public String getAndUpdateBillNo(String  sTableName,  HttpSession objSession){
		ArrayList<AutoIncrement> lstAutoIncrement= null;
	String result = null;
	String sBillNo = null;
	AutoIncrement billNo = null;
	AutoIncrement autoIncrement = null;
	int iIncrementNo = 0;
	String sReturnVal = null;
	Boolean bdone = false;
	
	AutoIncrementDAO dao = new AutoIncrementDAO();
	
	lstAutoIncrement = dao.getBillNo();
	if (lstAutoIncrement == null || lstAutoIncrement.size() > 0) {
		try {
			for(int i = 0; i < lstAutoIncrement.size(); i++){
				autoIncrement  = lstAutoIncrement.get(i);
				
				//sBillNo = autoincrement.getIncrementId();
				iIncrementNo = Integer.parseInt(autoIncrement.getIncrementId());
				
				if (iIncrementNo > 0) {
					iIncrementNo = iIncrementNo + 1;
					
					//System.out.println("in to iIncrementNo   "+iIncrementNo);
					
					//System.out.println("in to Auto increment sReturnVal==="+iIncrementNo);
					
					 autoIncrement.setIncrementId(String.valueOf(iIncrementNo));
					
					 objSession.setAttribute("INCREMENTID", autoIncrement);
					 
					// System.out.println("-----autoIncrement-----"+autoIncrement.getIncrementId()+"---------------------"+autoIncrement.getTableName());
					 
					dao.updateBillNo(autoIncrement);
				}
				
			}
	}
		
		catch(Exception e){
			e.printStackTrace();
		}
	
	
	
}
	return sReturnVal;
	
	
}
	}
	
