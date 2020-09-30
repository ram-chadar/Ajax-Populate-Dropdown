
<%@page import="com.dbcon.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<select class="form-control" name="city" id="city">
		<option value="">Select City</option>
		<%
		ResultSet rs=null;
		PreparedStatement ps=null;
		Connection con=null;
		try{
			
			con = DBUtil.getDataSource().getConnection();
			
			//System.out.println(division+sem+bname);
			
			String state = request.getParameter("state");
			
				ps = con
						.prepareStatement("select distinct (city) from address where state=?");
				ps.setString(1, state);
				
				rs = ps.executeQuery();
			

			while (rs.next())
			{
		%>
		<option value="<%=rs.getString("city")%>"><%=rs.getString("city")%></option>
		<%
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			out.println(e);
		}
		finally{
			if(con!=null)
				con.close();
			if(ps!=null)
				ps.close();
			if(rs!=null)
				rs.close();
		}
		%>
	</select>

</body>
</html>
