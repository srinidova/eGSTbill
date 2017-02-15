package com.eBilling.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.dao.ProductDao;
import com.eBilling.model.Product;
import com.eBilling.service.ProductPopulateService;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ProductController {

	@Autowired
	ProductPopulateService objPopulateService;
	/*
	 * @Autowired ServiceDao serviceDao;
	 */
	@Autowired
	ProductDao productDao;

	@RequestMapping(value = "/productHome")
	public String productHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From Prodcut Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			sJson = objPopulateService.populateProducts();
			objSession.setAttribute("allProducts", sJson);
			objSession.setAttribute("tabActive", "product");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "productHome";
	}

	@RequestMapping(value = "/productSave")
	public @ResponseBody String productSave(@ModelAttribute Product product, HttpSession objSession,
			HttpServletRequest objRequest) {
		boolean isInsert = false;
		String sJson = "";
		List<Product> lstProductModel = null;
		try {
			String sProductName = product.getProductName();
			lstProductModel = objPopulateService.getProductByName(sProductName);

			if (lstProductModel == null || lstProductModel.size() == 0) {
				product.setProductId(CommonUtils.getAutoGenId());

				isInsert = objPopulateService.productSave(product);

				if (isInsert) {
					sJson = objPopulateService.populateProducts();
				}
			} else {

				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Product Already Exist");
				sJson = json.toString();
			}
			System.out.println("after req attr ");
		} catch (Exception e) {
			System.out.println("Exception in Product Controller in productSave()");
		}
		return sJson;
	}

	@RequestMapping(value = "/productUpdate")
	public @ResponseBody String productUpdate(@ModelAttribute Product product,
			@RequestParam("jsondata") JSONObject data, HttpSession objSession, HttpServletRequest objRequest) {
		boolean isUpdate = false;
		String sJson = "";
		boolean toUpdate = false;
		List<Product> lstProductModel = null;
		try {
			String sProductName = data.getString("productName");
			lstProductModel = objPopulateService.getProductByName(sProductName);
			if (lstProductModel != null && lstProductModel.size() > 0) {
				for (int i = 0; i < lstProductModel.size(); i++) {
					Product productExist = lstProductModel.get(i);

					if (productExist.getProductId().equals(data.getString("productId"))) {
						toUpdate = true;
					} else {
						System.out.println("----else---");
						JSONObject json = new JSONObject();
						json.put("status", "ERROR");
						json.put("message", "Product Already Exist");
						sJson = json.toString();
					}
					break;
				}
			} else {
				toUpdate = true;
			}
			if (toUpdate) {
				System.out.println("productUpdate");
				product.setProductId(data.getString("productId"));
				product.setProductType(data.getString("productType"));
				product.setMrp(data.getString("mrp"));
				product.setProductName(data.getString("productName"));
				product.setUpdatedBy(CommonUtils.getDate());
				product.setUpdatedDate(CommonUtils.getDate());
				System.out.println("product values==" + product);

				isUpdate = objPopulateService.updateProduct(product);
				if (isUpdate) {
					sJson = objPopulateService.populateProducts();
				}
			}

		} catch (Exception ex) {
			System.out.println("Exception in Product Controller in  productUpdate()");
		}
		return sJson;
	}

	@RequestMapping(value = "/deleteProductData")
	public @ResponseBody String deleteProductData(@RequestParam("id") String sProductId, HttpSession objSession,
			HttpServletRequest objRequest) throws JsonGenerationException, JsonMappingException, IOException {
		boolean isDelete = false;
		String sJson = "";

		isDelete = objPopulateService.deleteProduct(sProductId);

		if (isDelete) {
			sJson = objPopulateService.populateProducts();
		}
		return sJson;

	}

}
