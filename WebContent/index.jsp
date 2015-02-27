<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page import="com.students.model.StudentForm"%>
<%@ page import="com.mongodb.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Students Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", -1); //prevents caching at the proxy server
%>
<link rel="stylesheet" href="stylesheet/style.css" />
<script type="text/javascript" src="scripts/jquery-1.11.2.js"></script>
<script type="text/javascript" src="scripts/jquery.leanModal.min.js"></script>
<script type="text/javascript" src="scripts/student.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	for(var i=0;i<700;i=i+8){
	$("#test"+i).css("display", "none");
	}
	
});
</script>
</head>
<body>
<h1>Students Details</h1>
<a id="modal_trigger" href="#modal" class="btn_link_create">Create
New Student</a>
<br />
<table>
	<thead>

		<th>Student Number</th>
		<th>Gender</th>
		<th>Birth Date</th>
		<th>Disability</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Email</th>
		<th>Options</th>
	</thead>
	<tbody>


		<%  
 	DBCollection coll = (DBCollection)request.getAttribute("coll");
    if(coll!=null){   	
    	DBCursor cursor = coll.find();		
    	Collection resultValues =null;	
    	int i=0;int j=0;
    	while(cursor.hasNext()) {
    	    DBObject resultElement = cursor.next();
    	    Map resultElementMap = resultElement.toMap();
    	     resultValues = resultElementMap.values();
    	    //Do something with the values
    	    System.out.println(resultValues);
    	    %><tr>
			<%
    	    Iterator itr= resultValues.iterator();
    	    while(itr.hasNext()){%>

			<td id="test<%=i %>"><%=itr.next() %></td>
			<% i++;}%>
			<td style="width: 100px;">
			<div style="float: left;">
			<form action="student.do?method=deleteStudent" method="post">
			<input name="obj_Id" type="hidden"
				value="<%=resultValues.iterator().next() %>" /> <input id="Delete"
				type="submit" value="Delete" class="btn btn_red" /></form>
			</div>
			<div style="float: right; margin-top: 7px;">
			<form id="myForm"><input id="objIdEdit" type="hidden"
				value="<%=resultValues.iterator().next() %>" /> <a
				id="modal_edit<%=j%>" href="#modal1" class="link_btn">Edit</a></form>
			</div>
			<% j++;}    		
		   cursor.close();
		   }%>
			</td>
		</tr>

	</tbody>
</table>

<%-- To create New Student --%>
<div id="modal" class="popupContainer" style="display: none;">
<div class="popupHeader"><span class="header_title">Create
New Student</span></div>
<div class="popupBody">
<div class="user_register">

<form action="student.do?method=createStudent" method="post"
	name="StudentForm">

<table>
	<tr>
		<td><label>Student Number</label></td>
		<td><input type="text" id="studentnumber" name="studentnumber">
		</td>
	</tr>
	<tr>
		<td><label>Gender</label></td>
		<td><select id="gender" name="gender">
			<option value=""></option>
			<option value="male">Male</option>
			<option value="female">Female</option>
		</select> <br>
		</td>
	</tr>
	<tr>
		<td><label>Birth Date</label></td>
		<td><input type="text" id="birthdate" name="birthdate"><br>
		</td>
	</tr>
	<tr>
		<td><label>Disability</label></td>
		<td><select id="disability" name="disability">
			<option value=""></option>
			<option value="true">True</option>
			<option value="false">False</option>
		</select><br>
		</td>
	</tr>
	<tr>
		<td><label>First Name</label></td>
		<td><input type="text" id="firstname" name="firstname"><br>
		</td>
	</tr>
	<tr>
		<td><label>Last Name</label></td>
		<td><input type="text" id="lastname" name="lastname"><br>
		</td>
	</tr>
	<tr>
		<td><label>Email</label></td>
		<td><input type="text" id="email" name="email"><br>
		</td>
	</tr>
</table>
<div class="action_btns">
<div style="float: left; margin-right: 5px; padding-right: 5px;">
<input id="create" type="submit" value="Create" class="btn btn_red" /></div>
<div style="padding-left: 5px; margin-left: 5px; padding-top: 10px;">
<a class="btn btn_red modal_close" href="#" id="close"
	style="padding: 9px 9px 9px 9px; font: 14px;">Close</a></div>
</div>
</form>
</div>
</div>
</div>

<%-- To edit Student --%>

<div id="modal1" class="popupContainer" style="display: none;">
<div class="popupHeader"><span class="header_title">Edit
Student</span></div>
<div class="popupBody">
<div class="user_register">

<form action="student.do?method=updateStudent" method="post"
	name="StudentForm"><input type="hidden" name="objId" id="objId" />
<table>
	<tr>
		<td><label>Student Number</label></td>
		<td><input type="text" id="studentnumber1" name="studentnumber">
		</td>
	</tr>
	<tr>
		<td><label>Gender</label></td>
		<td><select id="gender1" name="gender">
			<option value=""></option>
			<option value="male">Male</option>
			<option value="female">Female</option>
		</select> <br>
		</td>
	</tr>
	<tr>
		<td><label>Birth Date</label></td>
		<td><input type="text" id="birthdate1" name="birthdate"><br>
		</td>
	</tr>
	<tr>
		<td><label>Disability</label></td>
		<td><select id="disability1" name="disability">
			<option value=""></option>
			<option value="true">True</option>
			<option value="false">False</option>
		</select><br>
		</td>
	</tr>
	<tr>
		<td><label>First Name</label></td>
		<td><input type="text" id="firstname1" name="firstname"><br>
		</td>
	</tr>
	<tr>
		<td><label>Last Name</label></td>
		<td><input type="text" id="lastname1" name="lastname"><br>
		</td>
	</tr>
	<tr>
		<td><label>Email</label></td>
		<td><input type="text" id="email1" name="email"><br>
		</td>
	</tr>
</table>
<div class="action_btns">
<div style="float: left; margin-right: 5px; padding-right: 5px;">
<input id="create" type="submit" value="Update" class="btn btn_red" /></div>
<div style="padding-left: 5px; margin-left: 5px; padding-top: 10px;">
<a class="btn btn_red modal_close" href="#" id="close1"
	style="padding: 9px 9px 9px 9px; font: 14px;">Close</a></div>
</div>
</form>
</div>
</div>

</div>

</body>
</html>