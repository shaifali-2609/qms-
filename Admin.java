package pojoclass;

public class Admin {
	private int adminid;
    private String username;
    private String password;
    private int messgeid;

    // Constructors
    public Admin() {}

    public Admin( int adminid,String username, String password ,int messegeid) {
        this.username = username;
        this.password = password;
        this.messgeid=messegeid;
        this.adminid=adminid;
    }

    // Getters and Setters
    
    
    
    public String getUsername() {
        return username;
    }

    public int getAdminid() {
		return adminid;
	}

	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}

	public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public int getMessgeid() {
		return messgeid;
	}

	public void setMessgeid(int string) {
		this.messgeid = string;
	}
    
    
}
