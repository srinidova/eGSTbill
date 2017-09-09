package com.eGSTbill.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestParam;

import com.eGSTbill.model.SmsModel;
import com.eGSTbill.model.User;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.springframework.web.multipart.MultipartFile;  
import org.springframework.web.multipart.commons.*;


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
public static SmsModel getSmsProperties(ServletContext objContext) throws IOException {
		
		User user = null;
		SmsModel smsModel = null;
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
			 smsModel = new SmsModel();
			
			input = new FileInputStream(propertiespath);
			prop.load(input);
			smsUserMobile = prop.getProperty("smsUserMobile");
			//smsUserName = prop.getProperty("smsUserName");
			smsPassword = prop.getProperty("smsPassword");
			smsSenderID = prop.getProperty("smsSenderID");
			smsUrl = prop.getProperty("smsUrl");
			//smsSenderID = prop.getProperty("smsSenderID");
			
			/*user.setMobile(smsUserMobile);
			user.setPassword(smsPassword);*/
			
			smsModel.setPassword(smsPassword);
			smsModel.setMobile(smsUserMobile);
			smsModel.setSenderId(smsSenderID);
			smsModel.setUrl(smsUrl);
			
			/*System.out.println("in to getSmsProperties smsSenderID==="+smsSenderID);
			System.out.println("in to getSmsProperties smsPassword==="+smsPassword);
			System.out.println("in to getSmsProperties smsUserMobile==="+smsUserMobile);
			System.out.println("in to getSmsProperties smsUrl==="+smsUrl);*/
			
			/*smsDTO.setUserName(smsUserName);
			smsDTO.setPassword(smsPassword);
			smsDTO.setUrl(smsUrl);
			smsDTO.setSenderId(smsSenderID);*/
		}
		return smsModel;
	}
	public static String getPin (){

	int x = (int)(Math.random() * 9);
    x = x + 1;
    String randomPIN = (x + "") + ( ((int)(Math.random()*1000)) + "" );
	if(randomPIN.length() < 4){
		getPin ();
	}

	return randomPIN;
 }
	/*@POST
	@Path("/upload")*/
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public void uploadFile(@Context HttpServletRequest request, @RequestParam("file") InputStream uploadedInputStream,
			@RequestParam("fileDetail")  String fileDetail) throws IOException {
		String sFileExtn = null;
		String destination = "D:/currentworking/usgfa/WebContent/images/uploads/";
		HashMap<String, String> hm = null;
		HttpSession session = request.getSession();
		
		if (uploadedInputStream != null && fileDetail != null) {
			sFileExtn = FilenameUtils.getExtension(fileDetail);

			if (StringUtils.isNotEmpty(sFileExtn) && sFileExtn.equalsIgnoreCase("zip")) {
				hm = unZipIt(uploadedInputStream, destination);
			} else {
				hm = fileSave(request, uploadedInputStream, fileDetail, destination);
			}
		}
		if (hm != null && hm.size() > 0) {
			session.setAttribute("UPLOADED_FILELIST", hm);
		}

	}

	/**
	 * Utility method to save InputStream data to target location/file
	 * 
	 * @param inStream
	 *            - InputStream to be saved
	 * @param target
	 *            - full path to destination file
	 */
	private void saveToFile(InputStream inStream, String target)
			throws IOException {
		OutputStream out = null;
		int read = 0;
		byte[] bytes = new byte[1024];
		out = new FileOutputStream(new File(target));
		while ((read = inStream.read(bytes)) != -1) {
			out.write(bytes, 0, read);
		}
		out.flush();
		out.close();
	}

	/**
	 * Creates a folder to desired location if it not already exists
	 * 
	 * @param dirName
	 *            - full path to the folder
	 * @throws SecurityException
	 *             - in case you don't have permission to create the folder
	 */
	private void createFolderIfNotExists(String dirName)
			throws SecurityException {
		File theDir = new File(dirName);
		if (!theDir.exists()) {
			theDir.mkdir();
		}
	}
	
	
	private HashMap<String, String> fileSave(HttpServletRequest request, InputStream uploadedInputStream,
			String fileDetail, String destination) throws IOException {

		String uploadedFileLocation = null;
		HashMap<String, String> hm = new HashMap<String, String>();
		if (uploadedInputStream != null && fileDetail != null) {
			try {
				createFolderIfNotExists(destination);
			} catch (SecurityException se) {
			}
			try {

				String imageId = UUID.randomUUID().toString();
				//uploadedFileLocation = destination + imageId + "."+ FilenameUtils.getExtension(fileDetail.getFileName());
				//String sDbFilePath = "images/uploads/" + imageId + "." + FilenameUtils.getExtension(fileDetail.getFileName());
				saveToFile(uploadedInputStream, uploadedFileLocation);
				if (StringUtils.isNotEmpty(uploadedFileLocation)) {
					//hm.put(imageId, sDbFilePath);
				}
			} catch (IOException e) {
				// return Response.status(500).entity("Can not save
				// file").build();
			}
		}
		return hm;
	}
	
	public HashMap<String, String> unZipIt(InputStream inputStream, String destination) {
		HashMap<String, String> hm = new HashMap<String, String>();
		boolean overwrite = false;

		try {
			byte[] buf = new byte[1024];
			ZipInputStream zipinputstream = null;
			ZipEntry zipentry;
			zipinputstream = new ZipInputStream(inputStream);

			zipentry = zipinputstream.getNextEntry();

			while (zipentry != null) {
				int n;
				FileOutputStream fileoutputstream;

				String sFileName = zipentry.getName();
				String sFileExtn = sFileName.substring(sFileName.lastIndexOf(".") + 1);
				String sImageId = UUID.randomUUID().toString();
				File newFile = new File(sImageId + "." + sFileExtn);
				if (zipentry.isDirectory()) {
					newFile.mkdirs();
					zipentry = zipinputstream.getNextEntry();
					continue;
				}

				if (newFile.exists() && overwrite) {
					newFile.delete();
				}

				String sOutFile = destination + sImageId + "." + sFileExtn;
				String sDbFilePath = "images/uploads/" + sImageId + "." + sFileExtn;
				if (StringUtils.isNotEmpty(sOutFile)) {
					hm.put(sImageId, sDbFilePath);
				}

				fileoutputstream = new FileOutputStream(new File(sOutFile));

				while ((n = zipinputstream.read(buf, 0, 1024)) > -1) {
					fileoutputstream.write(buf, 0, n);
				}

				fileoutputstream.close();
				zipinputstream.closeEntry();
				zipentry = zipinputstream.getNextEntry();

			}

			zipinputstream.close();
		} catch (Exception e) {
			throw new IllegalStateException("Can't unzip input stream", e);
		}
		return hm;
	}
	@SuppressWarnings("unused")
	private HashMap<String, String> fileSave(HttpServletRequest request, @RequestParam("file") InputStream file,
			 String destination) throws IOException {

		String uploadedFileLocation = null;
		HashMap<String, String> hm = new HashMap<String, String>();
		if (file != null ) {
			try {
				createFolderIfNotExists(destination);
			} catch (SecurityException se) {
			}
			try {

				String imageId = UUID.randomUUID().toString();
				uploadedFileLocation = destination + imageId ;
				String sDbFilePath = "images/uploads/" + imageId   ;
				saveToFile(file, uploadedFileLocation);
				if (StringUtils.isNotEmpty(uploadedFileLocation)) {
					hm.put(imageId, sDbFilePath);
				}
			} catch (IOException e) {
				// return Response.status(500).entity("Can not save
				// file").build();
			}
		}
		return hm;
	}
	
	public String fileSave(InputStream inStream, String targetDir, String fileName){
		boolean bRes = false;
		//System.out.println("targetDir=="+targetDir+"--------fileName=="+fileName+"----------inStream=="+inStream.toString());
		String sUploadPath = null;
		try {
			createFolderIfNotExists(targetDir);
			
			sUploadPath = targetDir + fileName;
			//System.out.println("sUploadPath=="+sUploadPath);
			saveToFile(inStream, sUploadPath);
			bRes = true;
		} catch (IOException e) {
			e.printStackTrace();
			//System.out.println("Error in CommonUtils --------fileSave---");
		}
		
		return sUploadPath;
	}
}
