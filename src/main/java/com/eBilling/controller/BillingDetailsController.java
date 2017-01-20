/*package com.eBilling.controller;

import java.io.IOException;
import java.util.List;

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

import com.eBilling.baseDao.PurchaseInfoBaseDao;
import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.baseModel.BillingInfo;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.baseModel.PurchaserInfo;
import com.eBilling.dao.BillingDetailsDao;
import com.eBilling.dao.BillingInfoDao;
import com.eBilling.dao.ProductDao;
import com.eBilling.model.Product;
import com.eBilling.service.ProductPopulateService;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BillingDetailsController {
	@Autowired
	BillingInfoDao billingInfoDao;
	@Autowired
	PurchaseInfoBaseDao purchaseInfoBaseDao;
	@Autowired
	ProductDao productDao;
	@Autowired
	ProductPopulateService objPopulateService;
	@Autowired
	BillingDetailsDao billingDetailsDao;

	@RequestMapping(value = "/newBill")
	public String billDetailsHome(HttpServletResponse objResponce,
			@ModelAttribute("productCmd") Product product,
			HttpSession session, HttpServletRequest objRequest)
			throws IOException {

		System.out.println("From Prodcut Home");
		// objResponce.setCharacterEncoding("UTF-8");
		try {
			getAllProducts(objRequest, session);
			//getAllbillDeteailsCart(objRequest, session);
			//getBillInfoCart(objRequest, session);
			//getAllPurchase(objRequest, session);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "newBill";
	}

	//@RequestMapping(value = "/saveBillProduct")
	public @ResponseBody String saveBillProduct(@ModelAttribute Product productModel,
			BillingInfoCart billingInfoCartModel, HttpSession session, @RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
	String saveBillProduct(
			@ModelAttribute Product productModel,
			@RequestParam("jsondata") JSONObject data, HttpSession session,
			HttpServletRequest objRequest) {
		boolean isInsert = false;
		String sJson = null;
		BillingInfoCart billingInfoCart = null;
		BillingDetailsCart billingdetailsCart = null;
		ObjectMapper objectMapper = null;
		try {
			System.out.println("data-------==" +data.toString());
			//System.out.println("productModel==" +productModel.toString());
			//System.out.println("billingInfoCartModel==" +billingInfoCartModel.toString());
			//System.out.println("getProductId==" + productModel.getProductId());
			//String sBillId = billingInfoCartModel.getBillId();
			String sBillId = data.getString("billId");
			System.out.println("sBillId==" + sBillId);
			if (sBillId == null || sBillId.equals("")) {
				sBillId = CommonUtils.getAutoGenId();
				billingInfoCart = new BillingInfoCart();
				billingInfoCart.setBillId(sBillId);
				
			}
			String sProductId = data.getString("productId");
			System.out.println("sProductId=="+sProductId);
			if (sProductId != null && sProductId.length() > 0) {
				billingdetailsCart = new BillingDetailsCart();
				billingdetailsCart.setBillDetailsId(CommonUtils.getAutoGenId());
				billingdetailsCart.setProductId(sProductId);
				billingdetailsCart.setQuantity(data.getString("quantity"));
				billingdetailsCart.setRate(data.getString("rate"));

				int iRate = Integer.parseInt(data.getString("rate"));
				int iQuantity = Integer.parseInt(data.getString("quantity"));
				int iAmount = iRate * iQuantity;
				billingdetailsCart.setAmount(String.valueOf(iAmount));
				billingdetailsCart.setMrp(data.getString("mrp"));
				billingdetailsCart.setBillId(sBillId);
					System.out.println("billingdetailsCart==++++++++"+billingdetailsCart.toString());
				isInsert = billingDetailsDao
						.saveBillDetails(billingdetailsCart);
				sJson = getAllbillDeteailsCart(session, sBillId);

			}
				billingInfoCartModel = caliculateTotal(billingInfoCartModel);
				if (billingInfoCartModel != null) {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(billingInfoCartModel);
					System.out.println("billingInfoCartModel===========" + sJson);
					if (sJson != null && sJson.length() > 0)
						session.setAttribute("BillInfoCartModel", sJson);
				} else {
					session.setAttribute("BillInfoCartModel", "");
				}
				if (isInsert)
					sJson = getAllbillDeteailsCart(session, sBillId);
				
				if (sBillId != null) {
					objectMapper = new ObjectMapper();
					String sJsonBillId = objectMapper.writeValueAsString(sBillId);
					System.out.println("sJsonBillId------------" + sJsonBillId);
					if (sJsonBillId != null && sJsonBillId.length() > 0)
						session.setAttribute("BillId", sJsonBillId);
				}
				//session.setAttribute("BillInfoCartModel", billingInfoCartModel);

				//billingInfoDao.saveBillInfoCart(billingInfoCartModel);
				//System.out.println("billingInfoCartModel==1111--"	+ billingInfoCartModel);

				
				//getBillInfoCart(objRequest, session);

			

		} catch (Exception e) {
			System.out
					.println("Exception in Product Controller in  saveBillProduct()");
		}
		System.out.println("json88888888888888888888888"+sJson);
		return "newBill";
	}

	public BillingInfoCart caliculateTotal(
			BillingInfoCart billingInfoCart) {
		ObjectMapper objectMapper = null;
		String sJson = null;

		List<BillingDetailsCart> lstProductModel = null;
		try {
			lstProductModel = billingDetailsDao.getAllBillDetails();
			
			
			if (lstProductModel != null && lstProductModel.size() > 0) {
				int iTotalQuantity = 0;
				int iTotalMrp = 0;
				int iTotalRate = 0;
				int iTotalAmount = 0;
				for (int i = 0; i < lstProductModel.size(); i++) {

					BillingDetailsCart billingCart = lstProductModel
							.get(i);
					int iQuantity = Integer.parseInt(billingCart.getQuantity());
					iTotalQuantity = iTotalQuantity + iQuantity;
					int iMrp = Integer.parseInt(billingCart.getMrp());
					iTotalMrp = iTotalMrp + iMrp;
					int iRate = Integer.parseInt(billingCart.getRate());
					iTotalRate = iTotalRate + iRate;
					int iAmount = Integer.parseInt(billingCart.getAmount());
					iTotalAmount = iTotalAmount + iAmount;

				}
				billingInfoCart.setTotalQuantity(String
						.valueOf(iTotalQuantity));
				billingInfoCart.setTotalMrp(String.valueOf(iTotalMrp));
				billingInfoCart.setTotalRate(String.valueOf(iTotalRate));
				billingInfoCart.setTotalAmount(String
						.valueOf(iTotalAmount));
				System.out.println("billingInfoCartModel==++"
						+ billingInfoCart);

			}
		} catch (Exception e) {

			System.out.println("Exception in Product Controller in  getAllProducts()");
		}
		return billingInfoCart;
	}

	public String getBillInfoCart(HttpServletRequest objRequest,
			HttpSession session) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfoCart> billingInfoCart = null;
		try {
			billingInfoCart = billingInfoDao.getAllBillInfoCart();
			System.out.println("lstProductModel size = "
					+ billingInfoCart.size());
			if (billingInfoCart != null && billingInfoCart.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(billingInfoCart);
				System.out.println("getBillInfoCart==" + sJson);
				if (sJson != null && sJson.length() > 0)
					session.setAttribute("allGetBillInfoCart", sJson);
			} else {
				session.setAttribute("allGetBillInfoCart", "");
			}
		} catch (Exception e) {

			System.out
					.println("Exception in Product Controller in  getAllProducts()");
		}
		return sJson;
	}

	public String getAllbillDeteailsCart(HttpSession session, String sBillId) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingDetailsCart> lstProductModel = null;
		try {
			lstProductModel = billingDetailsDao.getAllBillDetailsByBillId(sBillId);
			System.out.println("lstProductModel size = "
					+ lstProductModel.size());
			if (lstProductModel != null && lstProductModel.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstProductModel);
				System.out.println("getAllbillDeteailsCart==" + sJson);
				if (sJson != null && sJson.length() > 0) {
					if (session != null) {
						session.setAttribute("allBillingDetaisCart", sJson);
					}
					// objRequest.setAttribute("allBillingDetaisCart", sJson);

				}
			} else {
				if (session != null) {
					session.setAttribute("allBillingDetaisCart", "");
				}
			}
		} catch (Exception e) {

			System.out
					.println("Exception in Product Controller in  getAllProducts()");
		}
		return sJson;
	}

	public String getAllbillDeteailsCart(HttpServletRequest objRequest) {
		return getAllbillDeteailsCart( null);

	}
	@RequestMapping(value = "/test")
	public @ResponseBody
	String test(
			@ModelAttribute Product product,
			@RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
		System.out.println("data=="+data.toString());
				return null;
		
	}

	

	

	// @ModelAttribute("productSelectName")
	public String getAllProducts(HttpServletRequest objRequest,
			HttpSession session) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Product> lstProductModel = null;
		try {
			lstProductModel = productDao.getAllProduct();
			System.out.println("listOrderBeans======size========= "
					+ lstProductModel.size());
			if (lstProductModel != null && lstProductModel.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstProductModel);
				System.out.println("in productHome sJson==" + sJson);
				if (sJson != null && sJson.length() > 0)
					session.setAttribute("allProducts", sJson);
			}
		} catch (Exception e) {

			System.out
					.println("Exception in Product Controller in  getAllProducts()");
		}
		return sJson;
	}

	
	 * @RequestMapping(value = "/saveBillInfo") public @ResponseBody String
	 * saveBillInfo(@ModelAttribute BillingInfo billInfo, HttpSession session,
	 * HttpServletRequest objRequest) { boolean isInsert = false; String sJson =
	 * ""; try { billInfo.setBillDate(CommonUtils.getDate());
	 * billingInfoDao.saveBillInfo1(billInfo);
	 * 
	 * System.out.println("after req attr "); } catch (Exception e) { System.out
	 * .println("Exception in Product Controller in productSave()"); } return
	 * sJson; }
	 

	public String getAllPurchase(HttpServletRequest objRequest,
			HttpSession session) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<PurchaserInfo> lstPurchaseInfoModel = null;
		try {
			lstPurchaseInfoModel = purchaseInfoBaseDao.getAllPurchaseInfo();
			System.out.println("listOrderBeans= " + lstPurchaseInfoModel);
			if (lstPurchaseInfoModel != null && lstPurchaseInfoModel.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstPurchaseInfoModel);
				System.out.println("in productHome sJson==" + sJson);
				if (sJson != null && sJson.length() > 0)
					session.setAttribute("allPurchaseInfo", sJson);
			}
		} catch (Exception e) {

			System.out
					.println("Exception in Product Controller in  getAllPurchase()");
		}
		return sJson;
	}

}
*/