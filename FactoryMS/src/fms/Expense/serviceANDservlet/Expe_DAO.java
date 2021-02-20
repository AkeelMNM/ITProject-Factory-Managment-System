package fms.Expense.serviceANDservlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.fms.DBconnection.DBConnection;

public class Expe_DAO {
	
	public static int save(Expenses u){  
	    int status=0;  
	    try{  
	        Connection con=DBConnection.getDBConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into expenses(	date,exp_type,discrp,ammount,sup_name,p_method,chk_no) values(?,?,?,?,?,?,?)");  
	        ps.setString(1,u.getDate());  
	        ps.setString(2,u.getExp_type());  
	        ps.setString(3,u.getDescrp());  
	        ps.setDouble(4,u.getAmmount());  
	        ps.setString(5,u.getEx_supp()); 
	        ps.setString(6,u.getPay_method()); 
	        ps.setString(7,u.getChek_no()); 
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	public static List<Expenses> getAllRecords(String query ){  
	    List<Expenses> list=new ArrayList<Expenses>();  
	      
	    try{  
	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from expenses");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	Expenses u=new Expenses();  
	            u.setId(rs.getInt("id"));  
	            u.setDate(rs.getString("date")); 
	            u.setExp_type(rs.getString("exp_type"));  
	            u.setDescrp(rs.getString("discrp"));  
	            u.setAmmount(rs.getDouble("ammount"));  
	            u.setEx_supp(rs.getString("sup_name")); 
	            u.setPay_method(rs.getString("p_method"));  
	            u.setChek_no(rs.getString("chk_no"));  
	            list.add(u);  
	        }
	        if(query!=null) {
	        	list=list.stream().filter(x->Integer.toString(x.getId()).contains(query)).collect(Collectors.toList());
	        }
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}
	public static Expenses getRecordById(int id){  
		Expenses u=null;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from expenses where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new Expenses();  
	            u.setId(rs.getInt("id"));  
	            u.setDate(rs.getString("date")); 
	            u.setExp_type(rs.getString("exp_type"));  
	            u.setDescrp(rs.getString("discrp"));  
	            u.setAmmount(rs.getDouble("ammount"));  
	            u.setEx_supp(rs.getString("sup_name")); 
	            u.setPay_method(rs.getString("p_method"));  
	            u.setChek_no(rs.getString("chk_no"));  

	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}
	
	public static int updateExp(Expenses u){  
	    int status=0;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();
	        PreparedStatement ps=con.prepareStatement(  
	"update expenses set date=?,exp_type=?,discrp=?,ammount=?,sup_name=?,p_method=?,chk_no=? where id=?");  
	        ps.setString(1,u.getDate());  
	        ps.setString(2,u.getExp_type());  
	        ps.setString(3,u.getDescrp());  
	        ps.setDouble(4,u.getAmmount());  
	        ps.setString(5,u.getEx_supp()); 
	        ps.setString(6,u.getPay_method()); 
	        ps.setString(7,u.getChek_no());
	        ps.setInt(8,u.getId()); 
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	public static int delete(Expenses u){  
	    int status=0;  
	    try{  
	    	Connection con=DBConnection.getDBConnection();
	        PreparedStatement ps=con.prepareStatement("delete from expenses where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}

}
