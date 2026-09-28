package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.FoodOrderBean;
import in.co.rays.proj4.model.FoodOrderModel;

public class TestFoodOrderModel {
	
	public static FoodOrderModel model = new FoodOrderModel();
	
	public static void main(String[] args) {
		
		//testAdd();
		//testUpdate();
		//testDelete();
		testSearch();
		
	}
	
	private static void testAdd() {
		
		FoodOrderBean bean = new FoodOrderBean();
		
		bean.setId(1);
		bean.setCustomerName("Nirmal Fayake");
		bean.setRestaurant("Dominos Pizza ");
		bean.setOrderAmount(499);
		bean.setDeliveryStatus("Delivered");
		bean.setCreatedBy("admin");
		bean.setModifiedBy("admin");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		model.add(bean);
	}
	
	private static void testUpdate() {
		
		FoodOrderBean bean = new FoodOrderBean();
		
		bean.setId(1);
		bean.setCustomerName("Nirmal Fayake");
		bean.setRestaurant("Dominos Pizza ");
		bean.setOrderAmount(499);
		bean.setDeliveryStatus("Not-Delivered");
		bean.setCreatedBy("admin");
		bean.setModifiedBy("admin");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		model.update(bean);
		
	}
	
	private static void testDelete() {
	
		model.delete(9);
	}

	private static void testSearch() {
		
		FoodOrderBean bean = new FoodOrderBean();
		
		List<FoodOrderBean> list = model.search(bean, 1, 5);
		
		Iterator<FoodOrderBean> it = list.iterator();
		
		while (it.hasNext()) {
			
			bean =  it.next();
			
			System.out.println(bean.getId());
			System.out.println(bean.getCustomerName());
			System.out.println(bean.getRestaurant());
			System.out.println(bean.getOrderAmount());
			System.out.println(bean.getDeliveryStatus());
			System.out.println(bean.getCreatedBy());
	        System.out.println(bean.getModifiedBy());
	        System.out.println(bean.getCreatedDatetime());
	        System.out.println(bean.getModifiedDatetime());

	        System.out.println("-------------------------------------");
			
		}
	}
}
