package jforum;

import java.sql.*;

import java.util.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ajaxforum extends HttpServlet {
private static final long serialVersionUID = 1L;
String s;
Connection con ;
Statement st;
ResultSet rs;
PrintWriter out ;
  public ajaxforum()
	{
				try
				{
					Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
				} 
				catch (ClassNotFoundException e)
				{
					e.printStackTrace();
				} 
				catch (InstantiationException e) 
				{
					e.printStackTrace();
				} 
				catch (IllegalAccessException e) 
				{
					e.printStackTrace();
				}
				try
				{
					 con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTDB1","root","root"); 
					 st= con.createStatement(); 
				}
		catch(Exception e){}
	
    
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
	
			st= con.createStatement(); 
			s=request.getParameter("word");
		    st.executeUpdate("insert into userposts (name1) values('"+s+"')");
		
		
			
	}
		
	catch(Exception e)
	{
			out.println(e);
	}
		
		
		try{
			 out = response.getWriter();
			
			//
			List dataList = new ArrayList(); 
			try 
			{
				
				String sqlret="select name1 from userposts";
				 rs=st.executeQuery(sqlret); 
				
				while (rs.next ())
				{

					  //Add records into data list
					
					  dataList.add(rs.getString("name1"));
					 
					 
				}
				
				rs.close ();

				  st.close ();
			}
			catch (Exception e) 
			{
				out.println(e);
			}
			
				 request.setAttribute("data",dataList);
				
					con.close();
				  //Disptching request

				  RequestDispatcher dispatcher = request.getRequestDispatcher("retpost.jsp");

				  if (dispatcher != null)
				  {
					  dispatcher.forward(request, response);
				  } 
		}
		catch(Exception e)
		{
			out.println(e);
		}
			//
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
}
