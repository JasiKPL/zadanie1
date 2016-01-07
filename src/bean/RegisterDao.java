package bean;

import java.sql.*;

public class RegisterDao {

	public static boolean freeSlots() {
		Connection con=ConnectionProvider.getCon();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("select count(*) from users");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
		        int numberOfRows = rs.getInt(1);
		        if (numberOfRows >= 5) {
		        	return false;
		        }
			}
		} catch (SQLException e) {
			return false;
		}
		return true;
	}
	
	public static String register(User u){
		try{
			if (!RegisterDao.freeSlots()) {
				return "Brak wolnych miejsc";
			}
			Connection con=ConnectionProvider.getCon();
            PreparedStatement ps=con.prepareStatement("insert into users values(?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, u.getName());
            ps.setString(2, u.getSurname());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getEmailConfirmation());
            ps.setString(5, u.getCompany());
            ps.setString(6, u.getSource());
            ps.setString(7, u.getJob());
			ps.executeUpdate();
		}catch(Exception e){
			System.out.println("Error while registering user: " + e.toString());
			return e.toString();
		}
		
		return "Poprawnie zarejestrowano";
	}
}
