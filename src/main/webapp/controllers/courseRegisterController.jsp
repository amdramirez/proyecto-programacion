<%@ page import="java.sql.*, javax.servlet.http.HttpServletRequest, java.io.PrintWriter" %>
<%
  String name = request.getParameter("name");
  String cardId = request.getParameter("card_id");
  String dateInit = request.getParameter("date_init");
  String course = request.getParameter("course");

  try {
    // Establecemos la conexion con la base de datos
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia", "root", "");

    // Insertamos la data en la tabla course_registration
    PreparedStatement stmt = conn.prepareStatement("INSERT INTO course_registration (course, name, card_id, date_init) VALUES (?, ?, ?, ?)");
    stmt.setString(1, course);
    stmt.setString(2, name);
    stmt.setString(3, cardId);
    stmt.setString(4, dateInit);
    stmt.executeUpdate();

    // Cerramos la conexion
    conn.close();
    response.sendRedirect("../templates/home.html");
  } catch (Exception e) {
    out.println("Error: " + e.getMessage());
  }
%>