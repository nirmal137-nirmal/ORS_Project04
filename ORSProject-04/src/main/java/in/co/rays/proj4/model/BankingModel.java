package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;


import in.co.rays.proj4.bean.BankingBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class BankingModel extends BaseModel<BankingBean> {

	@Override
	public long add(BankingBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;
		int pk = 0;

		try {

			pk = nextPk();
			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement("insert into bank values(?,?,?,?,?)");

			pstmt.setLong(1, bean.getAccountNo());
			pstmt.setString(2, bean.getHolderName());
			pstmt.setString(3, bean.getAccountType());
			pstmt.setDouble(4, bean.getBalance());
			pstmt.setString(5, bean.getBranch());

			int i = pstmt.executeUpdate();

			conn.commit();

			System.out.println("Data Inserted SuccessFully");

		} catch (Exception e) {
			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		return pk;
	}

	public void update(BankingBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(
					"update bank set holdername=?, accountType = ?, balance = ?, branch = ? where accountNo = ?");
			pstmt.setString(1, bean.getHolderName());
			pstmt.setString(2, bean.getAccountType());
			pstmt.setDouble(3, bean.getBalance());
			pstmt.setString(4, bean.getBranch());

			pstmt.setLong(5, bean.getAccountNo());

			int i = pstmt.executeUpdate();

			conn.commit();

			System.out.println("Data Updated SuccessFully");

		} catch (Exception e) {
			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

		} finally {
			JDBCDataSource.closeConnection(conn);
		}
	}

	public static void delete(long accountNo) {

		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement("Delete from bank where accountNo = ?");

			pstmt.setLong(1, accountNo);

			int i = pstmt.executeUpdate();

			conn.commit();
			System.out.println("Data Deleted SuccessFully " + i + " Row Effected ");
		} catch (Exception e) {
			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

		} finally {
			JDBCDataSource.closeConnection(conn);
		}
	}

	public String getWhereClause(BankingBean bean) {

		StringBuffer sql = new StringBuffer("");

		if (bean != null) {
			if (bean.getAccountNo() > 0) {
				sql.append(" and accountNo = " + bean.getAccountNo());
			}

			if (bean.getHolderName() != null && bean.getHolderName().length() > 0) {
				sql.append(" and holderName = " + bean.getHolderName() + "%'");
			}
			if (bean.getAccountType() != null && bean.getAccountType().length() > 0) {
				sql.append(" and accountType = " + bean.getAccountType() + "%'");
			}
			if (bean.getBalance() > 0) {
				sql.append(" and balance = " + bean.getBalance());
			}

			if (bean.getBranch() != null && bean.getBranch().length() > 0) {
				sql.append(" and branch = " + bean.getBranch() + "%'");
			}
		}

		return sql.toString();
	}

	/*
	 * public BankingBean findByName(long accountNo) {
	 * 
	 * BankingBean bean = findByUniqueColumn("accountNo", accountNo); return bean; }
	 */

	@Override
	public String getTable() {
		// TODO Auto-generated method stub
		return "bank";
	}

	@Override
	public BankingBean getBean() {
		// TODO Auto-generated method stub
		return new BankingBean();
	}

}
