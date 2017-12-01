

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Iterator;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
@WebServlet("/newFile")

@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class newFile extends HttpServlet {

    String id,dept,courseno,year;
    float salary;
    FileItem flItem = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement stat = null;
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
                    } else {
                        flItem = fileItem;
                    }
                }
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT", "123");
                stat = con.prepareStatement("insert into ppp (id,dept,courseno,year,pic)values(?,?,?,?,?)");
                stat.setString(1, id);
                stat.setString(2, dept);
                stat.setString(3,courseno );
                stat.setString(4, year);
                stat.setBinaryStream(5, flItem.getInputStream(), (int) flItem.getSize());
                // stat.setBinaryStream(4, (InputStream) itemPhoto.getInputStream(), (int) itemPhoto.getSize());
                int rows = stat.executeUpdate();
                out.println("insert");
             
            }
        } catch (Exception ex) {
            out.println(ex.getMessage());
        } 
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processFormField(FileItem item) {
        //String na = item.getFieldName();
        if (item.getFieldName().equals("id")) {
            id = item.getString();
        } else if (item.getFieldName().equals("name")) {
            dept = item.getString();
        } 
        else if (item.getFieldName().equals("course")) {
            courseno = item.getString();
        } 
        else if (item.getFieldName().equals("year")) {
            year = item.getString();
        } 
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
