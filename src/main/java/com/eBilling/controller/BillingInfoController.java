package com.eBilling.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.dao.BillingInfoDao;
import com.eBilling.dao.ProductDao;
import com.eBilling.model.Product;
import com.eBilling.service.ProductPopulateService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BillingInfoController {

	@Autowired
	ProductDao productDao;
	@Autowired 
	ProductPopulateService objPopulateService;
	@Autowired
	BillingInfoDao billingInfoDao;
	
	
	@RequestMapping(value = "/billingInformation")
public String billingInfoHome(HttpServletResponse objResponce, @ModelAttribute("productCmd") Product product,  HttpSession session,HttpServletRequest objRequest) throws IOException{
		System.out.println("From Prodcut Home");
		objResponce.setCharacterEncoding("UTF-8");
		try {
			//getAllProducts(objRequest);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "billingInfoHome";
	}
	
	/*@RequestMapping(value = "/saveBillInfo")
	public @ResponseBody String saveBillInfo(@ModelAttribute BillingInfoModel billingInfoModel ,@RequestParam("jsondata") JSONObject data, HttpSession session,HttpServletRequest req) {
		boolean isInsert=false;
		 //JSONArray jsonArray=new JSONArray();
			register.setRegName(req.getParameter("regName"));
			 register.setUserType( req.getParameter("userType"));
		System.out.println("saveBillInfo");
		billingInfoModel.setBillId(data.getString("billId"));
		billingInfoModel.setBillNo(data.getString("billNo"));
		billingInfoModel.setBillDate(data.getString("billDate"));
		billingInfoModel.setLrNo(data.getString("lrNo"));
		billingInfoModel.setLrDate(data.getString("lrDate"));
		billingInfoModel.setOrderNo(data.getString("orderNo"));
		billingInfoModel.setOrderDate(data.getString("orderDate"));
		billingInfoModel.setDispatchedBy(data.getString("dispatchedBy"));
		billingInfoModel.setDispatchedDate(data.getString("dispatchedDate"));
		billingInfoModel.setNoOfPacks(data.getString("noOfPacks"));
		billingInfoModel.setTermOfPayment(data.getString("termOfPayment"));
		billingInfoModel.setTerms(data.getString("terms"));
		billingInfoModel.setName(data.getString("name"));
		billingInfoModel.setPhone(data.getString("phone"));
		billingInfoModel.setAddress(data.getString("address"));
		billingInfoModel.setTinNo(data.getString("tinNo"));
		billingInfoModel.setTotalAmount(data.getString("totalAmount"));
		billingInfoModel.setDiscount(data.getString("discount"));
		
		
		    //product.setUpdatedDate(data.getString("updatedDate"));
			 isInsert=billingInfoDao.saveBillInfo(billingInfoModel);
			System.out.println("hi,,,,,,");
		return "succ";
}
	@RequestMapping(value = "/updateBillInfo")
	public @ResponseBody String updateBillInfo(@ModelAttribute BillingInfoModel billingInfoModel ,@RequestParam("jsondata") JSONObject data, HttpSession session,HttpServletRequest objRequest) {
		boolean isInsert=false;
		List<BillingInfoModel> listOrderBeans= null;
		ObjectMapper objectMapper=null;
		String sJson = "";
		try{
			
		
			billingInfoModel.setBillId(data.getString("billId"));
			billingInfoModel.setBillNo(data.getString("billNo"));
			billingInfoModel.setBillDate(data.getString("billDate"));
			billingInfoModel.setLrNo(data.getString("lrNo"));
			billingInfoModel.setLrDate(data.getString("lrDate"));
			billingInfoModel.setOrderNo(data.getString("orderNo"));
			billingInfoModel.setOrderDate(data.getString("orderDate"));
			billingInfoModel.setDispatchedBy(data.getString("dispatchedBy"));
			billingInfoModel.setDispatchedDate(data.getString("dispatchedDate"));
			billingInfoModel.setNoOfPacks(data.getString("noOfPacks"));
			billingInfoModel.setTermOfPayment(data.getString("termOfPayment"));
			billingInfoModel.setTerms(data.getString("terms"));
			billingInfoModel.setName(data.getString("name"));
			billingInfoModel.setPhone(data.getString("phone"));
			billingInfoModel.setAddress(data.getString("address"));
			billingInfoModel.setTinNo(data.getString("tinNo"));
			billingInfoModel.setTotalAmount(data.getString("totalAmount"));
			billingInfoModel.setDiscount(data.getString("discount"));
			 isInsert=billingInfoDao.updateBillInfo(billingInfoModel);
			 listOrderBeans = billingInfoDao.getAllBillInfo();
			 if(listOrderBeans != null && listOrderBeans.size() > 0) {
					objectMapper = new ObjectMapper(); 
					  sJson =objectMapper.writeValueAsString(listOrderBeans);
					  objRequest.setAttribute("allOrders1", sJson);
					 // System.out.println(sJson); 
				}
			 
			System.out.println("hi,,,,,,");
		}catch(Exception ex){
			
		}
		return sJson;
}
	
	@RequestMapping(value = "/deleteBillInfo")
	public @ResponseBody String deleteBillInfo(@RequestParam("id") String id, HttpSession session,HttpServletRequest req) throws JsonGenerationException, JsonMappingException, IOException {
		boolean isInsert=false;
		billingInfoDao.deleteBillInfo(id);
		List<BillingInfoModel> list = billingInfoDao.getAllBillInfo();
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		req.setAttribute("pList", json);
			System.out.println("hi,,,,,,");
			return json;
		
}*/

	/*public String getAllProducts(HttpServletRequest objRequest) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Product> lstProductModel = null;
		try {
			lstProductModel = productDao.getAllProduct();
			System.out.println("listOrderBeans= " + lstProductModel);
			if (lstProductModel != null && lstProductModel.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstProductModel);
				System.out.println("in productHome sJson==" + sJson);
				if (sJson != null && sJson.length() > 0)
					objRequest.setAttribute("allProducts", sJson);
			}
		} catch (Exception e) {
			 
			System.out
			.println("Exception in Product Controller in  getAllProducts()");
		}
		return sJson;
	}
	@ModelAttribute("productSelectName")
	public Map<String, String> populateProductName() {
		Map<String, String> mProductName = null;
		try {
			String sSql = "select productId,productName from product";
			mProductName = objPopulateService.populatePopUp(sSql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return mProductName;
	}
	@RequestMapping(value = "/selectProduct", method = RequestMethod.POST)
	public @ResponseBody
	String selectProduct(HttpServletRequest objRequest, HttpServletResponse response,@RequestParam("productName") String productName) {
		response.setCharacterEncoding("UTF-8");
		List<Product> lstProductSearch = null;
		String sJson = null;
		try {
			lstProductSearch = objPopulateService.categorySelect(productName);
			ObjectMapper objectMapper = new ObjectMapper();
			sJson = objectMapper.writeValueAsString(lstProductSearch);
			System.out.println("populate data== "+lstProductSearch);
		} catch (Exception e) {
			
		} finally {
		}
		return sJson;
	}*/

}
