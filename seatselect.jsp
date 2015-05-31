
<%@include file="connect.jsp" %>
<%				
PreparedStatement ps,ps1,ps2;
ps=con.prepareStatement("select * from seat where date1=?");
ps1=con.prepareStatement("select * from cumv");
ps2=con.prepareStatement("select * from cumv");
int si;
%>

	
<%


//String n=ck[0].getValue();
String name=(String)session.getAttribute("uname");
String mv=request.getParameter("mv");
String city=request.getParameter("city");
String date=request.getParameter("date");
String class1=request.getParameter("class");
String seats=request.getParameter("seats");
ps.setString(1,date);
ResultSet rs=ps.executeQuery();
ResultSet rs1=ps1.executeQuery();
ResultSet rs2=ps2.executeQuery();
//out.println(""+name+"&nbsp"+mv+"&nbsp"+city+"&nbsp"+date+"&nbsp"+class1+"&nbsp"+seats);

Cookie ck1=new Cookie("ck1",mv);
Cookie ck2=new Cookie("ck2",city);
Cookie ck3=new Cookie("ck3",date);
Cookie ck4=new Cookie("ck4",class1);
Cookie ck5=new Cookie("ck5",seats);
response.addCookie(ck1);
response.addCookie(ck2);
response.addCookie(ck3);
response.addCookie(ck4);
response.addCookie(ck5);

%>

<html>
<head>
<link rel="stylesheet"  type="text/css" href="css/m.css">

<script type="text/javascript">


function checkboxlimit(checkgroup, limit){
	var checkgroup=checkgroup
	var limit=limit
	for (var i=0; i<checkgroup.length; i++){
		checkgroup[i].onclick=function(){
		var checkedcount=0
		for (var i=0; i<checkgroup.length; i++)
			checkedcount+=(checkgroup[i].checked)? 1 : 0
		if (checkedcount>limit){
			alert("You can only select a maximum of "+limit+" seats")
			this.checked=false
			}
		}
	}
}
 
</script>

<%
int s=Integer.parseInt(request.getParameter("seats"));
%>



<body background="images/bg.jpg">

<table align="center" bgcolor="white">
<tr>
<td>
<hr>
<center><img src="images/screen.jpg"></center>
<hr>
<form action="pay.jsp" name="seat" method="post">
<center>
<%
int j=1;
int[] ar=new int[50];
while(rs.next())
{

ar[j]=Integer.parseInt(rs.getString("booked"));
//out.println(ar[j]);
j++;
}
%>
<% int r=1; 
 char a='A';%>
<% for(int i=1;i<50;i++)
{

int b=1;
for(int k=1;k<50;k++)
{
if(ar[k]==i)
{
b=0;
k++;
}
}
if(b==0)
{%>
<b><%=""+i%></b>
<input type="checkbox"  name="seat1" id="field1" class="mycheckbox" value=<%=""+i%>  onclick="check()" disabled>
<label for="field1" class="mycheckbox-label">&nbsp&nbsp&nbsp</label>
<%continue;
}
%>
<b><%=""+i%></b>

<label><input type="checkbox" class="mycheckbox"  name="seat"  value=<%=""+i%> id="check" ><span>&nbsp&nbsp&nbsp</span></label>
<%

if (i%9==0)
{%>
<br>



<%=""+a++%>
<%
continue;
}
}
%>

<br><br>
<input type="submit" value="pay">
</center>
</form>

<script type="text/javascript">
var s=<%=request.getParameter("seats")%>;
//Syntax: checkboxlimit(checkbox_reference, limit)
checkboxlimit(document.forms.seat.seat, s)
check()
</script>
<p align="center"><img src="images/R_chair.gif">Booked Seats<br>
<img src="images/G_chair.gif">Available Seats<br>
<img src="images/Gy_chair.gif">Your Choice<br></p>

</td>
</tr></table>
</body>
</html>