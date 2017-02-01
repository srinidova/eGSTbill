package com.eBilling.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.dao.DamageDao;
import com.eBilling.dao.RegisterDao;
import com.eBilling.model.Damage;
import com.eBilling.model.Product;
import com.eBilling.model.ProductStock;
import com.eBilling.model.Register;
import com.eBilling.model.SendSms;
import com.eBilling.service.DamageService;
import com.eBilling.service.DamageServiceImpl;
import com.eBilling.service.ProductPopulateService;
import com.eBilling.service.ProductStockService;
import com.eBilling.service.RegistrationService;
import com.eBilling.service.StockDetailsService;
import com.eBilling.util.CommonUtils;
import com.eBilling.util.EmailUtil;
import com.eBilling.util.Sms;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
public class DamageController {
	@Autowired
	DamageServiceImpl damageServiceImpl;
	@Autowired
	DamageDao damageDao;
	@Autowired
	ProductPopulateService objProductService;
	@Autowired
	ProductStockService objProductStockService;
	@Autowired
	StockDetailsService stockDetailsService;
	
	
	@RequestMapping(value = "damageHome")
	public String damageHome(@ModelAttribute Damage damage, HttpServletResponse objResponce, HttpSession objSession,
			HttpServletRequest objRequest) {

		 System.out.println("From Damage Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		String allprod = null;
		//String getAllProductStock =null;
		try {
			allprod = objProductService.populateProducts();
			sJson = damageServiceImpl.getAllDamage();
			objRequest.setAttribute("allDamages", sJson);
			System.out.println("sJson::::::"+sJson);
			objSession.setAttribute("allProducts", allprod);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return "damageHome";
	}

	@RequestMapping(value = "/damageSave")
	public @ResponseBody String damageSave(@ModelAttribute Damage damage, HttpSession objSession,@RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
		boolean isInsert = false;
		String sJson = "";
		List<Damage> lstDamage = null;
		List<ProductStock> lstProductstock =null;
		 ProductStock productStock=null;
		try {
				String sDamageId = CommonUtils.getAutoGenId();
				damage.setDamageId(sDamageId);
				damage.setProductId(data.getString("productId"));
				damage.setQuantity(data.getString("quantity"));
				damage.setDescription(data.getString("description"));
				damage.setUpdatedBy(CommonUtils.getDate());
				damage.setUpdatedOn(CommonUtils.getDate());
				boolean isExist = damageServiceImpl.checkInQuantity(damage, lstDamage);
				if(isExist){
					lstDamage = damageServiceImpl.updateProductQuantity(damage, lstDamage);
				}else{
					 isInsert = damageServiceImpl.damageSave(damage);
				}
               
					sJson = damageServiceImpl.getAllDamage();
					objProductStockService.deductStock(data.getString("productId"), data.getString("quantity"), sDamageId);
					stockDetailsService.addStockDetails(data.getString("productId"),  data.getString("quantity"), sDamageId, "Damage");
               // damageServiceImpl.updatedStock(productStock, data, lstProductstock);
                
			System.out.println("after req attr ");
		} catch (Exception e) {
			System.out.println("Exception in Product Controller in productSave()");
		}
		System.out.println("it is working");
		return sJson;
	}

	@RequestMapping(value = "/updateDamage")
	public @ResponseBody String updateDamage(@ModelAttribute Damage damage,
			@RequestParam("jsondata") JSONObject data, HttpSession objSession, HttpServletRequest objRequest) {
		boolean isupdate = false;
		String sJson = "";
		List<ProductStock> lstProductstock =null;
		 ProductStock productStock=null;
		try {
			String sDamageId = CommonUtils.getAutoGenId();
			damage.setDamageId(sDamageId);
			damage.setProductId(data.getString("productId"));
			damage.setQuantity(data.getString("quantity"));
			damage.setDescription(data.getString("description"));
			damage.setUpdatedBy(CommonUtils.getDate());
			damage.setUpdatedOn(CommonUtils.getDate());
			

			//updateStock
			objProductStockService.updateProductStock(data.getString("productId"), data.getString("quantity"));
			stockDetailsService.addStockDetails(data.getString("productId"),  data.getString("quantity"), sDamageId, "Damage");
			
			isupdate = damageServiceImpl.updateDamage(damage);
			// System.out.println("isupdate" + isupdate);
			
			
			if (isupdate)
				sJson = damageServiceImpl.getAllDamage();
				//sJson = productStockService.getAllProductStock();
			// System.out.println("update: " + sJson);
		} catch (Exception ex) {
			System.out.println("Exception in  updatePurchaseInfo()");
			ex.printStackTrace();
		}
		return sJson;
	}

	@RequestMapping(value = "/deleteDamage")
	public @ResponseBody String deleteDamage( @RequestParam("jsondata") JSONObject data, HttpSession objSession,
			HttpServletRequest objRequest) throws JsonGenerationException, JsonMappingException, IOException {
		boolean isDelete = false;
		String sJson = "";
		List<ProductStock> lstProductstock =null;
		 ProductStock productStock=null;
		 
		String sDamageId=data.getString("damageId");
		isDelete = damageServiceImpl.deleteDamage(sDamageId);
		
		damageServiceImpl.addDeletedStock(productStock, data, lstProductstock);
		
		if (isDelete) {
			sJson = damageServiceImpl.getAllDamage();
			//sJson = productStockService.getAllProductStock();
			// System.out.println("Delete" + sJson);
		}
		return sJson;
	}
	
	
}