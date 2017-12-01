<%-- 
    Document   : index
    Created on : Nov 14, 2013, 11:36:25 AM
    Author     : Vishal.Gilbile
--%>
<%@page import="java.util.Calendar"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="f1" method="post" enctype="multipart/form-data" action="newFile">
            <h2>
               Insert Assignment
            </h2>
            <table>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    ID:
                                </td>
                                <td>
                                    <input type="text" name="id" value="" />
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    Dept name:
                                </td>
                                <td>
                                    <input type="text" name="name" value="" />
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    Course NO:
                                </td>
                                <td>
                                    <input type="text" name="course" value="" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Year:
                                </td>
                                <td>
                                <input value=<%=(int) Calendar.getInstance().get(Calendar.YEAR)%>
									 name="year">
                                   
                                </td>
                            </tr>
                           
                            <tr>
                                <td>
                                   File:
                                </td>
                                <td>
                                    <input type="file" name="flPhoto" value="" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" value="Save" name="btnSave" />
                                </td>
                            </tr>
                        </table> 
                    </td>
                   
               
            </table>
        </form>
        
    </body>
</html>
