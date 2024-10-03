package pojoclass;



	import java.util.Date;

	public class Feedback {
	    private int feedId;
	    private Date feedDate;
	    private String Email;
	    private String status;
	    private int deptId;
	
	   
	    private String feedDesc;
	    private Department department; // Reference to Department

	    // Constructors
	    
	    
	    
	    
	    
	   
	    
	    public Feedback(int feedId, Date feedDate, String email, String status, int deptId, String feedDesc) {
			super();
			this.feedId = feedId;
			this.feedDate = feedDate;
			Email = email;
			this.status = status;
			this.deptId = deptId;
			this.feedDesc = feedDesc;
		}


		public Feedback(Date feedDate, String email, String status, int deptId, String feedDesc) {
			super();
			this.feedDate = feedDate;
			Email = email;
			this.status = status;
			this.deptId = deptId;
			this.feedDesc = feedDesc;
		}


		public Feedback(int feedId,  Date feeddate, String Email,   String status,int deptId, String  feedDesc, Department department) {
	        this.feedId = feedId;
	        this.feedDesc = feedDesc;
	        this.Email = Email;
	        this.deptId = deptId;
	        this.feedDate = feedDate;
	        this.status = status;
	        this.department = department;
	    }

	    // Getters and Setters
	    public int getFeedId() {
	        return feedId;
	    }

	    public void setFeedId(int feedId) {
	        this.feedId = feedId;
	    }

	    public String getFeedDesc() {
	        return feedDesc;
	    }

	    public void setFeedDesc(String feedDesc) {
	        this.feedDesc = feedDesc;
	    }

	   

	    public String getEmail() {
			return Email;
		}

		public void setEmail(String email) {
			Email = email;
		}

		public int getDeptId() {
	        return deptId;
	    }

	    public void setDeptId(int deptId) {
	        this.deptId = deptId;
	    }

	    public Date getFeedDate() {
	        return feedDate;
	    }

	    public void setFeedDate(Date feedDate) {
	        this.feedDate = feedDate;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }

	    public Department getDepartment() {
	        return department;
	    }

	    public void setDepartment(Department department) {
	        this.department = department;
	    }


		public Feedback() {
			super();
			// TODO Auto-generated constructor stub
		}

		
	}

