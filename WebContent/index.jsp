
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*"%>

<html>
<head>

<meta name="viewport" content="=600, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="customCss/branchSubDetail.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<script src="onlineJs/dashboard.js"></script>
<link href="customCss/dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="customCss/gredient.css">

<script type="text/javascript" src="onlineJs/jquery-3.3.1.js"></script>
<script type="text/javascript" src="onlineJs/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="onlineJs/dataTables.bootstrap4.min.js"></script>

</head>
<body>

<%String msg=(String)request.getAttribute("msg");

if(msg!=null)
{%>
<script type="text/javascript">
	alert("${msg}");
  </script>
<% 
}

%> 

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="form-resp">
				<center><a href="ShowEmployee">EMPLOYEE DETAILS</a></center>
								
							</div>
				<form action="EmpController" name="EmpController"
					class="form-data" method="post" enctype="multipart/form-data">
					<div class="row">

							<div class="col-md-4 col-xs-12 offset-md-4">
							
							<div class="form-resp">
								<H4 class="text-center">EMPLOYEE DETAILS</H4>
								
								<div class="form-group">
									 <input type="text"
										class="form-control" id="employeeId" hidden=""
										placeholder="Employee Id" name="eid"
										value="<%=UUID.randomUUID().toString()%>" required="required">
								</div>
								
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="ename"
										placeholder="Employee Name" name="ename"
										value="${employeeName}" required="required">
								</div>


								<div class="form-group">
									<div class="radio">
										<label><input type="radio" name="gender" value="Male"  required="required">Male
										</label>
									</div>
									<div class="radio">
										<label><input type="radio" name="gender" value="Female" required="required">Female
										</label>
									</div>

								</div>

								<div class="form-group">
									<label for="country">Country</label> <select
										class="form-control form-control-md" id="country"
										name="country" required="required">
										<%
											String country = (String) request.getAttribute("country");
											if (country != null) {
										%>
										<option value="<%=country%>"><%=country%></option>
										<%
											} else {
										%>
										<option value="">Select Country</option>
										<%
											}
										%>
									</select>
								</div>


								<div class="form-group">
									<label for="state">State</label> <select
										class="form-control form-control-md" id="state" name="state"
										required="required">
										<%
											String state = (String) request.getAttribute("state");
											if (state != null) {
										%>
										<option value="<%=state%>"><%=state%></option>
										<%
											}
										%>
										

									</select>
								</div>

								<div class="form-group">
									<label for="city">City</label> <select
										class="form-control form-control-md" id="city" name="city"
										required="required">
										<%
											String city = (String) request.getAttribute("city");
											if (city != null) {
										%>
										<option value="<%=city%>"><%=city%></option>
										<%
											}
										%>
										

									</select>
								</div>

								<div class="form-group">
									<label class="checkbox-inline"> <input type="checkbox"
										value="Java" name="technologies">Java
									</label> <label class="checkbox-inline"> <input type="checkbox"
										value="C++" name="technologies">C++
									</label> <label class="checkbox-inline"> <input type="checkbox"
										value="C" name="technologies">C
									</label>
								</div>

								<div class="form-group">
									

										<input type="file" class="file-data btn btn-primary btn-block"
											name="file" onchange="checkfile(this);"
											accept="application/xls" required="required">
										
									</div> 
									<div>
										<button type="submit" class="btn btn-primary btn-block "
											value="class" name="action">Save</button>


									</div>

								</div>


							</div>
						</div>





				</form>


			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#country").mouseover( function() {

				$.ajax({
					url : "getCountry.jsp",//your jsp page name
					method : "POST",//HTTP method.
					success : function(data) {
						$("#country").html(data);//output or response will display in subject select box.
					}
				});
			});
		});

		$(document).ready(function() {
			$("#country").on("change", function() {
				 var country = $("#country").val();
				$.ajax({
					url : "getState.jsp",//your jsp page name
					data:{country:country},
					method : "POST",//HTTP method.
					success : function(data) {
						$("#state").html(data);//output or response will display in subject select box.
					}
				});
			});
		});


		$(document).ready(function() {
			$("#state").on("change", function() {
				 var state = $("#state").val();
				$.ajax({
					url : "getCity.jsp",//your jsp page name
					data:{state:state},
					method : "POST",//HTTP method.
					success : function(data) {
						$("#city").html(data);//output or response will display in subject select box.
					}
				});
			});
		});


		/* function checkfile(sender) {
		    var validExts = new Array("jpg");
		    var fileExt = sender.value;
		    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
		    if (validExts.indexOf(fileExt) < 0) {
		      alert("Invalid file selected, valid files are of " +
		               validExts.toString() + " types.");
		      sender.value="";
		      return false;
		    }
		    else return true;
		} */
	</script>
</body>

</html>

