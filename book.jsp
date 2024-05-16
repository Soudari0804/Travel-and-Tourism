<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.text.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>
</head>
<body>
<%
String location = request.getParameter("p1");
int members = Integer.parseInt(request.getParameter("p2"));
String arrival= request.getParameter("p3");
String leaving= request.getParameter("p4");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/travel", "root", "tiger");

    // Parse arrival and leaving strings into java.sql.Date objects
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    java.sql.Date arrivals = new java.sql.Date(sdf.parse(arrival).getTime());
    java.sql.Date leavings = new java.sql.Date(sdf.parse(leaving).getTime());

    // Use PreparedStatement to prevent SQL injection attacks and improve performance
    PreparedStatement pst = con.prepareStatement("INSERT INTO booking (location, members, arrival, leaving) VALUES (?, ?, ?, ?)");

    pst.setString(1, location);
    pst.setInt(2, members);
    pst.setString(3, arrival);
    pst.setString(4, leaving);

    int rowCount = pst.executeUpdate();

    if (rowCount > 0) {
        response.sendRedirect("confirm.html");
    } else {
        out.println("Failed to insert booking.");
    }

    // Close resources
    pst.close();
    con.close();
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
}
%>
</body>
</html>
