<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <title>Get Customer Data</title>
        <script type="text/javascript">//<![CDATA[
            window.onload = function () {
                var divInfoToReturn = document.getElementById("divInfoToReturn");
                parent.displayCustomerInfo(divInfoToReturn.innerHTML);        
            };
        //]]>
        </script>    
    </head>
    <body>
<%!
    protected String getCustomerData(int id){                
    
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            //database information
            String dbservername = "localhost";
            String dbname = "Proajax";
            String username = "root";
            String password = "";
            String url = "jdbc:mysql://" + dbservername + "/" + dbname + "?user=" + username + "&password=" + password;
            
            //create database connection
            Connection conn = DriverManager.getConnection(url);
            
            //execute query
            String sql = "Select * from customers where CustomerId=" + id;
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            boolean found = rs.next();
            StringBuffer buffer = new StringBuffer();
                
            //if there was a match...
            if (found) {
                
                buffer.append(rs.getString("Name"));
                buffer.append("<br />");                
                buffer.append(rs.getString("Address"));                
                buffer.append("<br />");                
                buffer.append(rs.getString("City"));                
                buffer.append("<br />");                
                buffer.append(rs.getString("State"));                
                buffer.append("<br />");                
                buffer.append(rs.getString("Zip"));                
                buffer.append("<br /><br />");                
                buffer.append("Phone: " + rs.getString("Phone"));                
                buffer.append("<br /><a href=\"mailto:");                
                buffer.append(rs.getString("Email"));                
                buffer.append("\">");                
                buffer.append(rs.getString("Email"));                
                buffer.append("</a>");
            } else {
                buffer.append("Customer with ID ");
                buffer.append(id);
                buffer.append(" could not be found.");
            }
            
            rs.close();
            conn.close();
            
            return buffer.toString();
        } catch (Exception ex){
             return "Error occurred while trying to connect to database: " + ex.getMessage();
        }
        
    }        
%>
<%
        String strId = request.getParameter("id");
        int id = -1;
        String message = "";

        try {
            id = Integer.parseInt(strId);
            message = getCustomerData(id);
        } catch (Exception ex) {
            message = "Invalid customer ID.";
        }
%>
        <div id="divInfoToReturn"><%= message %></div>
    </body>
</html>