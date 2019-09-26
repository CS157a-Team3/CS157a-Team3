<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Flip Cart</title>
    </head>
  <body>
    <h1>Flip Cart Product List</h1>
    
    <table border="1">
      <tr>
        <td>Product Id</td>
        <td>Name</td>
        <td>Unit Price</td>
      </tr>
    <% 
     String db = "cs157a";
        String user; // assumes database name is the same as username
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
