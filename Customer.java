package pojoclass;

public class Customer {
private String email;
private String password;
private String mobile;
private String fullname;
private String status;
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getFullname() {
	return fullname;
}
public void setFullname(String fullname) {
	this.fullname = fullname;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Customer(String email, String password, String mobile, String fullname, String status) {
	super();
	this.email = email;
	this.password = password;
	this.mobile = mobile;
	this.fullname = fullname;
	this.status = status;
}
public Customer() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "Customer [email=" + email + ", password=" + password + ", mobile=" + mobile + ", fullname=" + fullname
			+ ", status=" + status + "]";
}




}
