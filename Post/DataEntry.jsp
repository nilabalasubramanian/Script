<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Create New Customer</title>
    <script type="text/javascript">//<![CDATA[
           
        function saveResult(sMessage) {
            var divStatus = document.getElementById("divStatus");
            divStatus.innerHTML = "Request completed: " + sMessage;            
        }
    //]]>
    </script>    
</head>
<body>
    <form method="post" action="SaveCustomer.jsp" target="hiddenFrame">
    <p>Enter customer information to be saved:</p>
    <p>Customer Name: <input type="text" name="name" value="" /><br />
    Address: <input type="text" name="address" value="" /><br />
    City: <input type="text" name="city" value="" /><br />
    State: <input type="text" name="state" value="" /><br />
    Zip Code: <input type="text" name="zipCode" value="" /><br />
    Phone: <input type="text" name="phone" value="" /><br />
    E-mail: <input type="text" name="essmail" value="" /></p>
    <p><input type="submit" value="Save Customer Info" /></p>
    </form>
    <div id="divStatus"></div>
</body>
</html>
