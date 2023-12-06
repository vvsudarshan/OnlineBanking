package com.banktoDatabase;

import java.sql.*;

public class GetCon 
{
	
	private GetCon() {}
	
	public static Connection con;
	
	// static block it will execute automatically as the class loads
	static
	{
		try 
		{
			Class.forName(DBInitializer.DRIVER);
			
			con = DriverManager.getConnection(DBInitializer.CON_STRING,DBInitializer.USERNAME,DBInitializer.PASSWORD);
		}catch(ClassNotFoundException e)
		{   
			System.out.println("class loader getting erorr");
			e.printStackTrace();
		}catch(SQLException e)
		{
			System.out.println("class loader getting erorr");
			System.out.println("Exception in GetCon.java file");
		}
	}
	
	public static Connection getcon()
	{
		return con;
	}
	
//	public static int getPrimaryKey()
//	{
//		int nextvalue = 0;
//		Connection con = GetCon.getcon();
//		
//		PreparedStatement ps2;
//		
//		try
//		{
//			ps2 = con.prepareStatement("select NEWACCOUNT.nextval from dual");
//			 ResultSet rs = ps2.executeQuery();
//			 rs.next();
//			 nextvalue = rs.getInt(1);
//			
//			
//		}catch(SQLException e)
//		{
//			e.printStackTrace();
//		}
//		
//		return nextvalue;
//		
//	}
	
	
	
}
