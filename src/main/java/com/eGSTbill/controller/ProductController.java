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

import com.eGSTbill.model.Client;
import com.eGSTbill.model.ClientProduct;
import com.eGSTbill.model.Product;
import com.eGSTbill.service.ClientProductService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.PurchaserService;
import com.eGSTbill.util.CommonUtils;

import org.json.JSONObject;

@Controller
public class ProductController {

	@RequestMapping(value = "/productHome")
	public String productHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From productHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		//String sState = null;
		try {
			ProducService bo = new ProducService();
			//sJson = bo.listProductsByClientId(sClientId)
			//sJson = bo.listProducts();
			
			String sClientId = (String) objSession.getAttribute("CLIENTID");
			//System.out.println("sClientId=="+sClientId);
			sJson = bo.listProductsByClientId(sClientId);
			
			if (sJson != null && sJson.length() > 0) {
				objSession.setAttribute("LISTPRODUCTS", sJson);
			}
			
			
			
		} catch (Exception e) {
			//System.out.println("Exception in ProductController in productHome()");
			e.printStackTrace();
		} finally {

		}
		return "productHome";
	}
	@RequestMapping(value = "/addProduct")
	public @ResponseBody String addProduct(@ModelAttribute Product product, HttpSession objSession,
			HttpServletRequest objRequest) {
		String resultAdd ="fail";
		String sJson = null;
		String sProductId = null;
		String resultClientProduct = null;
		try {
			String sProdName = product.getProductName();
			ProducService bo = new ProducService();
			
			boolean bProductExist = bo.getProductByName(sProdName);
			if(bProductExist){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", sProdName + " already exists. Please choose another Name");
				return sJson = json.toString();
			}
			sProductId = CommonUtils.getAutoGenId();
			product.setProductId(sProductId);
			product.setUpdatedBy(CommonUtils.getDate());
			product.setUpdatedDate(CommonUtils.getDate());
			resultAdd = bo.addProduct(product);
			if (StringUtils.isNotEmpty(resultAdd)) {
				if(resultAdd.equals("fail")){
					JSONObject json = new JSONObject();
					json.put("status", "ERROR");
					json.put("message", "Error while add product");
					return sJson = json.toString();
				}
				bo = new ProducService();
				sJson = bo.listProducts();
			}
			
			/*Client client = new Client();
			//System.out.println("e. in to login client==="+client.toString());
			String sClientId = client.getClientId();
			//System.out.println("f. in to login sClientId==="+sClientId);*/
			
			HttpSession session = objRequest.getSession();
			String clientId = (String) session.getAttribute("CLIENTID");
			
			//System.out.println("in to product controller clientId "+clientId);
			
			ClientProduct clientproduct = new ClientProduct();
			clientproduct.setClientId(clientId);
			clientproduct.setProductId(sProductId);
			
			
			ClientProductService cps = new ClientProductService();
			resultClientProduct = cps.addClientProduct(clientproduct);
			//System.out.println("in to client product resultClientProduct"+resultClientProduct);
		} catch (Exception e) {
			//System.out.println("Exception in ProductController in addProduct()");
			e.printStackTrace();		}
		return sJson;
	}
	@RequestMapping(value = "/deleteProduct")
	public @ResponseBody String deleteProduct(@RequestParam("productId") String productId, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result ="fail";
		String sJson = null;
		try{
			Product product = new Product();
			product.setProductId(productId);
			ProducService bo = new ProducService();
			result = bo.deleteProduct(product);
			if(result.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while delete product");
				return sJson = json.toString();
			}
			sJson = bo.listProducts();
				
		}catch(Exception e){
			//System.out.println("Exception in ProductController in deleteProduct()");
			e.printStackTrace();		}
		return sJson;
	}

	@RequestMapping(value = "/updateProduct")
	public @ResponseBody String updateProduct(@ModelAttribute Product newProduct, HttpSession objSession,
			HttpServletRequest objRequest) {
		String resultUpdate ="fail";
		String sJson = null;
		try{

			String sProdName = newProduct.getProductName();
			ProducService bo = new ProducService();
			
			boolean bProductExist = bo.checkProductByName(sProdName, newProduct.getProductId());
			if(bProductExist){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", sProdName + " already exists. Please choose another Name");
				return sJson = json.toString();
			}
			newProduct.setUpdatedBy(CommonUtils.getDate());
			newProduct.setUpdatedDate(CommonUtils.getDate());			
			resultUpdate = bo.updateProduct(newProduct);
			if(resultUpdate.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while update product");
				return sJson = json.toString();
			}
			bo = new ProducService();
			sJson = bo.listProducts();
		}catch(Exception e){
			//System.out.println("Exception in ProductController in updateProduct()");
			e.printStackTrace();
		}
		return sJson;
	}
	
	/*@RequestMapping(value = "/getProductsByClientId")
	public @ResponseBody String getProductsByClientId(@RequestParam("sClientId") String sClientId, HttpSession objSession,
			HttpServletRequest objRequest) {
		//System.out.println("inside update java");
		String sJson = null;
		try {

			//System.out.println(" sClientId============" + sClientId);
			ProducService ps = new ProducService();

			sJson = ps.listProductsByClientId(sClientId);
			//System.out.println(" final result in getProductsByClientId========" + sJson);

		} catch (Exception e) {
			//System.out.println("Exception in ProductController in getProductsByClientId()");
			e.printStackTrace();

		}
		return sJson;
	}*/
}
