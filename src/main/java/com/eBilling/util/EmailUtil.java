package com.eBilling.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;

import com.eBilling.model.Register;

public class EmailUtil {
	Logger objLogger = Logger.getLogger(EmailUtil.class);

	public static String sendEmail(Register objEmailBean,
			ServletContext objContext) throws AddressException,
			MessagingException, IOException {
		String reslutString = null;
		String toAddress = null;
		String ccAddress = null;
		String bccAddress = null;
		Map<String, String> mapInlineImages = new HashMap<String, String>();
		Properties prop = new Properties();
		InputStream input = null;
		try {

			String propertiespath = objContext.getRealPath("Resources"
					+ File.separator + "DataBase.properties");
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String userName = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
			String mailContent = null;

			mapInlineImages.put(
					"image1",
					objContext.getRealPath("images" + File.separator
							+ "DovaSoftLogo.png"));
			//mailContent = prop.getProperty("forgot_password");
			ccAddress = prop.getProperty("ccadmin");
			bccAddress = prop.getProperty("bccadmin");
			try {
				// System.out.println("host = " + host);
				// System.out.println("port = " + port);
				// System.out.println("userName = " + userName);
				// System.out.println("password = " + password);
				// System.out.println("toAddress = " + toAddress);
				// System.out.println("ccAddress = " + ccAddress);
				// System.out.println("bccAddress = " + bccAddress);
				mailContent = prop.getProperty("register_user");
				mailContent = mailContent
							.replace("_name_", objEmailBean.getRegName());
					mailContent = mailContent.replace("_user_",
							objEmailBean.getEmail());
					mailContent = mailContent.replace("_pass_",
							objEmailBean.getPassword());
					mailContent = mailContent.replace("_mob_",
							objEmailBean.getMobileNo());
					toAddress = objEmailBean.getEmail();
					
				EmbeddedEmailUtil.send(host, port, userName, password,
						toAddress, ccAddress, bccAddress, "Login Details",
						mailContent, mapInlineImages);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return reslutString;
	}
	
	public static String sendForgetEmail(Register objEmailBean,
			ServletContext objContext) throws AddressException,
			MessagingException, IOException {
		String reslutString = null;
		String toAddress = null;
		String ccAddress = null;
		String bccAddress = null;
		Map<String, String> mapInlineImages = new HashMap<String, String>();
		Properties prop = new Properties();
		InputStream input = null;
		try {

			String propertiespath = objContext.getRealPath("Resources"
					+ File.separator + "DataBase.properties");
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String userName = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
			String mailContent = null;

			mapInlineImages.put(
					"image1",
					objContext.getRealPath("images" + File.separator
							+ "DovaSoftLogo.png"));
			//mailContent = prop.getProperty("forgot_password");
			ccAddress = prop.getProperty("ccadmin");
			bccAddress = prop.getProperty("bccadmin");
			try {
				// System.out.println("host = " + host);
				// System.out.println("port = " + port);
				// System.out.println("userName = " + userName);
				// System.out.println("password = " + password);
				// System.out.println("toAddress = " + toAddress);
				// System.out.println("ccAddress = " + ccAddress);
				// System.out.println("bccAddress = " + bccAddress);
				mailContent = prop.getProperty("forgot_password");
				mailContent = mailContent.replace("_name_", objEmailBean.getRegName());
				mailContent = mailContent.replace("_pass_",	objEmailBean.getPassword());
					toAddress = objEmailBean.getEmail();
					
				EmbeddedEmailUtil.send(host, port, userName, password,
						toAddress, ccAddress, bccAddress, "Login Details",
						mailContent, mapInlineImages);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return reslutString;
	}
}
