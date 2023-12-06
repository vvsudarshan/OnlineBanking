<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<SCRIPT LANGUAGE="JavaScript">
			function dil(form)
			{
				for(var i=0;i<form.elements.length;i++)
				{
					if(form.elements[i].value =="")
					{
						alert("All Fields are Compulsory")
						document.F1.accountno.focus()
						return false
					}
				}
				
				if(isNaN(document.F1.accountno.value))
				{
					alert("Account No. must be Number & can't be Null")
					document.F1.accountno.value=""
					document.F1.accountno.focus()
					return false
					
				}
				if(!isNaN(document.F1.username.value))
				{
					alert("User Name  must  be  char's & can't be null")
					document.F1.username.value=""
					document.F1.username.focus()
					return false
				}
				if(!isNaN(document.F1.password.value))
				{
			        alert("Password  must  be  char's & can't be null")
				    document.F1.password.value=""
				    document.F1.password.focus()
				    return false
				}
				if(isNaN(document.F1.amount.value))
				{
			        alert("Amount  must  be  number & can't be null")
				    document.F1.amount.value=""
				    document.F1.amount.focus()
				    return false
				}
				return true
			}
			
		</SCRIPT>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Infinite Banking</title>
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
		
			<div id="header">
			
				<h1>EfficientEdge Banking<span class="style1"></span></h1>
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
			
			<table style="width:897px; background:#FFFFFF;margin:0 auto;">
			
				<tr>
					<td width="300" valign="top" style="border-right:#666666 1px dotted;">
						<div id="services"><br>
							<h1>Services</h1><br>
							<ul>
					            <li><a href="#">www.EfficientEdgeBankinge.com </a></li>
								<li><a href="#">www.OnlineBanking.com</a></li>
					            <li><a href="#">www.EEbank.com/forum.jsp</a></li>
							</ul>
						</div>
					</td>
				 	
				 	<td width="1200" valign="top">
				 		<div id="welcome" style="border-right:#666666 1px dotted;">
				 			<br>
				 			<h1>DEPOSIT FORM</h1><br>
				 			<table align="center" bgcolor="white">
				 				
				 				<tr>
				 				</tr>
				 				<tr>
				 					<td>
				 						<div>
				 							<%
				 								if(request.getAttribute("balance")!=null)
				 								{
				 									out.print(request.getAttribute("balance"));
				 								}
				 							%>
				 						</div>
				 						
				 						<form name=F1 onSubmit="return dil(this)" action="deposit.jsp" method="post">
				 							<table cellspacing="5" cellpadding="3">
				 								
				 								<tr><td>ACCOUNT NO</td><td><input type="text" name="accountno"/></td></tr>
				 								<tr><td>USERNAME</td><td><input type="text" name="username"/></td></tr>
				 								<tr><td>PASSWORD</td><td><input type="password" name="password"/></td></tr>
				 								<tr><td>AMOUNT</td><td><input type="text" name="amount"/></td></tr>
				 								
				 								<tr><td></td><td><input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 								<input type="reset" value="CLEAR"></td></tr>
				 								
				 							</table>
				 											 							
				 						</form>
				 						</td>
				 				</tr>	
				 				
				 			</table>
				 		</div>	
				 	</td>
				 	
				 	<td width="299" valign="top">
				 		<div id="welcome" style="text-align:center;border-right:#666666 1px dotted;">
							<br>
					 		<h1>Welcome</h1><br>
							<center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center>
							<br>
							<p>Welcome to the EfficientEdge Banking, where we provide every best possible facilities to our customers. Providing easy and fast payements online.</p>
						
						</div>
				 	
				 	</td>
				 </tr>
			</table>
			
			<div id="footer_top">
			  <div id="footer_navigation">
			  
			
			  </div>
			  
			  <div id="footer_coptright" style="text-align:center;color:black;">
				
				<center><img alt="business" width="196" height="106"></center><br>
				
				<p>This website belongs to the Infinite banking.</p>
				Copyright @EfficientEdge  Banking
			
			 </div>
			
			</div>
		
		<script type="text/javascript">
			document.onload=ctck();
		</script>
			
		</div>
		
	</body>
</html>
				 						