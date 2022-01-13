<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <title>Create New Customer</title>
<%
   //get information (replace apostrophes with double apostrophes to prevent SQL injection attacks)
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zipCode = request.getParameter("zipCode");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");                                    

    //the message to send back
    String message = "";

    //database information
    String dbservername = "localhost";
    String dbname = "mysri";
    String username = "root";
    String password = "";
    String url = "jdbc:mysql://" + dbservername + "/" + dbname + "?user=" + username + "&password=" + password;

    try {
        
        //create instance of the MySQL driver
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        
        //create database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysri", "root", "");
        
        //construct the query
       
            
        //execute it
        Statement stmt = conn.createStatement();
	stmt.executeUpdate("insert into test(Name,Address,City,State,ZipCode,Phone,Email)values('"+name+"','"+address+"','"+city+"','"+state+"','"+zipCode+"','"+phone+"','"+email+"')");
message="Added Customer";
        
    } catch (Exception ex){
        message = "Error occurred while trying to connect to database: " + ex.getMessage();
    }        

%>      
        <script type="text/javascript">//<![CDATA[
            window.onload = function () {
                top.frames["displayFrame"].saveResult("<%= message %>");        
            }
        //]]>
        </script>     
    </head>
    <body>
        
    </body>
</html>
