package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.StudentBean;
import in.co.rays.proj4.model.StudentModel;

public class TestStudentModel {

	public static StudentModel model = new StudentModel();

	public static void main(String[] args) throws Exception {

		//testAdd();
		//testUpdate();
		// testDelete();
		//testFindByPk();
		testSearch();

	}

	private static void testAdd() throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		StudentBean bean = new StudentBean();

		bean.setId(1);
		bean.setCollegeId(1);
		bean.setCollegeName("SVVV");
		bean.setFirstName("Sakshi");
		bean.setLastName("Vyas");
        bean.setDateOfBirth(sdf.parse("30-02-2001"));
		bean.setMobileNo("3692587410");
		bean.setEmail("shakshi@gmail.com");
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.add(bean);
	}

	private static void testUpdate() throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		StudentBean bean = new StudentBean();

		bean.setId(5);
		bean.setCollegeId(1);
		bean.setCollegeName("SVVV");
		bean.setFirstName("Vinay");
		bean.setLastName("Patidar");
        bean.setDateOfBirth(sdf.parse("30-02-2001"));
		bean.setMobileNo("3692587410");
		bean.setEmail("vinay@gmail.com");
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.update(bean);
	}

	private static void testDelete() {

		model.delete(6);
	}
	
	private static void testFindByPk() {
		
		StudentBean bean = model.findByPk(1);
		
		System.out.println(bean.getCollegeId());
		System.out.println(bean.getCollegeName());
		System.out.println(bean.getFirstName());
		System.out.println(bean.getLastName());
		System.out.println(bean.getDateOfBirth());
		System.out.println(bean.getMobileNo());
		System.out.println(bean.getEmail());
		System.out.println(bean.getCreatedBy());
		System.out.println(bean.getModifiedBy());
		System.out.println(bean.getCreatedDatetime());
		System.out.println(bean.getModifiedDatetime());
		
		
	}
	
	private static void testSearch() {
		StudentBean bean = new StudentBean();
		
		List<StudentBean> list = model.search(bean, 1, 5);
		
		Iterator<StudentBean> it = list.iterator();
		
		while (it.hasNext()) {
			
			bean = it.next();
			
			System.out.println(bean.getCollegeId());
			System.out.println(bean.getCollegeName());
			System.out.println(bean.getFirstName());
			System.out.println(bean.getLastName());
			System.out.println(bean.getDateOfBirth());
			System.out.println(bean.getMobileNo());
			System.out.println(bean.getEmail());
			System.out.println(bean.getCreatedBy());
			System.out.println(bean.getModifiedBy());
			System.out.println(bean.getCreatedDatetime());
			System.out.println(bean.getModifiedDatetime());
			
			System.out.println("-------------------------------");
			
		}
	}
}
