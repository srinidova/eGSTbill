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

import com.eGSTbill.model.BillCart;
import com.eGSTbill.model.BillDetailsCart;
import com.eGSTbill.model.Product;
import com.eGSTbill.service.BillCartService;
import com.eGSTbill.service.BillDetailsCartService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.PurchaserService;
import com.eGSTbill.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.json.JSONObject;

@Controller
public class NewBillController {

	@RequestMapping(value = "/newBillHome")
	public String newBillHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From newBillHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJsonProd = null;
		String sJsonPurch = null;
		try {

			ProducService bo = new ProducService();
			sJsonProd = bo.listProducts();
			if (sJsonProd != null && sJsonProd.length() > 0) {
				objSession.setAttribute("LISTPRODUCTS", sJsonProd);
			}

			PurchaserService ps = new PurchaserService();
			sJsonPurch = ps.listPurchaser();
			if (sJsonPurch != null && sJsonPurch.length() > 0) {
				objSession.setAttribute("LISTPURCHASERS", sJsonPurch);
			}

			objSession.setAttribute("sessBillCartId", null);
			objSession.setAttribute("sessBillCart", null);

		} catch (Exception e) {
			System.out.println("Exception in NewBillController in newBillHome()");
			e.printStackTrace();
		} finally {

		}
		/*
		 * try {
		 * 
		 * } catch (Exception e) { System.out.println(
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
		String sJson = null;
		String sBillCartId = null;
		BillCart billCart = null;
		String resAddBilCart = "fail";
		BillCartService bilCartServ = null;
		try {
			BillDetailsCartService bilDetCartServ = new BillDetailsCartService();
			bilCartServ = new BillCartService();

			sBillCartId = (String) objSession.getAttribute("sessBillCartId");
			if (StringUtils.isEmpty(sBillCartId)) {
				sBillCartId = CommonUtils.getAutoGenId();
				billCart = new BillCart();
				billCart.setBillCartId(sBillCartId);
				billCart.setBillNo("1");

				resAddBilCart = bilCartServ.addBillCart(billCart);
				objSession.setAttribute("sessBillCartId", sBillCartId);
			}

			//String sProdName = product.getProductName();
			//String sProdId = product.getProductId();
			BillDetailsCart existBilDetCart = bilDetCartServ.isProductBilled(product, sBillCartId);
			System.out.println("existBilDetCart==="+existBilDetCart);
			if(existBilDetCart == null){
				resAddDetCart = bilDetCartServ.billProduct(product, sBillCartId);
			}else{
				resAddDetCart = bilDetCartServ.updateProdQty(existBilDetCart, product);
			}
			
			
			
			if (StringUtils.isNotEmpty(resAddDetCart)) {
				if (resAddDetCart.equals("fail")) {
					JSONObject json = new JSONObject();
					json.put("status", "ERROR");
					json.put("message", "Error while add product to bill");
					return sJson = json.toString();
				}
			}

			billCart = bilCartServ.updatedBillCart(sBillCartId);
			ArrayList<BillCart> lstBillCartReturn = new ArrayList<BillCart>();
			lstBillCartReturn.add(billCart);

			if (lstBillCartReturn != null && lstBillCartReturn.size() > 0) {
				ObjectMapper objMapper = new ObjectMapper();
				sJson = objMapper.writeValueAsString(lstBillCartReturn);
			}

		} catch (Exception e) {
			System.out.println("Exception in NewBillController in addBillDetailsCart()");
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
			System.out.println("Exception in NewBillController in deleteBillDetailsCart()");
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
		// System.out.println("0. in to updateBillDetailsCart");
		try {
			sBillCartId = (String) objSession.getAttribute("sessBillCartId");
			// System.out.println("0. From addBillDetailsCart
			// sBillCartId=="+sBillCartId);

			sBilDetCartId = data.getString("billDetailsCartId");
			product = new Product();
			// System.out.println("1. in to
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
			// System.out.println("2. in to updateBillDetailsCart
			// sBillCartId===="+sBillCartId);

			BillCartService bilCartServ = new BillCartService();
			billCart = bilCartServ.updatedBillCart(sBillCartId);
			// System.out.println("4. in to updateBillDetailsCart
			// billCart===="+billCart);
			ArrayList<BillCart> lstBillCartReturn = new ArrayList<BillCart>();
			lstBillCartReturn.add(billCart);

			if (lstBillCartReturn != null && lstBillCartReturn.size() > 0) {
				ObjectMapper objMapper = new ObjectMapper();
				sJson = objMapper.writeValueAsString(lstBillCartReturn);
			}
			// System.out.println("5. From addBillDetailsCart sJson=="+sJson);

		} catch (Exception e) {
			System.out.println("Exception in NewBillController in updateBillDetailsCart()");
			e.printStackTrace();
		}
		return sJson;
	}
}
