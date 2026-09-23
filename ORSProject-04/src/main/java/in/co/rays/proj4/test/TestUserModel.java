package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.model.UserModel;

public class TestUserModel {

	public static UserModel model = new UserModel();

	public static void main(String[] args) throws Exception {

		//testAdd();
		// testUpdate();
		// testDelete();
		//testFindByPk();
		testSearch();

	}

	private static void testAdd() throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		UserBean bean = new UserBean();

		bean.setId(5);
		bean.setFirstName("Vinay");
		bean.setLastName("Patidar");
		bean.setLogin("vinay");
		bean.setPassword("123456");
		bean.setDob(sdf.parse("18-09-1997"));
		bean.setLastLogin(sdf.parse("21-09-2026"));
		bean.setMobileNo("9876545678");
		// 5 = KIOSK
		bean.setRoleId(5);
		bean.setUnsuccessfullLogin(0);
		bean.setGender("Male");
		bean.setUserLock("N");
		bean.setRegisteredIp("127.0.0.1");
		bean.setLastLoginIp("127.0.0.1");
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		model.add(bean);
	}

	private static void testUpdate() throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		UserBean bean = new UserBean();

		bean.setId(1);
		bean.setFirstName("Nirmal");
		bean.setLastName("Fayake");
		bean.setLogin("nirmal@gmail.com");
		bean.setPassword("123456");
		bean.setDob(sdf.parse("13-07-2000"));
		bean.setLastLogin(sdf.parse("21-09-2026"));
		bean.setMobileNo("9876543210");
		// 1 = Admin
		bean.setRoleId(1);
		bean.setUnsuccessfullLogin(0);
		bean.setGender("Male");
		bean.setUserLock("N");
		bean.setRegisteredIp("127.0.0.1");
		bean.setLastLoginIp("127.0.0.1");
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
		
		UserBean bean = model.findByPk(9);
		
		System.out.println(bean.getFirstName());
		System.out.println(bean.getLastName());
		System.out.println(bean.getLogin());
		System.out.println(bean.getPassword());
		System.out.println(bean.getDob());
		System.out.println(bean.getMobileNo());
		System.out.println(bean.getRoleId());
		System.out.println(bean.getUnsuccessfullLogin());
		System.out.println(bean.getGender());
		System.out.println(bean.getLastLogin());
		System.out.println(bean.getUserLock());
		System.out.println(bean.getRegisteredIp());
		System.out.println(bean.getLastLoginIp());
		System.out.println(bean.getCreatedBy());
		System.out.println(bean.getModifiedBy());
		System.out.println(bean.getCreatedDatetime());
		System.out.println(bean.getModifiedDatetime());
		
	}
	
	private static void testSearch() {

	    UserBean bean = new UserBean();

	    // Search condition
	    // bean.setFirstName("Nirmal");
	    // bean.setLastName("Fayake");
	    // bean.setLogin("admin");
	    // bean.setMobileNo("987");
	    // bean.setGender("Male");
	    // bean.setRoleId(1);

	    List<UserBean> list = model.search(bean, 1, 5);

	    Iterator<UserBean> it = list.iterator();

	    while (it.hasNext()) {

	        bean = it.next();

	        System.out.println(bean.getId());
	        System.out.println(bean.getFirstName());
	        System.out.println(bean.getLastName());
	        System.out.println(bean.getLogin());
	        System.out.println(bean.getPassword());
	        System.out.println(bean.getDob());
	        System.out.println(bean.getMobileNo());
	        System.out.println(bean.getRoleId());
	        System.out.println(bean.getUnsuccessfullLogin());
	        System.out.println(bean.getGender());
	        System.out.println(bean.getLastLogin());
	        System.out.println(bean.getUserLock());
	        System.out.println(bean.getRegisteredIp());
	        System.out.println(bean.getLastLoginIp());
	        System.out.println(bean.getCreatedBy());
	        System.out.println(bean.getModifiedBy());
	        System.out.println(bean.getCreatedDatetime());
	        System.out.println(bean.getModifiedDatetime());

	        System.out.println("-----------------------------------------");
	    }
	}
}
