<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
    <title>Hidden Frame POST Example</title>
</head>
<frameset rows="100%,0" style="border: 0px">
    <frame name="displayFrame" src="DataEntry.jsp" noresize="noresize" style="border: 0px" />
    <frame name="hiddenFrame" src="about:blank" noresize="noresize" style="border: 0px" />
</frameset>
</html>
