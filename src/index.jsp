<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Flip Cart</title>
    </head>
  <body>
      <div class="headerone"></div>
      <nav>
          <div class="navLinksWrapper">
              <a href="#">About</a>
              <a href="#">Contact</a>
              <a href="#">Shop</a>
              <a href="#">Category</a>
              <a href="#"class="button">Sign&nbsp;Up</a>
              <a href="#" class="button">Log&nbsp;In
              </a>
  
              <input type="email" placeholder="youremail@gmail.com"/>
  
              <input type="password" placeholder="password"/>
              </a>
          </div>
      </nav>
    <h1>Flip Cart Product List</h1>
    <table border="1">
      <tr>
        <td>Product Id</td>
        <td>Name</td>
        <td>Unit Price</td>
      </tr>
    <% 
     String db = "cs157a";
        String user; 
          user = "root";
        String password = "";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?serverTimezone=EST5EDT",user, password);

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT product_id, name, unit_price FROM products");
            while (rs.next()) {
            	out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getBigDecimal(3)+"</td></tr>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            //out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    </table>
  </body>
</html>
