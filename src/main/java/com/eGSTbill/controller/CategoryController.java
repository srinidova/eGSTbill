package com.eGSTbill.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eGSTbill.model.Category;
import com.eGSTbill.model.Client;
import com.eGSTbill.model.ClientCategory;
import com.eGSTbill.model.Product;
import com.eGSTbill.service.CategoryService;
import com.eGSTbill.service.ClientCategoryService;
import com.eGSTbill.service.ClientService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.util.CommonUtils;

import org.json.JSONObject;

@Controller
public class CategoryController {

	@RequestMapping(value = "/categoryHome")
	public String categoryHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From categoryHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJsonCategory = null;
		String sJson = null;
		try {
			CategoryService bo = new CategoryService();
			sJson = bo.listCategory();
			//System.out.println("in to category home sJson "+sJson);
			if(sJson != null && sJson.length()>0){
				objSession.setAttribute("LISTCATEGORY", sJson);
				
			}
			

		} catch (Exception e) {
			//System.out.println("Exception in CategoryController in categoryHome()");
			e.printStackTrace();
		} finally {

		}
		return "categoryHome";
	}
	
	
	@RequestMapping(value = "/saveCategory")
	public @ResponseBody String saveCategory(@ModelAttribute Category category, HttpSession objSession,
			HttpServletRequest objRequest ) {
		String resultAdd = "fail";
		String sJson = null;
		String sCategoryId = null;
		String clientCategoryAdd = null;
		//String Category = null;
		//System.out.println("in to saveCategory controller");
		try {
			sCategoryId = CommonUtils.getAutoGenId();
			category.setCategoryId(sCategoryId);
			category.setUpdatedBy(CommonUtils.getDate());
			category.setUpdatedOn(CommonUtils.getDate());
			
			CategoryService bo = new CategoryService();
			resultAdd = bo.saveCategory(category);
			
			if (StringUtils.isNotEmpty(resultAdd)) {
				if (resultAdd.equals("fail")) {
					JSONObject json = new JSONObject();
					json.put("status", "ERROR");
					json.put("message", "Error while add client");
					return sJson = json.toString();
				}
				bo = new CategoryService();
				sJson = bo.listCategory();
			}
			HttpSession session = objRequest.getSession();
			String clientId = (String) session.getAttribute("CLIENTID");
			//System.out.println("  clientId    "+clientId);
			
			ClientCategory clientCategory = new ClientCategory();
			clientCategory.setCategoryId(sCategoryId);
			clientCategory.setClientId(clientId);
			
			ClientCategoryService ccs = new ClientCategoryService();
			clientCategoryAdd = ccs.addClientCategory(clientCategory);
			//System.out.println("in to clientcategory "+clientCategoryAdd);
			
			//String sCategory = category.getCategoryId();
			objSession.setAttribute("CATEGORY", sCategoryId);
			
		//	System.out.println("in to category categoryId"+sCategoryId);
			
			
			
		} catch (Exception e) {
			//System.out.println("Exception in ClientController in addClient()");
			e.printStackTrace();
		}
		return sJson;

	}
	

	@RequestMapping(value = "/deleteCategory")
	public @ResponseBody String deleteCategory(@RequestParam("categoryId") String categoryId, HttpSession objSession, HttpServletRequest objRequest){
		String result = "fail";
		String sJson = null;
		//System.out.println("in to category delete");
		try{
			Category category = new Category();
			category.setCategoryId(categoryId);
			
			CategoryService bo = new CategoryService();
			result = bo.deleteCategory(category);
			if(result.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("Status", "ERROR");
				json.put("message", "Error While delete Category");
				return sJson = json.toString();
			}
			sJson = bo.listCategory();
		}catch(Exception e){
			e.printStackTrace();
		}
		return sJson;
	}
	
	@RequestMapping(value = "/updateCategory")
	public @ResponseBody String updateCategory(@ModelAttribute Category category, HttpSession objSession, HttpServletRequest objRequest ){
		String resultUpdate = "fail";
		String sJson = null;
		
		//System.out.println("in to update category");
		try{
			CategoryService bo = new CategoryService();
			category.setUpdatedBy(CommonUtils.getDate());
			category.setUpdatedOn(CommonUtils.getDate());
			resultUpdate = bo.updateCategory(category);
			if(resultUpdate.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("Status", "ERROR");
				json.put("message", "Error While Update Category");
				return sJson = json.toString();
			}
			
			bo = new CategoryService();
			sJson = bo.listCategory();
			
		}catch(Exception e){
			e.printStackTrace();
		}
				return sJson;
	}
}
