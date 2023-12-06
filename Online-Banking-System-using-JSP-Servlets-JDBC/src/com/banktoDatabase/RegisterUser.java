package com.banktoDatabase;

import java.sql.*;

public class RegisterUser 
{
	static int status=0 ;
	
	public static int register(String username,String password,String repassword,double amount,String address,double phone)
	{
		Connection con = GetCon.getcon();
		PreparedStatement ps;
		
		try
		{
			
			ps = con.prepareStatement("INSERT INTO newaccount"
					+ " (user_name, user_password, user_repassword,"
					+ " user_amount, user_address, user_phone) "
					+ "VALUES (?, ?, ?, ?, ?, ?)");
			
			//int nextvalue1 = GetCon.getPrimaryKey();
			
//			ps.setString(1,null);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, repassword);
			ps.setDouble(4, amount);
			ps.setString(5, address);
			ps.setDouble(6, phone);
			
			status = ps.executeUpdate();
			
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return status;
	}
}
