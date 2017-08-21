package com.eGSTbill.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;
import java.util.Properties;
import javax.servlet.ServletContext;
import org.apache.commons.lang.StringUtils;

import com.eGSTbill.model.User;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;


public class CommonUtils {
	public static String getAutoGenId(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	
	public static String getDate() {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		 String regDate = dateFormat.format(cal.getTime());
		return regDate;
	}
	public static String generatePIN() 
	{   
	    int x = (int)(Math.random() * 9);
	    x = x + 1;
	    String randomPIN = (x + "") + ( ((int)(Math.random()*1000)) + "" );
	    return randomPIN;
	}
	public static String getPropertyContent(ServletContext objContext, String sContentFor) throws IOException {

		String sPropertyContent = null;
		Properties prop = null;
		InputStream input = null;
		String propertiespath = null;

		propertiespath = objContext.getRealPath("Resources" + File.separator + "eGSTbill.properties");

		if (StringUtils.isNotEmpty(propertiespath)) {
			prop = new Properties();

			input = new FileInputStream(propertiespath);
			prop.load(input);

			sPropertyContent = prop.getProperty(sContentFor);

		}
		return sPropertyContent;
	}
public static User getSmsProperties(ServletContext objContext) throws IOException {
		
		User user = null;
		Properties prop = null;
		InputStream input = null;
		String propertiespath = null;
		String smsUserName = null;
		String smsPassword = null;
		String smsUserMobile = null;
		String smsUrl = null;
		String smsSenderID = null;
		
		propertiespath = objContext.getRealPath("Resources" + File.separator + "eGSTbill.properties");
		
		if (StringUtils.isNotEmpty(propertiespath)) {
			prop = new Properties();
			user = new User();
			
			input = new FileInputStream(propertiespath);
			prop.load(input);
			smsUserMobile = prop.getProperty("smsUserMobile");
			//smsUserName = prop.getProperty("smsUserName");
			smsPassword = prop.getProperty("smsPassword");
			//smsUrl = prop.getProperty("smsUrl");
			//smsSenderID = prop.getProperty("smsSenderID");
			
			user.setMobile(smsUserMobile);
			user.setPassword(smsPassword);
			
			/*smsDTO.setUserName(smsUserName);
			smsDTO.setPassword(smsPassword);
			smsDTO.setUrl(smsUrl);
			smsDTO.setSenderId(smsSenderID);*/
		}
		return user;
	}
}
