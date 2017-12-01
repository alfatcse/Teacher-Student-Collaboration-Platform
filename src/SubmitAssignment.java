
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.Iterator;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class SubmitAssignment
 */
@WebServlet("/SubmitAssignment")

@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class SubmitAssignment extends HttpServlet {
	
    String department_name,course_code,course_year;
    
    FileItem flItem = null;
	//table code
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
    	PrintWriter pw = response.getWriter(); 
        
    	// department_name = request.getParameter("department_name");
    	// course_code = request.getParameter("course_code");
    	 //course_name = request.getParameter("course_name");
    	// course_year = request.getParameter("course_year");
    	// String table_name = department_name+course_year+course_code; 
       // pw.println(table_name);
    	HttpSession hs = request.getSession();
    	String email = (String) hs.getAttribute("semail");
    	String name = (String) hs.getAttribute("sname");
    	String student_id = (String) hs.getAttribute("student_id");

    		if (email == null) {
    			
    			pw.println("<font color=red size=5>You are not logged in.</font>");
    			response.setHeader("Refresh", "3;url=StudentPanel.jsp");
    			
    			
    			//throw new javax.servlet.jsp.SkipPageException();

    		}
			//pw.println(table_name);
    		
        
       // sir code 
        
		
          PrintWriter out = response.getWriter();
       //out.println("juthi");
        PreparedStatement stat = null;
		Connection con=null;
        try {
        	
            long maxFileSize = (2 * 1024 * 1024);
            int maxMemSize = (2 * 1024 * 1024);
			
//            final String path = "/tmp";
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if (isMultiPart) {
				
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                while (iter.hasNext()) {
					
                    FileItem fileItem = iter.next();
                    if (fileItem.isFormField()) {
                        processFormField(fileItem);
						//out.println("juthi2");
						
                       
                    } else {
                        flItem = fileItem;
                     
                    }
                }
				
				
				
				
		 department_name = request.getParameter("department_name");
    	 course_code = request.getParameter("course_code");
		course_year = request.getParameter("course_year");
    	 String table_name = department_name+course_year+course_code; 
     
				
                  ServletContext sc = getServletContext();
          	 con = (Connection) sc.getAttribute("MyConn");
			 
               // pw.println("kundu");
             
                stat = con.prepareStatement("insert into " +table_name+ " (STUDENT_ID,assignment_1)values(?,?) where STUDENT_ID= "+student_id);
           
                stat.setString(1,student_id);
              
              pw.println("juthi");
                stat.setBinaryStream(2, flItem.getInputStream(), (int) flItem.getSize());
                // stat.setBinaryStream(4, (InputStream) itemPhoto.getInputStream(), (int) itemPhoto.getSize());
                ResultSet rs=stat.executeQuery();
                while(rs.next())
                {
                	
                	out.println("Insert....");
                	
                }
                }
               /* int rows = stat.executeUpdate();
                if (rows > 0) {
                    response.sendRedirect("index.jsp");
                } else {
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Error Adding Employee</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h2>Error Adding Employee Data</h2>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }*/
        } catch (Exception ex) {
            out.println(ex.getMessage());
        }
    }
	
	
	
	
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 processRequest(request, response);
	}
	
	
    private void processFormField(FileItem item) {
        //String na = item.getFieldName();
        if (item.getFieldName().equals("department_name")) {
        	department_name = item.getString();
        } else if (item.getFieldName().equals("course_code")) {
        	course_code = item.getString();
        }
        else if (item.getFieldName().equals("course_year")) {
        	course_year = item.getString();
        }
        
        
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
