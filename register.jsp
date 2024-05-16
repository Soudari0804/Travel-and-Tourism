<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Registration</title>

</head>

<body>

<%

int cid = Integer.parseInt(request.getParameter("t1"));

String fname = request.getParameter("t2");

String lname = request.getParameter("t3");

String email = request.getParameter("t4");

String pwd = request.getParameter("t5");



String status = "failed"; // Default status



try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/travel", "root", "tiger");

    PreparedStatement pst = con.prepareStatement("INSERT INTO customer VALUES (?, ?, ?, ?, ?)");

    pst.setInt(1, cid);

    pst.setString(2, fname);

    pst.setString(3, lname);

    pst.setString(4, email);

    pst.setString(5, pwd);



    int rowCount = pst.executeUpdate();

    if (rowCount > 0) {

      response.sendRedirect("login.html");

    }
    else
    {
        
    }

} catch (Exception e) {

out.println(e);
}
%>

</body>

</html>