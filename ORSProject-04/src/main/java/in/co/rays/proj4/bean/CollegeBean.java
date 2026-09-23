package in.co.rays.proj4.bean;

import java.sql.ResultSet;

public class CollegeBean extends BaseBean {

	private String name;
	private String address;
	private String State;
	private String city;
	private String phoneNo;

	@Override
	public String getValue() {
		
		return null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	
	@Override
	public void setResultSet(ResultSet rs) {
		try {
			setName(rs.getString("name"));
			setAddress(rs.getString("address"));
			setState(rs.getString("state"));
			setCity(rs.getString("city"));
			setPhoneNo(rs.getString("phone_no"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.setResultSet(rs);
	}

}
