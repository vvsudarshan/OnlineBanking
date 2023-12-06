<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.banktoDatabase.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>EfficientEdge  Banking...</title>
		<link href="styles.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
			function ctck()
			{
				var sds = document.getElementById("dum");
			}
		</script>
	</head>
	<body>
		<div id="top_links">
		
			<div id = "header">
				
				<h1>EfficientEdge  Banking..<span class="style1"></span></h1>
				<h2>ExtraOrdinary Services</h2>
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
			
			<table style="width:897px;background:#FFFFFF;margin:0 auto;">
				
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
				 	
				 		<table>
				 				
				 			<%
				 				String num = request.getParameter("accountno");
				 				int accountno = Integer.parseInt(num);
				 				
				 				String password = request.getParameter("password");
				 				String username = request.getParameter("username");
				 				
				 				boolean status = verifyLogin1.checkLogin(accountno, username, password);
				 				
				 				try
				 				{
				 					
				 					if(status)
				 					{
				 						Connection con = GetCon.getcon();
				 						PreparedStatement ps = con.prepareStatement("delete from NEWACCOUNT where user_id='"+accountno+"'");
				 						
				 						ps.executeUpdate();
				 						
				 						out.print("&nbsp;&nbsp;&nbsp;your account no '"+accountno+"' has closed.");

				 						out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href='index.html'><IMG SRC='images/home1.gif'></IMG></A>");
				 						
				 					}else
				 					{
				 						out.print("Please check your username and password");
				 						request.setAttribute("balance", "Please check your username and password!!");
				 						%>
				 						<jsp:forward page="closeac1.jsp"></jsp:forward>
				 						<%
				 					}
				 					
				 				}catch(SQLException e)
				 				{
				 					e.printStackTrace();
				 				}
				 				
				 				
				 			%>
				 			
				 		</table>
				</tr>
				
			</table>
		</div>
	</body>
</html>