package fms.Expense.serviceANDservlet;

import java.sql.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;  
import java.util.List;
import java.util.stream.Collectors;
import com.fms.DBconnection.DBConnection;

public class ExSupplierDao {

	public static int save(ExSupplier u){  
	    int status=0;  
	    try{  
	        Connection con=DBConnection.getDBConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into esupplier(dealerName,tep,Address,status,remark) values(?,?,?,?,?)");  
	        ps.setString(1,u.getDealerName());  
	        ps.setInt(2,u.getTep());  
	        ps.setString(3,u.getAddress());  
	        ps.setString(4,u.getStatus());  
	        ps.setString(5,u.getRemark()); 
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	public static List<ExSupplier> getAllRecords(String query ){  
	    List<ExSupplier> list=new ArrayList<ExSupplier>();  
	      
	    try{  
	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from esupplier");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	ExSupplier u=new ExSupplier();  
	            u.setId(rs.getInt("id"));  
	            u.setDealerName(rs.getString("dealerName")); 
	            u.setTep(rs.getInt("tep"));  
	            u.setAddress(rs.getString("Address"));  
	            u.setStatus(rs.getString("status"));  
	            u.setStatus(rs.getString("status")); 
	            u.setRemark(rs.getString("remark"));  
	            list.add(u);  
	        }
	        if(query!=null) {
	        	list=list.stream().filter(x->Integer.toString(x.getId()).contains(query)).collect(Collectors.toList());
	        }
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}
	
	public static ExSupplier getRecordById(int id){  
	    ExSupplier u=null;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from esupplier where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new ExSupplier();  
	            u.setId(rs.getInt("id"));  
	            u.setDealerName(rs.getString("dealerName"));  
	            u.setTep(rs.getInt("tep"));  
	            u.setAddress(rs.getString("Address"));  
	            u.setStatus(rs.getString("status"));  
	            u.setRemark(rs.getString("remark"));  

	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}
	public static int updateSupExp(ExSupplier u){  
	    int status=0;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();
	        PreparedStatement ps=con.prepareStatement(  
	"update esupplier set dealerName=?,tep=?,Address=?,status=?,remark=? where id=?");  
	        ps.setString(1,u.getDealerName());
	        ps.setInt(2,u.getTep());
	        ps.setString(3,u.getAddress());
	        ps.setString(4,u.getStatus());  
	        ps.setString(5,u.getRemark());  	        
	        ps.setInt(6,u.getId()); 
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	public static int delete(ExSupplier u){  
	    int status=0;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();
	        PreparedStatement ps=con.prepareStatement("delete from esupplier where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}

}
