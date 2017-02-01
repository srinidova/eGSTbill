package com.eBilling.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.PurchaserInfo;
import com.eBilling.model.SendSms;
import com.eBilling.util.Sms;

@Service
public class SmsServiceImpl implements SmsService {
	private Logger logger = Logger.getLogger(SmsServiceImpl.class);
	@Autowired
	PurchaseInfoService objPurchaseInfoService;
	@Autowired
	ServletContext objContext;
	
	public boolean smsToPurchase(String sMessage) {
		boolean sJson = false;
		String sMobileNo = null;
		String sSendTo = "";
		List<PurchaserInfo> lstPurchaserInfo = null;
		try {
			lstPurchaserInfo= objPurchaseInfoService.getAllPurchaseInfo();
			for(int i=0;i<lstPurchaserInfo.size();i++){
				PurchaserInfo purchaser= lstPurchaserInfo.get(i);
				sMobileNo = purchaser.getMobileNo();
				if (StringUtils.isNotEmpty(sMobileNo)) {
					if(sSendTo.length()>0){
						sSendTo = sSendTo+","+"91"+sMobileNo;
					}else{
						sSendTo = sSendTo+"91"+sMobileNo;
					}
					System.out.println("sMobileNo==="+sMobileNo+"--------------sSendTo=="+sSendTo);
				}
			}
			if (StringUtils.isNotEmpty(sSendTo)) {
				SendSms Objsmsbean = new SendSms();
				Objsmsbean.setSendTo(sSendTo);
				Objsmsbean.setMessage(sMessage);
				 System.out.println("before sendSms");
				 sJson=Sms.sendMessage(objContext, Objsmsbean);
				System.out.println("afetr sendSms");
			}
		} catch (Exception e) {
			//objLogger.info("Exception in ProductPopulateServiceImpl in populateProducts()" + e);
			System.out.println("Exception in smsServiceImpl in  smsToPurchase()"+e);
		}
		return sJson;
	}
}
