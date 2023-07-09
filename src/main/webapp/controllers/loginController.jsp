<%@ page import="java.sql.*, javax.servlet.http.HttpServletRequest, java.io.PrintWriter" %>
<%
  String email = request.getParameter("email");
  String password = request.getParameter("password");

  try {
    // Establece la conexion a la base de datos
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia", "root", "");

    // Busca al usuario a partir de el email y password
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
    stmt.setString(1, email);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
      // Si se encontro se redirecciona al home
      response.sendRedirect("../templates/home.html");
    } else {
      // Si no se le vuelve a cargar el login
      response.sendRedirect("../templates/login.html");
    }

    // Cerramos la conexion
    conn.close();
  } catch (Exception e) {
    out.println("Error: " + e.getMessage());
  }
%>