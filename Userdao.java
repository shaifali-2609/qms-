package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pojoclass.Admin;
import pojoclass.Adminmsg;
import pojoclass.Assigncom;
import pojoclass.Complain;
import pojoclass.Customer;
import pojoclass.Department;
import pojoclass.Employee;
import pojoclass.Feedback;
import pojoclass.Hr;
import pojoclass.Reply;

public class Userdao {
	
private Connection con;

public Userdao(Connection con) {
	super();
	this.con = con;
}

//insertuser
//----------------------------------------------------------------------------------------------------


public boolean savecustomer(Customer cus) {
	
	boolean f=false;
	try {
		String query="insert into customer(email,password,mobile,fullname,status) values(?,?,?,?,?)" ;
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, cus.getEmail());
			ps.setString(2, cus.getPassword());
			ps.setString(3,cus.getMobile());
			ps.setString(4,cus.getFullname());
			ps.setString(5,cus.getStatus());
			ps.executeUpdate();
			f=true;
	}
	catch(Exception e) {
		e.printStackTrace();}
	
	return f;
	
}
	//==============fethicing aal customer========================================================

public List<Customer> getallcustomer()throws SQLException{
	List<Customer> cus= new ArrayList<>();
	try {
		String query="select * from Customer";
		PreparedStatement ps=this.con.prepareStatement(query);
		ResultSet set=ps.executeQuery();
		while(set.next()) {
			Customer cust=new Customer();
		cust.setEmail(set.getString("email"));
		cust.setFullname(set.getString("fullname"));
		cust.setMobile(set.getString("mobile"));
		cust.setStatus(set.getString("status"));
		
	cus.add(cust);
	}}
		catch (SQLException e) {
			e.printStackTrace();
		}
	
return cus;
	
	
	
	
	
	
	
}



//=================================================================================================
 //fetching users
//-------------------------------------------------------------------------------------------------------------
/**public Object validateUser(String email, String password ,String role) {
	 if ("admin".equals(role)) {
         return validateAdmin(email, password);
     } else if ("employee".equals(role)) {
         return validateEmployee(email, password);}
         else if ("customer".equals(role)) {
         return validateCustomer(email, password);}
          
     else if("manager".equals(role)) {
    	 return validateManager(email,password);
     }
     else if("hr".equals(role)) {
    	 return validateHr( email,  password);
     }

     return null;
 }**/
public Object validateUser(String email, String password, String role) {
    Object user = null;
    switch (role) {
        case "admin":
            user = validateAdmin(email, password);
            break;
        case "employee":
            user = validateEmployee(email, password);
            break;
        case "customer":
            user = validateCustomer(email, password);
            break;
        case "manager":
            user = validateManager(email, password);
            break;
        case "hr":
            user = validateHr(email, password);
            break;
    }
    return user;
}
      

//==================================================================================================
public Customer validateCustomer( String email, String password) {
	
	Customer cus=null;
	try {
		 String query="Select * from customer where email=? and password=? ";
		 PreparedStatement ps=this.con.prepareStatement(query);
		 ps.setString(1, email);
		 ps.setString(2, password);
		
ResultSet set=ps.executeQuery();

if(set.next()) {
	cus=new Customer();
	cus.setEmail(set.getString("email"));
	cus.setPassword(set.getString("password"));
	cus.setMobile(set.getString("mobile"));
	cus.setFullname(set.getString("fullname"));
	cus.setStatus(set.getString("status"));
	}
}
	catch(Exception e) {
		e.printStackTrace();
	}
	return cus;
}
//-------------------------------------------------------------------------------------------------------
public Admin validateAdmin(String username, String password) {
    Admin add = null;
    try {
        String query = "SELECT * FROM admin WHERE username=? AND password=?";
        PreparedStatement ps = this.con.prepareStatement(query);
        ps.setString(1, username); // Correctly set username
        ps.setString(2, password);
        
        ResultSet set = ps.executeQuery();
        
        if (set.next()) {
            add = new Admin();
            add.setUsername(set.getString("username"));
            add.setPassword(set.getString("password"));
            add.setMessgeid(set.getInt("messegeid"));
            add.setAdminid(set.getInt("adminid"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return add;
}

//==================================================================================================
public boolean indertdept(Department dep) {
	boolean f=false;
	try {
		 String query="insert into department(deptid,dept)values(?,?)";
		 PreparedStatement ps=this.con.prepareStatement(query);
		 ps.setInt(1, dep.getDeptid());
		 ps.setString(2, dep.getDeptname());
		 ps.executeUpdate();
		  f=true;
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return f;
	
}
//================================================================================================
	public List<Department> getdep(){
		List<Department> dept=new ArrayList<>(); 
		try {
			 String query="select *from department";
			 PreparedStatement ps=this.con.prepareStatement(query);
			 ResultSet set=ps.executeQuery();
			 while(set.next()) {
				 Department dep=new Department();
				 dep.setDeptid(set.getInt("deptid"));
					dep.setDeptname(set.getString("dept"));
				 
				dept.add(dep); 
				 
				 
			 }
			 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return dept;
	}

	
//-----------------------------------------------------------------------		
	public List<Employee> getemp(){
		List<Employee> emp=new ArrayList<>(); 
		try {
			 String query="select *from employee";
			 PreparedStatement ps=this.con.prepareStatement(query);
			 ResultSet set=ps.executeQuery();
			 while(set.next()) {
				 Employee e=new Employee();
				e.setEmpemail(set.getString("empname"));
				e.setEmpemail(set.getString("empemail"));
				e.setEmpId(set.getInt("empid"));
				e.setDeptId(set.getInt("deptid"));
				e.setRole(set.getString("role"));
		emp.add(e);
				 			 
				 
			 }
			 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return emp ;
	}	
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	
	public Employee validateEmployee(String email, String password) {
        Employee emp = null;
        try {
            String query = "SELECT * FROM employee WHERE empemail=? AND password=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                emp = new Employee();
                emp.setEmpId(set.getInt("empid"));
                emp.setEmpemail(set.getString("empemail"));
                emp.setEmpName(set.getString("empname"));
                emp.setDeptId(set.getInt("deptid"));
                emp.setRole(set.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }
//====================================================================================================
	 public Employee validateManager(String email, String password) {
	        Employee emp = null;
	        try {
	            String query = "SELECT * FROM employee WHERE empemail=? AND password=?";
	            PreparedStatement ps = this.con.prepareStatement(query);
	            ps.setString(1, email);
	            ps.setString(2, password);
	            ResultSet set = ps.executeQuery();
	            if (set.next()) {
	                emp = new Employee();
	                emp.setEmpId(set.getInt("empid"));
	                emp.setEmpemail(set.getString("empemail"));
	                emp.setEmpName(set.getString("empname"));
	                emp.setDeptId(set.getInt("deptid"));
	                emp.setRole(set.getString("role"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return emp;
	    }
//======================================================================================================	

	public int insertDataAndGetId(Complain com) {
        int generatedId = -1;
        try {
            String query = "INSERT INTO complain (comdes,Complaindate,email) VALUES (?, ?,?)";
            PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, com.getComplain());
            pstmt.setDate(2, new java.sql.Date(com.getComdate().getTime()));
            pstmt.setString(3,com.getEmail());
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedId;
    }
//------------------------------------------------------------------------------------------------
	public List<Complain> getallcom() {
		List<Complain> com= new ArrayList<>();
		try {
			
			String query="select *from Complain";
			PreparedStatement ps=this.con.prepareStatement(query);
			ResultSet set=ps.executeQuery();
			while(set.next()) {
				Complain comp =new Complain();
				comp.setId(set.getInt("complainid"));
				comp.setComdate(set.getDate("Complaindate"));
				comp.setComplain(set.getString("comdes"));
				comp.setEmail(set.getString("email"));
				
				com.add(comp);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return com;
		
		
		
	}
	//-------------------------------------------------------------------------------------------------------------
	 // Assign complaint to employee
    public  boolean assign(Assigncom as) {
    	boolean f=false;
    	
    	try { String query = "insert into  assignment (empId,complainid)values(?,?)";
        PreparedStatement ps = con.prepareStatement(query);
      ps.setInt(1, as.getEmployeeid()); 
      ps.setInt(2, as.getComplainid());
      ps.executeUpdate();
      
      f=true;
    }
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return f;
    }	
       
    //-------------------------------------------------------------------------
 public List<Assigncom> getallasiign(){
	List<Assigncom> ass=new ArrayList<>();
	try {
		String query="select * from assignment";
		PreparedStatement ps=this.con.prepareStatement(query);
		ResultSet set=ps.executeQuery();
		while(set.next()) {
			
			Assigncom as=new Assigncom();
			as.setComplainid(set.getInt("complainId"));
			as.setEmployeeid(set.getInt("empid"));
			ass.add(as);
		}
		
		}
		
	catch(Exception e) {
		e.printStackTrace();
		
	}
	
	 return ass;
	 
 }

	//===========================================================
    public boolean adminmsg(Adminmsg  add) {
    	boolean f=false;
    	try {
    		 String query="insert into admin_msg(messege,role)values(?,?)";
    		 PreparedStatement ps=this.con.prepareStatement(query);
    		ps.setString(1, add.getMsg());
    		ps.setString(2, add.getRole());
    		
    	
    		 ps.executeUpdate();
    		  f=true;
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return f;
    	
    }
    //===================================================================================
    
    	public List<Adminmsg> alladminmsg(){
    		List<Adminmsg> msg=new ArrayList<>();
    		try {
    			String query="select *from admin_msg";
    			PreparedStatement ps=this.con.prepareStatement(query);
    			ResultSet set=ps.executeQuery();
    			while(set.next()) {
    				Adminmsg ad=new Adminmsg();
    				ad.setMsg(set.getString("messege"));
    				ad.setRole(set.getString("role"));
    			ad.setMsgid(set.getInt("messegeid"));
    			msg.add(ad);
    				
    			}}
    			catch(Exception e) {
    				e.printStackTrace();
    			}
    			return msg;}	
    				
    			
    		
    		
    		
    	
    	
    	
    	
   
    
//==================================================================================================
   
    public boolean insertreply(Reply re) {
        boolean f = false;
        try {
            String query = "INSERT INTO reply(complainid, replydate, email, empId, replydes) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, re.getComplainid());
            pst.setDate(2, new java.sql.Date(re.getReplyDate().getTime()));
            pst.setString(3, re.getCustomeremail());
            pst.setInt(4, re.getEmpId());
            pst.setString(5, re.getReplyMessage());
            
            pst.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
//---------------------------------------------------------------------------------------------
    
    public List<Reply> getallreply()
    {
    List<Reply> rep=new ArrayList<>();
    try {
    	String query="select *from reply";
    	PreparedStatement ps=this.con.prepareStatement(query);
    	ResultSet set=ps.executeQuery();
    	while(set.next()) {
    		Reply re=new Reply();
    		re.setComplainid(set.getInt("complainid"));
    		re.setCustomeremail(set.getString("email"));
    		re.setEmpId(set.getInt("empid"));
    		re.setReplyDate(set.getDate("replydate"));
    		re.setReplyMessage(set.getString("replydes"));
    		re.setReplyId(set.getInt("replyid"));
    		rep.add(re);
    		
    	}
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    return rep;}
//=======================================================================================================    

	public boolean insertfeed(Feedback feed) {
	    boolean f = false;
	    try {
	        String query = "insert into feedback(feeddate,email,status,deptid,feeddesc) values(?,?,?,?,?)";
	          PreparedStatement ps = this.con.prepareStatement(query);
	        ps.setDate(1, new java.sql.Date(feed.getFeedDate().getTime()));
	        ps.setString(2, feed.getEmail());
	        ps.setString(3, feed.getStatus());
	        ps.setInt(4, feed.getDeptId());
	        ps.setString(5, feed.getFeedDesc());
	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}
	//============================================================================================
	
	public List<Feedback> getallfeed(){
		List<Feedback> feed=new ArrayList<>();
		try {
			String query="select * from feedback";
			PreparedStatement ps=this.con.prepareStatement(query);
			 ResultSet set=ps.executeQuery();
			 while (set.next()) {
				 Feedback fed=new Feedback();
				 fed.setEmail(set.getString("email"));
				 fed.setFeedId(set.getInt("feedid"));
				 fed.setDeptId(set.getInt("deptid"));
				 fed.setFeedDate(set.getDate("feeddate"));
				 fed.setFeedDesc(set.getString("feeddesc"));
				feed.add(fed);
				 }}catch(Exception e) {
					 e.printStackTrace();
				 }
		return feed;
	}
	
//===================================================================================================
	public Hr validateHr(String username, String password) {
	    Hr add = null;
	    try {
	        String query = "SELECT * FROM hr WHERE username=? AND password=?";
	        PreparedStatement ps = this.con.prepareStatement(query);
	        ps.setString(1, username); // Correctly set username
	        ps.setString(2, password);
	        
	        ResultSet set = ps.executeQuery();
	        
	        if (set.next()) {
	            add = new Hr();
	            add.setUsername(set.getString("username"));
	            add.setPassword(set.getString("password"));
	            
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return add;
	}



//=================================================================================================
public boolean insertemp(Employee emp) {
	boolean f=false;
	try {
 String query="insert into employee(empname,empemail ,password,deptid,role)values(?,?,?,?,?)";
		PreparedStatement p=this.con.prepareStatement(query);
		p.setString(1, emp.getEmpName());
    p.setString(2, emp.getEmpemail());
		p.setString(3, emp.getPassword());
		p.setInt(4, emp.getDeptId());
		p.setString(5, emp.getRole());
		
		p.executeUpdate();
		f=true;
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return f;
}
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

}



