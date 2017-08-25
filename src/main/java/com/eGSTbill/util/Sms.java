/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eGSTbill.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import com.eGSTbill.model.SendSms;
import com.eGSTbill.model.SmsModel;
/**
 *
 * @author srinivasa.dova
 */
public class Sms {
	public static boolean sendMessage(ServletContext objContext,SmsModel smsModel){
		boolean bSentSms = false;
		String postData="";
		String retval = "";
		String Username ="";
		String Password = "";
		//String MobileNo = "917411184869";
		String MobileNo = smsModel.getSendTo();
		//String Message = "Test message from Dova Soft Dova Soft Dova Soft123456 ";
		String Message = smsModel.getMessage();
		String SenderID = "";
		InputStream input = null;
		//String mailContent = null;
		String smsUrl = null;
		//String smsOtpText = null;
		try{
			Properties prop = new Properties();
			String propertiespath = objContext.getRealPath("Resources"+ File.separator + "eGSTbill.properties");
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			Username =prop.getProperty("smsUserName");
			Password =prop.getProperty("smsPassword");
			SenderID =prop.getProperty("smsSenderID");
			smsUrl =prop.getProperty("smsUrl");
			
			// System.out.println("Username = " + Username);
			// System.out.println("Password = " + Password);
			// System.out.println("SenderID = " + SenderID);
			// System.out.println("smsUrl = " + smsUrl);
			
			postData += "user=" + Username + "&password=" + Password + "&GSM=" +
					MobileNo +"&sender=" + SenderID + "&SMSText=" + Message;
			 System.out.println("postData============"+postData);
			
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
			// System.out.println("retval==="+retval);
			
			bSentSms = true;
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Error While sending............."+e);
		}
		return bSentSms;
	}
	public boolean sendMessage(@Context HttpServletRequest request, @QueryParam("userMobile") String userMobile,
			String sMessage) throws IOException {
		boolean bSentSms = false;
		//Sms sms = new Sms();

		SmsModel smsModel = CommonUtils.getSmsProperties(request.getServletContext());
		/*smsModel.sets
		smsDTO.setSendTo("91" + userMobile);
		smsDTO.setMessage(sMessage);*/
		System.out.println("in to sendMessage "+userMobile);
		//smsDTO.setSendTo("91" + loginMobile);
		smsModel.setSendTo("91" + userMobile);
		smsModel.setMessage(sMessage);
		System.out.println("in to sendMessage==="+smsModel);
		System.out.println("in to setSendTo==="+userMobile);

		bSentSms = sendMessage(request.getServletContext(), smsModel);

		return bSentSms;
	}
}
