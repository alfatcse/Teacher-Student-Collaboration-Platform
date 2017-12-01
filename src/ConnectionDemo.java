import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.swing.JOptionPane;


public class ConnectionDemo implements ServletContextListener{

	Connection con=null;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		try{		
			//con.close();
		}catch(Exception ex)
		{
			System.out.println("Error in Closing::"+ex);
		}
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
		try {
			/*Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","123");*/
			Driver driver=new com.mysql.jdbc.Driver();
			DriverManager.registerDriver(driver);
			//Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://mysql123.mysql.database.azure.com:3306/saca","lictadmin@mysql123","lict@1234");
            
			 ServletContext sc = sce.getServletContext();
			 sc.setAttribute("MyConn", con);
			// JOptionPane.showConfirmDialog(null, sc);
			
		} 
		catch(Exception e){
			
			System.out.println("Error:  "+e);
		}
		
	}

}
