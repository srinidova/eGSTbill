package com.eBilling.baseDao;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.model.Product;
import com.eBilling.service.ProductPopulateServiceImpl;

@Service("populateService")
public class ServicesBaseDao {
	
	@Autowired
	ProductBaseDao productBaseDao;
	private Logger logger = Logger.getLogger(ProductPopulateServiceImpl.class);
	
	
	public Map<String, String> populatePopUp(String sSql) {
		// TODO Auto-generated method stub
		Map<String, String> map = new LinkedHashMap<String, String>();
		List<Product> list = null;

		try {
			list = productBaseDao.populate(sSql);
			Iterator<Product> iterator = list.iterator();
			while (iterator.hasNext()) {
				Product objects = (Product) iterator.next();
				map.put(objects.getProductId(), objects.getProductName());
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
			logger.fatal("error in populatePopUp in PopulateServiceImpl");
		} finally {

		}
		return map;

	}
	/*public List<CatBean> categorySearch(CatBean objCatBean) {
		List<CatBean> listCatBean = null;
		try {
			String sCategoryName = null;
			String sCategoryId = null;
			String sClientId = null;

			if (objCatBean != null) {
				sCategoryName = objCatBean.getCategoryDesc();
				sCategoryId = objCatBean.getCategoryId();
				sClientId = objCatBean.getClientId();
			}
			listCatBean = objCatDao.categorySearch(sClientId, sCategoryName,
					sCategoryId);
		} catch (Exception e) {
			logger.error(e.getMessage());
			logger.fatal("error in saveCategory in category service");
		} finally {

		}
		return listCatBean;
	}*/
}
