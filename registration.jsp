<%@ page import ="java.sql.*" %>
<%
String user = request.getParameter("uname");    
String pwd = request.getParameter("pass");
String R_pwd=request.getParameter("retype_password");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String Aadhar = request.getParameter("aadhar");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test100",
"root", "root");
Statement st = con.createStatement();
//ResultSet rs;
int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, retype_password, aadhar, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "','" + R_pwd + "','" + Aadhar + "', CURDATE())");
if (i > 0 && pwd.equals(R_pwd) ) {
//session.setAttribute("userid", user);
response.sendRedirect("welcome.jsp");
// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
} else {
out.println("Password not matched <a href='index.jsp'>Try Again</a>");
}
%>
