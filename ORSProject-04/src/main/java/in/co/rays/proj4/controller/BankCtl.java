package in.co.rays.proj4.controller;

import in.co.rays.proj4.bean.BankingBean;
import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.model.BankingModel;
import in.co.rays.proj4.model.BaseModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;

@WebServlet("/ctl/BankCtl")
public class BankCtl extends BaseCtl {

	@Override
	protected boolean validate(HttpServletRequest request) {

		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("accountNo"))) {
			request.setAttribute("accountNo", "Account Number is required");
			pass = false;
		} else if (!DataValidator.isLong(request.getParameter("accountNo"))) {
			request.setAttribute("accountNo", "Account Number must be a valid number");
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("holderName"))) {
			request.setAttribute("holderName", "Holder Name is required");
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("accountType"))) {
			request.setAttribute("accountType", "Account Type is required");
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("balance"))) {
			request.setAttribute("balance", "Balance is required");
			pass = false;
		} else if (!DataValidator.isDouble(request.getParameter("balance"))) {
			request.setAttribute("balance", "Balance must be a valid number");
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("branch"))) {
			request.setAttribute("branch", "Branch is required");
			pass = false;
		}

		return false;
	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		BankingBean bean = new BankingBean();

		bean.setAccountNo(DataUtility.getLong(request.getParameter("accountNo")));
		bean.setHolderName(DataUtility.getString(request.getParameter("holderName")));
		bean.setAccountType(DataUtility.getString(request.getParameter("accountType")));
		bean.setBalance(DataUtility.getDouble(request.getParameter("balance")));
		bean.setBranch(DataUtility.getString(request.getParameter("branch")));

		return bean;
	}

	@Override
	public BaseModel getModel() {
		return new BankingModel();
	}

	@Override
	public String getView() {
		return ORSView.BANK_VIEW;
	}

}
