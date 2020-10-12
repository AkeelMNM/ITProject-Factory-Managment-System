package fms.Payroll.servlet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import fms.Payroll.servlet.*;

import com.fms.DBconnection.DBConnection;


public class Crud {
	
	public static Salary getRecordById(int id){  
	    Salary u=null;  
	    try{  
	    	
	    	 	/*DBConnection con= con.getDBConnection() ;  
		        PreparedStatement ps=con.prepareStatement("select * from albums where id=?");  
		        ps.setInt(1,id);  
		        ResultSet rs=ps.executeQuery();  */
	    	PreparedStatement ps = DBConnection.getDBConnection().prepareStatement("SELECT * FROM salary where Sal_ID = ? and EmpId = ? ");
	    	ps.setInt(1, id);
	    	ResultSet rs = ps.executeQuery();
	        
	        while(rs.next()){  
	            u=new Salary();  
	            u.setSal_ID(rs.getInt("Sal_ID"));  
	            u.setEmpID(rs.getInt("EmpID")); 
	            u.setMedical(rs.getFloat("Medical"));  
	            u.setBonus(rs.getFloat("Bonus")); 
	            u.setTax(rs.getFloat("Tax")); 
				/* u.setAbsent(rs.getCharacterStream("")); */
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}
	
	public static int updateSal(Salary s) {
		int status = 0 ;
		 try {
			 
		     PreparedStatement ps=DBConnection.getDBConnection().prepareStatement(  
		    		 "update salary set insurance =?,time=?,medical=?,tax=?,bonus=?,Absent=? where sal_ID=?");
		     ps.setString(1,s.getInsurance());
		     ps.setString(2, s.getTime());
		     ps.setFloat(3, s.getMedical());
		     ps.setFloat(4, s.getTax());
		     ps.setFloat(5, s.getBonus());
		     ps.setString(6, s.getAbsent());
		     ps.setInt(7, s.getSal_ID());
			 
		 }catch(Exception e) {
			 System.out.println(e);
		 }
		 
		 return status ;
	}

}
