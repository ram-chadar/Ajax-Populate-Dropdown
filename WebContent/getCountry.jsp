
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
	<select class="form-control" name="country" id="country">
		<option value="">Select Country</option>
		<%
		ResultSet rs=null;
		PreparedStatement ps=null;
		Connection con=null;
		try{
			
			con = DBUtil.getDataSource().getConnection();
			
			//System.out.println(division+sem+bname);
			
			
			
				ps = con
						.prepareStatement("select distinct (country) from address");
				
				rs = ps.executeQuery();
			

			while (rs.next()) {
		%>
		<option value="<%=rs.getString("country")%>"><%=rs.getString("country")%></option>
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
