<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
int uid = Integer.parseInt(request.getParameter("uid"));
String upwd=request.getParameter("upwd");
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/travel","root","tiger");
    PreparedStatement st=con.prepareStatement("SELECT * FROM customer WHERE cid=? AND pwd=?");
    st.setInt(1, uid);
    st.setString(2, upwd);
    ResultSet rs = st.executeQuery();

    if(rs.next())
    {
        session.setAttribute("uid", uid);
        response.sendRedirect("travel.jsp");
    }
    else
    {
        out.println("invalid credentials");
    }
}catch(Exception e)
{
    out.println(e);
}
%>
</body>
</html>
