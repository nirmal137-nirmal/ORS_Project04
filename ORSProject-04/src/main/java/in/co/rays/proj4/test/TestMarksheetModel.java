package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.MarksheetBean;
import in.co.rays.proj4.model.MarksheetModel;

public class TestMarksheetModel {

	public static MarksheetModel model = new MarksheetModel();

	public static void main(String[] args) {

		//testAdd();
		// testUpdate();
		//testDelete();
		//testFindBypk();
		testSearch();

	}

	private static void testAdd() {

		MarksheetBean bean = new MarksheetBean();

		bean.setId(1);
		bean.setRollNo("1003");
		bean.setStudentId(1);
		bean.setName("Manoj Choudhary");
		bean.setPhysics(70);
		bean.setChemistry(60);
		bean.setMaths(86);
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.add(bean);
	}

	private static void testUpdate() {

		MarksheetBean bean = new MarksheetBean();

		bean.setId(1);

		bean.setRollNo("1001");
		bean.setStudentId(1);
		bean.setName("Rahul Sharma");
		bean.setPhysics(90);
		bean.setChemistry(92);
		bean.setMaths(98);
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		model.update(bean);
	}

	private static void testDelete() {

		model.delete(4);
	}
	
	private static void testFindBypk() {
		
		MarksheetBean bean = model.findByPk(1);
		
		System.out.println(bean.getRollNo());
		System.out.println(bean.getStudentId());
		System.out.println(bean.getName());
		System.out.println(bean.getPhysics());
		System.out.println(bean.getChemistry());
		System.out.println(bean.getMaths());
		System.out.println(bean.getCreatedBy());
		System.out.println(bean.getModifiedBy());
		System.out.println(bean.getCreatedDatetime());
		System.out.println(bean.getModifiedDatetime());
		
	}
	private static void testSearch() {

		MarksheetBean bean = new MarksheetBean();

		List<MarksheetBean> list = model.search(bean, 1, 5);

		Iterator<MarksheetBean> it = list.iterator();

		while (it.hasNext()) {

			bean = it.next();

			System.out.println(bean.getRollNo());
			System.out.println(bean.getStudentId());
			System.out.println(bean.getName());
			System.out.println(bean.getPhysics());
			System.out.println(bean.getChemistry());
			System.out.println(bean.getMaths());
			System.out.println(bean.getCreatedBy());
			System.out.println(bean.getModifiedBy());
			System.out.println(bean.getCreatedDatetime());
			System.out.println(bean.getModifiedDatetime());

			System.out.println("-------------------------------");
		}
	}
}