<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
				<h2>ExtraOrdinary Service</h2>
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
				 	
				 	
					 	<table>
					 		<tr>
					 			<td align="center" valign="middle" bgcolor="red"><h4>Account Info</h4></td>
					 		</tr>
					 		
					 		<tr>
					 			<td>
					 				<%
					 					if(request.getAttribute("balance")!=null)
					 					{
					 						
					 						out.print(request.getAttribute("balance"));
					 						out.print(request.getAttribute("totaldataamount"));
					 					}
					 				%>
					 			</td>
					 		</tr>
					 	</table>
					</td>
				</tr>
			</table>	
		</div>	
	</body>
</html>