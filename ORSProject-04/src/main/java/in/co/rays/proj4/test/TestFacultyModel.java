package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.FacultyBean;
import in.co.rays.proj4.model.FacultyModel;

public class TestFacultyModel {

	public static FacultyModel model = new FacultyModel();

	public static void main(String[] args) throws Exception {

		//testAdd();
		 //testUpdate();
		// testDelete();
		//testFindByPk();
		testSearch();

	}

	private static void testAdd() throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		FacultyBean bean = new FacultyBean();

		bean.setId(1);
		bean.setCollegeId(1);
		bean.setCollegeName("SVVV");
		bean.setFirstName("Nirmal");
		bean.setLastName("Fayake");
		bean.setEmail("nirmal@gmail.com");
		bean.setMobileNo("9753570572");
		bean.setAddress("Indore");
		bean.setGender("Male");
		bean.setDateOfBirth(sdf.parse("13-07-2001"));
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.add(bean);
	}

	private static void testUpdate() throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		FacultyBean bean = new FacultyBean();

		bean.setId(1);
		bean.setCollegeId(1);
		bean.setCollegeName("SVVV");
		bean.setFirstName("Nirmal");
		bean.setLastName("Fayake");
		bean.setEmail("nirmal13@gmail.com");
		bean.setMobileNo("9753570572");
		bean.setAddress("Indore");
		bean.setGender("Male");
		bean.setDateOfBirth(sdf.parse("13-07-2001"));
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.update(bean);
	}

	private static void testDelete() {

		model.delete(2);
	}
	
	private static void testFindByPk() {

		FacultyBean bean = model.findByPk(1);

		System.out.println(bean.getId());
		System.out.println(bean.getCollegeId());
		System.out.println(bean.getCollegeName());
		System.out.println(bean.getFirstName());
		System.out.println(bean.getLastName());
		System.out.println(bean.getEmail());
		System.out.println(bean.getMobileNo());
		System.out.println(bean.getAddress());
		System.out.println(bean.getGender());
		System.out.println(bean.getDateOfBirth());
		System.out.println(bean.getCreatedBy());
		System.out.println(bean.getModifiedBy());
		System.out.println(bean.getCreatedDatetime());
		System.out.println(bean.getModifiedDatetime());
	}
	
	private static void testSearch() {

		FacultyBean bean = new FacultyBean();

		List<FacultyBean> list = model.search(bean, 1, 10);

		Iterator<FacultyBean> it = list.iterator();

		while (it.hasNext()) {

			bean = it.next();

			System.out.println(bean.getId());
			System.out.println(bean.getCollegeId());
			System.out.println(bean.getCollegeName());
			System.out.println(bean.getFirstName());
			System.out.println(bean.getLastName());
			System.out.println(bean.getEmail());
			System.out.println(bean.getMobileNo());
			System.out.println(bean.getAddress());
			System.out.println(bean.getGender());
			System.out.println(bean.getDateOfBirth());
			System.out.println(bean.getCreatedBy());
			System.out.println(bean.getModifiedBy());
			System.out.println(bean.getCreatedDatetime());
			System.out.println(bean.getModifiedDatetime());

			System.out.println("-----------------------------");
		}
	}
}