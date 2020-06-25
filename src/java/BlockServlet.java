import java.io.*;
import java.sql.*;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;



@WebServlet(urlPatterns = {"/BlockServlet"})
public class BlockServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
              
            
            
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter()) {  
                    String a=request.getParameter("id");
                    String b=request.getParameter("blockno");
                    String c=request.getParameter("blockname");
                    try{
                        Properties prop = new Properties();
                        FileInputStream fis= new FileInputStream("C:\\Users\\scindia\\Documents\\NetBeansProjects\\OutstandingManagement\\conn.properties");
                        prop.load(fis);
                        String dname=(String)prop.getProperty("Dname");
                        String url=(String)prop.getProperty("URL");
                        String user=(String)prop.getProperty("Uname");
                        String pass=(String)prop.getProperty("password");
                        
                        
                        Class.forName(dname);
                        Connection con=DriverManager.getConnection(url,user,pass);
                        PreparedStatement ps=con.prepareStatement("insert into master_block_no(id,blockno,blockname) values (?,?,?)");
                        ps.setString(1,a);
                        ps.setString(2,b);
                        ps.setString(3,c);
                        
                        
                        
                        int i=ps.executeUpdate();
                        if(i>0)
                        {out.print("Block Details are successfully updated...");
                        
                        }
                        
                        
                        
                    } catch (ClassNotFoundException | SQLException e2) {
                        System.out.println(e2);
                    }
                
		
			
	}

        }
}