<%@page import="bean.RegisterDao" contentType="text/html; charset=UTF-8"%>  
<jsp:useBean id="obj" class="bean.User"/>  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
String status=RegisterDao.register(obj);  
if(status == "Poprawnie zarejestrowano") { 
	session.setAttribute("registered", "true");
}
out.print(status);
  
%> 