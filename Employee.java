package pojoclass;

public class Employee {
    private int empId;
    private String empName;
    private String empemail;
    private String password;
  
    private int deptId;
    private String role;
   
    private Department department;
    
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	
	public Employee(String empName, String empemail, String password, int deptId, String role) {
		super();
		this.empName = empName;
		this.empemail = empemail;
		this.password = password;
		this.deptId = deptId;
		this.role = role;
	}
	public String getEmpemail() {
		return empemail;
	}
	public void setEmpemail(String empemail) {
		this.empemail = empemail;
	}
	public Employee(int empId, String empName, String password, String role, int deptId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.password = password;
		this.role = role;
		this.deptId = deptId;
	}
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Employee(int empId, String empName, String password, String role, int deptId, Department department) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.password = password;
		this.role = role;
		this.deptId = deptId;
		this.department = department;
	} 
    
    
    
    
    
}
 


