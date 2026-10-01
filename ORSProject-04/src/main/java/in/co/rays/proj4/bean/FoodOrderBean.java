package in.co.rays.proj4.bean;

import java.sql.ResultSet;

public class FoodOrderBean extends BaseBean {

	private String customerName;
	private String restaurant;
	private double orderAmount;
	private String deliveryStatus;

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}

	public double getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(double orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setResultSet(ResultSet rs) {

		try {
			setId(rs.getLong("id"));
			setCustomerName(rs.getString("customer_name"));
			setRestaurant(rs.getString("restaurant"));
			setOrderAmount(rs.getDouble("order_amount"));
			setDeliveryStatus(rs.getString("delivery_status"));
			setCreatedBy(rs.getString("created_by"));
			setModifiedBy(rs.getString("modified_by"));
			setCreatedDatetime(rs.getTimestamp("created_datetime"));
			setModifiedDatetime(rs.getTimestamp("modified_datetime"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		super.setResultSet(rs);
	}

}
