package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.FoodOrderBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class FoodOrderModel extends BaseModel<FoodOrderBean> {

	@Override
	public long add(FoodOrderBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;
		int pk = 0;

		try {
			pk = nextPk();

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement("insert into " + getTable() + " values(?,?,?,?,?,?,?,?,?)");

			pstmt.setLong(1, pk);
			pstmt.setString(2, bean.getCustomerName());
			pstmt.setString(3, bean.getRestaurant());
			pstmt.setDouble(4, bean.getOrderAmount());
			pstmt.setString(5, bean.getDeliveryStatus());
			pstmt.setString(6, bean.getCreatedBy());
			pstmt.setString(7, bean.getModifiedBy());
			pstmt.setTimestamp(8, bean.getCreatedDatetime());
			pstmt.setTimestamp(9, bean.getModifiedDatetime());

			pstmt.executeUpdate();
			conn.commit();

			System.out.println("Record Inserted Successfully");

		} catch (Exception e) {
			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return pk;
	}
	@Override
	public void update(FoodOrderBean bean)
	        throws ApplicationException, DuplicateRecordException {

	    Connection conn = null;

	    try {

	        conn = JDBCDataSource.getConnection();
	        conn.setAutoCommit(false);

	        PreparedStatement pstmt = conn.prepareStatement(
	                "update " + getTable() +" set customer_name = ?, restaurant = ?, order_amount = ?, delivery_status = ?, created_by = ?, modified_by = ?, created_datetime = ?, modified_datetime = ? where id = ?"
	        );

	        pstmt.setString(1, bean.getCustomerName());
	        pstmt.setString(2, bean.getRestaurant());
	        pstmt.setDouble(3, bean.getOrderAmount());
	        pstmt.setString(4, bean.getDeliveryStatus());
	        pstmt.setString(5, bean.getCreatedBy());
	        pstmt.setString(6, bean.getModifiedBy());
	        pstmt.setTimestamp(7, bean.getCreatedDatetime());
	        pstmt.setTimestamp(8, bean.getModifiedDatetime());
	        pstmt.setLong(9, bean.getId());

	        pstmt.executeUpdate();

	        conn.commit();

	        System.out.println("Record Updated Successfully");

	    } catch (Exception e) {

	        e.printStackTrace();
	        JDBCDataSource.trnRollBack(conn);

	    } finally {

	        JDBCDataSource.closeConnection(conn);
	    }
	}

	@Override
	public String getWhereClause(FoodOrderBean bean) {

		StringBuffer sql = new StringBuffer();

		if (bean != null) {
			if (bean.getId() > 0) {
				sql.append(" and id = " + bean.getId());
			}
			if (bean.getCustomerName() != null && bean.getCustomerName().length() > 0) {
			    sql.append(" and customer_name like '" + bean.getCustomerName() + "%'");
			}

			if (bean.getRestaurant() != null && bean.getRestaurant().length() > 0) {
			    sql.append(" and restaurant like '" + bean.getRestaurant() + "%'");
			}

			if (bean.getOrderAmount() > 0) {
			    sql.append(" and order_amount = " + bean.getOrderAmount());
			}

			if (bean.getDeliveryStatus() != null && bean.getDeliveryStatus().length() > 0) {
			    sql.append(" and delivery_status like '" + bean.getDeliveryStatus() + "%'");
			}
			if (bean.getCreatedBy() != null && bean.getCreatedBy().length() > 0) {
				sql.append(" and created_by like '" + bean.getCreatedBy() + "%'");
			}
			if (bean.getModifiedBy() != null && bean.getModifiedBy().length() > 0) {
				sql.append(" and modified_by like '" + bean.getModifiedBy() + "%'");
			}
			if (bean.getCreatedDatetime() != null) {
				sql.append(" and created_datetime = '" + bean.getCreatedDatetime() + "'");
			}
			if (bean.getModifiedDatetime() != null) {
				sql.append(" and modified_datetime = '" + bean.getModifiedDatetime() + "'");
			}
		}

		return sql.toString();
	}

	@Override
	public String getTable() {

		return "food_order";
	}

	@Override
	public FoodOrderBean getBean() {

		return new FoodOrderBean();
	}

}
