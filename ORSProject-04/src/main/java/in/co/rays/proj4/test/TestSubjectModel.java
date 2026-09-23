package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.SubjectBean;
import in.co.rays.proj4.model.SubjectModel;

public class TestSubjectModel {

	public static SubjectModel model = new SubjectModel();

	public static void main(String[] args) {

		//testAdd();
		 //testUpdate();
		// testDelete();
		//testFindByPk();
		testSearch();

	}

	private static void testAdd() {

		SubjectBean bean = new SubjectBean();

		bean.setId(2);
		bean.setName("Python");
		bean.setDescription("Python Programming");
		bean.setCourseId(5);
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.add(bean);
	}

	private static void testUpdate() {

		SubjectBean bean = new SubjectBean();

		bean.setId(2);
		bean.setName("C, C++");
		bean.setDescription("C programming");
		bean.setCourseId(2);
		bean.setCreatedBy("Nirmal");
		bean.setModifiedBy("Nirmal");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.update(bean);
	}

	private static void testDelete() {

		model.delete(3);
	}
	
	private static void testFindByPk() {

		SubjectBean bean = model.findByPk(1);

		System.out.println(bean.getId());
		System.out.println(bean.getName());
		System.out.println(bean.getDescription());
		System.out.println(bean.getCourseId());
		System.out.println(bean.getCreatedBy());
		System.out.println(bean.getModifiedBy());
		System.out.println(bean.getCreatedDatetime());
		System.out.println(bean.getModifiedDatetime());
	}
	
	private static void testSearch() {

		SubjectBean bean = new SubjectBean();

		List<SubjectBean> list = model.search(bean, 1, 10);

		Iterator<SubjectBean> it = list.iterator();

		while (it.hasNext()) {

			bean = it.next();

			System.out.println(bean.getId());
			System.out.println(bean.getName());
			System.out.println(bean.getDescription());
			System.out.println(bean.getCourseId());
			System.out.println(bean.getCreatedBy());
			System.out.println(bean.getModifiedBy());
			System.out.println(bean.getCreatedDatetime());
			System.out.println(bean.getModifiedDatetime());

			System.out.println("-----------------------------");
		}
	}
}
