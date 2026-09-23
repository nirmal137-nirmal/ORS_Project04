package in.co.rays.proj4.bean;

import java.sql.ResultSet;

public class SubjectBean extends BaseBean {

	private String name;
	private String description;
	private long courseId;

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

	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
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
			setCourseId(rs.getLong(4));
			setCreatedBy(rs.getString(5));
			setModifiedBy(rs.getString(6));
			setCreatedDatetime(rs.getTimestamp(7));
			setModifiedDatetime(rs.getTimestamp(8));
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.setResultSet(rs);
	}

}
