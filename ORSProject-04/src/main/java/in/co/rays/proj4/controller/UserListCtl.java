package in.co.rays.proj4.controller;

import java.util.List;

import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.model.UserModel;
import in.co.rays.proj4.util.DataUtility;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;

@WebServlet("/ctl/UserListCtl")
public class UserListCtl extends BaseListCtl<UserBean, UserModel> {
	
	/*
	 * @Override protected void preload(HttpServletRequest request) {
	 * 
	 * UserModel model = new UserModel(); List<UserBean> userlist
	 * =model.search(null, 0, 0);
	 * 
	 * request.setAttribute("userList", userlist);
	 * 
	 * 
	 * }
	 */

	@Override
	protected UserBean populateBean(HttpServletRequest request) {

		UserBean bean = new UserBean();

		bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));
		bean.setLastName(DataUtility.getString(request.getParameter("lastName")));
		bean.setLogin(DataUtility.getString(request.getParameter("login")));
		bean.setDob(DataUtility.getDate(request.getParameter("dob")));
		bean.setRoleId(DataUtility.getLong(request.getParameter("roleId")));
		bean.setGender(DataUtility.getString(request.getParameter("gender")));
		return bean;
	}

	@Override
	public UserModel getModel() {

		return new UserModel();
	}

	@Override
	public String getView() {

		return ORSView.USER_LIST_VIEW;
	}

}
