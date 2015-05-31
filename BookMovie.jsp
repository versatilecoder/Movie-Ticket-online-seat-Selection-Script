<%@include file="connect.jsp" %>
<%
PreparedStatement ps;
String p="";
String pi="";
ps=con.prepareStatement("select * from bkmuv");

%>

	
<%
Cookie ck[]=request.getCookies();

String n=ck[0].getValue();
String mn="force";

ResultSet rs=ps.executeQuery();

%>

<html>
<head><center><font face="algerian">SELECT YOUR MOVIESHOW</font></center>
<style type="text/css">

.ds_box {
	background-color: #FFF;
	border: 1px solid #000;
	position: absolute;
	z-index: 32767;
}

.ds_tbl {
	background-color: #FFF;
}

.ds_head {
	background-color: #333;
	color: #FFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	letter-spacing: 2px;
}

.ds_subhead {
	background-color: #CCC;
	color: #000;
	font-size: 12px;
	font-weight: bold;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	width: 32px;
}

.ds_cell {
	background-color: #EEE;
	color: #000;
	font-size: 13px;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	padding: 5px;
	cursor: pointer;
}

.ds_cell:hover {
	background-color: #F3F3F3;
} 

</style>
</head>
<body>

<table class="ds_box" cellpadding="0" cellspacing="0" id="ds_conclass" style="display: none;">
<tr><td id="ds_calclass">
</td></tr>
</table>

<script type="text/javascript">

var ds_i_date = new Date();
ds_c_month = ds_i_date.getMonth() + 1;
ds_c_year = ds_i_date.getFullYear();


function ds_getel(id) {
	return document.getElementById(id);
}


function ds_getleft(el) {
	var tmp = el.offsetLeft;
	el = el.offsetParent
	while(el) {
		tmp += el.offsetLeft;
		el = el.offsetParent;
	}
	return tmp;
}
function ds_gettop(el) {
	var tmp = el.offsetTop;
	el = el.offsetParent
	while(el) {
		tmp += el.offsetTop;
		el = el.offsetParent;
	}
	return tmp;
}


var ds_oe = ds_getel('ds_calclass');

var ds_ce = ds_getel('ds_conclass');


var ds_ob = ''; 
function ds_ob_clean() {
	ds_ob = '';
}
function ds_ob_flush() {
	ds_oe.innerHTML = ds_ob;
	ds_ob_clean();
}
function ds_echo(t) {
	ds_ob += t;
}

var ds_element; 

var ds_monthnames = [
'January', 'February', 'March', 'April', 'May', 'June',
'July', 'August', 'September', 'October', 'November', 'December'
];

var ds_daynames = [
'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'
]; 


function ds_template_main_above(t) {
	return '<table cellpadding="3" cellspacing="1" class="ds_tbl">'
	     + '<tr>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_py();"><<</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_pm();"><</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_hi();" colspan="3">[Close]</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_nm();">></td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_ny();">>></td>'
		 + '</tr>'
	     + '<tr>'
		 + '<td colspan="7" class="ds_head">' + t + '</td>'
		 + '</tr>'
		 + '<tr>';
}

function ds_template_day_row(t) {
	return '<td class="ds_subhead">' + t + '</td>';
	
}

function ds_template_new_week() {
	return '</tr><tr>';
}

function ds_template_blank_cell(colspan) {
	return '<td colspan="' + colspan + '"></td>'
}

function ds_template_day(d, m, y) {
	return '<td class="ds_cell" onclick="ds_onclick(' + d + ',' + m + ',' + y + ')">' + d + '</td>';
	
}

function ds_template_main_below() {
	return '</tr>'
	     + '</table>';
}


function ds_draw_calendar(m, y) {

	ds_ob_clean();

	ds_echo (ds_template_main_above(ds_monthnames[m - 1] + ' ' + y));
	for (i = 0; i < 7; i ++) {
		ds_echo (ds_template_day_row(ds_daynames[i]));
	}

	var ds_dc_date = new Date();
	ds_dc_date.setMonth(m - 1);
	ds_dc_date.setFullYear(y);
	ds_dc_date.setDate(1);
	if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
		days = 31;
	} else if (m == 4 || m == 6 || m == 9 || m == 11) {
		days = 30;
	} else {
		days = (y % 4 == 0) ? 29 : 28;
	}
	var first_day = ds_dc_date.getDay();
	var first_loop = 1;
	
	ds_echo (ds_template_new_week());
	
	if (first_day != 0) {
		ds_echo (ds_template_blank_cell(first_day));
	}
	var j = first_day;
	for (i = 0; i < days; i ++) {
		
		if (j == 0 && !first_loop) {
			
			ds_echo (ds_template_new_week());
		}
		
		ds_echo (ds_template_day(i + 1, m, y));

		first_loop = 0;

		j ++;
		j %= 7;
	}
	
	ds_echo (ds_template_main_below());

	ds_ob_flush();
	
	ds_ce.scrollIntoView();
}

function ds_sh(t) {
	ds_element = t;
	
	var ds_sh_date = new Date();
	ds_c_month = ds_sh_date.getMonth() + 1;
	ds_c_year = ds_sh_date.getFullYear();
	ds_draw_calendar(ds_c_month, ds_c_year);
	
	ds_ce.style.display = '';
	
	the_left = ds_getleft(t);
	the_top = ds_gettop(t) + t.offsetHeight;
	ds_ce.style.left = the_left + 'px';
	ds_ce.style.top = the_top + 'px';

	ds_ce.scrollIntoView();
}


function ds_hi() {
	ds_ce.style.display = 'none';
}


function ds_nm() {
	
	ds_c_month ++;
	if (ds_c_month > 12) {
		ds_c_month = 1; 
		ds_c_year++;
	}
	
	ds_draw_calendar(ds_c_month, ds_c_year);
}


function ds_pm() {
	ds_c_month = ds_c_month - 1; 
	if (ds_c_month < 1) {
		ds_c_month = 12; 
		ds_c_year = ds_c_year - 1; 
	}
	ds_draw_calendar(ds_c_month, ds_c_year);
}


function ds_ny() {
	
	ds_c_year++;
	
	ds_draw_calendar(ds_c_month, ds_c_year);
}


function ds_py() {
	
	ds_c_year = ds_c_year - 1; 

	ds_draw_calendar(ds_c_month, ds_c_year);
}


function ds_format_date(d, m, y) {
	
	m2 = '00' + m;
	m2 = m2.substr(m2.length - 2);

	d2 = '00' + d;
	d2 = d2.substr(d2.length - 2);
	return y + '-' + m2 + '-' + d2;
}


function ds_onclick(d, m, y) {
	
	ds_hi();
	
	if (typeof(ds_element.value) != 'undefined') {
		ds_element.value = ds_format_date(d, m, y);
	
	} else if (typeof(ds_element.innerHTML) != 'undefined') {
		ds_element.innerHTML = ds_format_date(d, m, y);
	
	} else {
		alert (ds_format_date(d, m, y));
	}
}


</script>
<style type="text/css">
body
{
   background-color: #FFFFFF;
   color: #000000;
}
</style>
<style type="text/css">
a
{
   color: #0000FF;
   text-decoration: underline;
}
a:visited
{
   color: #800080;
}
a:active
{
   color: #FF0000;
}
a:hover
{
   color: #0000FF;
   text-decoration: underline;
}
</style>
<style type="text/css">
#Image1
{
   border: 0px #000000 solid;
}
</style>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.effects.core.min.js"></script>
<script type="text/javascript" src="js/jquery.effects.blind.min.js"></script>
<script type="text/javascript" src="js/jquery.effects.bounce.min.js"></script>
<script type="text/javascript" src="js/jquery.effects.clip.min.js"></script>
<script type="text/javascript" src="js/jquery.effects.drop.min.js"></script>
<script type="text/javascript" src="js/jquery.effects.fold.min.js"></script>
<script type="text/javascript" src="js/jquery.effects.scale.min.js"></script>
<script type="text/javascript" src="js/jquery.effects.slide.min.js"></script>
<script type="text/javascript" src="js/wb.slideshow.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
   $("#SlideShow1").slideshow(
   {
      interval: 3000,
      type: 'sequence',
      effect: 'none',
      direction: '',
      effectlength: 2000
   });
});



</script>


</head>
<body background="images/bg.jpg">
<div align="header">
<%@include file="Header.html" %>
</div>
<br><br><br><br><br><br><br><br><br>
<div id="menu" style="height:500px;width:250px;float:right;">
<form action="seatselect.jsp" method="post" >
<select name="mv" style="background-color:cyan;width:200px;height:25px;">
<% while(rs.next())
{
%>

<option><%=rs.getString("mvnm")%>
<%
}
%>
</select>
<br><br>
<%ResultSet rs1=ps.executeQuery();%>
<select name="city" style="background-color:cyan;width:200px;height:25px;">>
<% while(rs1.next())
{
%>

<option><%=rs1.getString("city")%>
<%
}
%>
</select><br><br>
<input onclick="ds_sh(this);" value="choose date" name="date" readonly="readonly" style="cursor:text; background-color:cyan;width:200px;height:25px;"><br /><br>
<select name="class" value="class" style="background-color:cyan;width:200px;height:25px;"><option>Platina(Rs.150)<option>Gold(Rs.100)</select><br><br>
<input type="text" name="seats" aria-required="1" placeholder="Choose Seats" style="background-color:cyan;width:200px;height:25px;">
<br><br>
<input type="image"  src="images/submit.png" title="login" type="submit" onclick="p">
</form><div id="wb_Image1" style="position:absolute;left:89px;top:65px;width:932px;height:618px;z-index:1;">
<img src="images/gallery_big5.jpg" id="Image1" alt="" border="0" style="width:932px;height:618px;"></div>
<div id="SlideShow1" style="position:absolute;left:326px;top:193px;width:432px;height:273px;z-index:2;">
<img style="border-width:0;left:0px;top:0px;width:432px;height:273px;" src="images/c.jpg" alt="" title="">
<img style="border-width:0;left:0px;top:0px;width:432px;height:273px;display:none;" src="images/ce.jpg" alt="" title="">
<img style="border-width:0;left:0px;top:0px;width:432px;height:273px;display:none;" src="images/bmb.jpg" alt="" title="">
<img style="border-width:0;left:0px;top:0px;width:432px;height:273px;display:none;" src="images/fukrey.jpg" alt="" title="">
<img style="border-width:0;left:0px;top:0px;width:432px;height:273px;display:none;" src="images/ranj.jpg" alt="" title="">
</div>
<%

Cookie ck1=new Cookie("ck1",n);

%>



</body>
</html>