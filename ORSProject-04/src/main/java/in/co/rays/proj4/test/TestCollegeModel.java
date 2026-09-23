package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.model.CollegeModel;

public class TestCollegeModel {
	
	public static CollegeModel model = new CollegeModel();
	
	public static void main(String[] args) {
		
		//testAdd();
		//testUpdate();
		//testDelete();
		//testFindByPk();
		testSearch();
	}
	
	private static void testAdd() {
		
		CollegeBean bean = new CollegeBean();
		
		bean.setId(3);
		bean.setName("Nirmal Fayake");
		bean.setAddress("Nipania");
		bean.setState("Madhya Pradesh");
		bean.setCity("Indore");
		bean.setPhoneNo("9753570572");
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		model.add(bean);
		
	}
	
	private static void testUpdate() {
		
		CollegeBean bean = new CollegeBean();
		
		bean.setId(1);
		bean.setName("Rupesh Mahajan");
		bean.setAddress("Ubale Nagar");
		bean.setState("Maharashtra");
		bean.setCity("Pune");
		bean.setPhoneNo("9617382689");
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		model.update(bean);
		
	}
	
	private static void testDelete() {
		model.delete(4);
	}

	
	private static void testFindByPk() {
		
		CollegeBean bean = model.findByPk(1);
		
		System.out.println(bean.getName());
		System.out.println(bean.getAddress());
		System.out.println(bean.getState());
		System.out.println(bean.getCity());
		System.out.println(bean.getPhoneNo());
		System.out.println(bean.getCreatedBy());
		System.out.println(bean.getModifiedBy());
		System.out.println(bean.getCreatedDatetime());
		System.out.println(bean.getModifiedDatetime());	
				
	}
	
	private static void testSearch() {
		CollegeBean bean = new CollegeBean();
		
		List<CollegeBean> list = model.search(bean, 1, 5);
		Iterator<CollegeBean> it = list.iterator();
		
		while(it.hasNext()) {
			
			bean = it.next();
			
			System.out.println(bean.getName());
			System.out.println(bean.getAddress());
			System.out.println(bean.getState());
			System.out.println(bean.getCity());
			System.out.println(bean.getPhoneNo());
			System.out.println(bean.getCreatedBy());
			System.out.println(bean.getModifiedBy());
			System.out.println(bean.getCreatedDatetime());
			System.out.println(bean.getModifiedDatetime());
			
			System.out.println("--------------------------");
		}
	}
}
