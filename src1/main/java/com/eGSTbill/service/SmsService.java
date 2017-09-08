package com.eGSTbill.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.User;
import com.eGSTbill.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

public class SmsService {

	/*public static boolean sendMessage(ServletContext objContext, User user ,String sMessage) throws IOException {
		boolean bSentSms = false;
		String postData="";
		String retval = "";
		Sms sms = new Sms();
		String smsUrl =sms.getUrl();
		
		// sms = CommonUtils.getSmsProperties(request.getServletContext());
		User mobileNo= user;
		String message=sMessage;
		user.setSendTo("91" + userMobile);
		smsDTO.setMessage(sMessage);

		//bSentSms = sendMessage(request.getServletContext(), sms);
		 postData += "mobileNo=" + mobileNo + "&message=" + message;
			//System.out.println("postData============"+postData);
			
			URL url = new URL(smsUrl);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("POST");
			urlconnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			urlconnection.setDoOutput(true);

			OutputStreamWriter out = new OutputStreamWriter(urlconnection.getOutputStream());
			out.write(postData);
			out.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
			String decodedString;
			while ((decodedString = in.readLine()) != null) {
				retval += decodedString;
			}
			in.close();
			//System.out.println("retval==="+retval);
			
			bSentSms = true;

		return bSentSms;
	}*/
}
