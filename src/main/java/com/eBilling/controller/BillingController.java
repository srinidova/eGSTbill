package com.eBilling.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
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
import com.eBilling.model.BillingDetails;
import com.eBilling.model.Product;
import com.eBilling.model.ProductStock;
import com.eBilling.model.StockDetails;
import com.eBilling.service.BillingDetailsService;
import com.eBilling.service.BillingDetatilsCartService;
import com.eBilling.service.BillingInfoCartService;
import com.eBilling.service.BillingInfoService;
import com.eBilling.service.ProductPopulateService;
import com.eBilling.service.ProductStockService;
import com.eBilling.service.PurchaseInfoService;
import com.eBilling.service.StockDetailsService;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BillingController {
	@Autowired
	ProductPopulateService objProductService;
	@Autowired
	BillingDetatilsCartService objBillingDetatilsCartService;
	@Autowired
	BillingDetailsService objBillingDetatilsService;
	
	@Autowired
	BillingInfoService objBillingInfoService;
	@Autowired
	BillingInfoCartService objBillingInfoCartService;
	@Autowired
	PurchaseInfoService objInfoService;
	@Autowired
	BillingInfoDao billingInfoDao;
	@Autowired
	BillingDetailsDao billingDetailsDao;
	@Autowired
	BillInfoController billInfoController;
	@Autowired
	ProductStockService productStockService;
	@Autowired
	StockDetailsService stockDetailsService;
	@RequestMapping(value = "/newBill")
	public String getBillingDetails(@ModelAttribute("productCmd") Product objProductmodel, HttpSession objSession, HttpServletRequest objRequest) {
		String sJson = "";
		String sBillId = "";
		List<BillingDetailsCart> listBillingDetails = null;
		BillingInfoCart billingInfoCart = null;
		ObjectMapper objMapper = null;
		List<PurchaserInfo> listPurchaseInfoModel;
		List<BillingInfoCart> listBillInfoCart = null;
		try {
			System.out.println("First time caling");
			sJson = objProductService.populateProducts();
			objSession.setAttribute("allProducts", sJson);
				sBillId = (String)objSession.getAttribute("sessionBillId");
				System.out.println("First time caling sBillId==" + sBillId);
			objSession.setAttribute("sessionBillId", null);
			
			//listPurchaseInfoModel = objInfoService.getAllPurchaseInfo();
			/*if(StringUtils.isNotEmpty(sBillId)){
				listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
			}*/
			if(billingInfoCart == null){
				billingInfoCart = new BillingInfoCart();
			}
			// Calculating totals
			//billingInfoCart = objBillingDetatilsCartService.calculateTotal(listBillingDetails, billingInfoCart);
			
			// Adding product list to billingInfo
			/*if(listBillingDetails != null && listBillingDetails.size() > 0){
			billingInfoCart.setListBillingInfoCart(listBillingDetails);
			 listBillInfoCart = new ArrayList<BillingInfoCart>();
			 listBillInfoCart.add(billingInfoCart);
			}*/
			
			// Adding puchaser list to billingInfo
			 //billingInfoCart.setListPurchase(listPurchaseInfoModel);
			
			//Converting billingInfoCart to JSON
			/*if (listBillInfoCart != null && listBillInfoCart.size() > 0) {
				//objMapper = new ObjectMapper();
				//sJson = objMapper.writeValueAsString(listBillInfoCart);
				//objSession.setAttribute("allBillingDetaisCart", "");
			}*/
		} catch (Exception e) {
			System.out.println("Exception in BillingController in getBillingDetails()"+ e);
		} finally {

		}
		return "newBill";
	}
	
	@RequestMapping(value = "/saveBillProduct")
	public @ResponseBody String  saveBillProduct(@RequestParam("jsondata") JSONObject data, HttpSession objSession) {
		String sJson = null;//aaaa
		BillingInfoCart billingInfoCart = null;
		BillingDetailsCart billingdetailsCart = null;
		String sBillId = null;
		ObjectMapper objMapper  = null;
		List<BillingDetailsCart> listBillingDetails = null;
		JSONObject objJSON = null;
		 boolean isUpdate = false;
		 List<PurchaserInfo> listPurchaseInfoModel;
		 List<ProductStock> lstProductstock =null;
		 ProductStock productStock=null;
		 String sProductId ="";
		 String sSessionProductId="";
		 StockDetails stockDetails =null;
		try {
			
			sProductId = data.getString("productId");
			 objSession.setAttribute("sProductId",sProductId );
			lstProductstock = productStockService.getAllProductStockByProductId(sProductId);
			for(int i=0;i<lstProductstock.size();i++){
				productStock=lstProductstock.get(i);
				
			}
			if(Integer.parseInt(productStock.getStock()) >= Integer.parseInt(data.getString("quantity"))){
				System.out.println("Adding Product");
				sBillId = (String)objSession.getAttribute("sessionBillId");
				System.out.println("sBillId==" + sBillId);
				if (StringUtils.isEmpty(sBillId)) {
					System.out.println("while billId 0");
					sBillId = CommonUtils.getAutoGenId();
					billingInfoCart = new BillingInfoCart();
					billingInfoCart.setBillId(sBillId);
					
					objBillingInfoCartService.saveBillInfoCart(billingInfoCart);
					objSession.setAttribute("sessionBillId", sBillId);
				}
					//sProductId = data.getString("productId");
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
					
					// Getting product list by billId
					listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
					//System.out.println("listBillingDetails.size=="+listBillingDetails.size());
					boolean isExist = objBillingDetatilsCartService.checkInCart( billingdetailsCart, listBillingDetails);
					//System.out.println("isExist-----"+isExist);
					if(isExist){
						listBillingDetails = objBillingDetatilsCartService.updateProductQuantity( billingdetailsCart, listBillingDetails);
					}else{
						// Save billingDeatailsCart
						objBillingDetatilsCartService.saveBillDetailsCart(billingdetailsCart);
						listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
					}
					
				}
				
				
				billingInfoCart = objBillingDetatilsCartService.calculateTotal(listBillingDetails, billingInfoCart);
				billingInfoCart.setListBillingInfoCart(listBillingDetails);
				
				// Adding puchaser list to billingInfo
				listPurchaseInfoModel = objInfoService.getAllPurchaseInfo();
				System.out.println("listPurchaseInfoModel=="+listPurchaseInfoModel.size());
				 billingInfoCart.setListPurchase(listPurchaseInfoModel);
				
				objJSON = new JSONObject();
				objJSON.append("objBillingInfoCart", billingInfoCart);
				List<BillingInfoCart> listBillInfoCart = new ArrayList<BillingInfoCart>();
				listBillInfoCart.add(billingInfoCart);
				if (listBillInfoCart != null && listBillInfoCart.size() > 0) {
					objMapper = new ObjectMapper();
					sJson = objMapper.writeValueAsString(listBillInfoCart);
				}
				
				isUpdate=objBillingInfoCartService.updateBillInfoCart(billingInfoCart);
				System.out.println("isUpdate"+isUpdate);
				
				/*String sCart="Cart";
				stockDetails =new StockDetails();
				for (int i = 0; i < listBillingDetails.size(); i++) {
				BillingDetailsCart existBillingDetailsCart = listBillingDetails.get(i);
				 int sQty=Integer.parseInt(existBillingDetailsCart.getQuantity());
				
				}
				stockDetails.setTransactionType(sCart);
				stockDetails.setQuantity(String.valueOf("sQty"));*/
				
			}else {
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Product Stock is Low");
				sJson = json.toString();
				
				
			}
		} catch (Exception e) {
			System.out.println("Exception in Product Controller in  saveBillProduct()");
		}
		return sJson;
	}
	@RequestMapping(value = "/genarateBill")
	public @ResponseBody
	String genarateBill(
			@ModelAttribute BillingInfo billingInfo, HttpSession objSession,HttpServletResponse objResponce,
			@RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
		List<BillingDetailsCart> listBillingDetails = null;
		BillingDetailsCart billingdetailsCart = null;
		BillingDetails billingDetails = null;
		boolean isSave = false;
		String sBillId = "";
		String sJson = "";
		boolean isDelete = false;
		ObjectMapper objMapper = null;
		List<ProductStock> lstProductstock =null;
		 ProductStock productStock=null;
		 String sProductId ="";
		 ProductStock existProductStock=null;
		 StockDetails stockDetails =null;
		try {
			System.out.println("productStock::::::"+sProductId);
			//sProductId = existProductStock.getProductId();
			/*sProductId = (String)objSession.getAttribute("sProductId");
			lstProductstock = productStockService.getAllProductStockByProductId(sProductId);
			for(int i=0;i<lstProductstock.size();i++){
				productStock=lstProductstock.get(i);
				
			}*/
			sBillId = data.getString("billId");
		  	 if(sBillId.length() > 0){
			//listBillingDetails = new List<BillingDetailsCart>();
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			billingInfo.setBillId(sBillId);
			
			billingInfo.setBillNo(data.getString("billNo"));
			billingInfo.setBillDate(CommonUtils.getDate());
			billingInfo.setLrNo(data.getString("lrNo"));
			billingInfo.setLrDate(data.getString("lrDate"));
			billingInfo.setOrderNo(data.getString("orderNo"));
			billingInfo.setOrderDate(data.getString("orderDate"));
			billingInfo.setDispatchedBy(data.getString("dispatchedBy"));
			billingInfo.setDispatchedDate(data.getString("dispatchedDate"));
			billingInfo.setNoOfPacks(data.getString("noOfPacks"));
			billingInfo.setTermOfPayment(data.getString("termOfPayment"));
			billingInfo.setTerms(data.getString("terms"));
			billingInfo.setName(data.getString("name"));
			billingInfo.setPhone(data.getString("phone"));
			billingInfo.setAddress(data.getString("address"));
			billingInfo.setTinNo(data.getString("tinNo"));
			billingInfo.setTotalAmount(data.getString("totalAmount"));
			billingInfo.setDiscount(data.getString("discount"));
			billingInfo.setTotalMrp(data.getString("totalMrp"));
			billingInfo.setTotalRate(data.getString("totalRate"));
			billingInfo.setTotalQuantity(data.getString("totalQuantity"));
			billingInfo.setOrderBy(data.getString("orderBy"));
			billingInfo.setPayment(data.getString("payment"));
			billingInfo.setPackSlipNo(data.getString("packSlipNo"));
			
			sJson=objBillingInfoService.saveBillInfo(billingInfo);
			
			/*objSession.setAttribute("PrintBillInfo", sJson);
			System.out.println("PrintBillInfo=="+sJson);*/
			 /*objMapper = new ObjectMapper();
			String billInfo = objMapper.writeValueAsString(billingInfo);
			objSession.setAttribute("PrintBillInfo", billInfo);*/
			
			isDelete=objBillingInfoCartService.deleteBillInfoCart(sBillId);
			
			/*sBillId = (String)objSession.getAttribute("sessionBillId");*/
			System.out.println("sBillId==" + sBillId);
			
			listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
			
				for(int i=0;i<listBillingDetails.size();i++){
					 billingDetails = new BillingDetails();
					 billingdetailsCart = listBillingDetails.get(i);
					billingDetails.setBillId(sBillId);
					billingDetails.setBillDetailsId(billingdetailsCart.getBillDetailsId());
					billingDetails.setMrp(billingdetailsCart.getMrp());
					billingDetails.setQuantity(billingdetailsCart.getQuantity());
					billingDetails.setRate(billingdetailsCart.getRate());
					billingDetails.setAmount(billingdetailsCart.getAmount());
					billingDetails.setProductId(billingdetailsCart.getProductId());
					
					 objBillingDetatilsService.saveBillDetails(billingDetails);
					 
					 
				}
				for(BillingDetailsCart billingdetailsC :listBillingDetails){
					lstProductstock = productStockService.getAllProductStockByProductId(billingdetailsC.getProductId());
					productStock=lstProductstock.get(0);
					if(Integer.parseInt(productStock.getStock()) >= Integer.parseInt(billingdetailsCart.getQuantity())){
						//Integer.parseInt(productStock.getStock()) - Integer.parseInt( billingdetailsCart.getQuantity());
							//int iQty=Integer.parseInt(billingdetailsC.getQuantity());
							int sNewStock = Integer.parseInt(productStock.getStock()) - Integer.parseInt( billingdetailsCart.getQuantity());
							 productStock.setStock(String.valueOf(sNewStock));
							 productStockService.updateProductStock(productStock);
						}	
					
				}
				//update stockDetails
				for(BillingDetailsCart billingdetailsC :listBillingDetails){
					List<StockDetails> lstStockDeatails = stockDetailsService.getStockDetailsByProductId(billingdetailsC.getProductId());
					stockDetails=lstStockDeatails.get(0);
				String sSale="Sale";
				//stockDetails =new StockDetails();
				//stockDetails=lstProductstock.get(0);
				stockDetails.setQuantity( billingdetailsCart.getQuantity());
				stockDetails.setTransactionId(data.getString("billNo"));
				stockDetails.setTransactionType(sSale);
				stockDetails.setTransactionDate(CommonUtils.getDate());
				stockDetailsService.updateStockDetails(stockDetails);
				}
				objBillingDetatilsCartService.deleteBillDetailsCart(sBillId);
				 String newJson = billInfoController.billInfoHome( objResponce,sBillId, objSession,  objRequest);
					
		  	 }
		  	 
		} catch (Exception ex) {
			//System.out.println("Exception thrown in updateDeatailsCart");
			ex.printStackTrace();
		}
		return "billInfoHome";
	}
	
	@RequestMapping(value = "/saveCart")
	public @ResponseBody
	String saveCart(
			@ModelAttribute BillingInfo billingInfo, HttpSession objSession,
			@RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
		List<BillingDetailsCart> listBillingDetails = null;
		BillingDetailsCart billingdetailsCart = null;
		BillingDetails billingDetails = null;
		BillingInfoCart billingInfoCart = null;
		boolean isSave = false;
		String sBillId = "";
		String sJson = "";
		boolean isDelete = false;
		try {
			sBillId = data.getString("billId");
		  	 if(sBillId.length() > 0){
		  		 
		  		billingInfoCart = new BillingInfoCart();
		  	
			//listBillingDetails = new List<BillingDetailsCart>();
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			billingInfoCart.setBillId(sBillId);
			
			billingInfoCart.setBillNo(data.getString("billNo"));
			billingInfoCart.setBillDate(CommonUtils.getDate());
			billingInfoCart.setLrNo(data.getString("lrNo"));
			billingInfoCart.setLrDate(data.getString("lrDate"));
			billingInfoCart.setOrderNo(data.getString("orderNo"));
			billingInfoCart.setOrderDate(data.getString("orderDate"));
			billingInfoCart.setDispatchedBy(data.getString("dispatchedBy"));
			billingInfoCart.setDispatchedDate(data.getString("dispatchedDate"));
			billingInfoCart.setNoOfPacks(data.getString("noOfPacks"));
			billingInfoCart.setTermOfPayment(data.getString("termOfPayment"));
			billingInfoCart.setTerms(data.getString("terms"));
			billingInfoCart.setName(data.getString("name"));
			billingInfoCart.setPhone(data.getString("phone"));
			billingInfoCart.setAddress(data.getString("address"));
			billingInfoCart.setTinNo(data.getString("tinNo"));
			billingInfoCart.setTotalAmount(data.getString("totalAmount"));
			billingInfoCart.setDiscount(data.getString("discount"));
			billingInfoCart.setTotalMrp(data.getString("totalMrp"));
			billingInfoCart.setTotalRate(data.getString("totalRate"));
			billingInfoCart.setTotalQuantity(data.getString("totalQuantity"));
			billingInfoCart.setOrderBy(data.getString("orderBy"));
			billingInfoCart.setPayment(data.getString("payment"));
			billingInfoCart.setPackSlipNo(data.getString("packSlipNo"));
			
			isSave=objBillingInfoCartService.updateBillInfoCart(billingInfoCart);
			
				if(isSave){
					 objSession.setAttribute("sessionBillId","");
				}
		  	 }
		} catch (Exception ex) {
			//System.out.println("Exception thrown in updateDeatailsCart");
			ex.printStackTrace();
		}
		return sJson;
	}
	@RequestMapping(value = "/updateBillDetailsCart")
	public @ResponseBody
	String updateBillDetailsCart(
			@ModelAttribute BillingDetailsCart billingdetailsCart,
			@RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
		boolean isUpdate = false;
		Product product = null;
		String sJson = "";
		String sBillId = null;
		ObjectMapper objMapper  = null;
		List<BillingInfoCart> lstBillingInfoCart = null;
		JSONObject objJSON = null;
		 //boolean isUpdate = false;
		 List<PurchaserInfo> listPurchaseInfoModel;
		 BillingInfoCart billingInfoCart = null;
		 List<BillingDetailsCart> listBillingDetails = null;
		try {
			System.out.println("update---------updateBillDetailsCart====="+data);
			product = new Product();
			billingdetailsCart.setBillDetailsId(data.getString("billDetailsId"));
			billingdetailsCart.setQuantity(data.getString("quantity"));
			billingdetailsCart.setRate(data.getString("rate"));

			int iRate = Integer.parseInt(data.getString("rate"));
			int iQuantity = Integer.parseInt(data.getString("quantity"));
			int iAmount = iRate * iQuantity;
			billingdetailsCart.setAmount(String.valueOf(iAmount));
			System.out.println("billingdetailsCart==="+billingdetailsCart);

			isUpdate = billingDetailsDao.updateBillDetails(billingdetailsCart);
			
			sBillId = data.getString("billId");
			System.out.println("billId==="+sBillId);
			
			billingInfoCart =new BillingInfoCart();
			billingInfoCart.setBillId(sBillId);
			// Getting product list by billId
			lstBillingInfoCart = objBillingInfoCartService.getAllBillInfoCartByBillId(billingInfoCart);
			System.out.println("listBillingDetailsCart==="+lstBillingInfoCart.size());
			for(int i=0;i<lstBillingInfoCart.size();i++){
				billingInfoCart = lstBillingInfoCart.get(i);
				System.out.println("billingInfoCart=="+billingInfoCart.toString());
			}
			
			// Getting product list by billId
			listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
			
			
			billingInfoCart = objBillingDetatilsCartService.calculateTotal(listBillingDetails, billingInfoCart);
			billingInfoCart.setListBillingInfoCart(listBillingDetails);
			
			// Adding puchaser list to billingInfo
			listPurchaseInfoModel = objInfoService.getAllPurchaseInfo();
			System.out.println("listPurchaseInfoModel=="+listPurchaseInfoModel.size());
			 billingInfoCart.setListPurchase(listPurchaseInfoModel);
			
			objJSON = new JSONObject();
			objJSON.append("objBillingInfoCart", billingInfoCart);
			List<BillingInfoCart> listBillInfoCart = new ArrayList<BillingInfoCart>();
			listBillInfoCart.add(billingInfoCart);
			if (listBillInfoCart != null && listBillInfoCart.size() > 0) {
				objMapper = new ObjectMapper();
				sJson = objMapper.writeValueAsString(listBillInfoCart);
			}
			
			isUpdate=objBillingInfoCartService.updateBillInfoCart(billingInfoCart);
			System.out.println("isUpdate"+isUpdate);
			
			System.out.println("hi,,,,,,");
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Exception thrown in updateDeatailsCart");
		}
		return sJson;
	}
	@RequestMapping(value = "/deleteBillingDetailsCart")
	public @ResponseBody
	String deleteBillingDetailsCart(@RequestParam("jsondata") JSONObject data, 
			HttpSession session, HttpServletRequest objRequest)
			throws JsonGenerationException, JsonMappingException, IOException {
			   	boolean isDelete = false;
				String sJson = "";
				String sBillId = null;
				String sBillDetailsId = null;
				ObjectMapper objMapper  = null;
				List<BillingInfoCart> lstBillingInfoCart = null;
				JSONObject objJSON = null;
				 //boolean isUpdate = false;
				 List<PurchaserInfo> listPurchaseInfoModel;
				 BillingInfoCart billingInfoCart = null;
				 List<BillingDetailsCart> listBillingDetails = null;
				 boolean isUpdate = false;
		 
		 try{
				
				sBillDetailsId =data.getString("billDetailsId");
				System.out.println("sBillDetailsId==="+sBillDetailsId);
				
				isDelete = objBillingDetatilsCartService.deleteBillingDetailsCart(sBillDetailsId);
				
			 	sBillId =data.getString("billId");
				System.out.println("billId==="+sBillId);
				
				
				billingInfoCart =new BillingInfoCart();
				billingInfoCart.setBillId(sBillId);
				// Getting product list by billId
				lstBillingInfoCart = objBillingInfoCartService.getAllBillInfoCartByBillId(billingInfoCart);
				System.out.println("listBillingDetailsCart==="+lstBillingInfoCart.size());
				for(int i=0;i<lstBillingInfoCart.size();i++){
					billingInfoCart = lstBillingInfoCart.get(i);
					System.out.println("billingInfoCart=="+billingInfoCart.toString());
				}
				
				// Getting product list by billId
				listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
				
				
				billingInfoCart = objBillingDetatilsCartService.calculateTotal(listBillingDetails, billingInfoCart);
				billingInfoCart.setListBillingInfoCart(listBillingDetails);
				
				// Adding puchaser list to billingInfo
				listPurchaseInfoModel = objInfoService.getAllPurchaseInfo();
				System.out.println("listPurchaseInfoModel=="+listPurchaseInfoModel.size());
				 billingInfoCart.setListPurchase(listPurchaseInfoModel);
				
				objJSON = new JSONObject();
				objJSON.append("objBillingInfoCart", billingInfoCart);
				List<BillingInfoCart> listBillInfoCart = new ArrayList<BillingInfoCart>();
				listBillInfoCart.add(billingInfoCart);
				if (listBillInfoCart != null && listBillInfoCart.size() > 0) {
					objMapper = new ObjectMapper();
					sJson = objMapper.writeValueAsString(listBillInfoCart);
				}
				isUpdate=objBillingInfoCartService.updateBillInfoCart(billingInfoCart);
				System.out.println("isUpdate"+isUpdate);
				
				System.out.println("hi,,,,,,");
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		
		
		return sJson;

	}
	
}
