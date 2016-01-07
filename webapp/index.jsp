<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.RegisterDao" contentType="text/html; charset=UTF-8"%>
<%
if (!RegisterDao.freeSlots()) {
	out.print("Brak wolnych miejsc");
} else if (session.getAttribute("registered") == "true") {
	out.print("Zgłoszenie już zostało wysłane");
} else {
%>
<form action="process.jsp">  
Imię: <input type="text" name="name"/><br/>  
Nazwisko: <input type="text" name="surname"/><br/>
Email: <input type="text" name="email"/><br/>
Powtórz Email: <input type="text" name="email_confirmation"/><br/>
Nazwa pracodawcy: <input type="text" name="company"/><br/>
Skąd dowiedziałeś się o konferencji?: <select name="source">
	<option value="Ogłoszenie w pracy">Ogłoszenie w pracy</option>
	<option value="Ogłoszenie na uczelni">Ogłoszenie na uczelni</option>
	<option value="Facebook">Facebook</option>
	<option value="Znajomi">Znajomi</option>
	<option value="Inne (jakie?)">Inne (jakie?)</option>
</select><br/>
Czym się zajmujesz?: <input type="text" name="job"/><br/>  
<input type="submit" value="register"/>  
</form>
<%
}
%>