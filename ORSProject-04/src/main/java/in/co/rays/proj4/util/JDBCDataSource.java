package in.co.rays.proj4.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;

import com.mchange.v2.c3p0.ComboPooledDataSource;   // isme 2 design follow kr rahe hai singleton or factory design -- ye connection pe hi rha hai 

//1.  provide Connection Re-usability
//2.  provide Reliable Connection With DataBase.
//3   Provide Maximum Connection limitation with DataBase.

public final class JDBCDataSource { // make class final - singleton class

	private static final JDBCDataSource jdbc = null; // self type ka attribute banaya - Make self type static variable ,
														// static variable have only one copy in there life

	private ComboPooledDataSource cpds = null; // combopool ka object bana diya - c3p0 ki dependency add kri hai
												// tb hi access kr skte h.

	private static ResourceBundle rb = ResourceBundle.getBundle("in.co.rays.proj4.bundle.System");

	private JDBCDataSource() { // make a private constructor - ek hi bar call hoga

		cpds = new ComboPooledDataSource();

		try {

			cpds.setDriverClass(rb.getString("driver")); // properties add kr di
			cpds.setJdbcUrl(rb.getString("url"));
			cpds.setUser(rb.getString("username"));
			cpds.setPassword(rb.getString("password"));

			 //  combopool  ki properties ka use kiya hai data source se ye methods se ye mil jayegi
			cpds.setMaxPoolSize(30); // total connetion  30 hai 30 ke bad koi aata hai to wait krega server down hoga new connection ke liye 
			cpds.setMinPoolSize(10); //  10 maintain krr ke chalega connection
			cpds.setAcquireIncrement(5);// 10 - 10 se badiya, ek user aya fr bhi 10 connection milege
			cpds.setInitialPoolSize(10);  // application open kri to 5 connection mil jayege

		} catch (Exception e) {
			e.getMessage();
		}

	}

	private static JDBCDataSource getInstance() { // make get instance() method for return same type of instance
		if (jdbc == null) {
			return new JDBCDataSource();
		}
		return jdbc;
	}

	public static Connection getConnection() {

		try {
			return getInstance().cpds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public static void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();

			} catch (Exception e) {
				e.printStackTrace();

			}
		}

	}

	public static void trnRollBack(Connection conn) {

		if (conn != null) {

			try {
				conn.rollback();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
