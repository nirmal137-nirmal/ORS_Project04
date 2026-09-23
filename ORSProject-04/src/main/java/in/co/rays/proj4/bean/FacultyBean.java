package in.co.rays.proj4.bean;

import java.sql.ResultSet;
import java.util.Date;

public class FacultyBean extends BaseBean {

	private long collegeId;
	private String collegeName;
	private String firstName;
	private String lastName;
	private String email;
	private String mobileNo;
	private String address;
	private String gender;
	private Date dateOfBirth;

	public long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(long collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void setResultSet(ResultSet rs) {
		try {
			setId(rs.getLong(1));
			setCollegeId(rs.getLong(2));
			setCollegeName(rs.getString(3));
			setFirstName(rs.getString(4));
			setLastName(rs.getString(5));
			setEmail(rs.getString(6));
			setMobileNo(rs.getString(7));
			setAddress(rs.getString(8));
			setGender(rs.getString(9));
			setDateOfBirth(rs.getTimestamp(10));
			setCreatedBy(rs.getString(11));
			setModifiedBy(rs.getString(12));
			setCreatedDatetime(rs.getTimestamp(13));
			setModifiedDatetime(rs.getTimestamp(14));
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.setResultSet(rs);
	}

}
