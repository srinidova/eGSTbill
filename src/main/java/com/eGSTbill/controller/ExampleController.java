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

import com.eGSTbill.model.Product;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.util.CommonUtils;

import org.json.JSONObject;

@Controller
public class ExampleController {

	@RequestMapping(value = "/exampleHome")
	public String exampleHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From exampleHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {

		} catch (Exception e) {
			System.out.println("Exception in ExampleController in exampleHome()");
			e.printStackTrace();
		} finally {

		}
		return "exampleHome";
	}
	
}
