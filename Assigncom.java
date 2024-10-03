package pojoclass;

public class Assigncom {
private String id;
private int complainid;
private int employeeid;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getComplainid() {
	return complainid;
}
public void setComplainid(int complainid) {
	this.complainid = complainid;
}
public int getEmployeeid() {
	return employeeid;
}
public void setEmployeeid(int employeeid) {
	this.employeeid = employeeid;
}
public Assigncom(int complainid, int employeeid) {
	super();
	this.complainid = complainid;
	this.employeeid = employeeid;
}
public Assigncom() {
	super();
	// TODO Auto-generated constructor stub
}

}
