<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.banktoDatabase.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>EfficientEdge  Banking..</title>
		<link href="styles.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
			function ctck()
			{
				var sds = document.getElementById("dum");
			}
		</script>
	</head>
	<body>
		<div id ="top_links">
			
			<div id="header">
			
				<h1>EfficientEdge  Banking..<span class="style1"></span></h1>
				<h2>Excellent Service Provider...</h2>
				<A href="index.html"><img alt="Home Button" src="images/home1.gif"></A>
				
			</div>
			<div id="navigation">
				
				<ul>
				    <li><a href="create.html">NEW ACCOUNT</a></li>
				    <li><a href="balance1.jsp">BALANCE</a></li>
				    <li><a href="deposit1.jsp">DEPOSIT</a></li>
				    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
				    <li><a href="transfer1.jsp">TRANSFER</a></li>
				    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
				    <li><a href="#">ABOUT US</a></li>
			    </ul>
				
			</div>
				<table style="width:897px; background:#FFFFFF; margin:0 auto;">
			
				<tr>
					<td width="300" valign="top" style="border-right:#666666 1px dotted;">
						<div id="services"><br>
							<h1>Services</h1><br>
							<ul>
								<li><a href="#">www.EfficientEdgeBanking.com</a></li>
					            <li><a href="#">www.Onlinebanking.com </a></li>
					            <li><a href="#">www.EEbank.com/forum.jsp</a></li>
							</ul>
						</div>
					</td>
				 	
				 	<td width="1200" valign="top">
					 	<% %>
					 	
					 	<table>
					 		
					 		<%
					 			String num = request.getParameter("accountno");
					 			int accountno = Integer.parseInt(num);
					 			
					 			String username = request.getParameter("username");
					 			String password = request.getParameter("password");
					 			
					 			String num1 = request.getParameter("taccountno");
					 			int taccountno = Integer.parseInt(num1);
					 			
					 			String amoun = request.getParameter("amount");
					 			int accoun = Integer.parseInt(amoun);
					 			
					 			boolean status = verifyLogin1.checkLogin(accountno, username, password);
					 			
					 			try
					 			{
					 				
					 				if(status)
					 				{
					 					out.print("Welcome "+username);
				 					  	out.print("RECIEVER ACCOUNT NO DOES NOT EXSIT -->    " + taccountno);
				 		
					 						
					 					Connection con = GetCon.getcon();
					 					
					 					
					 					PreparedStatement ps = con.prepareStatement("select * from NEWACCOUNT where user_id='"+taccountno+"'");
					 					ResultSet rs = ps.executeQuery();
					 					
					 					int dataamount = 0;
					 					
					 					if(rs.next())
					 					{
					 							dataamount = accoun + rs.getInt(5);
					 							
					 					}else
					 					{
					 						out.print("RECIEVER Account doesn't exist!!");
					 						request.setAttribute("balance", "RECIEVER Account doesn't exist!!");
					 						%>
					 						<jsp:forward page="transfer1.jsp"></jsp:forward>
					 						<%
					 					}
					 					
					 					PreparedStatement ps2 = con.prepareStatement("select * from NEWACCOUNT where user_id=?");
					 					ps2.setInt(1, accountno);
					 					
					 					ResultSet rs2 = ps2.executeQuery();
					 					
					 					int dataamount1 = 0;
					 					
					 					if(rs2.next())
					 					{
					 						dataamount1 = rs2.getInt(5) - accoun;
					 						
					 						
					 					}
					 					if(dataamount1 < 1000)
				 						{
				 							out.print("Your Account doesn't have sufficient Balance. Please maintain Base limit to continue");
				 							request.setAttribute("balance", "Your Account doesn't have sufficient Balance!!");
					 						%>
					 						<jsp:forward page="transfer1.jsp"></jsp:forward>
					 						<%
				 						}else
				 						{
				 							
						 					PreparedStatement ps1 =con.prepareStatement("update NEWACCOUNT set user_amount=? where user_id='"+taccountno+"'");
						 					ps1.setInt(1, dataamount);
						 					ps1.executeUpdate();
						 					
						 					PreparedStatement ps3 =con.prepareStatement("update NEWACCOUNT set user_amount=? where user_id='"+accountno+"'");
						 					ps3.setInt(1, dataamount1);
						 					ps3.executeUpdate();
						 			
					 						request.setAttribute("RECIEVER BALANCE :", dataamount);
					 						request.setAttribute("SENDER BALANCE :", dataamount1);
					 						
					 						%>
					 						<jsp:forward page="tbalance.jsp"></jsp:forward>
					 						<%
						 					
				 						}
					 					
					 				}else
					 				{

				 						out.print("Please check your username and password");
				 						request.setAttribute("balance", "Please check your username and password!!");
				 						%>
				 						<jsp:forward page="transfer1.jsp"></jsp:forward>
				 						<%
					 				}
					 				
					 			}catch(SQLException e)
					 			{
					 				e.printStackTrace();
					 			}
					 			
					 		%>
					 	</table>
					</td>
				</tr>
			</table>
		</div>
					 	
	</body>
</html>