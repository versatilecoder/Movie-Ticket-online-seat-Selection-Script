
<%@include file="connect.jsp" %>
<%				
PreparedStatement ps,ps1;
ps=con.prepareStatement("select * from seat where date1=?");
ps1=con.prepareStatement("insert into seat values(?,?,?,?,?,?)");
int si;
%>

	
<%
Cookie ck[]=request.getCookies();
String n=ck[0].getValue();

String mv=ck[1].getValue();
String city=ck[2].getValue();
String date=ck[3].getValue();
String class1=ck[4].getValue();
String seats=ck[5].getValue();
int str=Integer.parseInt(seats);
String [] st=request.getParameterValues("seat");
String subs=request.getParameter("subs");
ps.setString(1,date);
ResultSet rs=ps.executeQuery();

for(int k=0;k<str;k++)
{
  session.setAttribute( "ck6",st);
}


%>

<html>
<head><center>Secure Transaction</center></head>
<body background="images/pay2.jpg">
<br><br><br><br><br><br><br><br>
<table align="center">
<tr><td>
<form action="thanks.jsp" method="post">
<input type="text" name="amt" placeholder="Account number" style="width:200px;" ><br><br>
<input type="password" name="pin" placeholder="Enter PIN" style="width:200px;"><br>
<center><input type="image"  src="images/pay1.png" title="click to pay" type="submit" ></center>
</form>

<img src="images/pay.jpg" style="align:bottom;">
</td></tr></table>
</body>
</html>