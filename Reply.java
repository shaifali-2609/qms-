package pojoclass;



import java.util.Date;

public class Reply {
    public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reply(int complainid, Date replyDate, String customeremail, int empId, String replyMessage) {
		super();
		this.complainid = complainid;
		this.replyDate = replyDate;
		this.customeremail = customeremail;
		this.empId = empId;
		this.replyMessage = replyMessage;
	}

	private int replyId;
   private int complainid;
    

	private Date replyDate;
    private String customeremail;
    private int empId;
    private String replyMessage;
    private Employee employee; // Reference to Employee
    private Feedback feedback; // Reference to Feedback
    public int getComplainid() {
    	return complainid;
    }

    public void setComplainid(int complainid) {
    	this.complainid = complainid;
    }
    // Constructors
   

    

    // Getters and Setters
    public int getReplyId() {
        return replyId;
    }

   

	

	public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

   

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }

   

   
	

	public String getCustomeremail() {
		return customeremail;
	}

	public void setCustomeremail(String customeremail) {
		this.customeremail = customeremail;
	}

	public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getReplyMessage() {
        return replyMessage;
    }

    public void setReplyMessage(String replyMessage) {
        this.replyMessage = replyMessage;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }
}

