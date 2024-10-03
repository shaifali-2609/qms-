package pojoclass;

import java.util.Date; // Import java.util.Date instead of java.sql.Date

public class Complain {
    private int id;
    private String complain;
    private Date comdate;
    private String email;

    public Complain(int id, String complain) {
		super();
		this.id = id;
		this.complain = complain;
	}

	public Complain(String complain, Date comdate, String email) {
		super();
		this.complain = complain;
		this.comdate = comdate;
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Complain() {
        super();
    }

    public Complain(String complain, Date comdate) {
        super();
        this.complain = complain;
        this.comdate = comdate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComplain() {
        return complain;
    }

    public void setComplain(String complain) {
        this.complain = complain;
    }

    public Date getComdate() {
        return comdate;
    }

    public void setComdate(Date comdate) {
        this.comdate = comdate;
    }
}
