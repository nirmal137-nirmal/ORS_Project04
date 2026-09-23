package in.co.rays.proj4.bean;

import java.sql.ResultSet;

public class CourseBean extends BaseBean {

	private String name;
	private String description;
	private String duration;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
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
			setName(rs.getString(2));
			setDescription(rs.getString(3));
			setDuration(rs.getString(4));
			setCreatedBy(rs.getString(5));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.setResultSet(rs);
	}

}
