/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.Block;
/**
 *
 * @author SCINDIA
 */
@WebServlet(urlPatterns = {"/GetBlockServlet"})
public class GetBlockServlet extends HttpServlet {
      
    
    private ServletConfig config;

  //Setting JSP page

  String page="main.jsp";



  public void init(ServletConfig config)

  throws ServletException{

 this.config=config;
    
    
}

   public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException  {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
         
        List<Block> list=new ArrayList();  
try{        
     Properties prop = new Properties();
       FileInputStream fis= new FileInputStream("C:\\Users\\scindia\\Documents\\NetBeansProjects\\OutstandingManagement\\conn.properties");
       prop.load(fis);
        String dname=(String)prop.getProperty("Dname");
        String url=(String)prop.getProperty("URL");
        String user=(String)prop.getProperty("Uname");
        String pass=(String)prop.getProperty("password"); 
                Class.forName(dname);
            Connection con = DriverManager.getConnection(url,user,pass);
              
            PreparedStatement ps=con.prepareStatement("select * from master_block_no");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){ 
                Block e=new Block();
                e.setId(rs.getString("id"));
                e.setBlockno(rs.getString("blockno"));
                e.setBlockname(rs.getString("blockname"));
                list.add(e);
                
            
            }  
         }catch(SQLException e){} catch (ClassNotFoundException ex) {  
            Logger.getLogger(GetBlockServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("data", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        if(dispatcher != null){
            dispatcher.forward(request, response);
        }
        out.close();
        
   }    
}
