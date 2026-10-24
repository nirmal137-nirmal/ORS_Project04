package in.co.rays.proj4.test;

import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.BankingBean;
import in.co.rays.proj4.model.BankingModel;



public class TestBanking {

	public static void main(String[] args) {

		 testAdd();
		//testUpdate();
		//testDelete();
		
		//testSearch();

	}

	public static void testAdd() {

		BankingBean bean = new BankingBean();
		BankingModel model = new BankingModel();

		bean.setAccountNo(958910110002507L);
		bean.setHolderName("Gourav Mahajan");
		bean.setAccountType("Current");
		bean.setBalance(56500000);
		bean.setBranch("ICICI");

		model.add(bean);

	}

	public static void testUpdate() {

		BankingBean bean = new BankingBean();
		BankingModel model = new BankingModel();

		bean.setHolderName("Rupesh Mahajan");
		bean.setAccountType("Saving");
		bean.setBalance(8500000);
		bean.setBranch("SBI");

		bean.setAccountNo(958910110002503L);

		model.update(bean);

	}
	public static void testDelete() {
		
		BankingBean bean = new BankingBean();
		BankingModel model = new BankingModel();
		
		model.delete(958910110002503L);
	}
	
	public static void testSearch() {
		
		BankingBean bean = new BankingBean();
		BankingModel model = new BankingModel();
		
		List list = model.search(bean, 1, 5);
		
		Iterator it = list.iterator();
		
		while(it.hasNext()) {
			bean = (BankingBean) it.next();
			System.out.println("Account No : " + bean.getAccountNo());
			System.out.println("Account Holder Name : " + bean.getHolderName());
			System.out.println("Account Type : " + bean.getAccountType());
			System.out.println("Balance : " + bean.getBalance());
			System.out.println("branch : " + bean.getBranch());
			
			System.out.println("---------------------------------");
			
		}
		
	}
	
	

}
