package com.banktoDatabase;

import java.sql.*;

import javax.servlet.*;

public class MyListener implements ServletContextListener 
{
	
	public void contextInitialized(ServletContextEvent arg0)
	{
		int status = 0;
		Connection con = null;
		
		try
		{
			con = GetCon.getcon();
			PreparedStatement ps1 = con.prepareStatement("Select * from NEWACCOUNT");
			
			try
			{

				ps1.executeQuery();
				
				status=0;
				
			}catch(Exception e)
			{
				status = 2;
				System.out.println("my status is 1111111 "+status);
				e.printStackTrace();
			}
			
			if(status == 0)
			{
				System.out.println("Your table name already exist"+status);
				
			}
			else
				if(status == 2)
				{
					System.out.println("else if part table does not exist has created "+status);
//					PreparedStatement ps3 = con.prepareStatement("CREATE SEQUENCE infinitenewaccount MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE");
//					ps3.executeUpdate();
					/*CREATE TABLE Student
					(
							ID int NOT NULL AUTO_INCREMENT,
							FirstName varchar(50),
							LastName varchar(50),
							RollNo varchar(50),
							City varchar(50),
							PRIMARY KEY (ID)
							)*/
					PreparedStatement ps = con.prepareStatement("CREATE TABLE NEWACCOUNT(ACCOUNTNO int NOT NULL AUTO_INCREMENT, USERNAME VARCHAR(50),PASSWORD VARCHAR(50), REPASSWORD VARCHAR(50),AMOUNT VARCHAR(50),ADDERESS VARCHAR(50),PHONE VARCHAR(10),PRIMARY KEY (ACCOUNTNO))");
						ps.executeUpdate();
				}
				else
				{
					System.out.println("else part "+status);
				}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	public void contextDestroyed(ServletContextEvent arg0)
	{
		System.out.println("Project Undeployed");
	}
	
}