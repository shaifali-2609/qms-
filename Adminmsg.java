package pojoclass;

public class Adminmsg {
	private int msgid;
private String msg;
private String role;

public Adminmsg(String msg, String role) {
	super();
	this.msg = msg;
	this.role = role;
}

public int getMsgid() {
	return msgid;
}

public void setMsgid(int msgid) {
	this.msgid = msgid;
}

public String getRole() {
	return role;
}

public void setRole(String role) {
	this.role = role;
}

public String getMsg() {
	return msg;
}

public void setMsg(String msg) {
	this.msg = msg;
}

public Adminmsg() {
	super();
	// TODO Auto-generated constructor stub
}

public Adminmsg(String msg) {
	super();
	this.msg = msg;
}



}
