
package in.co.rays.proj4.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import in.co.rays.proj4.bean.RoleBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.model.RoleModel;
import in.co.rays.proj4.model.UserModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import in.co.rays.proj4.util.PropertyReader;
import in.co.rays.proj4.util.ServletUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/ctl/UploadPhotoCtl")
@MultipartConfig
public class UploadPhotoCtl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RoleModel model = new RoleModel();
		try {
			List l = model.search(null, 0, 0);
			request.setAttribute("roleList", l);
		} catch (ApplicationException e) {
		}

		super.service(request, response);

		/*
		 * RoleModel model = new RoleModel();
		 * 
		 * List<RoleBean> roleList = model.search(null, 0, 0);
		 * 
		 * request.setAttribute("roleList", roleList);
		 * 
		 * super.service(request, response);
		 */
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("upload ctl do get");

		long id = DataUtility.getLong(request.getParameter("id"));

		UserModel model = new UserModel();
		UserBean bean = model.findByPk(id);

		String photoPath = PropertyReader.getValue("photoPath");

		// User photo available
		if (bean != null && DataValidator.isNotNull(bean.getPhoto())) {

			File file = new File(photoPath, bean.getPhoto());

			if (file.exists()) {

				response.setContentType(getServletContext().getMimeType(file.getName()));

				try (InputStream in = new java.io.FileInputStream(file);
						OutputStream out = response.getOutputStream()) {

					byte[] buffer = new byte[4096];
					int ch;

					while ((ch = in.read(buffer)) != -1) {
						out.write(buffer, 0, ch);
					}
					out.flush();
				}

				return;
			}
		}

		// Get Default photo
		try (InputStream in = getServletContext().getResourceAsStream("/img/logo.png")) {

			response.setContentType("image/png");

			if (in != null) {
				OutputStream out = response.getOutputStream();

				byte[] buffer = new byte[4096];
				int ch;

				while ((ch = in.read(buffer)) != -1) {
					out.write(buffer, 0, ch);
				}

				out.flush();
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		long id = DataUtility.getLong(request.getParameter("id"));

		Part part = request.getPart("photo");

		if (part == null || part.getSize() == 0) {
			ServletUtility.setErrorMessage("Photo is required", request);
			ServletUtility.forward(getView(), request, response);
			return;
		}

		String fileName = part.getSubmittedFileName();

		System.out.println("image name: " + fileName);

		String photoPath = PropertyReader.getValue("photoPath");

		File folder = new File(photoPath);

		System.out.println("folder path: " + photoPath);
		System.out.println("folder: " + folder.getAbsolutePath());

		if (!folder.exists()) {
			folder.mkdirs();
		}

		File destFile = new File(folder, fileName);

		part.write(destFile.getAbsolutePath());

		try {
			UserModel model = new UserModel();

			model.updatePhoto(id, fileName);
			
			// 
			UserBean userBean = model.findByPk(id);
			request.setAttribute("bean", userBean);

			ServletUtility.setSuccessMessage("photo upload successfully", request);

			System.out.println("Photo uploaded successfully: " + fileName);

		} catch (ApplicationException e) {

			e.printStackTrace();

			ServletUtility.setErrorMessage("Photo upload failed", request);
			ServletUtility.forward(getView(), request, response);
			return;
		}

		ServletUtility.forward(getView(), request, response);
	}

	public String getView() {
		return ORSView.USER_VIEW;
	}
}
