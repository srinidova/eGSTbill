package com.eGSTbill.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eGSTbill.dao.AutoIncrementDAO;
import com.eGSTbill.dao.BillCartDAO;
import com.eGSTbill.model.AutoIncrement;
import com.eGSTbill.model.BillCart;
import com.eGSTbill.model.BillDetailsCart;
import com.eGSTbill.model.ClientUser;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchaser;
import com.eGSTbill.service.AutoIncrementService;
import com.eGSTbill.service.BillCartService;
import com.eGSTbill.service.BillDetailsCartService;
import com.eGSTbill.service.ClientService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.PurchaserService;
import com.eGSTbill.service.ShippingService;
import com.eGSTbill.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.json.JSONObject;

@Controller
public class NewBillController {

	@RequestMapping(value = "/newBillHome")
	public String newBillHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From newBillHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJsonProd = null;
		String sJsonPurch = null;
		String sJsonShipping = null;
		try {

			ProducService bo = new ProducService();
			//sJsonProd = bo.listProducts();
			String sClientId = (String) objSession.getAttribute("CLIENTID");
			//System.out.println("sClientId=="+sClientId);
			sJsonProd = bo.listProductsByClientId(sClientId);
			
			if (sJsonProd != null && sJsonProd.length() > 0) {
				objSession.setAttribute("LISTPRODUCTS", sJsonProd);
			}

			PurchaserService ps = new PurchaserService();
			sJsonPurch = ps.listPurchasersByClientId(sClientId);
			if (sJsonPurch != null && sJsonPurch.length() > 0) {
				objSession.setAttribute("LISTPURCHASERS", sJsonPurch);
			}
			
			Purchaser purchaser = new Purchaser();
			String sPurchaserId = purchaser.getPurchaserId();
			

			ShippingService ss = new ShippingService();
			sJsonShipping = ss.getShippingsBypurchaserId(sPurchaserId);
			
			
			//System.out.println("in to sJsonShipping==="+sJsonShipping);
			objSession.setAttribute("sessBillCartId", null);
			objSession.setAttribute("sessBillCart", null);

			
		} catch (Exception e) {
			//System.out.println("Exception in NewBillController in newBillHome()");
			e.printStackTrace();
		} finally {

		}
		/*
		 * try {
		 * 
		 * } catch (Exception e) { //System.out.println(
		 * "Exception in NewBillController in newBillHome()");
		 * e.printStackTrace(); } finally {
		 * 
		 * }
		 */
		return "newBillHome";
	}

	@RequestMapping(value = "/addBillDetailsCart")
	public @ResponseBody String addBillDetailsCart(@ModelAttribute Product product, HttpSession objSession,
			HttpServletRequest objRequest) {
		String resAddDetCart = "fail";
		ArrayList<AutoIncrement> lstAutoIncrement= null;
		String sJson = null;
		String sBillCartId = null;
		BillCart billCart = null;
		String resAddBilCart = "fail";
		String billNo = null;
		String sBillNo = null;
		BillCartService bilCartServ = null;
		//AutoIncrement autoIncrement = null;
		try {
			BillDetailsCartService bilDetCartServ = new BillDetailsCartService();
			bilCartServ = new BillCartService();

			sBillCartId = (String) objSession.getAttribute("sessBillCartId");
			AutoIncrement autoIncrement = new AutoIncrement();
			if (StringUtils.isEmpty(sBillCartId)) {
				
				AutoIncrementService autoIncrementService = new AutoIncrementService();
				AutoIncrementDAO dao = new AutoIncrementDAO();
				
				
				
				lstAutoIncrement = dao.getBillNo();
				for(int i = 0; i < lstAutoIncrement.size(); i++){
					autoIncrement  = lstAutoIncrement.get(i);
					sBillNo = autoIncrement.getIncrementId();
					
					//System.out.println("---sBillNo---"+sBillNo);
				}
				//System.out.println("---sBillNo----2--"+sBillNo);
				
				 autoIncrementService.getAndUpdateBillNo(sBillNo, objSession);
				 
				/*if (StringUtils.isNotEmpty(billNo)) {
					autoIncrement.setIncrementId(billNo);
				}*/
				autoIncrement  =  (AutoIncrement) objSession.getAttribute("INCREMENTID");
				
				
				
				//System.out.println("in to new bill conroller increment"+autoIncrement.getIncrementId());
				
				sBillCartId = CommonUtils.getAutoGenId();
				billCart = new BillCart();
				billCart.setBillCartId(sBillCartId);
				billCart.setBillNo(autoIncrement.getIncrementId());
				
				////System.out.println("autoIncrement.getIncrementId()"+autoIncrement.getIncrementId());

				resAddBilCart = bilCartServ.addBillCart(billCart);
				objSession.setAttribute("sessBillCartId", sBillCartId);
			}

			//String sProdName = product.getProductName();
			//String sProdId = product.getProductId();
			BillDetailsCart existBilDetCart = bilDetCartServ.isProductBilled(product, sBillCartId);
			//////System.out.println("existBilDetCart==="+existBilDetCart);
			if(existBilDetCart == null){
				resAddDetCart = bilDetCartServ.billProduct(product, sBillCartId);
			}else{
				resAddDetCart = bilDetCartServ.updateProdQty(existBilDetCart, product);
			}
			
			//objSession.setAttribute("", sBillCartId);
			
			if (StringUtils.isNotEmpty(resAddDetCart)) {
				if (resAddDetCart.equals("fail")) {
					JSONObject json = new JSONObject();
					json.put("status", "ERROR");
					json.put("message", "Error while add product to bill");
					return sJson = json.toString();
				}
			}
			//objSession.setAttribute("sBillCartId", "");
			
			
			billCart = bilCartServ.updatedBillCart(sBillCartId);
			ArrayList<BillCart> lstBillCartReturn = new ArrayList<BillCart>();
			lstBillCartReturn.add(billCart);

			if (lstBillCartReturn != null && lstBillCartReturn.size() > 0) {
				ObjectMapper objMapper = new ObjectMapper();
				sJson = objMapper.writeValueAsString(lstBillCartReturn);
			}
			/*objSession.setAttribute("sessBillCart", null);
			objSession.setAttribute("sessBillCartId", null);*/

		} catch (Exception e) {
			//////System.out.println("Exception in NewBillController in addBillDetailsCart()");
			e.printStackTrace();
		}
		return sJson;
	}

	@RequestMapping(value = "/deleteBillDetailsCart")
	public @ResponseBody String deleteBillDetailsCart(@RequestParam("billDetailsCartId") String billDetailsCartId,
			HttpSession objSession, HttpServletRequest objRequest) {
		String result = "fail";
		String sJson = null;
		String sBillCartId = null;
		BillCart billCart = null;
		try {
			sBillCartId = (String) objSession.getAttribute("sessBillCartId");

			BillDetailsCart billDetailsCart = new BillDetailsCart();
			billDetailsCart.setBillDetailsCartId(billDetailsCartId);

			BillDetailsCartService bo = new BillDetailsCartService();
			result = bo.deleteBillDetailsCart(billDetailsCart);

			if (result.equals("fail")) {
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while delete product");
				return sJson = json.toString();
			}

			BillCartService bilCartServ = new BillCartService();
			billCart = bilCartServ.updatedBillCart(sBillCartId);
			ArrayList<BillCart> lstBillCartReturn = new ArrayList<BillCart>();
			lstBillCartReturn.add(billCart);

			if (lstBillCartReturn != null && lstBillCartReturn.size() > 0) {
				ObjectMapper objMapper = new ObjectMapper();
				sJson = objMapper.writeValueAsString(lstBillCartReturn);
			}

		} catch (Exception e) {
			//////System.out.println("Exception in NewBillController in deleteBillDetailsCart()");
			e.printStackTrace();
		}
		return sJson;
	}

	@RequestMapping(value = "/updateBillDetailsCart")
	public @ResponseBody String updateBillDetailsCart(@RequestParam("jsondata") JSONObject data, HttpSession objSession,
			HttpServletRequest objRequest) {
		String resultUpdate = "fail";
		String sJson = null;
		Product product = null;
		String resultAdd = "fail";
		BillCart billCart = null;
		String sBilDetCartId = null;
		String sBillCartId = null;
		// //////System.out.println("0. in to updateBillDetailsCart");
		try {
			sBillCartId = (String) objSession.getAttribute("sessBillCartId");
			// //////System.out.println("0. From addBillDetailsCart
			// sBillCartId=="+sBillCartId);

			sBilDetCartId = data.getString("billDetailsCartId");
			product = new Product();
			// //////System.out.println("1. in to
			// updateBillDetailsCart===="+data.toString());
			product.setProductId(data.getString("productId"));
			product.setProductName(data.getString("productName"));
			product.setQuantity(data.getString("quantity"));
			product.setSalePrice(data.getString("salePrice"));
			product.setDiscount(data.getString("discount"));
			product.setcGST(data.getString("cGST"));
			product.setsGST(data.getString("sGST"));

			BillDetailsCartService bo = new BillDetailsCartService();
			resultAdd = bo.updateBillProduct(product, sBilDetCartId);

			if (resultAdd.equals("fail")) {
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while update BillDetailsCart");
				return sJson = json.toString();
			}
			// //////System.out.println("2. in to updateBillDetailsCart
			// sBillCartId===="+sBillCartId);

			BillCartService bilCartServ = new BillCartService();
			billCart = bilCartServ.updatedBillCart(sBillCartId);
			// ////System.out.println("4. in to updateBillDetailsCart
			// billCart===="+billCart);
			ArrayList<BillCart> lstBillCartReturn = new ArrayList<BillCart>();
			lstBillCartReturn.add(billCart);

			if (lstBillCartReturn != null && lstBillCartReturn.size() > 0) {
				ObjectMapper objMapper = new ObjectMapper();
				sJson = objMapper.writeValueAsString(lstBillCartReturn);
			}
			// ////System.out.println("5. From addBillDetailsCart sJson=="+sJson);

		} catch (Exception e) {
			////System.out.println("Exception in NewBillController in updateBillDetailsCart()");
			e.printStackTrace();
		}
		return sJson;
	}
	
	@RequestMapping(value = "/generateBill")
	public String generateBill(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		ArrayList<BillCart> lstBillCart = null;
		ObjectMapper objectMapper=null;
		String sJson=null;
		//System.out.println("in to generateBill");
		try {
			
		} catch (Exception e) {
			////System.out.println("Exception in NewBillController in newBillHome()");
			e.printStackTrace();
		} finally {

		}
		
		return "generateBill";
	}
	
	@RequestMapping(value = "/getClientByUserId")
	public @ResponseBody String getClientByUserId(@RequestParam("userId") String userId, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result ="fail";
		String sJson = null;
		try{
			ClientUser clientuser = new ClientUser();
			clientuser.setUserId(userId);
			ClientService bo = new ClientService();
			//result = bo.getClientByUserId(clientuser);
			if(result.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while delete product");
				return sJson = json.toString();
			}
			//sJson = bo.listProducts();
				
		}catch(Exception e){
			////System.out.println("Exception in ProductController in deleteProduct()");
			e.printStackTrace();		}
		return sJson;
	}
}
