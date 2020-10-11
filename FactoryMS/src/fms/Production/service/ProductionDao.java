package fms.Production.service;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;
import java.util.stream.Collectors;

import com.fms.DBconnection.*;
import fms.Production.service.Production;

public class ProductionDao {
	

	public static int save(Production u){  
	    int status=0;  
	    try{  
	        Connection con=DBConnection.getDBConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into production(teaGrade,wastageType,leavesWastage,teaWastage,Quantity,finalAmmount,Date) values(?,?,?,?,?,?,?)");  
	        ps.setString(1,u.getTeaGrade());  
	        ps.setString(2,u.getWastageType());  
	        ps.setString(3,u.getLeavesWastage());  
	        ps.setString(4,u.getTeaWastage());  
	        ps.setDouble(5,u.getQuntity()); 
	        ps.setDouble(6,u.getFinalAmmount());
	        ps.setString(7,u.getDate());
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	public static List<Production> getAllRecords(String query ){  
	    List<Production> list=new ArrayList<Production>();  
	      
	    try{  
	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from production");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	Production u=new Production();  
	            u.setId(rs.getInt("ProdectID"));  
	            u.setTeaGrade(rs.getString("teaGrade"));  
	            u.setQuntity(rs.getDouble("Quantity"));  
	            u.setDate(rs.getString("Date")); 
	            u.setWastageType(rs.getString("wastageType"));
	            u.setLeavesWastage(rs.getString("leavesWastage"));
	            u.setFinalAmmount(rs.getDouble("finalAmmount"));
	            
	            list.add(u);  
	        }
	        if(query!=null) {
	        	list=list.stream().filter(x->Integer.toString(x.getId()).contains(query)).collect(Collectors.toList());
	        }
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}
	
	public static Production getRecordById(int id){  
	    Production u=null;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from production where ProdectID=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new Production();  
	            u.setId(rs.getInt("ProdectID"));  
	            u.setTeaGrade(rs.getString("teaGrade"));  
	            u.setQuntity(rs.getDouble("Quantity"));  
	            u.setDate(rs.getString("Date"));  

	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}
	
	public static int updateWast(Production u){  
	    int status=0;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();
	        PreparedStatement ps=con.prepareStatement(  
	"update production set Date=?,teaGrade=?,Quantity=?,wastageType=?,leavesWastage=?,finalAmmount=? where ProdectID=?");  
	        ps.setString(1,u.getDate());
	        ps.setString(2,u.getTeaGrade());
	        ps.setDouble(3,u.getQuntity());
	        ps.setString(4,u.getWastageType());  
	        ps.setString(5,u.getLeavesWastage());  
	       
	        ps.setDouble(6,u.getFinalAmmount());
	        
	        ps.setInt(7,u.getId()); 
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	public static int update(Production u){  
	    int status=0;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();
	        PreparedStatement ps=con.prepareStatement(  
	"update production set teaGrade=?,Quantity=?,Date=? where ProdectID=?");  
	        ps.setString(1,u.getTeaGrade());  
	        ps.setDouble(2,u.getQuntity());  
	        ps.setString(3,u.getDate());  
	        ps.setInt(4,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	public static int delete(Production u){  
	    int status=0;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();
	        PreparedStatement ps=con.prepareStatement("delete from production where ProdectID=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}

}
