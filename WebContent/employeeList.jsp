<!DOCTYPE html>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="customCss/subjectList.css">
<link rel="stylesheet" type="text/css" href="customCss/branchSubDetail.css">
 
<link rel="stylesheet" type="text/css" href="onlineCss/cloudflare.css">
<link rel="stylesheet" type="text/css" href="onlineCss/dataTables.bootstrap4.min.css">
<script type="text/javascript" src="onlineJs/jquery-3.3.1.js"></script> 
<script type="text/javascript" src="onlineJs/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="onlineJs/dataTables.bootstrap4.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
	
	<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
	
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
	
	<link href="customCss/dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="customCss/gredient.css">


<style type="text/css">
.bs-example {
	margin: 2px;
}
</style>


</head>
<body>

	<div class="form-resp">
		<div class="bs-example">
			<h3 class="text-center">All Employee</h3>

			<div class="table-data">

				<table class="table table-dark table-striped" border="1"
					id="example" style="width: 100%">
					<thead>
						<tr>
							<th class="text-center">Id</th>
							<th class="text-center ">Name</th>
							<th class="text-center">Country</th>
							<th class="text-center">Action</th>


						</tr>
					</thead>
					<tbody>
						<c:forEach items="${employees}" var="employee">
							<tr>
								<td class="text-center"><c:out value="${employee.eid}" /></td>
								<td class="text-center"><c:out value="${employee.name}" /></td>
								<td class="text-center"><c:out value="${employee.country}" /></td>
								<td class="text-center">
									<a class="clickme lookinfo"
									href="editEmployee?eid=${employee.eid}">Update</a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#example').DataTable({
				"pagingType" : "full_numbers",
				"scrollY" : 400,
				"scrollX" : true
			});
		});
	</script>
</body>
</html>

