<%@ page import="java.sql.*, javax.servlet.http.HttpServletRequest, java.io.PrintWriter" %>
<%
  String name = request.getParameter("name");
  String age = request.getParameter("age");
  String email = request.getParameter("email");
  String password = request.getParameter("password");

  try {
    // Se establece la conexion con la base de datos
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia", "root", "");

    // Insertamos la data en la tabla users
    PreparedStatement stmt = conn.prepareStatement("INSERT INTO users (name, age, email, password) VALUES (?, ?, ?, ?)");
    stmt.setString(1, name);
    stmt.setString(2, age);
    stmt.setString(3, email);
    stmt.setString(4, password);
    stmt.executeUpdate();

    // Cerramos la conexion
    conn.close();
    response.sendRedirect("../templates/home.html");
  } catch (Exception e) {
    out.println("Error: " + e.getMessage());
  }
%>