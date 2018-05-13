package com.chengxusheji.po;

public class Yeji {

	private Integer id;
	
	private String user_name;
	
	private String yeji_name;

    private String yeji_num;
    
    private String dept_name;
    
    private Integer status;
   private String userObj;
    
    


	public String getUserObj() {
	return userObj;
}

public void setUserObj(String userObj) {
	this.userObj = userObj;
}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getYeji_name() {
		return yeji_name;
	}

	public void setYeji_name(String yeji_name) {
		this.yeji_name = yeji_name;
	}
    

	public String getYeji_num() {
		return yeji_num;
	}

	public void setYeji_num(String yeji_num) {
		this.yeji_num = yeji_num;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	@Override
	public String toString() {
		return "Yeji [id=" + id + ", user_name=" + user_name + ", yeji_name=" + yeji_name + ", yeji_num=" + yeji_num
				+ ", dept_name=" + dept_name + ", status=" + status + "]";
	}
    
    
}
